----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/13/2024 03:08:09 AM
-- Design Name: 
-- Module Name: dff - Behavioral
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

entity dff is
  Port ( CLK : in std_logic;
    D : in std_logic;
    S : in std_logic;
    Q : out std_logic
  );
end dff;

architecture Behavioral of dff is

begin

process(CLK, S)
begin
  if(S = '0') then
    Q <= '0';
  elsif(rising_edge(CLK)) then
    Q <= D;
  end if;
end process;

end Behavioral;
