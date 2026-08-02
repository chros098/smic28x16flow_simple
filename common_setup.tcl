###########################################################
## Design Setting (SMIC 40nm GDS-only flow)
## Fill in via ./setup.sh, or edit directly.
## Note: relative paths are resolved from pr/work.
###########################################################

set vars(DESIGN) swerv_dual
set vars(netlist) [list ../../netlist/cdl/swerv_dual.smic.gate.v]

#############
# floorplan
#############
# Optional: pre-placed floorplan DEF. If empty, fp step creates the default
# floorplan from the 40nm script: floorPlan -r 1.2 0.7 5 5 5 5
set vars(fp_def_file) ""

# Macro keep-out regions in the fp step:
#   true  = draw the 3 fixed 60000um2 keep-out polygons (designs with SRAM macros)
#   false = no macro keep-outs (all-std-cell designs like swerv_dual)
set vars(fp_macro_keepouts) "false"

#############
# GDS output
#############
# true  = additionally stream out <design>.mergecell.gds.gz with std-cell
#         layout merged (recommended, this is the usable full GDS)
# false = only stream out <design>.pr.gds.gz (cells as references)
set vars(merge_gds) true
