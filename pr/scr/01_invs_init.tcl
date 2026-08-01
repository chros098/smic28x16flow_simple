##################################
## 01 init : import netlist + libraries (LEF only, no timing), save init db
##################################
source -e -v ../scr/design.setup.invs.tcl
source -e -v ../scr/invs_proc.tcl
source -e -v ../scr/invs_common_setting.tcl

set vars(step) init
set vars(rpt_dir) "$vars(rpt_basic_dir)/$vars(step)"
exec mkdir -p $vars(rpt_dir)

puts "<ICL> Starting to run $vars(step) step ..."
invsRunTimeCalculation -start

#-------------------------------------------------------------------------------
# import design
#-------------------------------------------------------------------------------
setImportMode -reset
setLibraryUnit -cap 1pf -time 1ns
set init_remove_assigns 1
set init_design_uniquify 1

source -e -v ../scr/design.global
init_design
checkUnique -verbose

invsReportLogErrors

#-------------------------------------------------------------------------------
# save
#-------------------------------------------------------------------------------
saveDesign -tcon $vars(dbs_dir)/[dbgDesignName].$vars(step).enc

invsRunTimeCalculation -end
puts "<ICL> Ending $vars(step) step ..."
invs_exit
