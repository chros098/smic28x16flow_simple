###########################################################
## Design Setting (SMIC 40nm GDS-only flow)
## Fill in via ./setup.sh, or edit directly.
## Note: relative paths are resolved from pr/work.
###########################################################

set vars(DESIGN) complex_mul32
set vars(netlist) [list ../../netlist/cdl/complex_mul32.v]

#############
# floorplan
#############
# Optional: pre-placed floorplan DEF. If empty, fp step creates the default
# floorplan from the 40nm script: floorPlan -r 1.2 0.7 5 5 5 5
set vars(fp_def_file) ""

#############
# GDS output
#############
# true  = additionally stream out <design>.mergecell.gds.gz with std-cell
#         layout merged (recommended, this is the usable full GDS)
# false = only stream out <design>.pr.gds.gz (cells as references)
set vars(merge_gds) true
