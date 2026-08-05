##################################
## Power plan (SMIC 40nm)
## core ring: M7 top/bottom + M6 left/right (width 3 / spacing 2)
## stripes  : M5/M6/M7, width 4.5 um, spacing 120 um / set-to-set 240 um
##            M5/M7 vertical, M6 horizontal (alternating)
##            M8 is NOT used in this flow (removed)
##            stripes STOP at the macro keep-out regions (route blockages
##            created in the fp step; setAddStripeMode below makes addStripe
##            respect them, so no power stripe crosses a macro)
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

# --- respect the macro keep-out blockages ------------------------------
# The fp step creates route blockages over the macro keep-out regions.
# Without this mode, addStripe may run stripes straight across them.
#   -ignore_block_check false : do NOT ignore blocks/blockages (some tool
#                               defaults allow stripes to cross macros)
#   -break_at none            : do not force breaks at rings/pads/boundaries;
#                               only the macro blockages matter here
if {[catch {setAddStripeMode -ignore_block_check false -break_at none} strikemode_err]} {
  if {[catch {setAddStripeMode -ignore_block_check false} strikemode_err2]} {
    puts "WARNING: setAddStripeMode not accepted (${strikemode_err} / ${strikemode_err2}); power stripes may cross macro keep-outs"
  } else {
    puts ">>> setAddStripeMode (fallback): -ignore_block_check false only"
  }
} else {
  puts ">>> setAddStripeMode: power stripes will respect macro keep-out blockages"
}

# M5 vertical stripes
addStripe -nets $power_pattern -layer M5 -direction vertical \
          -width 4.5 -spacing 120 -set_to_set_distance 240
# M6 horizontal stripes
addStripe -nets $power_pattern -layer M6 -direction horizontal \
          -width 4.5 -spacing 120 -set_to_set_distance 240
# M7 vertical stripes
addStripe -nets $power_pattern -layer M7 -direction vertical \
          -width 4.5 -spacing 120 -set_to_set_distance 240

sroute -nets [list $PWR_NET $GND_NET] -connect {corePin floatingStripe}

puts "<ICL> power plan done (M5/M6/M7 W4.5, S120/P240, no M8)"
