##################################
## Power plan (SMIC 40nm, from the complex_mul32 script)
## core ring: M7 top/bottom + M6 left/right
## stripes  : M6 vertical, width 2 / spacing 20 / set-to-set 30
##################################
set PWR_NET [lindex $vars(pwr_nets) 0]
set GND_NET [lindex $vars(gnd_nets) 0]

globalNetConnect $PWR_NET -type pgpin -pin $PWR_NET -inst *
globalNetConnect $GND_NET -type pgpin -pin $GND_NET -inst *
globalNetConnect $PWR_NET -type tiehi -inst *
globalNetConnect $GND_NET -type tielo -inst *

addRing -nets "$PWR_NET $GND_NET" -type core_rings -follow core \
        -layer {top M7 bottom M7 left M6 right M6} -width 3 -spacing 2
addStripe -nets "$PWR_NET $GND_NET" -layer M6 -direction vertical \
          -width 2 -spacing 20 -set_to_set_distance 30

sroute -nets [list $PWR_NET $GND_NET] -connect {corePin floatingStripe}

puts "<ICL> power plan done"
