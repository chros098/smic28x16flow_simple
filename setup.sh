#!/bin/bash
##################################
## Setup design parameters for the simplified GDS-only flow.
##
## Usage: ./setup.sh <design> <netlist> [floorplan_def]
## Example:
##   ./setup.sh my_block /release/JX8/block/my_block.mapped.v \
##              /project/JX8/datain/floorplan/my_block.def.gz
##################################
set -e

if [ $# -lt 2 ]; then
  echo "Usage: $0 <design> <netlist> [floorplan_def]"
  echo "Example: $0 my_block /path/my_block.mapped.v /path/my_block.def.gz"
  exit 1
fi

DESIGN="$1"
NETLIST="$2"
DEF="$3"

perl -pi -e "s#^set vars\(DESIGN\).*#set vars(DESIGN) ${DESIGN}#" common_setup.tcl
perl -pi -e "s#^set vars\(netlist\).*#set vars(netlist) [list ${NETLIST}]#" common_setup.tcl
perl -pi -e "s#^set vars\(fp_def_file\).*#set vars(fp_def_file) \"${DEF}\"#" common_setup.tcl
perl -pi -e "s#^DESIGN:=.*#DESIGN:=${DESIGN}#" Makefile

echo "Done. DESIGN=${DESIGN}"
echo "Next step: make dataout   (or step by step: make init / fp / place / route / dataout)"
