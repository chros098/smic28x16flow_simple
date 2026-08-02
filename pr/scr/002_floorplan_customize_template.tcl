##################################
## Floorplan template (SMIC 40nm, from the complex_mul32 script)
## - default: floorPlan -r 1.2 0.7 5 5 5 5 (aspect ratio / core util / margins)
## - optional: load a pre-placed DEF if vars(fp_def_file) is set
## - macro regions fully shielded (placement hard blockage + routing blockage
##   on ALL routing layers: no std cells, no wires inside)
## - power: M7/M6 core ring + M5-M8 stripes (width 4.5 / spacing 30) + sroute
##################################

#-------------------------------------------------------------------------------
# 1) floorplan
#-------------------------------------------------------------------------------
if {[string length $vars(fp_def_file)] > 0 && [file exists $vars(fp_def_file)]} {
  puts "<ICL> Loading floorplan DEF: $vars(fp_def_file)"
  defIn $vars(fp_def_file)
} else {
  puts "<ICL> Creating default floorplan: floorPlan -r 1.2 0.7 5 5 5 5"
  floorPlan -r 1.2 0.7 5 5 5 5
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
# 3) macro keep-out regions (core coordinates)
#    Fixed area: 60000 um2 per macro, positioned by absolute offsets (um)
#    from the core edges. Core box is read at runtime, so the actual
#    coordinates are computed when the core size is known.
#    Disabled when vars(fp_macro_keepouts) == "false" (no-SRAM designs).
#      Macro 1 : top-center rectangle  300 x 200 = 60000 um2
#      Macro 2 : bottom-right rectangle 300 x 200 = 60000 um2
#      Macro 3 : bottom-left L-shape   250x160 + 100x200 = 60000 um2
#-------------------------------------------------------------------------------
if {[info exists vars(fp_macro_keepouts)] && $vars(fp_macro_keepouts) == "false"} {
  puts ">>> Macro keep-out regions disabled (vars(fp_macro_keepouts)=false)"
} else {
set MACRO_POLYGONS [list]

set MACRO_MARGIN 10      ; # gap from core edge (um)
set MACRO_W 300          ; # rectangle width (um)
set MACRO_H 200          ; # rectangle height (um)

if {($core_w < 920) || ($core_h < 420)} {
  puts "WARNING: core ${core_w}x${core_h} um is small; fixed 60000um2 macro keep-outs may overlap or exceed the core"
}

# region 1 : top-center rectangle
set m1_llx [expr {$core_llx + ($core_w - $MACRO_W)/2.0}]
set m1_lly [expr {$core_ury - $MACRO_H - $MACRO_MARGIN}]
lappend MACRO_POLYGONS [list \
    $m1_llx                          $m1_lly \
    [expr {$m1_llx + $MACRO_W}]      $m1_lly \
    [expr {$m1_llx + $MACRO_W}]      [expr {$m1_lly + $MACRO_H}] \
    $m1_llx                          [expr {$m1_lly + $MACRO_H}] \
]

# region 2 : bottom-right rectangle
set m2_llx [expr {$core_urx - $MACRO_W - $MACRO_MARGIN}]
set m2_lly [expr {$core_lly + $MACRO_MARGIN}]
lappend MACRO_POLYGONS [list \
    $m2_llx                          $m2_lly \
    [expr {$m2_llx + $MACRO_W}]      $m2_lly \
    [expr {$m2_llx + $MACRO_W}]      [expr {$m2_lly + $MACRO_H}] \
    $m2_llx                          [expr {$m2_lly + $MACRO_H}] \
]

# region 3 : bottom-left L-shape (250x160 bar + 100x200 arm)
set mL_bar_w 250
set mL_bar_h 160
set mL_arm_w 100
set mL_arm_h 200
set mL_x [expr {$core_llx + $MACRO_MARGIN}]
set mL_y [expr {$core_lly + $MACRO_MARGIN}]
lappend MACRO_POLYGONS [list \
    $mL_x                             $mL_y \
    [expr {$mL_x + $mL_bar_w}]        $mL_y \
    [expr {$mL_x + $mL_bar_w}]        [expr {$mL_y + $mL_bar_h}] \
    [expr {$mL_x + $mL_arm_w}]        [expr {$mL_y + $mL_bar_h}] \
    [expr {$mL_x + $mL_arm_w}]        [expr {$mL_y + $mL_bar_h + $mL_arm_h}] \
    $mL_x                             [expr {$mL_y + $mL_bar_h + $mL_arm_h}] \
]

puts ">>> Macro 1 area: [expr {$MACRO_W * $MACRO_H}] um2"
puts ">>> Macro 2 area: [expr {$MACRO_W * $MACRO_H}] um2"
puts ">>> Macro 3 area: [expr {$mL_bar_w*$mL_bar_h + $mL_arm_w*$mL_arm_h}] um2"

set idx 0
foreach poly $MACRO_POLYGONS {
    set pb_name "macro_pb_${idx}"
    set rb_name "macro_rb_${idx}"

    # placement: completely block standard cells inside the macro region
    createPlaceBlockage -name $pb_name -type hard -polygon $poly

    # routing: completely block ALL routing layers inside the macro region
    # (M1..M10 + top metals). Explicitly pass the layer list when it can be
    # read from the tech; otherwise let Innovus apply its all-layer default.
    if {[catch {dbGet top.tech.layers.name -if {.isRoutingLayer==1}} rb_layers] == 0 \
        && [llength $rb_layers] > 0} {
        createRouteBlockage -name $rb_name -layers $rb_layers -polygon $poly
    } else {
        createRouteBlockage -name $rb_name -polygon $poly
    }
    puts "  Macro region $idx: placement + routing fully blocked (no std cells, no wires)"
    incr idx
}
}

#-------------------------------------------------------------------------------
# 4) power plan (ring + stripe + sroute, from the 40nm script)
#-------------------------------------------------------------------------------
source -e -v ../scr/pg/pg.tcl

#-------------------------------------------------------------------------------
# 5) tap cells (well/substrate tie insertion)
#-------------------------------------------------------------------------------
# addWellTap accepts one or more tap cells; if your Innovus version does not
# accept a list here, keep only one cell name in vars(tap_cells).
addWellTap -cell $vars(tap_cells) -cellInterval $vars(tap_cell_interval) -prefix WELLTAP -checkerBoard
puts "<ICL> tap cells done"

#-------------------------------------------------------------------------------
# 6) save database + reference floorplan DEF
#-------------------------------------------------------------------------------
exec mkdir -p ../../datain/floorplan_file
defOut -floorplan ../../datain/floorplan_file/[dbgDesignName].$vars(step).def
saveDesign -tcon $vars(dbs_dir)/[dbgDesignName].$vars(step).enc
puts "<ICL> fp done: $vars(dbs_dir)/[dbgDesignName].$vars(step).enc"
