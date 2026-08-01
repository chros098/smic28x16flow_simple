##################################
## Floorplan template (SMIC 40nm, from the complex_mul32 script)
## - default: floorPlan -r 1.2 0.7 5 5 5 5 (aspect ratio / core util / margins)
## - optional: load a pre-placed DEF if vars(fp_def_file) is set
## - irregular macro keep-out regions (placement + routing blockage)
## - power: M7/M6 core ring + M6 vertical stripes + sroute
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
#      Macro 1 : top-center rectangle  300 x 200 = 60000 um2
#      Macro 2 : bottom-right rectangle 300 x 200 = 60000 um2
#      Macro 3 : bottom-left L-shape   250x160 + 100x200 = 60000 um2
#-------------------------------------------------------------------------------
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

    createPlaceBlockage -name $pb_name -type hard -polygon $poly

    if { [catch {createRouteBlockage -name $rb_name -layer all -polygon $poly}] } {
        if { [catch {create_route_blockage -name $rb_name -layer all -polygon $poly}] } {
            puts "  Warning: route blockage command not found, only placement blockage created for region $idx"
        } else {
            puts "  Created route blockage (create_route_blockage) for region $idx"
        }
    } else {
        puts "  Created route blockage (createRouteBlockage) for region $idx"
    }
    puts "  Created placement blockage for region $idx"
    incr idx
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
