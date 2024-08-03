----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/03/2024 07:00:15 AM
-- Design Name: 
-- Module Name: add_1b - Behavioral
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

entity add_1b is
  Port ( A : in std_logic;
    B : in std_logic;
    C_IN : in std_logic;
    Y : out std_logic;
    C_OUT : out std_logic
  );
end add_1b;

architecture Behavioral of add_1b is

begin
  Y <= A XOR B XOR C_IN;
  C_OUT <= (A AND B) OR (A AND C_IN) OR (B AND C_IN);

end Behavioral;
