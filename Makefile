#!/usr/bin/make
##################################
## Simplified GDS-only physical design flow
## init -> fp -> place -> route -> dataout (GDS)
## No CTS, no timing signoff, no StarRC/PT/RedHawk/Formality.
##################################

DESIGN:=complex_mul32
BLOCK_PATH:= $(PWD)
CPUS:=16

INNOVUS:=/home/eda/cadence/INNOVUS201/tools.lnx86/bin/innovus

FLAG_PATH:=${BLOCK_PATH}/.flag
PR_PATH:=${BLOCK_PATH}/pr/work

export DESIGN

.PHONY: init fp place route dataout all restart cleanall help

init:${FLAG_PATH}/init
fp:${FLAG_PATH}/fp
place:${FLAG_PATH}/place
route:${FLAG_PATH}/route
dataout:${FLAG_PATH}/dataout
all:dataout

### PR
${FLAG_PATH}/init:
	@mkdir -p ${FLAG_PATH} ${PR_PATH} ${BLOCK_PATH}/pr/dbs ${BLOCK_PATH}/pr/log ${BLOCK_PATH}/pr/rpts ${BLOCK_PATH}/datain/floorplan_file
	cd ${PR_PATH} \
	&&  ${INNOVUS} -cpus ${CPUS} -file ../scr/01_invs_init.tcl -log ../log/init.log

${FLAG_PATH}/fp:${FLAG_PATH}/init
	cd ${PR_PATH} \
	&&  ${INNOVUS} -cpus ${CPUS} -file ../scr/02_invs_floorplan.tcl -log ../log/fp.log

${FLAG_PATH}/place:${FLAG_PATH}/fp
	cd ${PR_PATH} \
	&&  ${INNOVUS} -cpus ${CPUS} -file ../scr/03_invs_place.tcl -log ../log/place.log

${FLAG_PATH}/route:${FLAG_PATH}/place
	cd ${PR_PATH} \
	&&  ${INNOVUS} -cpus ${CPUS} -file ../scr/04_invs_route.tcl -log ../log/route.log

${FLAG_PATH}/dataout:${FLAG_PATH}/route
	cd ${PR_PATH} \
	&&  ${INNOVUS} -cpus ${CPUS} -file ../scr/05_invs_dataout.tcl -log ../log/dataout.log

### clean / restart
restart:
	@rm -rf ${FLAG_PATH}/*

cleanall:
	@rm -rf ${FLAG_PATH}/* ${PR_PATH}/* ${BLOCK_PATH}/pr/dbs/* ${BLOCK_PATH}/pr/log/* ${BLOCK_PATH}/pr/rpts/* ${BLOCK_PATH}/dataout/*

help:
	@echo "Simplified Innovus flow: init -> fp -> place -> route -> dataout (GDS)"
	@echo "Usage:"
	@echo "  ./setup.sh <design> <netlist> [floorplan_def]"
	@echo "  make dataout        # run the whole flow to GDS"
	@echo "  make init|fp|place|route|dataout   # run one step (auto-runs prerequisites)"
	@echo "  make cleanall       # remove all run data"
	@echo "  make restart        # clear step flags only"
