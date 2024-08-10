----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/01/2024 01:30:13 AM
-- Design Name: 
-- Module Name: reg_file - Behavioral
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

entity reg_file is
  Port ( 
     D_IN : in std_logic_vector(7 downto 0);
     COL_NUM : in std_logic_vector(9 downto 0);
     ROW_NUM : in std_logic_vector(9 downto 0);
     SHIFT : in std_logic;
     CLK : in std_logic;
     PIX_DATA : out std_logic_vector(37439 downto 0)
  );
  
end reg_file;

architecture Behavioral of reg_file is

-- component declarations
component reg_column is
  Port ( 
    SHIFT : in std_logic;
    LD : in std_logic_vector(0 to 5);
    CLK : in std_logic;
    
    D_IN : in std_logic_vector(7 downto 0);

    D_OUT0 : out std_logic_vector(7 downto 0);
    D_OUT1 : out std_logic_vector(7 downto 0);
    D_OUT2 : out std_logic_vector(7 downto 0);
    D_OUT3 : out std_logic_vector(7 downto 0);
    D_OUT4 : out std_logic_vector(7 downto 0);
    D_OUT5 : out std_logic_vector(7 downto 0)
    --D_OUT6 : out std_logic_vector(7 downto 0);
    --D_OUT7 : out std_logic_vector(7 downto 0);
    --D_OUT8 : out std_logic_vector(7 downto 0);
    --D_OUT9 : out std_logic_vector(7 downto 0)
  );
 end component;
 --component signals  
  --signal shift : std_logic := '0';
  --signal ld : std_logic_vector(5 downto 0) := "000001";
  
  type outw_t is array (0 to 9359) of std_logic_vector(7 downto 0); --12x780 8-bit registers
  --type inw_t is array(0 to 7799) of std_logic_vector(7 downto 0);
  signal outw: outw_t;
  --signal inw : inw_t;
  
  signal cn : integer range 0 to 779 := to_integer(unsigned(COL_NUM));
  signal rn : integer range 0 to 5 := to_integer(unsigned(ROW_NUM));

  
  type ld_w_t is array (0 to 779) of std_logic_vector(0 to 5);
  signal ld_w : ld_w_t;
  --signal sel : std_logic := '0';
begin
   ld_w(cn)(rn) <= '1';
  
  GEN_REG: 
  for I in 0 to 779 generate
    REG_COLX : reg_column port map(
      SHIFT => SHIFT,
      LD => ld_w(I),
      CLK => CLK,
      D_IN => D_IN,
      D_OUT0 => outw(I),
      D_OUT1 => outw(I + 780),
      D_OUT2 => outw(I + 1560),
      D_OUT3 => outw(I + 2340),
      D_OUT4 => outw(I + 3120),
      D_OUT5 => outw(I + 3900)
      --D_OUT6 => outw(I + 4680),
      --D_OUT7 => outw(I + 5460),
      --D_OUT8 => outw(I + 6240),
      --D_OUT9 => outw(I + 7020)
     );
     
  PIX_DATA(I*8 + 7) <= outw(I)(0);
  PIX_DATA(I*8 + 6) <= outw(I)(1);
  PIX_DATA(I*8 + 5) <= outw(I)(2);
  PIX_DATA(I*8 + 4) <= outw(I)(3);
  PIX_DATA(I*8 + 3) <= outw(I)(4);
  PIX_DATA(I*8 + 2) <= outw(I)(5);
  PIX_DATA(I*8 + 1) <= outw(I)(6);
  PIX_DATA(I*8 + 0) <= outw(I)(7);
  
  PIX_DATA(I*8 + 780*8 + 7) <= outw(I + 780)(0);
  PIX_DATA(I*8 + 780*8 + 6) <= outw(I + 780)(1);
  PIX_DATA(I*8 + 780*8 + 5) <= outw(I + 780)(2);
  PIX_DATA(I*8 + 780*8 + 4) <= outw(I + 780)(3);
  PIX_DATA(I*8 + 780*8 + 3) <= outw(I + 780)(4);
  PIX_DATA(I*8 + 780*8 + 2) <= outw(I + 780)(5);
  PIX_DATA(I*8 + 780*8 + 1) <= outw(I + 780)(6);
  PIX_DATA(I*8 + 780*8 + 0) <= outw(I + 780)(7);
  
  PIX_DATA(I*8 + 1560*8 + 7) <= outw(I + 1560)(0);
  PIX_DATA(I*8 + 1560*8 + 6) <= outw(I + 1560)(1);
  PIX_DATA(I*8 + 1560*8 + 5) <= outw(I + 1560)(2);
  PIX_DATA(I*8 + 1560*8 + 4) <= outw(I + 1560)(3);
  PIX_DATA(I*8 + 1560*8 + 3) <= outw(I + 1560)(4);
  PIX_DATA(I*8 + 1560*8 + 2) <= outw(I + 1560)(5);
  PIX_DATA(I*8 + 1560*8 + 1) <= outw(I + 1560)(6);
  PIX_DATA(I*8 + 1560*8 + 0) <= outw(I + 1560)(7);
  
  PIX_DATA(I*8 + 2340*8 + 7) <= outw(I + 2340)(0);
  PIX_DATA(I*8 + 2340*8 + 6) <= outw(I + 2340)(1);
  PIX_DATA(I*8 + 2340*8 + 5) <= outw(I + 2340)(2);
  PIX_DATA(I*8 + 2340*8 + 4) <= outw(I + 2340)(3);
  PIX_DATA(I*8 + 2340*8 + 3) <= outw(I + 2340)(4);
  PIX_DATA(I*8 + 2340*8 + 2) <= outw(I + 2340)(5);
  PIX_DATA(I*8 + 2340*8 + 1) <= outw(I + 2340)(6);
  PIX_DATA(I*8 + 2340*8 + 0) <= outw(I + 2340)(7);
  
  PIX_DATA(I*8 + 3120*8 + 7) <= outw(I + 3120)(0);
  PIX_DATA(I*8 + 3120*8 + 6) <= outw(I + 3120)(1);
  PIX_DATA(I*8 + 3120*8 + 5) <= outw(I + 3120)(2);
  PIX_DATA(I*8 + 3120*8 + 4) <= outw(I + 3120)(3);
  PIX_DATA(I*8 + 3120*8 + 3) <= outw(I + 3120)(4);
  PIX_DATA(I*8 + 3120*8 + 2) <= outw(I + 3120)(5);
  PIX_DATA(I*8 + 3120*8 + 1) <= outw(I + 3120)(6);
  PIX_DATA(I*8 + 3120*8 + 0) <= outw(I + 3120)(7);
  
  PIX_DATA(I*8 + 3900*8 + 7) <= outw(I + 3900)(0);
  PIX_DATA(I*8 + 3900*8 + 6) <= outw(I + 3900)(1);
  PIX_DATA(I*8 + 3900*8 + 5) <= outw(I + 3900)(2);
  PIX_DATA(I*8 + 3900*8 + 4) <= outw(I + 3900)(3);
  PIX_DATA(I*8 + 3900*8 + 3) <= outw(I + 3900)(4);
  PIX_DATA(I*8 + 3900*8 + 2) <= outw(I + 3900)(5);
  PIX_DATA(I*8 + 3900*8 + 1) <= outw(I + 3900)(6);
  PIX_DATA(I*8 + 3900*8 + 0) <= outw(I + 3900)(7);
  
