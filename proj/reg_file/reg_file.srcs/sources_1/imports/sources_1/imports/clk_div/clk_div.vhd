----------------------------------------------------------------------------------
-- Company: IP Bondaruk
-- Engineer: Maksim Bondaruk
-- 
-- Create Date: 08/10/2024 05:17:18 AM
-- Design Name: 
-- Module Name: clk_div - Behavioral
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

entity clk_div is
  Port ( 
    EN : in std_logic;
    CLK_IN : in std_logic;
    CLK_OUT : out std_logic
  );
end clk_div;

architecture Behavioral of clk_div is
 --component declaration
 component double_counter_4b is
   port (
      RESET : in std_logic;
      CLK : in std_logic;
      COMP : in std_logic_vector (3 downto 0);
      COUNT : out std_logic_vector (3 downto 0);
      OVERFLOW : out std_logic
   );
 end component;
-- component dff is
--   port ( CLK : in std_logic;
--     D : in std_logic;
--     S : in std_logic;
--     Q : out std_logic
--  );
-- end component;
component clk_reg is
  port ( CLK : in std_logic;
   -- D : in std_logic;
    S : in std_logic;
    Q : out std_logic
  );
end component;
 --component signals
 signal rst : std_logic;
 --signal ld : std_logic := '1';
 signal cnt : std_logic_vector(3 downto 0);
 signal clk : std_logic := '0';
 signal cnt_overflow : std_logic;
-- signal not_cnt_overflow : std_logic;
-- signal dff0_d : std_logic;
-- signal dff0_q : std_logic;
-- signal dff1_d : std_logic;
-- signal dff1_q : std_logic;
-- signal deff_d : std_logic;
-- signal deff_s : std_logic;
-- signal deff_q : std_logic;
 
begin
--divide input clock by 4.5 => double count to 9
  rst <= not EN;
  --CLK_OUT <= clk;
  with EN select
    CLK_OUT <= CLK_IN when '0',
    clk when others;
    
DBL_CNT: double_counter_4b port map(RESET => rst, CLK => CLK_IN, COMP => "1000", COUNT => cnt, OVERFLOW => cnt_overflow);
CLKOUT: clk_reg port map(CLK => cnt_overflow, S => EN, Q => clk);

--CLK_DIVIDE: process(CLK_IN)
--begin
--  if(rising_edge(CLK_IN)) then
--   if(cnt_overflow = '1') then
--     clk <= not clk;
--   end if;
--  end if;
--end process;
--DFF0: dff port map(CLK => cnt_overflow, D => dff1_q, S => EN, Q => dff0_q);
--DFF1: dff port map(CLK => not_cnt_overflow, D => dff0_q, S => EN, Q => dff1_q);
--  not_cnt_overflow <= NOT cnt_overflow;
--  clk <= dff1_q;
  
end Behavioral;
