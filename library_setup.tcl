##################################
## Library setup (SMIC 40nm, from the complex_mul32 script)
## LEF / GDS / stream-out map only. No timing libs, no QRC.
##################################

set vars(TECH_LEF_FILE) "/tgzn/data/techfile/smic40/std/librarya/Design_Start/SMIC/40nm_logic/lib/stdcell/smic/SCC40NLL_VHSC40_LVT/V0p1/lef/tf/scc40nll_10lm_2tm.lef"

set vars(LEF_LIBS) [list \
/tgzn/data/techfile/smic40/std/librarya/Design_Start/SMIC/40nm_logic/lib/stdcell/smic/SCC40NLL_VHSC40_LVT/V0p1/lef/macro/scc40nll_vhsc40_lvt.lef \
]

set vars(GDS_LIBS) [list \
/tgzn/data/techfile/smic40/std/librarya/Design_Start/SMIC/40nm_logic/lib/stdcell/smic/SCC40NLL_VHSC40_LVT/V0p1/gds/scc40nll_vhsc40_lvt.gds \
]

# stream-out layer map
# user-provided path: /tgzn/project/user03/k/inn/smic40_ad/lib/streams.map
set vars(TECH_MAP_INVS) "/tgzn/project/user03/k/inn/smic40_ad/lib/streams.map"
