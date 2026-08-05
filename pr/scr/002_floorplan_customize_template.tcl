##################################
## Floorplan template (SMIC 40nm, from the complex_mul32 script)
## - default: floorPlan -r 1.2 0.6 5 5 5 5 (aspect ratio / core util / margins)
## - optional: load a pre-placed DEF if vars(fp_def_file) is set
## - macro regions fully shielded (placement hard blockage + routing blockage
##   on M1..M7: no std cells, no wires inside; M8 is not used in this flow).
##   Power stripes (M5/M6/M7) also stop at the macro regions: a PG-specific
##   route blockage is created per macro and addStripe is told to respect it.
##   Adaptive/random keep-outs: count 1..3, square/rect/L shapes, TOTAL area
##   fixed at 25% of the core and randomly split between the macros, random
##   boundary-touching positions, no overlap.
## - power: M7/M6 core ring (width 3 / spacing 2) + M5 V4.5 / M6 H10 / M7 V10
##   stripes (spacing 120 / set-to-set 240, M8 disabled by default via
##   vars(pg_use_m8)) + sroute
##################################

#-------------------------------------------------------------------------------
# 1) floorplan
#-------------------------------------------------------------------------------
if {[string length $vars(fp_def_file)] > 0 && [file exists $vars(fp_def_file)]} {
  puts "<ICL> Loading floorplan DEF: $vars(fp_def_file)"
  defIn $vars(fp_def_file)
} else {
  puts "<ICL> Creating default floorplan: floorPlan -r 1.2 0.6 5 5 5 5"
  floorPlan -r 1.2 0.6 5 5 5 5
}

#-------------------------------------------------------------------------------
# 2) core box
#-------------------------------------------------------------------------------
set core_llx [get_db current_design .core_bbox.ll.x]
set core_lly [get_db current_design .core_bbox.ll.y]
set core_urx [get_db current_design .core_bbox.ur.x]
set core_ury [get_db current_design .core_bbox.ur.y]
set core_w   [expr {$core_urx - $core_llx}]
set core_h   [expr {$core_ury - $core_lly}]
puts ">>> Core Box  : {$core_llx $core_lly $core_urx $core_ury}"
puts ">>> Core Size : ${core_w} x ${core_h}"

