----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/10/2024 05:17:18 AM
-- Design Name: 
-- Module Name: clk_div - Behavioral
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

entity clk_div is
  Port ( 
    EN : in std_logic;
    CLK_IN : in std_logic;
    CLK_OUT : out std_logic
  );
end clk_div;

architecture Behavioral of clk_div is
 --component declaration
 component double_counter_4b is
   port (
      RESET,CLK,LD,UP : in std_logic;
      DIN : in std_logic_vector (3 downto 0);
      COUNT : out std_logic_vector (3 downto 0)
   );
 end component;
 --component signals
 signal rst : std_logic;
 signal ld : std_logic := '1';
 signal cnt : std_logic_vector(3 downto 0);
 signal clk : std_logic := '0';
begin
--divide input clock by 4.5 => double count to 9
  rst <= not EN;
  CLK_OUT <= clk;
DBL_CNT: double_counter_4b port map(RESET => rst, CLK => CLK_IN, LD => ld, UP => '1', DIN => "1000", COUNT => cnt);


CLK_DIVIDE: process(CLK_IN)
begin
  if(EN = '1') then
    if(rising_edge(CLK_IN)) then
      if(cnt = "1000") then
        clk <= not clk;
      end if;
    end if;
  end if;
      
end process CLK_DIVIDE;

end Behavioral;
