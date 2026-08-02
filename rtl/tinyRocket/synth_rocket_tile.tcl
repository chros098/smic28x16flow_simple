#################################################
# Yosys synthesis: RocketTile (Rocket TinyConfig)
# Std-cell-only mode:
#   - SRAM black boxes are replaced by behavioral
#     models (behav_srams.v), no macros needed
#   - plusarg_reader.v is the ORFS companion module
#
# Usage (run from rtl/tinyRocket/):
#   yosys -c synth_rocket_tile.tcl        # Tcl-enabled Yosys
#   yosys -s synth_rocket_tile.ys         # any Yosys (recommended)
#
# To map onto SMIC40 std cells (required before Innovus),
# set SMIC_LIB to the .lib path, e.g.:
#   SMIC_LIB=/tgzn/.../scc40nll_vhsc40_lvt.lib \
#     yosys -c synth_rocket_tile.tcl
#
# Output: RocketTile.gate.v
#################################################

read_verilog freechips.rocketchip.system.TinyConfig.v
read_verilog behav_srams.v
read_verilog plusarg_reader.v

synth -top RocketTile

# Replace all X (don't-care) constants with 0. Innovus's netlist parser
# (IMPVL) rejects literals like 8'hxx, so this is required before write_verilog.
setundef -zero

if {[info exists env(SMIC_LIB)] && [file exists $env(SMIC_LIB)]} {
  puts "INFO: mapping to SMIC40 library $env(SMIC_LIB)"
  dfflibmap -liberty $env(SMIC_LIB)
  abc -liberty $env(SMIC_LIB)
  stat -liberty $env(SMIC_LIB)
} else {
  puts "WARNING: SMIC_LIB not set, keeping Yosys generic cells"
}

write_verilog RocketTile.gate.v
puts "INFO: netlist written to RocketTile.gate.v"
