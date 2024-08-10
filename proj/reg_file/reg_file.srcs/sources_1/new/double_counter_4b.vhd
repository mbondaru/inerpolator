----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/10/2024 05:24:47 AM
-- Design Name: 
-- Module Name: double_counter_4b - Behavioral
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
use IEEE.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity double_counter_4b is
  Port 
  ( 
      RESET,CLK,LD,UP : in std_logic;
      DIN : in std_logic_vector (3 downto 0);
      COUNT : out std_logic_vector (3 downto 0)  
  );
end double_counter_4b;

architecture Behavioral of double_counter_4b is
  signal t_cnt : unsigned(3 downto 0);
  signal max_cnt : unsigned(3 downto 0) := unsigned(DIN);
begin
process (CLK, RESET)
begin
if (RESET = '1') then
  t_cnt <= (others => '0'); -- clear
elsif (rising_edge(CLK)) then
  if (LD = '1') then
  --t_cnt <= unsigned(DIN); -- load
--else
    if (t_cnt = max_cnt) then
      t_cnt <= "0000";
    else
      if (UP = '1') then 
        t_cnt <= t_cnt + 1; -- incr
      else
        t_cnt <= t_cnt - 1; -- decr
    end if;
   end if;
  end if;
elsif (falling_edge(CLK)) then
  if (LD = '1') then
    --t_cnt <= unsigned(DIN); -- load
  --else
    if (t_cnt = max_cnt) then
      t_cnt <= "0000";
    else
      if (UP = '1') then 
        t_cnt <= t_cnt + 1; -- incr
      else
        t_cnt <= t_cnt - 1; -- decr
      end if;
    end if;
  end if;
 end if;
end process;
COUNT <= std_logic_vector(t_cnt);

end Behavioral;
