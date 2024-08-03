----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/03/2024 07:18:06 AM
-- Design Name: 
-- Module Name: RS_2 - Behavioral
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

entity RS_2 is
  Port ( A : in std_logic_vector(9 downto 0);
    Y : out std_logic_vector(7 downto 0)
    );
end RS_2;

architecture Behavioral of RS_2 is

begin
  Y(7) <= A(9);
  Y(6) <= A(8);
  Y(5) <= A(7);
  Y(4) <= A(6);
  Y(3) <= A(5);
  Y(2) <= A(4);
  Y(1) <= A(3);
  Y(0) <= A(2);
  
 end Behavioral;
