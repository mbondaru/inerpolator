## Clock signal

#set_property CFGBVS VCCO [current_design]
#    set_property CONFIG_VOLTAGE 1.8 [current_design]

set_property CONFIG_VOLTAGE 3.3 [current_design]
set_property CFGBVS VCCO [current_design]

set_property -dict { PACKAGE_PIN N21   IOSTANDARD LVCMOS33 } [get_ports CLK]
create_clock -add -name clk_pin -period 34.00 -waveform {0 17} [get_ports CLK]

set_property -dict { PACKAGE_PIN E20   IOSTANDARD LVCMOS18 } [get_ports CLK_DISPLAY]
create_clock -add -name clk_display_pin -period 37.00 -waveform {0 18.5} [get_ports CLK_DISPLAY]

set_property -dict { PACKAGE_PIN D19   IOSTANDARD LVCMOS18 } [get_ports DISP_MCLK]
#create_generated_clock -source clk_display_pin -master_clock CLK_DISPLAY -add -name clk_disp_mclk  [get_ports DISP_MCLK]


#set_property -dict { PACKAGE_PIN     IOSTANDARD LVCMOS33 } [get_ports HPHI1]
#create_generated_clock -add -name clk_hphi1 -source clk_pin [get_ports HPHI1]
set_property -dict { PACKAGE_PIN M22   IOSTANDARD LVCMOS33 } [get_ports HPHI1];
set_property -dict { PACKAGE_PIN L23   IOSTANDARD LVCMOS33 } [get_ports HPHI2];
set_property -dict { PACKAGE_PIN M20   IOSTANDARD LVCMOS33 } [get_ports CLAMP];
set_property -dict { PACKAGE_PIN T25   IOSTANDARD LVCMOS33 } [get_ports SAMPLE];
set_property -dict { PACKAGE_PIN T24   IOSTANDARD LVCMOS33 } [get_ports PHIRG];
set_property -dict { PACKAGE_PIN T23   IOSTANDARD LVCMOS33 } [get_ports ADC_CLK];



#Bank 15 HR
set_property -dict { PACKAGE_PIN K26   IOSTANDARD LVCMOS33 } [get_ports {D_IN[0]}];
set_property -dict { PACKAGE_PIN K25   IOSTANDARD LVCMOS33 } [get_ports {D_IN[1]}];
set_property -dict { PACKAGE_PIN L24   IOSTANDARD LVCMOS33 } [get_ports {D_IN[2]}];
set_property -dict { PACKAGE_PIN L25   IOSTANDARD LVCMOS33 } [get_ports {D_IN[3]}];
set_property -dict { PACKAGE_PIN M24   IOSTANDARD LVCMOS33 } [get_ports {D_IN[4]}];
set_property -dict { PACKAGE_PIN M25   IOSTANDARD LVCMOS33 } [get_ports {D_IN[5]}];
set_property -dict { PACKAGE_PIN M26   IOSTANDARD LVCMOS33 } [get_ports {D_IN[6]}];
set_property -dict { PACKAGE_PIN N24   IOSTANDARD LVCMOS33 } [get_ports {D_IN[7]}];
set_property -dict { PACKAGE_PIN N26   IOSTANDARD LVCMOS33 } [get_ports {EN}];