--  PIX_DATA(I*8 + 4680*8 + 7) <= outw(I + 4680)(0);
--  PIX_DATA(I*8 + 4680*8 + 6) <= outw(I + 4680)(1);
--  PIX_DATA(I*8 + 4680*8 + 5) <= outw(I + 4680)(2);
--  PIX_DATA(I*8 + 4680*8 + 4) <= outw(I + 4680)(3);
--  PIX_DATA(I*8 + 4680*8 + 3) <= outw(I + 4680)(4);
--  PIX_DATA(I*8 + 4680*8 + 2) <= outw(I + 4680)(5);
--  PIX_DATA(I*8 + 4680*8 + 1) <= outw(I + 4680)(6);
--  PIX_DATA(I*8 + 4680*8 + 0) <= outw(I + 4680)(7);
  
--  PIX_DATA(I*8 + 5460*8 + 7) <= outw(I + 5460)(0);
--  PIX_DATA(I*8 + 5460*8 + 6) <= outw(I + 5460)(1);
--  PIX_DATA(I*8 + 5460*8 + 5) <= outw(I + 5460)(2);
--  PIX_DATA(I*8 + 5460*8 + 4) <= outw(I + 5460)(3);
--  PIX_DATA(I*8 + 5460*8 + 3) <= outw(I + 5460)(4);
--  PIX_DATA(I*8 + 5460*8 + 2) <= outw(I + 5460)(5);
--  PIX_DATA(I*8 + 5460*8 + 1) <= outw(I + 5460)(6);
--  PIX_DATA(I*8 + 5460*8 + 0) <= outw(I + 5460)(7);
  
--  PIX_DATA(I*8 + 6240*8 + 7) <= outw(I + 6240)(0);
--  PIX_DATA(I*8 + 6240*8 + 6) <= outw(I + 6240)(1);
--  PIX_DATA(I*8 + 6240*8 + 5) <= outw(I + 6240)(2);
--  PIX_DATA(I*8 + 6240*8 + 4) <= outw(I + 6240)(3);
--  PIX_DATA(I*8 + 6240*8 + 3) <= outw(I + 6240)(4);
--  PIX_DATA(I*8 + 6240*8 + 2) <= outw(I + 6240)(5);
--  PIX_DATA(I*8 + 6240*8 + 1) <= outw(I + 6240)(6);
--  PIX_DATA(I*8 + 6240*8 + 0) <= outw(I + 6240)(7);
  
--  PIX_DATA(I*8 + 7020*8 + 7) <= outw(I + 7020)(0);
--  PIX_DATA(I*8 + 7020*8 + 6) <= outw(I + 7020)(1);
--  PIX_DATA(I*8 + 7020*8 + 5) <= outw(I + 7020)(2);
--  PIX_DATA(I*8 + 7020*8 + 4) <= outw(I + 7020)(3);
--  PIX_DATA(I*8 + 7020*8 + 3) <= outw(I + 7020)(4);
--  PIX_DATA(I*8 + 7020*8 + 2) <= outw(I + 7020)(5);
--  PIX_DATA(I*8 + 7020*8 + 1) <= outw(I + 7020)(6);
--  PIX_DATA(I*8 + 7020*8 + 0) <= outw(I + 7020)(7);
  end generate GEN_REG;

end Behavioral;
