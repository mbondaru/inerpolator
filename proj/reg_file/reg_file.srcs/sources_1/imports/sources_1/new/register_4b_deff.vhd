----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/13/2024 03:24:50 AM
-- Design Name: 
-- Module Name: register_4b_deff - Behavioral
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

entity register_4b_deff is
  Port ( CLK : in std_logic;
    LD : in std_logic;
    D_IN : in std_logic_vector(3 downto 0);
    D_OUT : out std_logic_vector(3 downto 0)
  );
end register_4b_deff;

architecture Behavioral of register_4b_deff is
--component declaration
component double_edge_dff is
  Port ( CLK : in std_logic;
    D : in std_logic;
    S : in std_logic;
    Q : out std_logic
  );
end component;

-- component signals
 signal clk_ld : std_logic;
begin
  clk_ld <= (CLK and LD);
  DEFF0: double_edge_dff port map(CLK => clk_ld, D => D_IN(0), S => LD, Q => D_OUT(0));
  DEFF1: double_edge_dff port map(CLK => clk_ld, D => D_IN(1), S => LD, Q => D_OUT(1));
  DEFF2: double_edge_dff port map(CLK => clk_ld, D => D_IN(2), S => LD, Q => D_OUT(2));
  DEFF3: double_edge_dff port map(CLK => clk_ld, D => D_IN(3), S => LD, Q => D_OUT(3));

end Behavioral;
