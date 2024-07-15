----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/15/2024 03:14:32 AM
-- Design Name: 
-- Module Name: dual_vector_core_8b - Dataflow
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
use IEEE.numeric_std.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity dual_vector_core_8b is
  Port ( X : in std_logic_vector(7 downto 0);
    D : in std_logic_vector(7 downto 0);
    OMEGA : out std_logic_vector(7 downto 0));
end dual_vector_core_8b;

architecture Dataflow of dual_vector_core_8b is
  
  --component declaration
  
  component flip_8b is
    port(D_IN : in std_logic_vector(7 downto 0);
      D_OUT : out std_logic_vector(7 downto 0));
  end component;
  
  component shift_8b is
    port(D_IN : in std_logic_vector(7 downto 0);
      D_OUT : out std_logic_vector(7 downto 0));
  end component;
  
  --component signals
  
  type w_t is array (0 to 255) of std_logic_vector(7 downto 0);

  signal w0 : w_t;
  signal w1 : w_t;
  signal w2 : w_t;
  signal w3 : w_t;
  signal w4 : w_t;
  signal w5 : w_t;
  signal w6 : w_t;
  signal w7 : w_t;
  signal w8 : w_t;
  
  signal decode_D : integer;
  
begin
   decode_D <= to_integer(unsigned(D));
   OMEGA <= w8(decode_D);
   
   GEN_DUAL: 
     for I in 0 to 255 generate
       SHIFTX0 : if((I rem 2) = 0) generate
        S0 : shift_8b port map(
         D_IN => w7(I),
         D_OUT => w8(I)
       );
       end generate SHIFTX0;
       FLIPX0 : if((I rem 2) = 1) generate
        F0 : flip_8b port map(
         D_IN => w7(I),
         D_OUT => w8(I)
       );
       end generate FLIPX0;
       
       SHIFTX1 : if((I/2 rem 2) = 0) generate
        S1 : shift_8b port map(
         D_IN => w6(I),
         D_OUT => w7(I)
       );
       end generate SHIFTX1;
       FLIPX1 : if((I/2 rem 2) = 1) generate
        F1 : flip_8b port map(
         D_IN => w6(I),
         D_OUT => w7(I)
       );
       end generate FLIPX1;
       
       SHIFTX2 : if((I/4 rem 2) = 0) generate
        S2 : shift_8b port map(
         D_IN => w5(I),
         D_OUT => w6(I)
       );
       end generate SHIFTX2;
       FLIPX2 : if((I/4 rem 2) = 1) generate
        F2 : flip_8b port map(
         D_IN => w5(I),
         D_OUT => w6(I)
       );
       end generate FLIPX2;
       
       SHIFTX3 : if((I/8 rem 2) = 0) generate
        S3 : shift_8b port map(
         D_IN => w4(I),
         D_OUT => w5(I)
       );
       end generate SHIFTX3;
       FLIPX3 : if((I/8 rem 2) = 1) generate
        F3 : flip_8b port map(
         D_IN => w4(I),
         D_OUT => w5(I)
       );
       end generate FLIPX3;
       
       SHIFTX4 : if((I/16 rem 2) = 0) generate
        S4 : shift_8b port map(
         D_IN => w3(I),
         D_OUT => w4(I)
       );
       end generate SHIFTX4;
       FLIPX4 : if((I/16 rem 2) = 1) generate
        F4 : flip_8b port map(
         D_IN => w3(I),
         D_OUT => w4(I)
       );
       end generate FLIPX4;
       
       SHIFTX5 : if((I/32 rem 2) = 0) generate
        S5 : shift_8b port map(
         D_IN => w2(I),
         D_OUT => w3(I)
       );
       end generate SHIFTX5;
       FLIPX5 : if((I/32 rem 2) = 1) generate
        F5 : flip_8b port map(
         D_IN => w2(I),
         D_OUT => w3(I)
       );
       end generate FLIPX5;
       
      SHIFTX6 : if((I/64 rem 2) = 0) generate
       S6 : shift_8b port map(
        D_IN => w1(I),
        D_OUT => w2(I)
      );
      end generate SHIFTX6;
      FLIPX6 : if((I/64 rem 2) = 1) generate
       F6 : flip_8b port map(
        D_IN => w1(I),
        D_OUT => w2(I)
      );
      end generate FLIPX6;
      
      SHIFTX7 : if((I/128 rem 2) = 0) generate
       S7 : shift_8b port map(
        D_IN => w0(I),
        D_OUT => w1(I)
      );
      end generate SHIFTX7;
      FLIPX7 : if((I/128 rem 2) = 1) generate
       F7 : flip_8b port map(
        D_IN => w0(I),
        D_OUT => w1(I)
      );
      end generate FLIPX7;
      
      w0(I) <= X;
    end generate GEN_DUAL;
    
end Dataflow;
