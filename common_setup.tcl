###########################################################
## Design Setting (SMIC 40nm GDS-only flow)
## Fill in via ./setup.sh, or edit directly.
## Note: script paths are resolved from pr/work; the netlist below is an
## absolute path on the server.
###########################################################

set vars(DESIGN) swerv_dual
set vars(netlist) [list /tgzn/project/user03/k/inn/smic28x16flow_simple/netlist/cdl/swerv_dual.smic.gate.v]

#############
# floorplan
#############
# Optional: pre-placed floorplan DEF. If empty, fp step creates the default
# floorplan from the 40nm script: floorPlan -r 1.2 0.6 5 5 5 5
set vars(fp_def_file) ""

# Macro keep-out regions in the fp step:
#   true  = draw adaptive/random macro keep-outs (count 1..3, square/rect/L,
#           TOTAL area = 25% of core, random edge positions, no overlap)
#   false = no macro keep-outs (all-std-cell designs like swerv_dual)
set vars(fp_macro_keepouts) "true"

# Reproducible random seed for the macro keep-outs: with a fixed seed, every
# run generates the SAME macro count / shape / position / area split. Change
# the number to get a different (but still reproducible) layout, or delete
# this line to go back to fully random layouts on every run.
set vars(fp_macro_seed) 12345

# Layer used for auto-placed top-level pin shapes (block-level routing needs
# physical pin geometry; see invsPlaceTopPins in pr/scr/invs_proc.tcl).
set vars(pin_layer) M3

#############
# routing
#############
# Layers available for signal/clock routing in this flow: M1..M7 only
# (M8 is intentionally not used). The fp step blocks the macro keep-out
# regions on exactly these layers, and the route step restricts global and
# detail routing to them (hard limits via setDesignMode). Core signals tend
# to use the upper layers (M6/M7) first by default.
set vars(route_layers) "M1 M2 M3 M4 M5 M6 M7"
set vars(route_top_layer) "M7"

# Power stripes: M5/M6/M7 only (M8 stripe code removed from pr/scr/pg/pg.tcl).
# This flag is kept for pr_top, where "true" still re-enables M8 stripes.
set vars(pg_use_m8) "false"

#############
# GDS output
#############
# true  = additionally stream out <design>.mergecell.gds.gz with std-cell
#         layout merged (recommended, this is the usable full GDS)
# false = only stream out <design>.pr.gds.gz (cells as references)
set vars(merge_gds) true