#-------------------------------------------------------------------------------
# 3) adaptive macro keep-out regions (randomized)
#    - count   : random MACRO_COUNT_MIN..MACRO_COUNT_MAX (default 1..3)
#    - shape   : square / rectangle / L-shape, random, repetition allowed
#    - size    : each macro area = MACRO_AREA_RATIO * core area (fixed ratio);
#                shrunk proportionally if it does not fit the core
#    - position: random edge (top/bottom/left/right) + random offset along it,
#                the macro always touches that core boundary
#    - overlap : placement is retried until it does not overlap previous macros
#    Disabled when vars(fp_macro_keepouts) == "false" (no-SRAM designs).
#-------------------------------------------------------------------------------
if {[info exists vars(fp_macro_keepouts)] && $vars(fp_macro_keepouts) == "false"} {
  puts ">>> Macro keep-out regions disabled (vars(fp_macro_keepouts)=false)"
} else {
  #--- random / sizing parameters ---
  set MACRO_COUNT_MIN   1          ; # min number of macro keep-outs
  set MACRO_COUNT_MAX   3          ; # max number of macro keep-outs
  set MACRO_TOTAL_RATIO 0.25       ; # TOTAL macro area = 25% of core area
  set RECT_ASPECT       1.5        ; # rectangle width / height (fixed ratio)
  set L_BAR_W           250.0      ; # L-shape fixed proportions: bar 250x160
  set L_BAR_H           160.0
  set L_ARM_W           100.0      ; # arm 100x200 (total = 250*160 + 100*200)
  set L_ARM_H           200.0
  set MACRO_TRY_LIMIT   100        ; # random placement attempts per macro
  set MACRO_SCAN_STEPS  40         ; # deterministic fallback granularity
  set MACRO_RANDOM_SEED -1         ; # >=0: reproducible random sequence

  # allow common_setup.tcl to force a reproducible seed:
  # set vars(fp_macro_seed) 12345
  if {[info exists vars(fp_macro_seed)]} {
    set MACRO_RANDOM_SEED $vars(fp_macro_seed)
  }

  if {$MACRO_RANDOM_SEED >= 0} {
    expr {srand($MACRO_RANDOM_SEED)}
    puts ">>> Macro keep-out RNG seed (fixed): $MACRO_RANDOM_SEED"
  } else {
    set macro_rng_seed [clock microseconds]
    expr {srand($macro_rng_seed)}
    puts ">>> Macro keep-out RNG seed (time-based): $macro_rng_seed"
  }

  set core_area  [expr {$core_w * $core_h}]
  set total_macro_area [expr {$MACRO_TOTAL_RATIO * $core_area}]

  proc invsRandInt {lo hi} {
    return [expr {$lo + int(rand() * ($hi - $lo + 1))}]
  }
  proc invsRandReal {lo hi} {
    return [expr {$lo + rand() * ($hi - $lo)}]
  }
  proc invsScalePoly {poly f} {
    set out [list]
    foreach {x y} $poly {
      lappend out [expr {$x * $f}] [expr {$y * $f}]
    }
    return $out
  }
  proc invsTranslatePoly {poly dx dy} {
    set out [list]
    foreach {x y} $poly {
      lappend out [expr {$x + $dx}] [expr {$y + $dy}]
    }
    return $out
  }
  proc invsBboxOverlap {ax0 ay0 ax1 ay1 bx0 by0 bx1 by1} {
    return [expr {($ax0 < $bx1) && ($ax1 > $bx0) && ($ay0 < $by1) && ($ay1 > $by0)}]
  }
  proc invsBboxFree {dx dy mw mh placed_bboxes} {
    foreach bb $placed_bboxes {
      set bx0 [lindex $bb 0]
      set by0 [lindex $bb 1]
      set bx1 [lindex $bb 2]
      set by1 [lindex $bb 3]
      if {[invsBboxOverlap $dx $dy [expr {$dx + $mw}] [expr {$dy + $mh}] \
                                 $bx0 $by0 $bx1 $by1]} {
        return 0
      }
    }
    return 1
  }
  # returns: shape_name bbox_width bbox_height relative_polygon
  proc invsMakeSquare {area} {
    set s [expr {sqrt($area)}]
    return [list square $s $s [list 0 0 $s 0 $s $s 0 $s]]
  }
  proc invsMakeRect {area aspect} {
    set w [expr {sqrt($area * $aspect)}]
    set h [expr {$w / $aspect}]
    return [list rect $w $h [list 0 0 $w 0 $w $h 0 $h]]
  }
  proc invsMakeL {area barW barH armW armH} {
    set ref_area [expr {double($barW)*$barH + double($armW)*$armH}]
    set scale    [expr {sqrt(double($area) / $ref_area)}]
    set bw [expr {$barW * $scale}]
    set bh [expr {$barH * $scale}]
    set aw [expr {$armW * $scale}]
    set ah [expr {$armH * $scale}]
    set W   $bw
    set H   [expr {$bh + $ah}]
    set poly [list 0 0 $W 0 $W $bh $aw $bh $aw $H 0 $H]
    return [list L $W $H $poly]
  }
  # create the placement + routing blockages for one macro and record its bbox
proc invsPlaceMacro {idx shape_name mw mh dx dy edge rel_poly} {
    global placed_bboxes macro_rb_layers macro_pg_rb_layers macro_bboxes
    set abs_poly [invsTranslatePoly $rel_poly $dx $dy]
    set pb_name "macro_pb_${idx}"
    set rb_name "macro_rb_${idx}"
    set pgrb_name "macro_pgrb_${idx}"

    # placement: completely block standard cells inside the macro region
    createPlaceBlockage -name $pb_name -type hard -polygon $abs_poly

    # routing blockage #1 (all nets, M1..M7): completely block routing inside
    # the macro region on the layers actually used by this flow. The list
    # comes from vars(route_layers) in common_setup.tcl, the same list used
    # to restrict routing in the route step. No -exceptpgnet is used, so PG
    # special routing is blocked here as well.
    if {[catch {createRouteBlockage -name $rb_name -layers $macro_rb_layers -polygon $abs_poly} rb_err]} {
      if {[catch {createRouteBlk -name $rb_name -layer $macro_rb_layers -polygon $abs_poly} rb_err2]} {
        puts "WARNING: route blockage for macro $idx failed: $rb_err / $rb_err2"
      } else {
        puts "  Macro $idx: route blockage $rb_name (createRouteBlk, M1..M7, all nets)"
      }
    } else {
      puts "  Macro $idx: route blockage $rb_name (M1..M7, all nets)"
    }

    # routing blockage #2 (PG-only, stripe layers M5/M6/M7 +/- M8): explicit
    # belt-and-braces blockage so addStripe breaks/avoids the macro region.
    # Same command as above but scoped to the layers pg.tcl actually uses.
    if {[catch {createRouteBlockage -name $pgrb_name -layers $macro_pg_rb_layers -polygon $abs_poly} pgrb_err]} {
      if {[catch {createRouteBlk -name $pgrb_name -layer $macro_pg_rb_layers -polygon $abs_poly} pgrb_err2]} {
        puts "WARNING: PG route blockage for macro $idx failed: $pgrb_err / $pgrb_err2"
      } else {
        puts "  Macro $idx: PG route blockage $pgrb_name (createRouteBlk, $macro_pg_rb_layers)"
      }
    } else {
      puts "  Macro $idx: PG route blockage $pgrb_name ($macro_pg_rb_layers)"
    }

    lappend placed_bboxes [list $dx $dy [expr {$dx + $mw}] [expr {$dy + $mh}]]
    lappend macro_bboxes [list $dx $dy [expr {$dx + $mw}] [expr {$dy + $mh}]]
    if {$shape_name == "L"} {
      set area_real [expr {$mw * $mh * 2.0 / 3.0}]
    } else {
      set area_real [expr {$mw * $mh}]
    }
    puts "  Macro $idx: $shape_name ${mw}x${mh} on $edge at ($dx,$dy), area=${area_real}"
  }

  # 1) random macro count
  set macro_count [invsRandInt $MACRO_COUNT_MIN $MACRO_COUNT_MAX]

  # 2) randomly split the fixed total budget among the macros
  #    (each macro gets at least 10% of the budget; the last macro takes the
  #    remainder so the total is exactly MACRO_TOTAL_RATIO of the core area)
  set weights [list]
  set wsum 0.0
  for {set i 0} {$i < $macro_count} {incr i} {
    set w [expr {0.1 + rand() * 0.9}]
    lappend weights $w
    set wsum [expr {$wsum + $w}]
  }
  set areas [list]
  set used 0.0
  for {set i 0} {$i < $macro_count} {incr i} {
    if {$i == $macro_count - 1} {
      set a [expr {$total_macro_area - $used}]
    } else {
      set a [expr {$total_macro_area * [lindex $weights $i] / $wsum}]
    }
    lappend areas $a
    set used [expr {$used + $a}]
  }
  puts ">>> Adaptive macro keep-outs: count=$macro_count, total area=${total_macro_area} units^2 (ratio=$MACRO_TOTAL_RATIO of core)"
  for {set i 0} {$i < $macro_count} {incr i} {
    set share_pct [expr {[lindex $areas $i] / $total_macro_area * 100.0}]
    puts "    macro $i budget: [lindex $areas $i] units^2 (${share_pct}% of macro budget)"
  }

  set placed_bboxes [list]
  set macro_bboxes [list]
  set idx 0
  # routing-layer list shared with the route step (M1..M7, no M8)
  if {![info exists vars(route_layers)] || [llength $vars(route_layers)] == 0} {
    set vars(route_layers) {M1 M2 M3 M4 M5 M6 M7}
  }
  set macro_rb_layers $vars(route_layers)
  # power-stripe layers for the PG blockage (must match pg.tcl: M5 vertical,
  # M6 horizontal, M7 vertical; M8 only when vars(pg_use_m8)=true)
  if {[info exists vars(pg_use_m8)] && $vars(pg_use_m8) == "true"} {
    set macro_pg_rb_layers {M5 M6 M7 M8}
  } else {
    set macro_pg_rb_layers {M5 M6 M7}
  }
  puts ">>> Macro PG route blockage layers: $macro_pg_rb_layers"
  for {set i 0} {$i < $macro_count} {incr i} {
    # random shape (square=0, rect=1, L=2), repetition allowed
    set shape_id [invsRandInt 0 2]
    set macro_area [lindex $areas $i]
    if {$shape_id == 0} {
      set info [invsMakeSquare $macro_area]
    } elseif {$shape_id == 1} {
      set info [invsMakeRect $macro_area $RECT_ASPECT]
    } else {
      set info [invsMakeL $macro_area $L_BAR_W $L_BAR_H $L_ARM_W $L_ARM_H]
    }
    set shape_name [lindex $info 0]
    set mw         [lindex $info 1]
    set mh         [lindex $info 2]
    set rel_poly   [lindex $info 3]

    # shrink proportionally if the shape does not fit the core
    if {$mw > $core_w || $mh > $core_h} {
      if {[expr {double($core_w)/$mw}] < [expr {double($core_h)/$mh}]} {
        set fit [expr {double($core_w)/$mw}]
      } else {
        set fit [expr {double($core_h)/$mh}]
      }
      set mw       [expr {$mw * $fit}]
      set mh       [expr {$mh * $fit}]
      set rel_poly [invsScalePoly $rel_poly $fit]
      puts "  Note: macro $i ($shape_name) shrunk by $fit to fit the core"
    }

    # 3a) random tries: random edge + random offset, always on the boundary
    set placed 0
    for {set try 0} {$try < $MACRO_TRY_LIMIT && !$placed} {incr try} {
      set edge_id [invsRandInt 0 3]
      if {$edge_id == 0} {                   ; # bottom
        set dx [invsRandReal $core_llx [expr {$core_urx - $mw}]]
        set dy $core_lly
        set edge_name bottom
      } elseif {$edge_id == 1} {             ; # top
        set dx [invsRandReal $core_llx [expr {$core_urx - $mw}]]
        set dy [expr {$core_ury - $mh}]
        set edge_name top
      } elseif {$edge_id == 2} {             ; # left
        set dx $core_llx
        set dy [invsRandReal $core_lly [expr {$core_ury - $mh}]]
        set edge_name left
      } else {                               ; # right
        set dx [expr {$core_urx - $mw}]
        set dy [invsRandReal $core_lly [expr {$core_ury - $mh}]]
        set edge_name right
      }
      if {[invsBboxFree $dx $dy $mw $mh $placed_bboxes]} {
        invsPlaceMacro $idx $shape_name $mw $mh $dx $dy $edge_name $rel_poly
        incr idx
        set placed 1
      }
    }

    # 3b) deterministic fallback: scan every edge at fine granularity so any
    #     geometrically feasible boundary position is found
    if {!$placed} {
      for {set e 0} {$e < 4 && !$placed} {incr e} {
        if {$e == 0 || $e == 1} {
          set span [expr {$core_w - $mw}]
        } else {
          set span [expr {$core_h - $mh}]
        }
        for {set k 0} {$k <= $MACRO_SCAN_STEPS && !$placed} {incr k} {
          set off [expr {$span * $k / double($MACRO_SCAN_STEPS)}]
          if {$e == 0} {
            set dx [expr {$core_llx + $off}]
            set dy $core_lly
            set edge_name bottom
          } elseif {$e == 1} {
            set dx [expr {$core_llx + $off}]
            set dy [expr {$core_ury - $mh}]
            set edge_name top
          } elseif {$e == 2} {
            set dx $core_llx
            set dy [expr {$core_lly + $off}]
            set edge_name left
          } else {
            set dx [expr {$core_urx - $mw}]
            set dy [expr {$core_lly + $off}]
            set edge_name right
          }
          if {[invsBboxFree $dx $dy $mw $mh $placed_bboxes]} {
            invsPlaceMacro $idx $shape_name $mw $mh $dx $dy $edge_name $rel_poly
            incr idx
            set placed 1
          }
        }
      }
    }

    if {!$placed} {
      puts "WARNING: macro $i ($shape_name, area=$macro_area) has no non-overlapping boundary position; skipped"
    }
  }
  puts ">>> Placed $idx / $macro_count adaptive macro keep-outs"
}

