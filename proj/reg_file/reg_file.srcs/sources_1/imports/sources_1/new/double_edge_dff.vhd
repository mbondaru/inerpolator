----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/13/2024 03:10:24 AM
-- Design Name: 
-- Module Name: double_edge_dff - Behavioral
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

entity double_edge_dff is
  Port ( CLK : in std_logic;
    D : in std_logic;
    S : in std_logic;
    Q : out std_logic
  );
end double_edge_dff;

architecture Behavioral of double_edge_dff is
--component declaration
component dff is
  Port ( CLK : in std_logic;
    D : in std_logic;
    S : in std_logic;
    Q : out std_logic
  );
end component;

--component signals
signal ff0_in : std_logic;
signal ff1_in : std_logic;
signal ff0_out : std_logic;
signal ff1_out : std_logic;
signal clk_inv : std_logic;

begin
  clk_inv <= not CLK;
 
FF0: dff port map(CLK => CLK, D => D, S => S, Q => ff0_out);
FF1: dff port map(CLK => clk_inv, D => D, S => S, Q => ff1_out);

with CLK select
  Q <= ff0_out when '1',
  ff1_out when others;
  
  
--  FF0: dff port map(CLK => CLK, D => ff0_in, S => S, Q => ff0_out);
--  FF1: dff port map(CLK => clk_inv, D => ff1_in, S => S, Q => ff1_out);
--  Q <= ff0_out XOR ff1_out;
--  ff0_in <= D XOR ff1_out;
--  ff1_in <= D XOR ff0_out;

end Behavioral;
