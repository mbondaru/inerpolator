// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.2 (lin64) Build 2258646 Thu Jun 14 20:02:38 MDT 2018
// Date        : Tue Aug 27 13:59:06 2024
// Host        : max running 64-bit Debian GNU/Linux 12 (bookworm)
// Command     : write_verilog -force -mode synth_stub
//               /home/bimbom/Desktop/VivadoWorkspace/reg_file/reg_file.srcs/sources_1/ip/clk_wiz_0_1/clk_wiz_0_stub.v
// Design      : clk_wiz_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a200tifbg676-1L
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module clk_wiz_0(hphi_2, clamp, sample, phirg, hphi_1, adc, reset, 
  clk_in1)
/* synthesis syn_black_box black_box_pad_pin="hphi_2,clamp,sample,phirg,hphi_1,adc,reset,clk_in1" */;
  output hphi_2;
  output clamp;
  output sample;
  output phirg;
  output hphi_1;
  output adc;
  input reset;
  input clk_in1;
endmodule