#Bank 15 HR
set_property PACKAGE_PIN D24 [get_ports {D_OUT[0]}]
set_property IOSTANDARD LVCMOS18 [get_ports {D_OUT[0]}]
##Sch name = JA2
set_property PACKAGE_PIN D23 [get_ports {D_OUT[1]}]
set_property IOSTANDARD LVCMOS18 [get_ports {D_OUT[1]}]
##Sch name = JA3
set_property PACKAGE_PIN D26 [get_ports {D_OUT[2]}]
set_property IOSTANDARD LVCMOS18 [get_ports {D_OUT[2]}]
##Sch name = JA4
set_property PACKAGE_PIN C26 [get_ports {D_OUT[3]}]
set_property IOSTANDARD LVCMOS18 [get_ports {D_OUT[3]}]
##Sch name = JA7
set_property PACKAGE_PIN C24 [get_ports {D_OUT[4]}]
set_property IOSTANDARD LVCMOS18 [get_ports {D_OUT[4]}]
##Sch name = JA8
set_property PACKAGE_PIN C23 [get_ports {D_OUT[5]}]
set_property IOSTANDARD LVCMOS18 [get_ports {D_OUT[5]}]
##Sch name = JA9
set_property PACKAGE_PIN B26 [get_ports {D_OUT[6]}]
set_property IOSTANDARD LVCMOS18 [get_ports {D_OUT[6]}]
##Sch name = JA10
set_property PACKAGE_PIN B25 [get_ports {D_OUT[7]}]
set_property IOSTANDARD LVCMOS18 [get_ports {D_OUT[7]}]

set_property PACKAGE_PIN B24 [get_ports {D_OUT[8]}]
set_property IOSTANDARD LVCMOS18 [get_ports {D_OUT[8]}]
##Sch name = JB2
set_property PACKAGE_PIN A25 [get_ports {D_OUT[9]}]
set_property IOSTANDARD LVCMOS18 [get_ports {D_OUT[9]}]
##Sch name = JB3
set_property PACKAGE_PIN A24 [get_ports {D_OUT[10]}]
set_property IOSTANDARD LVCMOS18 [get_ports {D_OUT[10]}]
##Sch name = JB4
set_property PACKAGE_PIN A23 [get_ports {D_OUT[11]}]
set_property IOSTANDARD LVCMOS18 [get_ports {D_OUT[11]}]
##Sch name = JB7
set_property PACKAGE_PIN A22 [get_ports {D_OUT[12]}]
set_property IOSTANDARD LVCMOS18 [get_ports {D_OUT[12]}]
##Sch name = JB8
set_property PACKAGE_PIN B22 [get_ports {D_OUT[13]}]
set_property IOSTANDARD LVCMOS18 [get_ports {D_OUT[13]}]
##Sch name = JB9
set_property PACKAGE_PIN C22 [get_ports {D_OUT[14]}]
set_property IOSTANDARD LVCMOS18 [get_ports {D_OUT[14]}]
##Sch name = JB10
set_property PACKAGE_PIN D16 [get_ports {D_OUT[15]}]
set_property IOSTANDARD LVCMOS18 [get_ports {D_OUT[15]}]

set_property PACKAGE_PIN B21 [get_ports {D_OUT[16]}]
set_property IOSTANDARD LVCMOS18 [get_ports {D_OUT[16]}]
##Sch name = JC2
set_property PACKAGE_PIN C21 [get_ports {D_OUT[17]}]
set_property IOSTANDARD LVCMOS18 [get_ports {D_OUT[17]}]
##Sch name = JC3
set_property PACKAGE_PIN D21 [get_ports {D_OUT[18]}]
set_property IOSTANDARD LVCMOS18 [get_ports {D_OUT[18]}]
##Sch name = JC4
set_property PACKAGE_PIN D20 [get_ports {D_OUT[19]}]
set_property IOSTANDARD LVCMOS18 [get_ports {D_OUT[19]}]
##Sch name = JC7
set_property PACKAGE_PIN B20 [get_ports {D_OUT[20]}]
set_property IOSTANDARD LVCMOS18 [get_ports {D_OUT[20]}]
##Sch name = JC8
set_property PACKAGE_PIN A20 [get_ports {D_OUT[21]}]
set_property IOSTANDARD LVCMOS18 [get_ports {D_OUT[21]}]
##Sch name = JC9
set_property PACKAGE_PIN A19 [get_ports {D_OUT[22]}]
set_property IOSTANDARD LVCMOS18 [get_ports {D_OUT[22]}]
##Sch name = JC10
set_property PACKAGE_PIN B19 [get_ports {D_OUT[23]}]
set_property IOSTANDARD LVCMOS18 [get_ports {D_OUT[23]}]

