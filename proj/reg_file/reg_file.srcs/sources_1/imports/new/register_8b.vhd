----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/14/2024 05:06:37 AM
-- Design Name: 
-- Module Name: register_8b - Behavioral
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

entity register_8b is
  Port ( 
    REG_IN : in std_logic_vector(7 downto 0);
    LD : in std_logic;
    CLK : in std_logic;
    REG_OUT : out std_logic_vector(7 downto 0)
  );
end register_8b;

architecture Behavioral of register_8b is

begin
  process (CLK)
  begin
    if(rising_edge(CLK)) then
      if(LD = '1') then
          REG_OUT <= REG_IN;
        end if;
    end if;
  end process;
  
end Behavioral;
