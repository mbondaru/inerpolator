----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/03/2024 08:01:24 AM
-- Design Name: 
-- Module Name: avger_g - Behavioral
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

entity avger_g is
  Port ( 
    A : in std_logic_vector(7 downto 0);
    B : in std_logic_vector(7 downto 0);
    C : in std_logic_vector(7 downto 0);
    D : in std_logic_vector(7 downto 0);
    E : in std_logic_vector(7 downto 0);
    F : in std_logic_vector(7 downto 0);
    G : in std_logic_vector(7 downto 0);
    H : in std_logic_vector(7 downto 0);
    Y : out std_logic_vector(7 downto 0)
    );
end avger_g;

architecture Behavioral of avger_g is

component avger is
Port ( 
      A : in std_logic_vector(7 downto 0);
      B : in std_logic_vector(7 downto 0);
      C : in std_logic_vector(7 downto 0);
      D : in std_logic_vector(7 downto 0);
      Y : out std_logic_vector(7 downto 0)
    );
end component;
component add_8b is
  Port ( 
   A : in std_logic_vector(7 downto 0);
   B : in std_logic_vector(7 downto 0);
   C_IN : in std_logic;
   Y : out std_logic_vector(7 downto 0);
   C_OUT : out std_logic
  );
end component;

signal avg1 : std_logic_vector(7 downto 0);
signal avg2 : std_logic_vector(7 downto 0);
signal carry : std_logic;
signal sum : std_logic_vector(7 downto 0);

begin

AVGERX0_G : avger port map(A => A, B => B, C => C, D => D, Y => avg1);
AVGERX1_G : avger port map(A => E, B => F, C => G, D => H, Y => avg2);
SUMX : add_8b port map(A => avg1, B => avg2, C_IN => '0', Y => sum, C_OUT => carry);

  Y(7) <= carry;
  Y(6) <= sum(7);
  Y(5) <= sum(6);
  Y(4) <= sum(5);
  Y(3) <= sum(4);
  Y(2) <= sum(3);
  Y(1) <= sum(2);
  Y(0) <= sum(1);

end Behavioral;
