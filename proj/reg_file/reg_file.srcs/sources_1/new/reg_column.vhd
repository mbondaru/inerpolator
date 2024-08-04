----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
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
    LD : in std_logic_vector(5 downto 0);
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
   
  signal reg_out0 : std_logic_vector(7 downto 0);
  signal reg_out1 : std_logic_vector(7 downto 0);
  signal reg_out2 : std_logic_vector(7 downto 0);
  signal reg_out3 : std_logic_vector(7 downto 0);
  signal reg_out4 : std_logic_vector(7 downto 0);
  signal reg_out5 : std_logic_vector(7 downto 0);
  
  signal ld_w : std_logic_vector(5 downto 0) := "111111";
  
begin

    reg_in0 <= D_IN;
    with SHIFT select
        reg_in1 <= reg_out0 when '1',
        D_IN when others;
    with SHIFT select
        reg_in2 <= reg_out1 when '1',
        D_IN when others;
    with SHIFT select
        reg_in3 <= reg_out2 when '1',
        D_IN when others;
    with SHIFT select
        reg_in4 <= reg_out3 when '1',
        D_IN when others;
    with SHIFT select
        reg_in5 <= reg_out4 when '1',
        D_IN when others;
    with SHIFT select
        ld_w <= "111111" when '1',
        LD when others;
        
REG0: register_8b port map (REG_IN => reg_in0, LD => ld_w(0), CLK => CLK, REG_OUT => reg_out0);
REG1: register_8b port map (REG_IN => reg_in1, LD => ld_w(1), CLK => CLK, REG_OUT => reg_out1);
REG2: register_8b port map (REG_IN => reg_in2, LD => ld_w(2), CLK => CLK, REG_OUT => reg_out2);
REG3: register_8b port map (REG_IN => reg_in3, LD => ld_w(3), CLK => CLK, REG_OUT => reg_out3);
REG4: register_8b port map (REG_IN => reg_in4, LD => ld_w(4), CLK => CLK, REG_OUT => reg_out4);
REG5: register_8b port map (REG_IN => reg_in5, LD => ld_w(5), CLK => CLK, REG_OUT => reg_out5);
   D_OUT0 <= reg_out0;
   D_OUT1 <= reg_out1;
   D_OUT2 <= reg_out2;
   D_OUT3 <= reg_out3;
   D_OUT4 <= reg_out4;
   D_OUT5 <= reg_out5;

  

end Behavioral;
