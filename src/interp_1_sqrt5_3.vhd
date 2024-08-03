----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/03/2024 02:13:56 PM
-- Design Name: 
-- Module Name: interp_1_sqrt5_3 - Behavioral
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

entity interp_1_sqrt5_3 is
    Port ( CLOSEST : in std_logic_vector (7 downto 0);
       CLOSER : in std_logic_vector (7 downto 0);
       FARTHEST : in std_logic_vector(7 downto 0);
       RES : out std_logic_vector (7 downto 0));
end interp_1_sqrt5_3;

architecture Behavioral of interp_1_sqrt5_3 is

begin
 RES(7) <= CLOSEST(7);
 RES(6) <= CLOSEST(6);
 RES(5) <= CLOSEST(5);
 RES(4) <= CLOSEST(4);
 RES(3) <= CLOSER(7);
 RES(2) <= CLOSER(6);
 RES(1) <= CLOSER(5);
 RES(0) <= FARTHEST(7);

end Behavioral;
