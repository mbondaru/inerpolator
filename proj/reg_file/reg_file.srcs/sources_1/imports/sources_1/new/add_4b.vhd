----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/13/2024 04:06:45 AM
-- Design Name: 
-- Module Name: add_4b - Behavioral
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
entity add_4b is
  Port ( A : in std_logic_vector(3 downto 0);
    B : in std_logic_vector(3 downto 0);
    C_IN : in std_logic;
    Y : out std_logic_vector(3 downto 0);
    C_OUT : out std_logic
    );
end add_4b;

architecture Behavioral of add_4b is
 component add_1b is 
  port (A : in std_logic;
    B : in std_logic;
    C_IN : in std_logic;
    Y : out std_logic;
    C_OUT : out std_logic
  );
 end component;
 
 signal carry : std_logic_vector(2 downto 0);
begin

    ADDX0: add_1b port map(A => A(0), B => B(0), C_IN => C_IN, Y => Y(0), C_OUT => carry(0));
    ADDX1: add_1b port map(A => A(1), B => B(1), C_IN => carry(0), Y => Y(1), C_OUT => carry(1));
    ADDX2: add_1b port map(A => A(2), B => B(2), C_IN => carry(1), Y => Y(2), C_OUT => carry(2));
    ADDX3: add_1b port map(A => A(3), B => B(3), C_IN => carry(2), Y => Y(3), C_OUT => C_OUT);

end Behavioral;
