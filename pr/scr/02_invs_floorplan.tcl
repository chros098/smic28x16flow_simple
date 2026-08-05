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

# fail fast if the init database did not load: with
# enc_source_continue_on_error true, a failed restoreDesign would otherwise be
# silently ignored and the first design-dependent command (floorPlan) fails
# later with a confusing "Design must be in memory" message.
if {[catch {set cur_dn [get_db current_design .name]} db_err]} {
  set cur_dn ""
}
if {$cur_dn == ""} {
  error "ERROR: restoreDesign failed ($vars(dbs_dir)/$vars(design).$vars(previous_step).enc.dat missing or stale?). Run 'make restart' then 'make fp' so init re-runs for the current design."
}
puts "<ICL> Restored design: $cur_dn"

puts "<ICL> Starting to run $vars(step) step ..."
invsRunTimeCalculation -start

source -e -v ../scr/002_floorplan_customize_template.tcl

invsRunTimeCalculation -end
puts "<ICL> Ending $vars(step) step ..."
invs_exit
