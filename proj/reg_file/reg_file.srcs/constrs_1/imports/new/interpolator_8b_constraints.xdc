## Clock signal

#set_property CFGBVS VCCO [current_design]
#    set_property CONFIG_VOLTAGE 1.8 [current_design]

set_property CONFIG_VOLTAGE 1.8 [current_design]
set_property CFGBVS GND [current_design]

set_property -dict { PACKAGE_PIN M6   IOSTANDARD LVCMOS33 } [get_ports CLK]
create_clock -add -name sys_clk_pin -period 34.00 -waveform {0 17} [get_ports CLK]

##set_property -dict { PACKAGE_PIN V17   IOSTANDARD LVCMOS33 } [get_ports RST]
#Bank 34 HR
set_property -dict { PACKAGE_PIN M4   IOSTANDARD LVCMOS33 } [get_ports {D_IN[0]}];
set_property -dict { PACKAGE_PIN N4   IOSTANDARD LVCMOS33 } [get_ports {D_IN[1]}];
set_property -dict { PACKAGE_PIN N3   IOSTANDARD LVCMOS33 } [get_ports {D_IN[2]}];
set_property -dict { PACKAGE_PIN N2   IOSTANDARD LVCMOS33 } [get_ports {D_IN[3]}];
set_property -dict { PACKAGE_PIN P4   IOSTANDARD LVCMOS33 } [get_ports {D_IN[4]}];
set_property -dict { PACKAGE_PIN P3   IOSTANDARD LVCMOS33 } [get_ports {D_IN[5]}];
set_property -dict { PACKAGE_PIN R2   IOSTANDARD LVCMOS33 } [get_ports {D_IN[6]}];
set_property -dict { PACKAGE_PIN R1   IOSTANDARD LVCMOS33 } [get_ports {D_IN[7]}];


#Bank 15 HR
set_property PACKAGE_PIN D8 [get_ports {D_OUT[0]}]
set_property IOSTANDARD LVCMOS18 [get_ports {D_OUT[0]}]
##Sch name = JA2
set_property PACKAGE_PIN C8 [get_ports {D_OUT[1]}]
set_property IOSTANDARD LVCMOS18 [get_ports {D_OUT[1]}]
##Sch name = JA3
set_property PACKAGE_PIN D9 [get_ports {D_OUT[2]}]
set_property IOSTANDARD LVCMOS18 [get_ports {D_OUT[2]}]
##Sch name = JA4
set_property PACKAGE_PIN C9 [get_ports {D_OUT[3]}]
set_property IOSTANDARD LVCMOS18 [get_ports {D_OUT[3]}]
##Sch name = JA7
set_property PACKAGE_PIN B9 [get_ports {D_OUT[4]}]
set_property IOSTANDARD LVCMOS18 [get_ports {D_OUT[4]}]
##Sch name = JA8
set_property PACKAGE_PIN A9 [get_ports {D_OUT[5]}]
set_property IOSTANDARD LVCMOS18 [get_ports {D_OUT[5]}]
##Sch name = JA9
set_property PACKAGE_PIN C11 [get_ports {D_OUT[6]}]
set_property IOSTANDARD LVCMOS18 [get_ports {D_OUT[6]}]
##Sch name = JA10
set_property PACKAGE_PIN B11 [get_ports {D_OUT[7]}]
set_property IOSTANDARD LVCMOS18 [get_ports {D_OUT[7]}]



##Pmod Header JB
##Sch name = JB1
set_property PACKAGE_PIN B10 [get_ports {D_OUT[8]}]
set_property IOSTANDARD LVCMOS18 [get_ports {D_OUT[8]}]
##Sch name = JB2
set_property PACKAGE_PIN A10 [get_ports {D_OUT[9]}]
set_property IOSTANDARD LVCMOS18 [get_ports {D_OUT[9]}]
##Sch name = JB3
set_property PACKAGE_PIN D11 [get_ports {D_OUT[10]}]
set_property IOSTANDARD LVCMOS18 [get_ports {D_OUT[10]}]
##Sch name = JB4
set_property PACKAGE_PIN C12 [get_ports {D_OUT[11]}]
set_property IOSTANDARD LVCMOS18 [get_ports {D_OUT[11]}]
##Sch name = JB7
set_property PACKAGE_PIN B12 [get_ports {D_OUT[12]}]
set_property IOSTANDARD LVCMOS18 [get_ports {D_OUT[12]}]
##Sch name = JB8
set_property PACKAGE_PIN A12 [get_ports {D_OUT[13]}]
set_property IOSTANDARD LVCMOS18 [get_ports {D_OUT[13]}]
##Sch name = JB9
set_property PACKAGE_PIN A13 [get_ports {D_OUT[14]}]
set_property IOSTANDARD LVCMOS18 [get_ports {D_OUT[14]}]
##Sch name = JB10
set_property PACKAGE_PIN A14 [get_ports {D_OUT[15]}]
set_property IOSTANDARD LVCMOS18 [get_ports {D_OUT[15]}]



##Pmod Header JC
##Sch name = JC1
set_property PACKAGE_PIN C14 [get_ports {D_OUT[16]}]
set_property IOSTANDARD LVCMOS18 [get_ports {D_OUT[16]}]
##Sch name = JC2
set_property PACKAGE_PIN B15 [get_ports {D_OUT[17]}]
set_property IOSTANDARD LVCMOS18 [get_ports {D_OUT[17]}]
##Sch name = JC3
set_property PACKAGE_PIN B14 [get_ports {D_OUT[18]}]
set_property IOSTANDARD LVCMOS18 [get_ports {D_OUT[18]}]
##Sch name = JC4
set_property PACKAGE_PIN A15 [get_ports {D_OUT[19]}]
set_property IOSTANDARD LVCMOS18 [get_ports {D_OUT[19]}]
##Sch name = JC7
set_property PACKAGE_PIN D13 [get_ports {D_OUT[20]}]
set_property IOSTANDARD LVCMOS18 [get_ports {D_OUT[20]}]
##Sch name = JC8
set_property PACKAGE_PIN C13 [get_ports {D_OUT[21]}]
set_property IOSTANDARD LVCMOS18 [get_ports {D_OUT[21]}]
##Sch name = JC9
set_property PACKAGE_PIN E13 [get_ports {D_OUT[22]}]
set_property IOSTANDARD LVCMOS18 [get_ports {D_OUT[22]}]
##Sch name = JC10
set_property PACKAGE_PIN D14 [get_ports {D_OUT[23]}]
set_property IOSTANDARD LVCMOS18 [get_ports {D_OUT[23]}]

