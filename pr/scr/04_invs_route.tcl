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

setNanoRouteMode -quiet -routeWithTimingDriven false -routeWithSiDriven false
routeDesign -globalDetail

catch {redirect -tee $vars(rpt_dir)/[dbgDesignName].$vars(step).unrouted.rpt {reportNets -unrouted}}

saveDesign -tcon $vars(dbs_dir)/[dbgDesignName].$vars(step).enc

invsRunTimeCalculation -end
puts "<ICL> Ending $vars(step) step ..."
invs_exit
