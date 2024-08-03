----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/03/2024 07:37:56 AM
-- Design Name: 
-- Module Name: avger - Behavioral
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

entity avger is
  Port ( 
    A : in std_logic_vector(7 downto 0);
    B : in std_logic_vector(7 downto 0);
    C : in std_logic_vector(7 downto 0);
    D : in std_logic_vector(7 downto 0);
    Y : out std_logic_vector(7 downto 0)
  );
end avger;

architecture Behavioral of avger is
-- component declarations
  component add_8b is
  port ( 
     A : in std_logic_vector(7 downto 0);
     B : in std_logic_vector(7 downto 0);
     C_IN : in std_logic;
     Y : out std_logic_vector(7 downto 0);
     C_OUT : out std_logic
    );
  end component;
  
  component add_9b is
  port ( A : in std_logic_vector(8 downto 0);
    B : in std_logic_vector(8 downto 0);
    C_IN : in std_logic;
    Y : out std_logic_vector(8 downto 0);
    C_OUT : out std_logic
    );
  end component;
  
  component RS_2 is
  port ( A : in std_logic_vector(9 downto 0);
      Y : out std_logic_vector(7 downto 0)
   );
  end component;
  
  --component signals
  signal c1 : std_logic;
  signal c2 : std_logic;
  
  signal first_add : std_logic_vector(7 downto 0);
  signal second_add : std_logic_vector(7 downto 0);
  
  signal ce_first_add : std_logic_vector(8 downto 0);
  signal ce_second_add : std_logic_vector(8 downto 0);
  
  signal c3 : std_logic;
  signal total_sum : std_logic_vector(8 downto 0);
  signal ce_total_sum : std_logic_vector(9 downto 0);
  
begin
ce_first_add <= c1 & first_add;
ce_second_add <= c2 & second_add;
ce_total_sum <= c3 & total_sum;

ADD8X0 : add_8b port map(A => A, B => B, C_IN => '0', Y => first_add, C_OUT => c1);
ADD8X1 : add_8b port map(A => C, B => D, C_IN => '0', Y => second_add, C_OUT => c2);
ADD9X : add_9b port map(A => ce_first_add, B => ce_second_add, C_IN => '0', Y => total_sum, C_OUT => c3);
RS2X: RS_2 port map(A => ce_total_sum, Y => Y);

end Behavioral;
