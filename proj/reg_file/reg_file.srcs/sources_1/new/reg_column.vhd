----------------------------------------------------------------------------------
-- Company: IP Bondaruk
-- Engineer: Maksim Bondaruk
-- 
-- Create Date: 08/01/2024 02:01:44 AM
-- Design Name: 
-- Module Name: reg_column - Behavioral
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

entity reg_column is
  Port ( 
    SHIFT : in std_logic;
    LD : in std_logic_vector(0 to 5);
    CLK : in std_logic;
    
    D_IN : in std_logic_vector(7 downto 0);
--    D_IN1 : in std_logic_vector(7 downto 0);
--    D_IN2 : in std_logic_vector(7 downto 0);
--    D_IN3 : in std_logic_vector(7 downto 0);
--    D_IN4 : in std_logic_vector(7 downto 0);
--    D_IN5 : in std_logic_vector(7 downto 0);
    
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
end reg_column;

architecture Behavioral of reg_column is

  component register_8b is 
    port(
        REG_IN : in std_logic_vector(7 downto 0);
        LD : in std_logic;
        CLK : in std_logic;
        REG_OUT : out std_logic_vector(7 downto 0));
  end component;
  
  
  signal reg_in0 : std_logic_vector(7 downto 0);
  signal reg_in1 : std_logic_vector(7 downto 0);
  signal reg_in2 : std_logic_vector(7 downto 0);
  signal reg_in3 : std_logic_vector(7 downto 0);
  signal reg_in4 : std_logic_vector(7 downto 0);
  signal reg_in5 : std_logic_vector(7 downto 0);

  signal reg_out4 : std_logic_vector(7 downto 0);
  signal reg_out5 : std_logic_vector(7 downto 0);
  signal reg_out6 : std_logic_vector(7 downto 0);
  signal reg_out7 : std_logic_vector(7 downto 0);
  signal reg_out8 : std_logic_vector(7 downto 0);
  signal reg_out9 : std_logic_vector(7 downto 0);
  signal reg_out10 : std_logic_vector(7 downto 0);
  signal reg_out11 : std_logic_vector(7 downto 0);

  --signal ld_w : std_logic_vector(4 downto 0) := "00000";
  
begin

    with SHIFT select
        reg_in0 <= D_IN when '0',
        reg_out6 when others;
    with SHIFT select
        reg_in1 <= D_IN when '0',
        reg_out7 when others;
    with SHIFT select
        reg_in2 <= D_IN when '0',
        reg_out8 when others;
    with SHIFT select
        reg_in3 <= D_IN when '0',
        reg_out9 when others;
    with SHIFT select
        reg_in4 <= D_IN when '0',
        reg_out10 when others;
    with SHIFT select
        reg_in5 <= D_IN when '0',
        reg_out11 when others;
        
REG0: register_8b port map (REG_IN => reg_out6, LD => SHIFT, CLK => CLK, REG_OUT => D_OUT0);
REG1: register_8b port map (REG_IN => reg_out7, LD => SHIFT, CLK => CLK, REG_OUT => D_OUT1);
REG2: register_8b port map (REG_IN => reg_out8, LD => SHIFT, CLK => CLK, REG_OUT => D_OUT2);
REG3: register_8b port map (REG_IN => reg_out9, LD => SHIFT, CLK => CLK, REG_OUT => D_OUT3);
REG4: register_8b port map (REG_IN => reg_out10, LD => SHIFT, CLK => CLK, REG_OUT => D_OUT4);
REG5: register_8b port map (REG_IN => reg_out11, LD => SHIFT, CLK => CLK, REG_OUT => D_OUT5);
REG6: register_8b port map (REG_IN => D_IN, LD => LD(0), CLK => CLK, REG_OUT => reg_out6);
REG7: register_8b port map (REG_IN => D_IN, LD => LD(1), CLK => CLK, REG_OUT => reg_out7);
REG8: register_8b port map (REG_IN => D_IN, LD => LD(2), CLK => CLK, REG_OUT => reg_out8);
REG9: register_8b port map (REG_IN => D_IN, LD => LD(3), CLK => CLK, REG_OUT => reg_out9);
REG10: register_8b port map (REG_IN => D_IN, LD => LD(4), CLK => CLK, REG_OUT => reg_out10);
REG11: register_8b port map (REG_IN => D_IN, LD => LD(5), CLK => CLK, REG_OUT => reg_out11);


   --D_OUT6 <= reg_out5;
   --D_OUT7 <= reg_out5;
   --D_OUT8 <= reg_out5;
   --D_OUT9 <= reg_out5;

  

end Behavioral;
