----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/14/2024 02:26:03 AM
-- Design Name: 
-- Module Name: clk_reg - Behavioral
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

entity clk_reg is
  port ( CLK : in std_logic;
    --D : in std_logic;
    S : in std_logic;
    Q : out std_logic
  );
end clk_reg;

architecture Behavioral of clk_reg is
-- component declaration
 component dff is
   port ( CLK : in std_logic;
     D : in std_logic;
     S : in std_logic;
     Q : out std_logic
  );
 end component;
 
 --component signals
 signal dff0_d : std_logic;
 signal dff0_q : std_logic;
 signal dff1_d : std_logic;
 signal dff1_q : std_logic;
 signal inv_clk : std_logic;
begin

  --inv_clk <= not CLK;
  
DFF0: dff port map(CLK => CLK, D => dff0_d, S => S, Q => dff0_q);
DFF1: dff port map(CLK => CLK, D => dff1_d, S => S, Q => dff1_q);

  dff0_d <= dff1_q;
  dff1_d <= NOT dff0_q;
  Q <= dff0_q;

end Behavioral;
