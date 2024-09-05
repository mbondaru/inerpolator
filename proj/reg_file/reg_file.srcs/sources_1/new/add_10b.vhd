----------------------------------------------------------------------------------
-- Company: IP Bondaruk
-- Engineer: Maksim Bondaruk 
-- 
-- Create Date: 08/03/2024 08:08:09 AM
-- Design Name: 
-- Module Name: add_10b - Behavioral
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

entity add_10b is
  Port ( A : in std_logic_vector(9 downto 0);
    B : in std_logic_vector(9 downto 0);
    C_IN : in std_logic;
    Y : out std_logic_vector(9 downto 0);
    C_OUT : out std_logic
    );
end add_10b;

architecture Behavioral of add_10b is
 component add_1b is 
 port (A : in std_logic;
   B : in std_logic;
   C_IN : in std_logic;
   Y : out std_logic;
   C_OUT : out std_logic
 );
 end component;
 
  signal carry : std_logic_vector(8 downto 0);
 begin
 
     ADDX0: add_1b port map(A => A(0), B => B(0), C_IN => C_IN, Y => Y(0), C_OUT => carry(0));
     ADDX1: add_1b port map(A => A(1), B => B(1), C_IN => carry(0), Y => Y(1), C_OUT => carry(1));
     ADDX2: add_1b port map(A => A(2), B => B(2), C_IN => carry(1), Y => Y(2), C_OUT => carry(2));
     ADDX3: add_1b port map(A => A(3), B => B(3), C_IN => carry(2), Y => Y(3), C_OUT => carry(3));
     ADDX4: add_1b port map(A => A(4), B => B(4), C_IN => carry(3), Y => Y(4), C_OUT => carry(4));
     ADDX5: add_1b port map(A => A(5), B => B(5), C_IN => carry(4), Y => Y(5), C_OUT => carry(5));
     ADDX6: add_1b port map(A => A(6), B => B(6), C_IN => carry(5), Y => Y(6), C_OUT => carry(6));
     ADDX7: add_1b port map(A => A(7), B => B(7), C_IN => carry(6), Y => Y(7), C_OUT => carry(7));
     ADDX8: add_1b port map(A => A(8), B => B(8), C_IN => carry(7), Y => Y(8), C_OUT => carry(8));
     ADDX9: add_1b port map(A => A(9), B => B(9), C_IN => carry(8), Y => Y(9), C_OUT => C_OUT);


end Behavioral;
