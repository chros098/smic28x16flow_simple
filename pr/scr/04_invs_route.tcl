##################################
## 04 route : global + detail route, timing/SI driven OFF
##################################
source ../scr/design.setup.invs.tcl
source ../scr/invs_proc.tcl
source -e -v ../scr/invs_common_setting.tcl

set vars(previous_step) place
set vars(step) route
set vars(rpt_dir) "$vars(rpt_basic_dir)/$vars(step)"
exec mkdir -p $vars(rpt_dir)

restoreDesign $vars(dbs_dir)/$vars(design).$vars(previous_step).enc.dat $vars(design)

puts "<ICL> Starting to run $vars(step) step ..."
invsRunTimeCalculation -start

#--- block-level pin shapes (safety net) ---------------------------------------
# If the fp database was built before top ports got physical shapes, NanoRoute
# would abort with NRDB-631 / NRIG-39. This call is idempotent: it only adds
# shapes for pins that do not have a layer yet.
invsPlaceTopPins

#--- routing layer policy ------------------------------------------------
# Signal routing uses M1..M7 only: M8 is intentionally not used. Power
# stripes are created in the fp step by pg.tcl (also M5/M6/M7 only, M8
# removed). Every limit below is wrapped in catch, so an option that this
# Innovus build does not support only prints a NOTE instead of aborting.
if {![info exists vars(route_layers)] || [llength $vars(route_layers)] == 0} {
  set vars(route_layers) {M1 M2 M3 M4 M5 M6 M7}
}
if {![info exists vars(route_top_layer)]} {
  set vars(route_top_layer) [lindex $vars(route_layers) end]
}
set bottom_rl [lindex $vars(route_layers) 0]
set top_rl    $vars(route_top_layer)
puts "<ICL> Routing layers: $vars(route_layers) (bottom=$bottom_rl top=$top_rl, no M8)"

# Innovus layer-limit options are typed as INTEGERS (layer numbers), not
# layer names: -earlyGlobalMinRouteLayer etc. reject "M1". Derive 1..7 from
# the M1..M7 names above (falls back to the raw string if no number found).
proc invsLayerNum {layer} {
  if {[regexp {([0-9]+)} $layer n]} { return $n }
  return $layer
}
set bottom_num [invsLayerNum $bottom_rl]
set top_num    [invsLayerNum $top_rl]

# 1) design-wide hard limits for global + detail routing (INNOVUS201 way)
if {[catch {setDesignMode -topRoutingLayer $top_num -bottomRoutingLayer $bottom_num} err]} {
  puts "WARNING: setDesignMode -topRoutingLayer/-bottomRoutingLayer ignored ($err)"
} else {
  puts "<ICL> setDesignMode: routing limited to M${bottom_num}..M${top_num}"
}

# 2) Early Global Route layer range
if {[catch {setRouteMode -earlyGlobalMinRouteLayer $bottom_num -earlyGlobalMaxRouteLayer $top_num} err]} {
  puts "NOTE: setRouteMode early-global layer limits not supported ($err)"
} else {
  puts "<ICL> setRouteMode: early global routing limited to M${bottom_num}..M${top_num}"
}

# 3) NanoRoute layer limits (classic option; removed in some INNOVUS201
#    builds, so it is only a bonus if accepted)
if {[catch {setNanoRouteMode -routeBottomRoutingLayer $bottom_num -routeTopRoutingLayer $top_num} err]} {
  puts "NOTE: setNanoRouteMode layer limits not supported ($err)"
} else {
  puts "<ICL> setNanoRouteMode: routing limited to M${bottom_num}..M${top_num}"
}

setNanoRouteMode -quiet -routeWithTimingDriven false -routeWithSiDriven false
routeDesign -globalDetail

catch {redirect -tee $vars(rpt_dir)/[dbgDesignName].$vars(step).unrouted.rpt {reportNets -unrouted}}

saveDesign -tcon $vars(dbs_dir)/[dbgDesignName].$vars(step).enc

invsRunTimeCalculation -end
puts "<ICL> Ending $vars(step) step ..."
invs_exit
