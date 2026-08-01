##################################
## 02 fp : floorplan + power plan (fully automated, no GUI interaction)
##################################
source ../scr/design.setup.invs.tcl
source ../scr/invs_proc.tcl
source -e -v ../scr/invs_common_setting.tcl

set vars(previous_step) init
set vars(step) fp
set vars(rpt_dir) "$vars(rpt_basic_dir)/$vars(step)"
exec mkdir -p $vars(rpt_dir)

restoreDesign $vars(dbs_dir)/$vars(design).$vars(previous_step).enc.dat $vars(design)

puts "<ICL> Starting to run $vars(step) step ..."
invsRunTimeCalculation -start

source -e -v ../scr/002_floorplan_customize_template.tcl

invsRunTimeCalculation -end
puts "<ICL> Ending $vars(step) step ..."
invs_exit
