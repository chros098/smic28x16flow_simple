##################################
## Power plan (SMIC 40nm)
## core ring: M7 top/bottom + M6 left/right (width 3 / spacing 2)
## stripes  : M5/M6/M7/M8, width 4.5 um / spacing 30 um
##            M5/M7 vertical, M6/M8 horizontal (alternating)
##################################
set PWR_NET [lindex $vars(pwr_nets) 0]
set GND_NET [lindex $vars(gnd_nets) 0]
set power_pattern "$PWR_NET $GND_NET"

globalNetConnect $PWR_NET -type pgpin -pin $PWR_NET -inst *
globalNetConnect $GND_NET -type pgpin -pin $GND_NET -inst *
globalNetConnect $PWR_NET -type tiehi -inst *
globalNetConnect $GND_NET -type tielo -inst *

addRing -nets "$PWR_NET $GND_NET" -type core_rings -follow core \
        -layer {top M7 bottom M7 left M6 right M6} -width 3 -spacing 2

# M5 vertical stripes
addStripe -nets $power_pattern -layer M5 -direction vertical \
          -width 4.5 -spacing 30 -set_to_set_distance 60
# M6 horizontal stripes
addStripe -nets $power_pattern -layer M6 -direction horizontal \
          -width 4.5 -spacing 30 -set_to_set_distance 60
# M7 vertical stripes
addStripe -nets $power_pattern -layer M7 -direction vertical \
          -width 4.5 -spacing 30 -set_to_set_distance 60
# M8 horizontal stripes
addStripe -nets $power_pattern -layer M8 -direction horizontal \
          -width 4.5 -spacing 30 -set_to_set_distance 60

sroute -nets [list $PWR_NET $GND_NET] -connect {corePin floatingStripe}

puts "<ICL> power plan done (M5-M8 stripes W4.5/S30)"
