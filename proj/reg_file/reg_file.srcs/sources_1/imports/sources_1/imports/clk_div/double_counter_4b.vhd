----------------------------------------------------------------------------------
-- Company: IP Bondaruk
-- Engineer: Maksim Bondaruk
-- 
-- Create Date: 08/10/2024 05:24:47 AM
-- Design Name: 
-- Module Name: double_counter_4b - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

Library UNISIM;
use UNISIM.vcomponents.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity double_counter_4b is
  Port 
  ( 
      RESET : in std_logic;
      CLK : in std_logic;
      COMP : in std_logic_vector (3 downto 0);
      COUNT : out std_logic_vector (3 downto 0);
      OVERFLOW : out std_logic
  );
end double_counter_4b;

architecture Behavioral of double_counter_4b is

--component declaration
  component register_4b_deff is
  port ( CLK : in std_logic;
    LD : in std_logic;
    D_IN : in std_logic_vector(3 downto 0);
    D_OUT : out std_logic_vector(3 downto 0)
  );
  end component;
  
  component add_4b is
    port ( A : in std_logic_vector(3 downto 0);
      B : in std_logic_vector(3 downto 0);
      C_IN : in std_logic;
      Y : out std_logic_vector(3 downto 0);
      C_OUT : out std_logic);
  end component;
  
  component comparator_4b is
    Port ( A : in std_logic_vector(3 downto 0);
      B : in std_logic_vector(3 downto 0);
      EQ : out std_logic
    );
  end component;
  
  --signal max_cnt : unsigned(3 downto 0) := unsigned(DIN);
  --signal cnt : std_logic_vector(3 downto 0);
  signal reg_d_in : std_logic_vector(3 downto 0);
  signal reg_d_out : std_logic_vector(3 downto 0);
  --signal add_a : std_logic_vector(3 downto 0);
  --signal add_b : std_logic_vector(3 downto 0) := "0001";
  --signal carry_in : std_logic := '0';
  signal add_result : std_logic_vector(3 downto 0);
  signal carry_out : std_logic;
  signal cnt_overflow : std_logic;
  signal rst : std_logic;
  signal comp_res : std_logic;
  signal load : std_logic;
  
begin
  rst <= (RESET OR cnt_overflow);
  load <= (NOT RESET);
  with comp_res select
    cnt_overflow <= '1' when '1',
    '0' when others;
  with rst select
    reg_d_in <= "0000" when '1',
    add_result when others;
    
  REG: register_4b_deff port map(CLK => CLK, LD => load, D_IN => reg_d_in, D_OUT => reg_d_out);
  ADD: add_4b port map(A => reg_d_out, B => "0001", C_IN => '0', Y => add_result, C_OUT => carry_out);
  COMPARE : comparator_4b port map(A => reg_d_out, B => COMP, EQ => comp_res);
  
  COUNT <= reg_d_out;
  OVERFLOW <= cnt_overflow;
  
  end Behavioral;
