----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/13/2024 05:23:21 AM
-- Design Name: 
-- Module Name: comparator_4b - Behavioral
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

entity comparator_4b is
  Port ( A : in std_logic_vector(3 downto 0);
    B : in std_logic_vector(3 downto 0);
    EQ : out std_logic
  );
end comparator_4b;

architecture Behavioral of comparator_4b is

begin
  EQ <= (A(3) XNOR B(3)) AND (A(2) XNOR B(2)) AND (A(1) XNOR B(1)) AND (A(0) XNOR B(0));

end Behavioral;
