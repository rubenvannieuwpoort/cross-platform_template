read_verilog -sv [glob *.sv]
read_xdc "constraints.xdc"
synth_design -top "top" -part "xc7a50tfgg484-1"
opt_design
place_design
route_design
write_bitstream -force "mimasa7.bit"
