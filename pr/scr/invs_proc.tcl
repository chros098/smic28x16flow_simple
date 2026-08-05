##################################
## Simplified procs for the GDS-only flow
##################################

proc invsRunTimeCalculation {args} {
  global vars
  set action [lindex $args 0]
  if {$action == "-start"} {
    set vars(run_start_time) [clock seconds]
    puts "<ICL> step started at [clock format $vars(run_start_time) -format {%Y-%m-%d %H:%M:%S}]"
  } else {
    set end [clock seconds]
    set elapsed [expr $end - $vars(run_start_time)]
    puts "<ICL> step ended at [clock format $end -format {%Y-%m-%d %H:%M:%S}], elapsed ${elapsed}s"
  }
}

proc invs_exit {} {
  global vars
  exec touch ../../.flag/$vars(step)
  puts "<ICL> touched ../../.flag/$vars(step)"
  exit
}

proc invsReportLogErrors {} {
  if { [catch {exec grep -i Error [getLogFileName]} ret_var] == 0 } {
    puts "Info: Error keyword detected in [getLogFileName]"
    puts "$ret_var"
  }
}

# Macro keep-out regions live in the global ::macro_bboxes list (set by the
# fp step as {llx lly urx ury} per placed keep-out). invsEdgeIntervals clips
# a core edge into free intervals that do not overlap any keep-out, so the
# auto-placed top pins never land inside a macro routing blockage.
proc invsEdgeIntervals {side llx lly urx ury} {
  global macro_bboxes
  if {$side eq "left" || $side eq "right"} {
    set span_lo $lly
    set span_hi $ury
  } else {
    set span_lo $llx
    set span_hi $urx
  }
  set intervals [list [list $span_lo $span_hi]]
  if {![info exists macro_bboxes]} { return $intervals }
  set out [list]
  foreach iv $intervals {
    set lo [lindex $iv 0]
    set hi [lindex $iv 1]
    foreach bb $macro_bboxes {
      set bx0 [lindex $bb 0]
      set by0 [lindex $bb 1]
      set bx1 [lindex $bb 2]
      set by1 [lindex $bb 3]
      if {$side eq "left" || $side eq "right"} {
        set m0 $by0
        set m1 $by1
      } else {
        set m0 $bx0
        set m1 $bx1
      }
      set cut0 [expr {$m0 > $lo ? $m0 : $lo}]
      set cut1 [expr {$m1 < $hi ? $m1 : $hi}]
      if {$cut0 < $cut1} {
        if {$lo < $cut0} { lappend out [list $lo $cut0] }
        if {$cut1 > $lo} { set lo $cut1 }
      }
    }
    if {$lo < $hi} { lappend out [list $lo $hi] }
  }
  return $out
}

# Place a group of pins on one core edge, evenly spread inside the free
# intervals (macro keep-outs excluded). Coordinates are assigned explicitly
# so pins never overlap a macro routing blockage.
proc invsPlacePinsOnEdge {pins side llx lly urx ury} {
  global vars
  if {[llength $pins] == 0} { return }
  set intervals [invsEdgeIntervals $side $llx $lly $urx $ury]
  set total 0
  foreach iv $intervals {
    set total [expr {$total + ([lindex $iv 1] - [lindex $iv 0])}]
  }
  if {$total <= 0} {
    puts "WARNING: invsPlacePinsOnEdge: no free space on $side for [llength $pins] pin(s)"
    return
  }
  set npins [llength $pins]
  set nint  [llength $intervals]
  set idx   0
  for {set j 0} {$j < $nint} {incr j} {
    set iv  [lindex $intervals $j]
    set lo  [lindex $iv 0]
    set hi  [lindex $iv 1]
    set len [expr {$hi - $lo}]
    if {$j == $nint - 1} {
      set cnt [expr {$npins - $idx}]
    } else {
      set cnt [expr {int(0.5 + double($npins) * $len / $total)}]
      if {$cnt > $npins - $idx} { set cnt [expr {$npins - $idx}] }
      if {$cnt < 0} { set cnt 0 }
    }
    if {$cnt <= 0} { continue }
    set sub [lrange $pins $idx [expr {$idx + $cnt - 1}]]
    incr idx $cnt
    set step [expr {$len / double($cnt + 1)}]
    set assigns [list]
    for {set i 0} {$i < $cnt} {incr i} {
      set pos [expr {$lo + double($i + 1) * $step}]
      if {$side eq "left"} {
        lappend assigns [list $llx $pos]
      } elseif {$side eq "right"} {
        lappend assigns [list $urx $pos]
      } elseif {$side eq "top"} {
        lappend assigns [list $pos $ury]
      } else {
        lappend assigns [list $pos $lly]
      }
    }
    # editPin -assign accepts ONE {x y} pair per call, so place pin by pin.
    set placed_cnt 0
    foreach pn $sub coord $assigns {
      if {[catch {editPin -pin $pn -layer $vars(pin_layer) -fixedPin -assign $coord} pin_err]} {
        puts "WARNING: invsPlacePinsOnEdge: editPin failed for $pn on $side: $pin_err"
      } else {
        incr placed_cnt
      }
    }
    puts "<ICL> invsPlacePinsOnEdge: placed $placed_cnt pin(s) on $side (layer $vars(pin_layer))"
  }
  if {$idx < $npins} {
    puts "WARNING: invsPlacePinsOnEdge: only placed $idx of $npins pin(s) on $side"
  }
}

