-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.2 (lin64) Build 2258646 Thu Jun 14 20:02:38 MDT 2018
-- Date        : Tue Aug 27 13:59:06 2024
-- Host        : max running 64-bit Debian GNU/Linux 12 (bookworm)
-- Command     : write_vhdl -force -mode synth_stub
--               /home/bimbom/Desktop/VivadoWorkspace/reg_file/reg_file.srcs/sources_1/ip/clk_wiz_0_1/clk_wiz_0_stub.vhdl
-- Design      : clk_wiz_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a200tifbg676-1L
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity clk_wiz_0 is
  Port ( 
    hphi_2 : out STD_LOGIC;
    clamp : out STD_LOGIC;
    sample : out STD_LOGIC;
    phirg : out STD_LOGIC;
    hphi_1 : out STD_LOGIC;
    adc : out STD_LOGIC;
    reset : in STD_LOGIC;
    clk_in1 : in STD_LOGIC
  );

end clk_wiz_0;

architecture stub of clk_wiz_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "hphi_2,clamp,sample,phirg,hphi_1,adc,reset,clk_in1";
begin
end;