#-------------------------------------------------------------------------------
# 3.5) top-level pin shapes
# Block-level routing requires physical pin geometry on the top ports,
# otherwise NanoRoute aborts with NRDB-631 / NRIG-39 ("pin has no physical
# port"). Pins are auto-placed on the core boundary (layer M3 by default,
# override with vars(pin_layer) in common_setup.tcl), avoiding the macro
# keep-out regions placed above (::macro_bboxes).
#-------------------------------------------------------------------------------
invsPlaceTopPins

#-------------------------------------------------------------------------------
# 4) power plan (ring + stripe + sroute, from the 40nm script)
#-------------------------------------------------------------------------------
source -e -v ../scr/pg/pg.tcl

#-------------------------------------------------------------------------------
# 5) tap cells (well/substrate tie insertion)
#-------------------------------------------------------------------------------
# Some Innovus builds reject a cell list for -cell (IMPSP-9048: the whole
# list is treated as a single cell name). Use one tap cell for compatibility.
addWellTap -cell [lindex $vars(tap_cells) 0] -cellInterval $vars(tap_cell_interval) -prefix WELLTAP -checkerBoard
puts "<ICL> tap cells done"

#-------------------------------------------------------------------------------
# 6) save database + reference floorplan DEF
#-------------------------------------------------------------------------------
exec mkdir -p ../../datain/floorplan_file
defOut -floorplan ../../datain/floorplan_file/[dbgDesignName].$vars(step).def
saveDesign -tcon $vars(dbs_dir)/[dbgDesignName].$vars(step).enc
puts "<ICL> fp done: $vars(dbs_dir)/[dbgDesignName].$vars(step).enc"