# Create physical pin shapes for every top-level port that still has no
# physical shape (logical pin only). Block-level designs need these shapes,
# otherwise NanoRoute fails with NRDB-631 / NRIG-39 ("pin has no physical
# port / cannot route to pin"). Pins are fixed on the core boundary:
# inputs on left/top, outputs on right/bottom, inout on top/bottom, others
# on left/right, always avoiding the macro keep-out regions. The procedure
# is idempotent: pins that already have a physical shape are left untouched.
proc invsPlaceTopPins {} {
  global vars
  if {![info exists vars(pin_layer)] || $vars(pin_layer) == ""} {
    set vars(pin_layer) M3
  }
  # Top-level ports are "terms" in the Innovus db schema (dbget top.pins is
  # NOT a valid path on topCell and raises IMPDBTCL-204).
  set all_terms [dbget top.terms]
  if {[llength $all_terms] == 0} {
    puts "<ICL> invsPlaceTopPins: no top-level terms/pins"
    return
  }

  set llx [get_db current_design .core_bbox.ll.x]
  set lly [get_db current_design .core_bbox.ll.y]
  set urx [get_db current_design .core_bbox.ur.x]
  set ury [get_db current_design .core_bbox.ur.y]

  set in_pins [list]
  set out_pins [list]
  set io_pins [list]
  set other_pins [list]
  # NOTE: no physical-shape pre-check here. editPin -assign simply (re)places
  # the pin at the computed coordinates, so calling it on a fresh design or on
  # an existing pin is both safe and idempotent. This avoids db-schema
  # attribute probing (layer/allShapes differ between Innovus releases).
  foreach t $all_terms {
    set pin_name [dbget $t.name]
    switch -- [dbget $t.direction] {
      in      { lappend in_pins $pin_name }
      out     { lappend out_pins $pin_name }
      inout   { lappend io_pins $pin_name }
      default { lappend other_pins $pin_name }
    }
  }

  # Batch mode: hundreds/thousands of editPin calls are much faster inside
  # setPinAssignMode -pinEditInBatch true ... false (Innovus speed hint).
  set batch_failed [catch {setPinAssignMode -pinEditInBatch true} batch_err]
  if {$batch_failed} {
    puts "NOTE: setPinAssignMode -pinEditInBatch not supported ($batch_err)"
  }

  # place each direction group on two edges (half on each edge)
  foreach group [list [list $in_pins left top] \
                       [list $out_pins right bottom] \
                       [list $io_pins top bottom] \
                       [list $other_pins left right]] {
    set pins   [lindex $group 0]
    set side_a [lindex $group 1]
    set side_b [lindex $group 2]
    if {[llength $pins] == 0} { continue }
    set n [llength $pins]
    set k [expr {$n / 2}]
    invsPlacePinsOnEdge [lrange $pins 0 [expr {$k - 1}]] $side_a $llx $lly $urx $ury
    invsPlacePinsOnEdge [lrange $pins $k end]        $side_b $llx $lly $urx $ury
  }

  if {!$batch_failed} {
    catch {setPinAssignMode -pinEditInBatch false}
  }
  puts "<ICL> invsPlaceTopPins: (re)placed [llength $all_terms] top-level pins on core boundary"
}

proc invsAddFillerCells {} {
  global vars
  setFillerMode -reset
  setFillerMode -fitGap true
  addFiller -cell $vars(filler_cells) -prefix FILLER
}

proc invsSaveNetlist {} {
  global vars
  set base_path [pwd]
  set dsn_gate_dir "$base_path/../../dataout/netlist"
  exec mkdir -p $dsn_gate_dir
  deleteDanglingPort
  deleteEmptyModule
  saveNetlist $dsn_gate_dir/[dbgDesignName].pr.vg.gz
  puts "<ICL> netlist saved: $dsn_gate_dir/[dbgDesignName].pr.vg.gz"
}

proc invsSaveGds {} {
  global vars
  set base_path [pwd]
  set dsn_gds_dir "$base_path/../../dataout/gds"
  exec mkdir -p $dsn_gds_dir
  setStreamOutMode -reset
  setStreamOutMode -labelAllPinShape true -virtualConnection false
  streamOut $dsn_gds_dir/[dbgDesignName].pr.gds.gz \
    -mapFile $vars(TECH_MAP_INVS) -libName [dbgDesignName] \
    -structureName [dbgDesignName] -stripes 1 -units 1000 \
    -mode ALL -dieAreaAsBoundary
  puts "<ICL> GDS saved: $dsn_gds_dir/[dbgDesignName].pr.gds.gz"
  if {$vars(merge_gds) == "true"} {
    streamOut $dsn_gds_dir/[dbgDesignName].mergecell.gds.gz \
      -merge $vars(GDS_LIBS) -mapFile $vars(TECH_MAP_INVS) -libName [dbgDesignName] \
      -structureName [dbgDesignName] -stripes 1 -units 1000 -uniquifyCellNames \
      -mode ALL -dieAreaAsBoundary
    puts "<ICL> merged GDS saved: $dsn_gds_dir/[dbgDesignName].mergecell.gds.gz"
  }
  exec mkdir -p $base_path/../../dataout/db
  saveDesign $base_path/../../dataout/db/[dbgDesignName].enc -tcon
}

proc invsSaveAllDef {} {
  global vars
  set base_path [pwd]
  set dsn_def_dir "$base_path/../../dataout/def"
  exec mkdir -p $dsn_def_dir
  defOut $dsn_def_dir/[dbgDesignName].def.gz
  puts "<ICL> DEF saved: $dsn_def_dir/[dbgDesignName].def.gz"
}
