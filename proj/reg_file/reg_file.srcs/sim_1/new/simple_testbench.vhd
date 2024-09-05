----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/15/2024 06:59:39 AM
-- Design Name: 
-- Module Name: simple_testbench - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity simple_testbench is
--  Port ( );
end simple_testbench;

architecture Behavioral of simple_testbench is

  component interpolator is
  port ( 
      EN : in std_logic;
      CLK : in std_logic;
      CLK_DISPLAY : in std_logic;
      D_IN : in std_logic_vector(7 downto 0);
      D_OUT : out std_logic_vector(23 downto 0)
    );
  end component;
    signal en: std_logic := '0';

  signal clk : std_logic := '0';
  signal clk_display : std_logic := '0';
  
  signal data : std_logic_vector(7 downto 0) := "01010101";
  signal rgb : std_logic_vector(23 downto 0);
  
  constant clk_period: time := 34 ns;
  constant clk_display_period : time := 37 ns;
  
begin
  UUT: interpolator port map (EN => en, CLK => clk, CLK_DISPLAY => clk_display, D_IN => data, D_OUT => rgb); --unit under test
  clk_process: process
  begin
    clk <= '0';
    wait for clk_period/2;
    clk <= '1';
    wait for clk_period/2;
  end process;
  
  clk_display_process: process
  begin
    clk_display <= '0';
    wait for clk_display_period/2;
    clk_display <= '1';
    wait for clk_display_period/2;
  end process;
  
  
  test_process: process
  begin  
    wait for 34 ns;
    en <= '1';
    wait for 100 ns;
  end process;
  
end Behavioral;
