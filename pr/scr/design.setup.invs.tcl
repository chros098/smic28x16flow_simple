##################################
## Design setup (SMIC 40nm, GDS-only flow, no timing)
## Only variables actually used by the simplified scripts are kept.
##################################
set enc_source_continue_on_error true
set synopsys_program_name innovus
suppressMessage IMPLF-82

# golden lib setup
set restore_db_file_check 0
source -e -v ../../common_setup.tcl
source -e -v ../../library_setup.tcl

# basic vars
set vars(design) $vars(DESIGN)
set vars(rpt_basic_dir) ../rpts
set vars(dbs_dir) ../dbs
set vars(process) 40

# power nets (same as the 40nm script)
set vars(pwr_nets) "VDD"
set vars(gnd_nets) "VSS"

# filler cells (from the 40nm script, SCC40NLL VHSC40 12T L40)
set vars(filler_cells) "F_FILL1_12TL40 F_FILL2_12TL40 F_FILL4_12TL40 F_FILL8_12TL40 F_FILL16_12TL40 F_FILL32_12TL40 F_FILL64_12TL40 F_FILL128_12TL40"

# tap cells (well/substrate ties, SCC40NLL VHSC40 12T L40)
set vars(tap_cells) "FILLTIE3_12TL40 FILLTIE4_12TL40 FILLTIE8_12TL40 FILLTIE16_12TL40 FILLTIE32_12TL40 FILLTIE64_12TL40 FILLTIE128_12TL40"

# tap cell insertion interval (in site widths; adjust per process rule)
set vars(tap_cell_interval) 60

puts "ICL : Finish loading setup file"
