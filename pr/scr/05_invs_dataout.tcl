##################################
## 05 dataout : filler + netlist + GDS + DEF
##################################
source ../scr/design.setup.invs.tcl
source ../scr/invs_proc.tcl
source -e -v ../scr/invs_common_setting.tcl

set vars(previous_step) route
set vars(step) dataout
set vars(rpt_dir) "$vars(rpt_basic_dir)/$vars(step)"
exec mkdir -p $vars(rpt_dir)

restoreDesign $vars(dbs_dir)/$vars(design).$vars(previous_step).enc.dat $vars(design)

puts "<ICL> Starting to run $vars(step) step ..."
invsRunTimeCalculation -start

invsAddFillerCells
invsSaveNetlist
invsSaveGds
invsSaveAllDef

saveDesign -tcon $vars(dbs_dir)/[dbgDesignName].$vars(step).enc

invsRunTimeCalculation -end
puts "<ICL> Ending $vars(step) step ..."
invs_exit
