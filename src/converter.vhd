----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/03/2024 06:51:54 AM
-- Design Name: 
-- Module Name: converter - Behavioral
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

entity converter is
  Port ( 
    PIX_DATA_IN : in std_logic_vector(37439 downto 0);
    PIX_DATA_OUT : out std_logic_vector(19967 downto 0)
  );
end converter;

architecture Behavioral of converter is
-- component declarations
 component avger is
   port ( 
   A : in std_logic_vector(7 downto 0);
   B : in std_logic_vector(7 downto 0);
   C : in std_logic_vector(7 downto 0);
   D : in std_logic_vector(7 downto 0);
   Y : out std_logic_vector(7 downto 0)
 );
 end component;
 component avger_g is
   port ( 
   A : in std_logic_vector(7 downto 0);
   B : in std_logic_vector(7 downto 0);
   C : in std_logic_vector(7 downto 0);
   D : in std_logic_vector(7 downto 0);
   E : in std_logic_vector(7 downto 0);
   F : in std_logic_vector(7 downto 0);
   G : in std_logic_vector(7 downto 0);
   H : in std_logic_vector(7 downto 0);
   Y : out std_logic_vector(7 downto 0)
   );
 end component;
   -- component signals
   
 type pix_wire_in_t is array (0 to 4679) of std_logic_vector(7 downto 0);
 signal pix_wire_in : pix_wire_in_t;
 type pix_wire_out_t is array(0 to 2495) of std_logic_vector(7 downto 0);
 signal pix_wire_out : pix_wire_out_t;
 
begin
  GENAVGX:
    for I in 0 to 77 generate
    
    --wires IN
    pix_wire_in(I*10) <= PIX_DATA_IN(I*80) & PIX_DATA_IN(I*80 + 1) & PIX_DATA_IN(I*80 + 2) & PIX_DATA_IN(I*80 + 3) & PIX_DATA_IN(I*80 + 4) & PIX_DATA_IN(I*80 + 5) & PIX_DATA_IN(I*80 + 6) & PIX_DATA_IN(I*80 + 7);
    pix_wire_in(I*10 + 1) <= PIX_DATA_IN(I*80 + 8) & PIX_DATA_IN(I*80 + 9) & PIX_DATA_IN(I*80 + 10) & PIX_DATA_IN(I*80 + 11) & PIX_DATA_IN(I*80 + 12) & PIX_DATA_IN(I*80 + 13) & PIX_DATA_IN(I*80 + 14) & PIX_DATA_IN(I*80 + 15);
    pix_wire_in(I*10 + 2) <= PIX_DATA_IN(I*80 + 16) & PIX_DATA_IN(I*80 + 17) & PIX_DATA_IN(I*80 + 18) & PIX_DATA_IN(I*80 + 19) & PIX_DATA_IN(I*80 + 20) & PIX_DATA_IN(I*80 + 21) & PIX_DATA_IN(I*80 + 22) & PIX_DATA_IN(I*80 + 23);
    pix_wire_in(I*10 + 3) <= PIX_DATA_IN(I*80 + 24) & PIX_DATA_IN(I*80 + 25) & PIX_DATA_IN(I*80 + 26) & PIX_DATA_IN(I*80 + 27) & PIX_DATA_IN(I*80 + 28) & PIX_DATA_IN(I*80 + 29) & PIX_DATA_IN(I*80 + 30) & PIX_DATA_IN(I*80 + 31);
    pix_wire_in(I*10 + 4) <= PIX_DATA_IN(I*80 + 32) & PIX_DATA_IN(I*80 + 33) & PIX_DATA_IN(I*80 + 34) & PIX_DATA_IN(I*80 + 35) & PIX_DATA_IN(I*80 + 36) & PIX_DATA_IN(I*80 + 37) & PIX_DATA_IN(I*80 + 38) & PIX_DATA_IN(I*80 + 39);
    pix_wire_in(I*10 + 5) <= PIX_DATA_IN(I*80 + 40) & PIX_DATA_IN(I*80 + 41) & PIX_DATA_IN(I*80 + 42) & PIX_DATA_IN(I*80 + 43) & PIX_DATA_IN(I*80 + 44) & PIX_DATA_IN(I*80 + 45) & PIX_DATA_IN(I*80 + 46) & PIX_DATA_IN(I*80 + 47);
    pix_wire_in(I*10 + 6) <= PIX_DATA_IN(I*80 + 48) & PIX_DATA_IN(I*80 + 49) & PIX_DATA_IN(I*80 + 50) & PIX_DATA_IN(I*80 + 51) & PIX_DATA_IN(I*80 + 52) & PIX_DATA_IN(I*80 + 53) & PIX_DATA_IN(I*80 + 54) & PIX_DATA_IN(I*80 + 55);
    pix_wire_in(I*10 + 7) <= PIX_DATA_IN(I*80 + 56) & PIX_DATA_IN(I*80 + 57) & PIX_DATA_IN(I*80 + 58) & PIX_DATA_IN(I*80 + 59) & PIX_DATA_IN(I*80 + 60) & PIX_DATA_IN(I*80 + 61) & PIX_DATA_IN(I*80 + 62) & PIX_DATA_IN(I*80 + 63);
    pix_wire_in(I*10 + 8) <= PIX_DATA_IN(I*80 + 64) & PIX_DATA_IN(I*80 + 65) & PIX_DATA_IN(I*80 + 66) & PIX_DATA_IN(I*80 + 67) & PIX_DATA_IN(I*80 + 68) & PIX_DATA_IN(I*80 + 69) & PIX_DATA_IN(I*80 + 70) & PIX_DATA_IN(I*80 + 71);
    pix_wire_in(I*10 + 9) <= PIX_DATA_IN(I*80 + 72) & PIX_DATA_IN(I*80 + 73) & PIX_DATA_IN(I*80 + 74) & PIX_DATA_IN(I*80 + 75) & PIX_DATA_IN(I*80 + 76) & PIX_DATA_IN(I*80 + 77) & PIX_DATA_IN(I*80 + 78) & PIX_DATA_IN(I*80 + 79);

    pix_wire_in(I*10 + 780) <= PIX_DATA_IN(I*80 + 6240) & PIX_DATA_IN(I*80 + 6241) & PIX_DATA_IN(I*80 + 6242) & PIX_DATA_IN(I*80 + 6243) & PIX_DATA_IN(I*80 + 6244) & PIX_DATA_IN(I*80 + 6245) & PIX_DATA_IN(I*80 + 6246) & PIX_DATA_IN(I*80 + 6247);
    pix_wire_in(I*10 + 781) <= PIX_DATA_IN(I*80 + 6248) & PIX_DATA_IN(I*80 + 6249) & PIX_DATA_IN(I*80 + 6250) & PIX_DATA_IN(I*80 + 6251) & PIX_DATA_IN(I*80 + 6252) & PIX_DATA_IN(I*80 + 6253) & PIX_DATA_IN(I*80 + 6254) & PIX_DATA_IN(I*80 + 6255);
    pix_wire_in(I*10 + 782) <= PIX_DATA_IN(I*80 + 6256) & PIX_DATA_IN(I*80 + 6257) & PIX_DATA_IN(I*80 + 6258) & PIX_DATA_IN(I*80 + 6259) & PIX_DATA_IN(I*80 + 6260) & PIX_DATA_IN(I*80 + 6261) & PIX_DATA_IN(I*80 + 6262) & PIX_DATA_IN(I*80 + 6263);
    pix_wire_in(I*10 + 783) <= PIX_DATA_IN(I*80 + 6264) & PIX_DATA_IN(I*80 + 6265) & PIX_DATA_IN(I*80 + 6266) & PIX_DATA_IN(I*80 + 6267) & PIX_DATA_IN(I*80 + 6268) & PIX_DATA_IN(I*80 + 6269) & PIX_DATA_IN(I*80 + 6270) & PIX_DATA_IN(I*80 + 6271);
    pix_wire_in(I*10 + 784) <= PIX_DATA_IN(I*80 + 6240 + 32) & PIX_DATA_IN(I*80 + 6240 + 33) & PIX_DATA_IN(I*80 + 6240 + 34) & PIX_DATA_IN(I*80 + 6240 + 35) & PIX_DATA_IN(I*80 + 6240 + 36) & PIX_DATA_IN(I*80 + 6240 + 37) & PIX_DATA_IN(I*80 + 6240 + 38) & PIX_DATA_IN(I*80 + 6240 + 39);
    pix_wire_in(I*10 + 785) <= PIX_DATA_IN(I*80 + 6240 + 40) & PIX_DATA_IN(I*80 + 6240 + 41) & PIX_DATA_IN(I*80 + 6240 + 42) & PIX_DATA_IN(I*80 + 6240 + 43) & PIX_DATA_IN(I*80 + 6240 + 44) & PIX_DATA_IN(I*80 + 6240 + 45) & PIX_DATA_IN(I*80 + 6240 + 46) & PIX_DATA_IN(I*80 + 6240 + 47);
    pix_wire_in(I*10 + 786) <= PIX_DATA_IN(I*80 + 6240 + 48) & PIX_DATA_IN(I*80 + 6240 + 49) & PIX_DATA_IN(I*80 + 6240 + 50) & PIX_DATA_IN(I*80 + 6240 + 51) & PIX_DATA_IN(I*80 + 6240 + 52) & PIX_DATA_IN(I*80 + 6240 + 53) & PIX_DATA_IN(I*80 + 6240 + 54) & PIX_DATA_IN(I*80 + 6240 + 55);
    pix_wire_in(I*10 + 787) <= PIX_DATA_IN(I*80 + 6240 + 56) & PIX_DATA_IN(I*80 + 6240 + 57) & PIX_DATA_IN(I*80 + 6240 + 58) & PIX_DATA_IN(I*80 + 6240 + 59) & PIX_DATA_IN(I*80 + 6240 + 60) & PIX_DATA_IN(I*80 + 6240 + 61) & PIX_DATA_IN(I*80 + 6240 + 62) & PIX_DATA_IN(I*80 + 6240 + 63);
    pix_wire_in(I*10 + 788) <= PIX_DATA_IN(I*80 + 6240 + 64) & PIX_DATA_IN(I*80 + 6240 + 65) & PIX_DATA_IN(I*80 + 6240 + 66) & PIX_DATA_IN(I*80 + 6240 + 67) & PIX_DATA_IN(I*80 + 6240 + 68) & PIX_DATA_IN(I*80 + 6240 + 69) & PIX_DATA_IN(I*80 + 6240 + 70) & PIX_DATA_IN(I*80 + 6240 + 71);
    pix_wire_in(I*10 + 789) <= PIX_DATA_IN(I*80 + 6240 + 72) & PIX_DATA_IN(I*80 + 6240 + 73) & PIX_DATA_IN(I*80 + 6240 + 74) & PIX_DATA_IN(I*80 + 6240 + 75) & PIX_DATA_IN(I*80 + 6240 + 76) & PIX_DATA_IN(I*80 + 6240 + 77) & PIX_DATA_IN(I*80 + 6240 + 78) & PIX_DATA_IN(I*80 + 6240 + 79);

    pix_wire_in(I*10 + 1560) <= PIX_DATA_IN(I*80 + 12480) & PIX_DATA_IN(I*80 + 12480 + 1) & PIX_DATA_IN(I*80 + 12480 + 2) & PIX_DATA_IN(I*80 + 12480 + 3) & PIX_DATA_IN(I*80 + 12480 + 4) & PIX_DATA_IN(I*80 + 12480 + 5) & PIX_DATA_IN(I*80 + 12480 + 6) & PIX_DATA_IN(I*80 + 12480 + 7);
    pix_wire_in(I*10 + 1561) <= PIX_DATA_IN(I*80 + 12480 + 8) & PIX_DATA_IN(I*80 + 12480 + 9) & PIX_DATA_IN(I*80 + 12480 + 10) & PIX_DATA_IN(I*80 + 12480 + 11) & PIX_DATA_IN(I*80 + 12480 + 12) & PIX_DATA_IN(I*80 + 12480 + 13) & PIX_DATA_IN(I*80 + 12480 + 14) & PIX_DATA_IN(I*80 + 12480 + 15);
    pix_wire_in(I*10 + 1562) <= PIX_DATA_IN(I*80 + 12480 + 16) & PIX_DATA_IN(I*80 + 12480 + 17) & PIX_DATA_IN(I*80 + 12480 + 18) & PIX_DATA_IN(I*80 + 12480 + 19) & PIX_DATA_IN(I*80 + 12480 + 20) & PIX_DATA_IN(I*80 + 12480 + 21) & PIX_DATA_IN(I*80 + 12480 + 22) & PIX_DATA_IN(I*80 + 12480 + 23);
    pix_wire_in(I*10 + 1563) <= PIX_DATA_IN(I*80 + 12480 + 24) & PIX_DATA_IN(I*80 + 12480 + 25) & PIX_DATA_IN(I*80 + 12480 + 26) & PIX_DATA_IN(I*80 + 12480 + 27) & PIX_DATA_IN(I*80 + 12480 + 28) & PIX_DATA_IN(I*80 + 12480 + 29) & PIX_DATA_IN(I*80 + 12480 + 30) & PIX_DATA_IN(I*80 + 12480 + 31);
    pix_wire_in(I*10 + 1564) <= PIX_DATA_IN(I*80 + 12480 + 32) & PIX_DATA_IN(I*80 + 12480 + 33) & PIX_DATA_IN(I*80 + 12480 + 34) & PIX_DATA_IN(I*80 + 12480 + 35) & PIX_DATA_IN(I*80 + 12480 + 36) & PIX_DATA_IN(I*80 + 12480 + 37) & PIX_DATA_IN(I*80 + 12480 + 38) & PIX_DATA_IN(I*80 + 12480 + 39);
    pix_wire_in(I*10 + 1565) <= PIX_DATA_IN(I*80 + 12480 + 40) & PIX_DATA_IN(I*80 + 12480 + 41) & PIX_DATA_IN(I*80 + 12480 + 42) & PIX_DATA_IN(I*80 + 12480 + 43) & PIX_DATA_IN(I*80 + 12480 + 44) & PIX_DATA_IN(I*80 + 12480 + 45) & PIX_DATA_IN(I*80 + 12480 + 46) & PIX_DATA_IN(I*80 + 12480 + 47);
    pix_wire_in(I*10 + 1566) <= PIX_DATA_IN(I*80 + 12480 + 48) & PIX_DATA_IN(I*80 + 12480 + 49) & PIX_DATA_IN(I*80 + 12480 + 50) & PIX_DATA_IN(I*80 + 12480 + 51) & PIX_DATA_IN(I*80 + 12480 + 52) & PIX_DATA_IN(I*80 + 12480 + 53) & PIX_DATA_IN(I*80 + 12480 + 54) & PIX_DATA_IN(I*80 + 12480 + 55);
    pix_wire_in(I*10 + 1567) <= PIX_DATA_IN(I*80 + 12480 + 56) & PIX_DATA_IN(I*80 + 12480 + 57) & PIX_DATA_IN(I*80 + 12480 + 58) & PIX_DATA_IN(I*80 + 12480 + 59) & PIX_DATA_IN(I*80 + 12480 + 60) & PIX_DATA_IN(I*80 + 12480 + 61) & PIX_DATA_IN(I*80 + 12480 + 62) & PIX_DATA_IN(I*80 + 12480 + 63);
    pix_wire_in(I*10 + 1568) <= PIX_DATA_IN(I*80 + 12480 + 64) & PIX_DATA_IN(I*80 + 12480 + 65) & PIX_DATA_IN(I*80 + 12480 + 66) & PIX_DATA_IN(I*80 + 12480 + 67) & PIX_DATA_IN(I*80 + 12480 + 68) & PIX_DATA_IN(I*80 + 12480 + 69) & PIX_DATA_IN(I*80 + 12480 + 70) & PIX_DATA_IN(I*80 + 12480 + 71);
    pix_wire_in(I*10 + 1569) <= PIX_DATA_IN(I*80 + 12480 + 72) & PIX_DATA_IN(I*80 + 12480 + 73) & PIX_DATA_IN(I*80 + 12480 + 74) & PIX_DATA_IN(I*80 + 12480 + 75) & PIX_DATA_IN(I*80 + 12480 + 76) & PIX_DATA_IN(I*80 + 12480 + 77) & PIX_DATA_IN(I*80 + 12480 + 78) & PIX_DATA_IN(I*80 + 12480 + 79);

    pix_wire_in(I*10 + 2340) <= PIX_DATA_IN(I*80 + 18720) & PIX_DATA_IN(I*80 + 18720 + 1) & PIX_DATA_IN(I*80 + 18720 + 2) & PIX_DATA_IN(I*80 + 18720 + 3) & PIX_DATA_IN(I*80 + 18720 + 4) & PIX_DATA_IN(I*80 + 18720 + 5) & PIX_DATA_IN(I*80 + 18720 + 6) & PIX_DATA_IN(I*80 + 18720 + 7);
    pix_wire_in(I*10 + 2341) <= PIX_DATA_IN(I*80 + 18720 + 8) & PIX_DATA_IN(I*80 + 18720 + 9) & PIX_DATA_IN(I*80 + 18720 + 10) & PIX_DATA_IN(I*80 + 18720 + 11) & PIX_DATA_IN(I*80 + 18720 + 12) & PIX_DATA_IN(I*80 + 18720 + 13) & PIX_DATA_IN(I*80 + 18720 + 14) & PIX_DATA_IN(I*80 + 18720 + 15);
    pix_wire_in(I*10 + 2342) <= PIX_DATA_IN(I*80 + 18720 + 16) & PIX_DATA_IN(I*80 + 18720 + 17) & PIX_DATA_IN(I*80 + 18720 + 18) & PIX_DATA_IN(I*80 + 18720 + 19) & PIX_DATA_IN(I*80 + 18720 + 20) & PIX_DATA_IN(I*80 + 18720 + 21) & PIX_DATA_IN(I*80 + 18720 + 22) & PIX_DATA_IN(I*80 + 18720 + 23);
    pix_wire_in(I*10 + 2343) <= PIX_DATA_IN(I*80 + 18720 + 24) & PIX_DATA_IN(I*80 + 18720 + 25) & PIX_DATA_IN(I*80 + 18720 + 26) & PIX_DATA_IN(I*80 + 18720 + 27) & PIX_DATA_IN(I*80 + 18720 + 28) & PIX_DATA_IN(I*80 + 18720 + 29) & PIX_DATA_IN(I*80 + 18720 + 30) & PIX_DATA_IN(I*80 + 18720 + 31);
    pix_wire_in(I*10 + 2344) <= PIX_DATA_IN(I*80 + 18720 + 32) & PIX_DATA_IN(I*80 + 18720 + 33) & PIX_DATA_IN(I*80 + 18720 + 34) & PIX_DATA_IN(I*80 + 18720 + 35) & PIX_DATA_IN(I*80 + 18720 + 36) & PIX_DATA_IN(I*80 + 18720 + 37) & PIX_DATA_IN(I*80 + 18720 + 38) & PIX_DATA_IN(I*80 + 18720 + 39);
    pix_wire_in(I*10 + 2345) <= PIX_DATA_IN(I*80 + 18720 + 40) & PIX_DATA_IN(I*80 + 18720 + 41) & PIX_DATA_IN(I*80 + 18720 + 42) & PIX_DATA_IN(I*80 + 18720 + 43) & PIX_DATA_IN(I*80 + 18720 + 44) & PIX_DATA_IN(I*80 + 18720 + 45) & PIX_DATA_IN(I*80 + 18720 + 46) & PIX_DATA_IN(I*80 + 18720 + 47);
    pix_wire_in(I*10 + 2346) <= PIX_DATA_IN(I*80 + 18720 + 48) & PIX_DATA_IN(I*80 + 18720 + 49) & PIX_DATA_IN(I*80 + 18720 + 50) & PIX_DATA_IN(I*80 + 18720 + 51) & PIX_DATA_IN(I*80 + 18720 + 52) & PIX_DATA_IN(I*80 + 18720 + 53) & PIX_DATA_IN(I*80 + 18720 + 54) & PIX_DATA_IN(I*80 + 18720 + 55);
    pix_wire_in(I*10 + 2347) <= PIX_DATA_IN(I*80 + 18720 + 56) & PIX_DATA_IN(I*80 + 18720 + 57) & PIX_DATA_IN(I*80 + 18720 + 58) & PIX_DATA_IN(I*80 + 18720 + 59) & PIX_DATA_IN(I*80 + 18720 + 60) & PIX_DATA_IN(I*80 + 18720 + 61) & PIX_DATA_IN(I*80 + 18720 + 62) & PIX_DATA_IN(I*80 + 18720 + 63);
    pix_wire_in(I*10 + 2348) <= PIX_DATA_IN(I*80 + 18720 + 64) & PIX_DATA_IN(I*80 + 18720 + 65) & PIX_DATA_IN(I*80 + 18720 + 66) & PIX_DATA_IN(I*80 + 18720 + 67) & PIX_DATA_IN(I*80 + 18720 + 68) & PIX_DATA_IN(I*80 + 18720 + 69) & PIX_DATA_IN(I*80 + 18720 + 70) & PIX_DATA_IN(I*80 + 18720 + 71);
    pix_wire_in(I*10 + 2349) <= PIX_DATA_IN(I*80 + 18720 + 72) & PIX_DATA_IN(I*80 + 18720 + 73) & PIX_DATA_IN(I*80 + 18720 + 74) & PIX_DATA_IN(I*80 + 18720 + 75) & PIX_DATA_IN(I*80 + 18720 + 76) & PIX_DATA_IN(I*80 + 18720 + 77) & PIX_DATA_IN(I*80 + 18720 + 78) & PIX_DATA_IN(I*80 + 18720 + 79);

    pix_wire_in(I*10 + 3120) <= PIX_DATA_IN(I*80 + 24960) & PIX_DATA_IN(I*80 + 24960 + 1) & PIX_DATA_IN(I*80 + 24960 + 2) & PIX_DATA_IN(I*80 + 24960 + 3) & PIX_DATA_IN(I*80 + 24960 + 4) & PIX_DATA_IN(I*80 + 24960 + 5) & PIX_DATA_IN(I*80 + 24960 + 6) & PIX_DATA_IN(I*80 + 24960 + 7);
    pix_wire_in(I*10 + 3121) <= PIX_DATA_IN(I*80 + 24960 + 8) & PIX_DATA_IN(I*80 + 24960 + 9) & PIX_DATA_IN(I*80 + 24960 + 10) & PIX_DATA_IN(I*80 + 24960 + 11) & PIX_DATA_IN(I*80 + 24960 + 12) & PIX_DATA_IN(I*80 + 24960 + 13) & PIX_DATA_IN(I*80 + 24960 + 14) & PIX_DATA_IN(I*80 + 24960 + 15);
    pix_wire_in(I*10 + 3122) <= PIX_DATA_IN(I*80 + 24960 + 16) & PIX_DATA_IN(I*80 + 24960 + 17) & PIX_DATA_IN(I*80 + 24960 + 18) & PIX_DATA_IN(I*80 + 24960 + 19) & PIX_DATA_IN(I*80 + 24960 + 20) & PIX_DATA_IN(I*80 + 24960 + 21) & PIX_DATA_IN(I*80 + 24960 + 22) & PIX_DATA_IN(I*80 + 24960 + 23);
    pix_wire_in(I*10 + 3123) <= PIX_DATA_IN(I*80 + 24960 + 24) & PIX_DATA_IN(I*80 + 24960 + 25) & PIX_DATA_IN(I*80 + 24960 + 26) & PIX_DATA_IN(I*80 + 24960 + 27) & PIX_DATA_IN(I*80 + 24960 + 28) & PIX_DATA_IN(I*80 + 24960 + 29) & PIX_DATA_IN(I*80 + 24960 + 30) & PIX_DATA_IN(I*80 + 24960 + 31);
    pix_wire_in(I*10 + 3124) <= PIX_DATA_IN(I*80 + 24960 + 32) & PIX_DATA_IN(I*80 + 24960 + 33) & PIX_DATA_IN(I*80 + 24960 + 34) & PIX_DATA_IN(I*80 + 24960 + 35) & PIX_DATA_IN(I*80 + 24960 + 36) & PIX_DATA_IN(I*80 + 24960 + 37) & PIX_DATA_IN(I*80 + 24960 + 38) & PIX_DATA_IN(I*80 + 24960 + 39);
    pix_wire_in(I*10 + 3125) <= PIX_DATA_IN(I*80 + 24960 + 40) & PIX_DATA_IN(I*80 + 24960 + 41) & PIX_DATA_IN(I*80 + 24960 + 42) & PIX_DATA_IN(I*80 + 24960 + 43) & PIX_DATA_IN(I*80 + 24960 + 44) & PIX_DATA_IN(I*80 + 24960 + 45) & PIX_DATA_IN(I*80 + 24960 + 46) & PIX_DATA_IN(I*80 + 24960 + 47);
    pix_wire_in(I*10 + 3126) <= PIX_DATA_IN(I*80 + 24960 + 48) & PIX_DATA_IN(I*80 + 24960 + 49) & PIX_DATA_IN(I*80 + 24960 + 50) & PIX_DATA_IN(I*80 + 24960 + 51) & PIX_DATA_IN(I*80 + 24960 + 52) & PIX_DATA_IN(I*80 + 24960 + 53) & PIX_DATA_IN(I*80 + 24960 + 54) & PIX_DATA_IN(I*80 + 24960 + 55);
    pix_wire_in(I*10 + 3127) <= PIX_DATA_IN(I*80 + 24960 + 56) & PIX_DATA_IN(I*80 + 24960 + 57) & PIX_DATA_IN(I*80 + 24960 + 58) & PIX_DATA_IN(I*80 + 24960 + 59) & PIX_DATA_IN(I*80 + 24960 + 60) & PIX_DATA_IN(I*80 + 24960 + 61) & PIX_DATA_IN(I*80 + 24960 + 62) & PIX_DATA_IN(I*80 + 24960 + 63);
    pix_wire_in(I*10 + 3128) <= PIX_DATA_IN(I*80 + 24960 + 64) & PIX_DATA_IN(I*80 + 24960 + 65) & PIX_DATA_IN(I*80 + 24960 + 66) & PIX_DATA_IN(I*80 + 24960 + 67) & PIX_DATA_IN(I*80 + 24960 + 68) & PIX_DATA_IN(I*80 + 24960 + 69) & PIX_DATA_IN(I*80 + 24960 + 70) & PIX_DATA_IN(I*80 + 24960 + 71);
    pix_wire_in(I*10 + 3129) <= PIX_DATA_IN(I*80 + 24960 + 72) & PIX_DATA_IN(I*80 + 24960 + 73) & PIX_DATA_IN(I*80 + 24960 + 74) & PIX_DATA_IN(I*80 + 24960 + 75) & PIX_DATA_IN(I*80 + 24960 + 76) & PIX_DATA_IN(I*80 + 24960 + 77) & PIX_DATA_IN(I*80 + 24960 + 78) & PIX_DATA_IN(I*80 + 24960 + 79);

    pix_wire_in(I*10 + 3900) <= PIX_DATA_IN(I*80 + 31200) & PIX_DATA_IN(I*80 + 31200 + 1) & PIX_DATA_IN(I*80 + 31200 + 2) & PIX_DATA_IN(I*80 + 31200 + 3) & PIX_DATA_IN(I*80 + 31200 + 4) & PIX_DATA_IN(I*80 + 31200 + 5) & PIX_DATA_IN(I*80 + 31200 + 6) & PIX_DATA_IN(I*80 + 31200 + 7);
    pix_wire_in(I*10 + 3901) <= PIX_DATA_IN(I*80 + 31200 + 8) & PIX_DATA_IN(I*80 + 31200 + 9) & PIX_DATA_IN(I*80 + 31200 + 10) & PIX_DATA_IN(I*80 + 31200 + 11) & PIX_DATA_IN(I*80 + 31200 + 12) & PIX_DATA_IN(I*80 + 31200 + 13) & PIX_DATA_IN(I*80 + 31200 + 14) & PIX_DATA_IN(I*80 + 31200 + 15);
    pix_wire_in(I*10 + 3902) <= PIX_DATA_IN(I*80 + 31200 + 16) & PIX_DATA_IN(I*80 + 31200 + 17) & PIX_DATA_IN(I*80 + 31200 + 18) & PIX_DATA_IN(I*80 + 31200 + 19) & PIX_DATA_IN(I*80 + 31200 + 20) & PIX_DATA_IN(I*80 + 31200 + 21) & PIX_DATA_IN(I*80 + 31200 + 22) & PIX_DATA_IN(I*80 + 31200 + 23);
    pix_wire_in(I*10 + 3903) <= PIX_DATA_IN(I*80 + 31200 + 24) & PIX_DATA_IN(I*80 + 31200 + 25) & PIX_DATA_IN(I*80 + 31200 + 26) & PIX_DATA_IN(I*80 + 31200 + 27) & PIX_DATA_IN(I*80 + 31200 + 28) & PIX_DATA_IN(I*80 + 31200 + 29) & PIX_DATA_IN(I*80 + 31200 + 30) & PIX_DATA_IN(I*80 + 31200 + 31);
    pix_wire_in(I*10 + 3904) <= PIX_DATA_IN(I*80 + 31200 + 32) & PIX_DATA_IN(I*80 + 31200 + 33) & PIX_DATA_IN(I*80 + 31200 + 34) & PIX_DATA_IN(I*80 + 31200 + 35) & PIX_DATA_IN(I*80 + 31200 + 36) & PIX_DATA_IN(I*80 + 31200 + 37) & PIX_DATA_IN(I*80 + 31200 + 38) & PIX_DATA_IN(I*80 + 31200 + 39);
    pix_wire_in(I*10 + 3905) <= PIX_DATA_IN(I*80 + 31200 + 40) & PIX_DATA_IN(I*80 + 31200 + 41) & PIX_DATA_IN(I*80 + 31200 + 42) & PIX_DATA_IN(I*80 + 31200 + 43) & PIX_DATA_IN(I*80 + 31200 + 44) & PIX_DATA_IN(I*80 + 31200 + 45) & PIX_DATA_IN(I*80 + 31200 + 46) & PIX_DATA_IN(I*80 + 31200 + 47);
    pix_wire_in(I*10 + 3906) <= PIX_DATA_IN(I*80 + 31200 + 48) & PIX_DATA_IN(I*80 + 31200 + 49) & PIX_DATA_IN(I*80 + 31200 + 50) & PIX_DATA_IN(I*80 + 31200 + 51) & PIX_DATA_IN(I*80 + 31200 + 52) & PIX_DATA_IN(I*80 + 31200 + 53) & PIX_DATA_IN(I*80 + 31200 + 54) & PIX_DATA_IN(I*80 + 31200 + 55);
    pix_wire_in(I*10 + 3907) <= PIX_DATA_IN(I*80 + 31200 + 56) & PIX_DATA_IN(I*80 + 31200 + 57) & PIX_DATA_IN(I*80 + 31200 + 58) & PIX_DATA_IN(I*80 + 31200 + 59) & PIX_DATA_IN(I*80 + 31200 + 60) & PIX_DATA_IN(I*80 + 31200 + 61) & PIX_DATA_IN(I*80 + 31200 + 62) & PIX_DATA_IN(I*80 + 31200 + 63);
    pix_wire_in(I*10 + 3908) <= PIX_DATA_IN(I*80 + 31200 + 64) & PIX_DATA_IN(I*80 + 31200 + 65) & PIX_DATA_IN(I*80 + 31200 + 66) & PIX_DATA_IN(I*80 + 31200 + 67) & PIX_DATA_IN(I*80 + 31200 + 68) & PIX_DATA_IN(I*80 + 31200 + 69) & PIX_DATA_IN(I*80 + 31200 + 70) & PIX_DATA_IN(I*80 + 31200 + 71);
    pix_wire_in(I*10 + 3909) <= PIX_DATA_IN(I*80 + 31200 + 72) & PIX_DATA_IN(I*80 + 31200 + 73) & PIX_DATA_IN(I*80 + 31200 + 74) & PIX_DATA_IN(I*80 + 31200 + 75) & PIX_DATA_IN(I*80 + 31200 + 76) & PIX_DATA_IN(I*80 + 31200 + 77) & PIX_DATA_IN(I*80 + 31200 + 78) & PIX_DATA_IN(I*80 + 31200 + 79);

    --wires OUT
    PIX_DATA_OUT(I*8) <= pix_wire_out(I*8)(7);
    PIX_DATA_OUT(I*8 + 1) <= pix_wire_out(I*8)(6);
    PIX_DATA_OUT(I*8 + 2) <= pix_wire_out(I*8)(5);
    PIX_DATA_OUT(I*8 + 3) <= pix_wire_out(I*8)(4);
    PIX_DATA_OUT(I*8 + 4) <= pix_wire_out(I*8)(3);
    PIX_DATA_OUT(I*8 + 5) <= pix_wire_out(I*8)(2);
    PIX_DATA_OUT(I*8 + 6) <= pix_wire_out(I*8)(1);
    PIX_DATA_OUT(I*8 + 7) <= pix_wire_out(I*8)(0);
    
    PIX_DATA_OUT(I*8 + 4992) <= pix_wire_out(I*8 + 624)(7);
    PIX_DATA_OUT(I*8 + 4993) <= pix_wire_out(I*8 + 624)(6);
    PIX_DATA_OUT(I*8 + 4994) <= pix_wire_out(I*8 + 624)(5);
    PIX_DATA_OUT(I*8 + 4995) <= pix_wire_out(I*8 + 624)(4);
    PIX_DATA_OUT(I*8 + 4996) <= pix_wire_out(I*8 + 624)(3);
    PIX_DATA_OUT(I*8 + 4997) <= pix_wire_out(I*8 + 624)(2);
    PIX_DATA_OUT(I*8 + 4998) <= pix_wire_out(I*8 + 624)(1);
    PIX_DATA_OUT(I*8 + 4999) <= pix_wire_out(I*8 + 624)(0);
    
    PIX_DATA_OUT(I*8 + 9984) <= pix_wire_out(I*8 + 1248)(7);
    PIX_DATA_OUT(I*8 + 9985) <= pix_wire_out(I*8 + 1248)(6);
    PIX_DATA_OUT(I*8 + 9986) <= pix_wire_out(I*8 + 1248)(5);
    PIX_DATA_OUT(I*8 + 9987) <= pix_wire_out(I*8 + 1248)(4);
    PIX_DATA_OUT(I*8 + 9988) <= pix_wire_out(I*8 + 1248)(3);
    PIX_DATA_OUT(I*8 + 9989) <= pix_wire_out(I*8 + 1248)(2);
    PIX_DATA_OUT(I*8 + 9990) <= pix_wire_out(I*8 + 1248)(1);
    PIX_DATA_OUT(I*8 + 9991) <= pix_wire_out(I*8 + 1248)(0);
    
    PIX_DATA_OUT(I*8 + 14976) <= pix_wire_out(I*8 + 1872)(7);
    PIX_DATA_OUT(I*8 + 14977) <= pix_wire_out(I*8 + 1872)(6);
    PIX_DATA_OUT(I*8 + 14978) <= pix_wire_out(I*8 + 1872)(5);
    PIX_DATA_OUT(I*8 + 14979) <= pix_wire_out(I*8 + 1872)(4);
    PIX_DATA_OUT(I*8 + 14980) <= pix_wire_out(I*8 + 1872)(3);
    PIX_DATA_OUT(I*8 + 14981) <= pix_wire_out(I*8 + 1872)(2);
    PIX_DATA_OUT(I*8 + 14982) <= pix_wire_out(I*8 + 1872)(1);
    PIX_DATA_OUT(I*8 + 14983) <= pix_wire_out(I*8 + 1872)(0);
    
    PIX_DATA_OUT(I*8 + 8) <= pix_wire_out(I*8 + 1)(7);
    PIX_DATA_OUT(I*8 + 9) <= pix_wire_out(I*8 + 1)(6);
    PIX_DATA_OUT(I*8 + 10) <= pix_wire_out(I*8 + 1)(5);
    PIX_DATA_OUT(I*8 + 11) <= pix_wire_out(I*8 + 1)(4);
    PIX_DATA_OUT(I*8 + 12) <= pix_wire_out(I*8 + 1)(3);
    PIX_DATA_OUT(I*8 + 13) <= pix_wire_out(I*8 + 1)(2);
    PIX_DATA_OUT(I*8 + 14) <= pix_wire_out(I*8 + 1)(1);
    PIX_DATA_OUT(I*8 + 15) <= pix_wire_out(I*8 + 1)(0);
    
    PIX_DATA_OUT(I*8 + 5000) <= pix_wire_out(I*8 + 625)(7);
    PIX_DATA_OUT(I*8 + 5001) <= pix_wire_out(I*8 + 625)(6);
    PIX_DATA_OUT(I*8 + 5002) <= pix_wire_out(I*8 + 625)(5);
    PIX_DATA_OUT(I*8 + 5003) <= pix_wire_out(I*8 + 625)(4);
    PIX_DATA_OUT(I*8 + 5004) <= pix_wire_out(I*8 + 625)(3);
    PIX_DATA_OUT(I*8 + 5005) <= pix_wire_out(I*8 + 625)(2);
    PIX_DATA_OUT(I*8 + 5006) <= pix_wire_out(I*8 + 625)(1);
    PIX_DATA_OUT(I*8 + 5007) <= pix_wire_out(I*8 + 625)(0);
    
    PIX_DATA_OUT(I*8 + 9992) <= pix_wire_out(I*8 + 1249)(7);
    PIX_DATA_OUT(I*8 + 9993) <= pix_wire_out(I*8 + 1249)(6);
    PIX_DATA_OUT(I*8 + 9994) <= pix_wire_out(I*8 + 1249)(5);
    PIX_DATA_OUT(I*8 + 9995) <= pix_wire_out(I*8 + 1249)(4);
    PIX_DATA_OUT(I*8 + 9996) <= pix_wire_out(I*8 + 1249)(3);
    PIX_DATA_OUT(I*8 + 9997) <= pix_wire_out(I*8 + 1249)(2);
    PIX_DATA_OUT(I*8 + 9998) <= pix_wire_out(I*8 + 1249)(1);
    PIX_DATA_OUT(I*8 + 9999) <= pix_wire_out(I*8 + 1249)(0);
    
    PIX_DATA_OUT(I*8 + 14984) <= pix_wire_out(I*8 + 1873)(7);
    PIX_DATA_OUT(I*8 + 14985) <= pix_wire_out(I*8 + 1873)(6);
    PIX_DATA_OUT(I*8 + 14986) <= pix_wire_out(I*8 + 1873)(5);
    PIX_DATA_OUT(I*8 + 14987) <= pix_wire_out(I*8 + 1873)(4);
    PIX_DATA_OUT(I*8 + 14988) <= pix_wire_out(I*8 + 1873)(3);
    PIX_DATA_OUT(I*8 + 14989) <= pix_wire_out(I*8 + 1873)(2);
    PIX_DATA_OUT(I*8 + 14990) <= pix_wire_out(I*8 + 1873)(1);
    PIX_DATA_OUT(I*8 + 14991) <= pix_wire_out(I*8 + 1873)(0);
    
    PIX_DATA_OUT(I*8 + 16) <= pix_wire_out(I*8 + 2)(7);
    PIX_DATA_OUT(I*8 + 17) <= pix_wire_out(I*8 + 2)(6);
    PIX_DATA_OUT(I*8 + 18) <= pix_wire_out(I*8 + 2)(5);
    PIX_DATA_OUT(I*8 + 19) <= pix_wire_out(I*8 + 2)(4);
    PIX_DATA_OUT(I*8 + 20) <= pix_wire_out(I*8 + 2)(3);
    PIX_DATA_OUT(I*8 + 21) <= pix_wire_out(I*8 + 2)(2);
    PIX_DATA_OUT(I*8 + 22) <= pix_wire_out(I*8 + 2)(1);
    PIX_DATA_OUT(I*8 + 23) <= pix_wire_out(I*8 + 2)(0);
    
    PIX_DATA_OUT(I*8 + 5008) <= pix_wire_out(I*8 + 626)(7);
    PIX_DATA_OUT(I*8 + 5009) <= pix_wire_out(I*8 + 626)(6);
    PIX_DATA_OUT(I*8 + 5010) <= pix_wire_out(I*8 + 626)(5);
    PIX_DATA_OUT(I*8 + 5011) <= pix_wire_out(I*8 + 626)(4);
    PIX_DATA_OUT(I*8 + 5012) <= pix_wire_out(I*8 + 626)(3);
    PIX_DATA_OUT(I*8 + 5013) <= pix_wire_out(I*8 + 626)(2);
    PIX_DATA_OUT(I*8 + 5014) <= pix_wire_out(I*8 + 626)(1);
    PIX_DATA_OUT(I*8 + 5015) <= pix_wire_out(I*8 + 626)(0);
    
    PIX_DATA_OUT(I*8 + 10000) <= pix_wire_out(I*8 + 1250)(7);
    PIX_DATA_OUT(I*8 + 10001) <= pix_wire_out(I*8 + 1250)(6);
    PIX_DATA_OUT(I*8 + 10002) <= pix_wire_out(I*8 + 1250)(5);
    PIX_DATA_OUT(I*8 + 10003) <= pix_wire_out(I*8 + 1250)(4);
    PIX_DATA_OUT(I*8 + 10004) <= pix_wire_out(I*8 + 1250)(3);
    PIX_DATA_OUT(I*8 + 10005) <= pix_wire_out(I*8 + 1250)(2);
    PIX_DATA_OUT(I*8 + 10006) <= pix_wire_out(I*8 + 1250)(1);
    PIX_DATA_OUT(I*8 + 10007) <= pix_wire_out(I*8 + 1250)(0);
    
    PIX_DATA_OUT(I*8 + 14992) <= pix_wire_out(I*8 + 1874)(7);
    PIX_DATA_OUT(I*8 + 14993) <= pix_wire_out(I*8 + 1874)(6);
    PIX_DATA_OUT(I*8 + 14994) <= pix_wire_out(I*8 + 1874)(5);
    PIX_DATA_OUT(I*8 + 14995) <= pix_wire_out(I*8 + 1874)(4);
    PIX_DATA_OUT(I*8 + 14996) <= pix_wire_out(I*8 + 1874)(3);
    PIX_DATA_OUT(I*8 + 14997) <= pix_wire_out(I*8 + 1874)(2);
    PIX_DATA_OUT(I*8 + 14998) <= pix_wire_out(I*8 + 1874)(1);
    PIX_DATA_OUT(I*8 + 14999) <= pix_wire_out(I*8 + 1874)(0);
    
    PIX_DATA_OUT(I*8 + 24) <= pix_wire_out(I*8 + 3)(7);
    PIX_DATA_OUT(I*8 + 25) <= pix_wire_out(I*8 + 3)(6);
    PIX_DATA_OUT(I*8 + 26) <= pix_wire_out(I*8 + 3)(5);
    PIX_DATA_OUT(I*8 + 27) <= pix_wire_out(I*8 + 3)(4);
    PIX_DATA_OUT(I*8 + 28) <= pix_wire_out(I*8 + 3)(3);
    PIX_DATA_OUT(I*8 + 29) <= pix_wire_out(I*8 + 3)(2);
    PIX_DATA_OUT(I*8 + 30) <= pix_wire_out(I*8 + 3)(1);
    PIX_DATA_OUT(I*8 + 31) <= pix_wire_out(I*8 + 3)(0);
    
    PIX_DATA_OUT(I*8 + 5016) <= pix_wire_out(I*8 + 627)(7);
    PIX_DATA_OUT(I*8 + 5017) <= pix_wire_out(I*8 + 627)(6);
    PIX_DATA_OUT(I*8 + 5018) <= pix_wire_out(I*8 + 627)(5);
    PIX_DATA_OUT(I*8 + 5019) <= pix_wire_out(I*8 + 627)(4);
    PIX_DATA_OUT(I*8 + 5020) <= pix_wire_out(I*8 + 627)(3);
    PIX_DATA_OUT(I*8 + 5021) <= pix_wire_out(I*8 + 627)(2);
    PIX_DATA_OUT(I*8 + 5022) <= pix_wire_out(I*8 + 627)(1);
    PIX_DATA_OUT(I*8 + 5023) <= pix_wire_out(I*8 + 627)(0);
    
    PIX_DATA_OUT(I*8 + 10008) <= pix_wire_out(I*8 + 1251)(7);
    PIX_DATA_OUT(I*8 + 10009) <= pix_wire_out(I*8 + 1251)(6);
    PIX_DATA_OUT(I*8 + 10010) <= pix_wire_out(I*8 + 1251)(5);
    PIX_DATA_OUT(I*8 + 10011) <= pix_wire_out(I*8 + 1251)(4);
    PIX_DATA_OUT(I*8 + 10012) <= pix_wire_out(I*8 + 1251)(3);
    PIX_DATA_OUT(I*8 + 10013) <= pix_wire_out(I*8 + 1251)(2);
    PIX_DATA_OUT(I*8 + 10014) <= pix_wire_out(I*8 + 1251)(1);
    PIX_DATA_OUT(I*8 + 10015) <= pix_wire_out(I*8 + 1251)(0);
    
    PIX_DATA_OUT(I*8 + 15000) <= pix_wire_out(I*8 + 1875)(7);
    PIX_DATA_OUT(I*8 + 15001) <= pix_wire_out(I*8 + 1875)(6);
    PIX_DATA_OUT(I*8 + 15002) <= pix_wire_out(I*8 + 1875)(5);
    PIX_DATA_OUT(I*8 + 15003) <= pix_wire_out(I*8 + 1875)(4);
    PIX_DATA_OUT(I*8 + 15004) <= pix_wire_out(I*8 + 1875)(3);
    PIX_DATA_OUT(I*8 + 15005) <= pix_wire_out(I*8 + 1875)(2);
    PIX_DATA_OUT(I*8 + 15006) <= pix_wire_out(I*8 + 1875)(1);
    PIX_DATA_OUT(I*8 + 15007) <= pix_wire_out(I*8 + 1875)(0);
    
    PIX_DATA_OUT(I*8 + 32) <= pix_wire_out(I*8 + 4)(7);
    PIX_DATA_OUT(I*8 + 33) <= pix_wire_out(I*8 + 4)(6);
    PIX_DATA_OUT(I*8 + 34) <= pix_wire_out(I*8 + 4)(5);
    PIX_DATA_OUT(I*8 + 35) <= pix_wire_out(I*8 + 4)(4);
    PIX_DATA_OUT(I*8 + 36) <= pix_wire_out(I*8 + 4)(3);
    PIX_DATA_OUT(I*8 + 37) <= pix_wire_out(I*8 + 4)(2);
    PIX_DATA_OUT(I*8 + 38) <= pix_wire_out(I*8 + 4)(1);
    PIX_DATA_OUT(I*8 + 39) <= pix_wire_out(I*8 + 4)(0);
    
    PIX_DATA_OUT(I*8 + 5024) <= pix_wire_out(I*8 + 628)(7);
    PIX_DATA_OUT(I*8 + 5025) <= pix_wire_out(I*8 + 628)(6);
    PIX_DATA_OUT(I*8 + 5026) <= pix_wire_out(I*8 + 628)(5);
    PIX_DATA_OUT(I*8 + 5027) <= pix_wire_out(I*8 + 628)(4);
    PIX_DATA_OUT(I*8 + 5028) <= pix_wire_out(I*8 + 628)(3);
    PIX_DATA_OUT(I*8 + 5029) <= pix_wire_out(I*8 + 628)(2);
    PIX_DATA_OUT(I*8 + 5030) <= pix_wire_out(I*8 + 628)(1);
    PIX_DATA_OUT(I*8 + 5031) <= pix_wire_out(I*8 + 628)(0);
    
    PIX_DATA_OUT(I*8 + 10016) <= pix_wire_out(I*8 + 1252)(7);
    PIX_DATA_OUT(I*8 + 10017) <= pix_wire_out(I*8 + 1252)(6);
    PIX_DATA_OUT(I*8 + 10018) <= pix_wire_out(I*8 + 1252)(5);
    PIX_DATA_OUT(I*8 + 10019) <= pix_wire_out(I*8 + 1252)(4);
    PIX_DATA_OUT(I*8 + 10020) <= pix_wire_out(I*8 + 1252)(3);
    PIX_DATA_OUT(I*8 + 10021) <= pix_wire_out(I*8 + 1252)(2);
    PIX_DATA_OUT(I*8 + 10022) <= pix_wire_out(I*8 + 1252)(1);
    PIX_DATA_OUT(I*8 + 10023) <= pix_wire_out(I*8 + 1252)(0);
    
    PIX_DATA_OUT(I*8 + 15008) <= pix_wire_out(I*8 + 1876)(7);
    PIX_DATA_OUT(I*8 + 15009) <= pix_wire_out(I*8 + 1876)(6);
    PIX_DATA_OUT(I*8 + 15010) <= pix_wire_out(I*8 + 1876)(5);
    PIX_DATA_OUT(I*8 + 15011) <= pix_wire_out(I*8 + 1876)(4);
    PIX_DATA_OUT(I*8 + 15012) <= pix_wire_out(I*8 + 1876)(3);
    PIX_DATA_OUT(I*8 + 15013) <= pix_wire_out(I*8 + 1876)(2);
    PIX_DATA_OUT(I*8 + 15014) <= pix_wire_out(I*8 + 1876)(1);
    PIX_DATA_OUT(I*8 + 15015) <= pix_wire_out(I*8 + 1876)(0);
    
    PIX_DATA_OUT(I*8 + 40) <= pix_wire_out(I*8 + 5)(7);
    PIX_DATA_OUT(I*8 + 41) <= pix_wire_out(I*8 + 5)(6);
    PIX_DATA_OUT(I*8 + 42) <= pix_wire_out(I*8 + 5)(5);
    PIX_DATA_OUT(I*8 + 43) <= pix_wire_out(I*8 + 5)(4);
    PIX_DATA_OUT(I*8 + 44) <= pix_wire_out(I*8 + 5)(3);
    PIX_DATA_OUT(I*8 + 45) <= pix_wire_out(I*8 + 5)(2);
    PIX_DATA_OUT(I*8 + 46) <= pix_wire_out(I*8 + 5)(1);
    PIX_DATA_OUT(I*8 + 47) <= pix_wire_out(I*8 + 5)(0);
    
    PIX_DATA_OUT(I*8 + 5032) <= pix_wire_out(I*8 + 629)(7);
    PIX_DATA_OUT(I*8 + 5033) <= pix_wire_out(I*8 + 629)(6);
    PIX_DATA_OUT(I*8 + 5034) <= pix_wire_out(I*8 + 629)(5);
    PIX_DATA_OUT(I*8 + 5035) <= pix_wire_out(I*8 + 629)(4);
    PIX_DATA_OUT(I*8 + 5036) <= pix_wire_out(I*8 + 629)(3);
    PIX_DATA_OUT(I*8 + 5037) <= pix_wire_out(I*8 + 629)(2);
    PIX_DATA_OUT(I*8 + 5038) <= pix_wire_out(I*8 + 629)(1);
    PIX_DATA_OUT(I*8 + 5039) <= pix_wire_out(I*8 + 629)(0);
    
    PIX_DATA_OUT(I*8 + 10024) <= pix_wire_out(I*8 + 1253)(7);
    PIX_DATA_OUT(I*8 + 10025) <= pix_wire_out(I*8 + 1253)(6);
    PIX_DATA_OUT(I*8 + 10026) <= pix_wire_out(I*8 + 1253)(5);
    PIX_DATA_OUT(I*8 + 10027) <= pix_wire_out(I*8 + 1253)(4);
    PIX_DATA_OUT(I*8 + 10028) <= pix_wire_out(I*8 + 1253)(3);
    PIX_DATA_OUT(I*8 + 10029) <= pix_wire_out(I*8 + 1253)(2);
    PIX_DATA_OUT(I*8 + 10030) <= pix_wire_out(I*8 + 1253)(1);
    PIX_DATA_OUT(I*8 + 10031) <= pix_wire_out(I*8 + 1253)(0);
    
    PIX_DATA_OUT(I*8 + 15016) <= pix_wire_out(I*8 + 1877)(7);
    PIX_DATA_OUT(I*8 + 15017) <= pix_wire_out(I*8 + 1877)(6);
    PIX_DATA_OUT(I*8 + 15018) <= pix_wire_out(I*8 + 1877)(5);
    PIX_DATA_OUT(I*8 + 15019) <= pix_wire_out(I*8 + 1877)(4);
    PIX_DATA_OUT(I*8 + 15020) <= pix_wire_out(I*8 + 1877)(3);
    PIX_DATA_OUT(I*8 + 15021) <= pix_wire_out(I*8 + 1877)(2);
    PIX_DATA_OUT(I*8 + 15022) <= pix_wire_out(I*8 + 1877)(1);
    PIX_DATA_OUT(I*8 + 15023) <= pix_wire_out(I*8 + 1877)(0);
    
    PIX_DATA_OUT(I*8 + 48) <= pix_wire_out(I*8 + 6)(7);
    PIX_DATA_OUT(I*8 + 49) <= pix_wire_out(I*8 + 6)(6);
    PIX_DATA_OUT(I*8 + 50) <= pix_wire_out(I*8 + 6)(5);
    PIX_DATA_OUT(I*8 + 51) <= pix_wire_out(I*8 + 6)(4);
    PIX_DATA_OUT(I*8 + 52) <= pix_wire_out(I*8 + 6)(3);
    PIX_DATA_OUT(I*8 + 53) <= pix_wire_out(I*8 + 6)(2);
    PIX_DATA_OUT(I*8 + 54) <= pix_wire_out(I*8 + 6)(1);
    PIX_DATA_OUT(I*8 + 55) <= pix_wire_out(I*8 + 6)(0);
    
    PIX_DATA_OUT(I*8 + 5040) <= pix_wire_out(I*8 + 630)(7);
    PIX_DATA_OUT(I*8 + 5041) <= pix_wire_out(I*8 + 630)(6);
    PIX_DATA_OUT(I*8 + 5042) <= pix_wire_out(I*8 + 630)(5);
    PIX_DATA_OUT(I*8 + 5043) <= pix_wire_out(I*8 + 630)(4);
    PIX_DATA_OUT(I*8 + 5044) <= pix_wire_out(I*8 + 630)(3);
    PIX_DATA_OUT(I*8 + 5045) <= pix_wire_out(I*8 + 630)(2);
    PIX_DATA_OUT(I*8 + 5046) <= pix_wire_out(I*8 + 630)(1);
    PIX_DATA_OUT(I*8 + 5047) <= pix_wire_out(I*8 + 630)(0);
    
    PIX_DATA_OUT(I*8 + 10032) <= pix_wire_out(I*8 + 1254)(7);
    PIX_DATA_OUT(I*8 + 10033) <= pix_wire_out(I*8 + 1254)(6);
    PIX_DATA_OUT(I*8 + 10034) <= pix_wire_out(I*8 + 1254)(5);
    PIX_DATA_OUT(I*8 + 10035) <= pix_wire_out(I*8 + 1254)(4);
    PIX_DATA_OUT(I*8 + 10036) <= pix_wire_out(I*8 + 1254)(3);
    PIX_DATA_OUT(I*8 + 10037) <= pix_wire_out(I*8 + 1254)(2);
    PIX_DATA_OUT(I*8 + 10038) <= pix_wire_out(I*8 + 1254)(1);
    PIX_DATA_OUT(I*8 + 10039) <= pix_wire_out(I*8 + 1254)(0);
    
    PIX_DATA_OUT(I*8 + 15024) <= pix_wire_out(I*8 + 1878)(7);
    PIX_DATA_OUT(I*8 + 15025) <= pix_wire_out(I*8 + 1878)(6);
    PIX_DATA_OUT(I*8 + 15026) <= pix_wire_out(I*8 + 1878)(5);
    PIX_DATA_OUT(I*8 + 15027) <= pix_wire_out(I*8 + 1878)(4);
    PIX_DATA_OUT(I*8 + 15028) <= pix_wire_out(I*8 + 1878)(3);
    PIX_DATA_OUT(I*8 + 15029) <= pix_wire_out(I*8 + 1878)(2);
    PIX_DATA_OUT(I*8 + 15030) <= pix_wire_out(I*8 + 1878)(1);
    PIX_DATA_OUT(I*8 + 15031) <= pix_wire_out(I*8 + 1878)(0);
    
    PIX_DATA_OUT(I*8 + 56) <= pix_wire_out(I*8 + 7)(7);
    PIX_DATA_OUT(I*8 + 57) <= pix_wire_out(I*8 + 7)(6);
    PIX_DATA_OUT(I*8 + 58) <= pix_wire_out(I*8 + 7)(5);
    PIX_DATA_OUT(I*8 + 59) <= pix_wire_out(I*8 + 7)(4);
    PIX_DATA_OUT(I*8 + 60) <= pix_wire_out(I*8 + 7)(3);
    PIX_DATA_OUT(I*8 + 61) <= pix_wire_out(I*8 + 7)(2);
    PIX_DATA_OUT(I*8 + 62) <= pix_wire_out(I*8 + 7)(1);
    PIX_DATA_OUT(I*8 + 63) <= pix_wire_out(I*8 + 7)(0);
    
    PIX_DATA_OUT(I*8 + 5048) <= pix_wire_out(I*8 + 631)(7);
    PIX_DATA_OUT(I*8 + 5049) <= pix_wire_out(I*8 + 631)(6);
    PIX_DATA_OUT(I*8 + 5050) <= pix_wire_out(I*8 + 631)(5);
    PIX_DATA_OUT(I*8 + 5051) <= pix_wire_out(I*8 + 631)(4);
    PIX_DATA_OUT(I*8 + 5052) <= pix_wire_out(I*8 + 631)(3);
    PIX_DATA_OUT(I*8 + 5053) <= pix_wire_out(I*8 + 631)(2);
    PIX_DATA_OUT(I*8 + 5054) <= pix_wire_out(I*8 + 631)(1);
    PIX_DATA_OUT(I*8 + 5055) <= pix_wire_out(I*8 + 631)(0);
    
    PIX_DATA_OUT(I*8 + 10040) <= pix_wire_out(I*8 + 1255)(7);
    PIX_DATA_OUT(I*8 + 10041) <= pix_wire_out(I*8 + 1255)(6);
    PIX_DATA_OUT(I*8 + 10042) <= pix_wire_out(I*8 + 1255)(5);
    PIX_DATA_OUT(I*8 + 10043) <= pix_wire_out(I*8 + 1255)(4);
    PIX_DATA_OUT(I*8 + 10044) <= pix_wire_out(I*8 + 1255)(3);
    PIX_DATA_OUT(I*8 + 10045) <= pix_wire_out(I*8 + 1255)(2);
    PIX_DATA_OUT(I*8 + 10046) <= pix_wire_out(I*8 + 1255)(1);
    PIX_DATA_OUT(I*8 + 10047) <= pix_wire_out(I*8 + 1255)(0);
    
    PIX_DATA_OUT(I*8 + 15032) <= pix_wire_out(I*8 + 1879)(7);
    PIX_DATA_OUT(I*8 + 15033) <= pix_wire_out(I*8 + 1879)(6);
    PIX_DATA_OUT(I*8 + 15034) <= pix_wire_out(I*8 + 1879)(5);
    PIX_DATA_OUT(I*8 + 15035) <= pix_wire_out(I*8 + 1879)(4);
    PIX_DATA_OUT(I*8 + 15036) <= pix_wire_out(I*8 + 1879)(3);
    PIX_DATA_OUT(I*8 + 15037) <= pix_wire_out(I*8 + 1879)(2);
    PIX_DATA_OUT(I*8 + 15038) <= pix_wire_out(I*8 + 1879)(1);
    PIX_DATA_OUT(I*8 + 15039) <= pix_wire_out(I*8 + 1879)(0);
    
    
--    pix_wire_in(I*10 + 780 + J) <= PIX_DATA_IN(I*80 + J*8 + 6240) & PIX_DATA_IN(I*80 + J*8 + 6240+ 1) & PIX_DATA_IN(I*80 + J*8  + 6240+ 2) & PIX_DATA_IN(I*80 + J*8 + 6240+ 3) & PIX_DATA_IN(I*80 + J*8 + 6240+ 4) & PIX_DATA_IN(I*80 + J*8 + 6240 + 5) & PIX_DATA_IN(I*80 + J*8 + 6240+ 6) & PIX_DATA_IN(I*80 + J*8+ 6240 + 7);
--    pix_wire_in(I*10 + 1560 + J) <= PIX_DATA_IN(I*80 + J*8 + 12480) & PIX_DATA_IN(I*80 + J*8 + 12480+ 1) & PIX_DATA_IN(I*80 + J*8 + 12480+ 2) & PIX_DATA_IN(I*80 + J*8 + 12480+ 3) & PIX_DATA_IN(I*80 + J*8 + 12480+ 4) & PIX_DATA_IN(I*80 + J*8 + 12480+ 5) & PIX_DATA_IN(I*80 + J*8 + 12480+ 6) & PIX_DATA_IN(I*80 + J*8+ 12480 + 7);
--    pix_wire_in(I*10 + 2340 + J) <= PIX_DATA_IN(I*80 + J*8 + 18720) & PIX_DATA_IN(I*80 + J*8 + 18720+ 1) & PIX_DATA_IN(I*80 + J*8 + 18720+ 2) & PIX_DATA_IN(I*80 + J*8 + 18720+ 3) & PIX_DATA_IN(I*80 + J*8 + 18720+ 4) & PIX_DATA_IN(I*80 + J*8 + 18720+ 5) & PIX_DATA_IN(I*80 + J*8 + 18720+ 6) & PIX_DATA_IN(I*80 + J*8+ 18720 + 7);
--    pix_wire_in(I*10 + 3120 + J) <= PIX_DATA_IN(I*80 + J*8 + 24960) & PIX_DATA_IN(I*80 + J*8 + 24960+ 1) & PIX_DATA_IN(I*80 + J*8 + 24960+ 2) & PIX_DATA_IN(I*80 + J*8 + 24960+ 3) & PIX_DATA_IN(I*80 + J*8 + 24960+ 4) & PIX_DATA_IN(I*80 + J*8 + 24960+ 5) & PIX_DATA_IN(I*80 + J*8 + 24960+ 6) & PIX_DATA_IN(I*80 + J*8+ 24960 + 7);
--    pix_wire_in(I*10 + 3900 + J) <= PIX_DATA_IN(I*80 + J*8 + 31200) & PIX_DATA_IN(I*80 + J*8 + 31200+ 1) & PIX_DATA_IN(I*80 + J*8 + 31200+ 2) & PIX_DATA_IN(I*80 + J*8 + 31200+ 3) & PIX_DATA_IN(I*80 + J*8 + 31200+ 4) & PIX_DATA_IN(I*80 + J*8 + 31200+ 5) & PIX_DATA_IN(I*80 + J*8 + 31200+ 6) & PIX_DATA_IN(I*80 + J*8+ 31200 + 7);

--    GENWIREX:
--     for J in 0 to 9 generate
--        GENWIRE:
--          pix_wire_in(I*10 + J) <= PIX_DATA_IN(I*80 + J*8) & PIX_DATA_IN(I*80 + J*8 + 1) & PIX_DATA_IN(I*80 + J*8 + 2) & PIX_DATA_IN(I*80 + J*8 + 3) & PIX_DATA_IN(I*80 + J*8 + 4) & PIX_DATA_IN(I*80 + J*8 + 5) & PIX_DATA_IN(I*80 + J*8 + 6) & PIX_DATA_IN(I*80 + J*8 + 7);
--          pix_wire_in(I*10 + 780 + J) <= PIX_DATA_IN(I*80 + J*8 + 6240) & PIX_DATA_IN(I*80 + J*8 + 6240+ 1) & PIX_DATA_IN(I*80 + J*8  + 6240+ 2) & PIX_DATA_IN(I*80 + J*8 + 6240+ 3) & PIX_DATA_IN(I*80 + J*8 + 6240+ 4) & PIX_DATA_IN(I*80 + J*8 + 6240 + 5) & PIX_DATA_IN(I*80 + J*8 + 6240+ 6) & PIX_DATA_IN(I*80 + J*8+ 6240 + 7);
--          pix_wire_in(I*10 + 1560 + J) <= PIX_DATA_IN(I*80 + J*8 + 12480) & PIX_DATA_IN(I*80 + J*8 + 12480+ 1) & PIX_DATA_IN(I*80 + J*8 + 12480+ 2) & PIX_DATA_IN(I*80 + J*8 + 12480+ 3) & PIX_DATA_IN(I*80 + J*8 + 12480+ 4) & PIX_DATA_IN(I*80 + J*8 + 12480+ 5) & PIX_DATA_IN(I*80 + J*8 + 12480+ 6) & PIX_DATA_IN(I*80 + J*8+ 12480 + 7);
--          pix_wire_in(I*10 + 2340 + J) <= PIX_DATA_IN(I*80 + J*8 + 18720) & PIX_DATA_IN(I*80 + J*8 + 18720+ 1) & PIX_DATA_IN(I*80 + J*8 + 18720+ 2) & PIX_DATA_IN(I*80 + J*8 + 18720+ 3) & PIX_DATA_IN(I*80 + J*8 + 18720+ 4) & PIX_DATA_IN(I*80 + J*8 + 18720+ 5) & PIX_DATA_IN(I*80 + J*8 + 18720+ 6) & PIX_DATA_IN(I*80 + J*8+ 18720 + 7);
--          pix_wire_in(I*10 + 3120 + J) <= PIX_DATA_IN(I*80 + J*8 + 24960) & PIX_DATA_IN(I*80 + J*8 + 24960+ 1) & PIX_DATA_IN(I*80 + J*8 + 24960+ 2) & PIX_DATA_IN(I*80 + J*8 + 24960+ 3) & PIX_DATA_IN(I*80 + J*8 + 24960+ 4) & PIX_DATA_IN(I*80 + J*8 + 24960+ 5) & PIX_DATA_IN(I*80 + J*8 + 24960+ 6) & PIX_DATA_IN(I*80 + J*8+ 24960 + 7);
--          pix_wire_in(I*10 + 3900 + J) <= PIX_DATA_IN(I*80 + J*8 + 31200) & PIX_DATA_IN(I*80 + J*8 + 31200+ 1) & PIX_DATA_IN(I*80 + J*8 + 31200+ 2) & PIX_DATA_IN(I*80 + J*8 + 31200+ 3) & PIX_DATA_IN(I*80 + J*8 + 31200+ 4) & PIX_DATA_IN(I*80 + J*8 + 31200+ 5) & PIX_DATA_IN(I*80 + J*8 + 31200+ 6) & PIX_DATA_IN(I*80 + J*8+ 31200 + 7);
--    end generate GENWIREX;
    
--    GENWIREX_OUT:
--      for J in 0 to 3 generate
--      BLINEX: 
--       for K in 0 to 7 generate
--         BLINE:
--         PIX_DATA_OUT(I*32 + J*624 + K*8) <= pix_wire_out(I*8 + J*623 + K)(0);
--         PIX_DATA_OUT(I*32 + J*624 + 1 + K*8) <= pix_wire_out(I*8 + J*623 + K)(1);
--         PIX_DATA_OUT(I*32 + J*624 + 2 + K*8) <= pix_wire_out(I*8 + J*623 + K)(2);
--         PIX_DATA_OUT(I*32 + J*624 + 3 + K*8) <= pix_wire_out(I*8 + J*623 + K)(3);
--         PIX_DATA_OUT(I*32 + J*624 + 4 + K*8) <= pix_wire_out(I*8 + J*623 + K)(4);
--         PIX_DATA_OUT(I*32 + J*624 + 5 + K*8) <= pix_wire_out(I*8 + J*623 + K)(5);
--         PIX_DATA_OUT(I*32 + J*624 + 6 + K*8) <= pix_wire_out(I*8 + J*623 + K)(6);
--         PIX_DATA_OUT(I*32 + J*624 + 7 + K*8) <= pix_wire_out(I*8 + J*623 + K)(7);
--       end generate BLINEX;
--    end generate GENWIREX_OUT;
    
    -- column 1
      AVGX_G0  : avger_g port map(
        A => pix_wire_in(I*10),
        B => pix_wire_in(I*10 + 2),
        C => pix_wire_in(I*10 + 780 + 1),
        D => pix_wire_in(I*10 + 780 + 3),
        E => pix_wire_in(I*10 + 780 + 1),
        F => pix_wire_in(I*10 + 780 + 3),
        G => pix_wire_in(I*10 + 1560),
        H => pix_wire_in(I*10 + 1560 + 2),
        Y => pix_wire_out(I*8));

       AVGX_B0 : avger port map(
        A => pix_wire_in(I*10 + 1),
        B => pix_wire_in(I*10 + 3),
        C => pix_wire_in(I*10 + 1560 + 1),
        D => pix_wire_in(I*10 + 1560 + 3),
        Y => pix_wire_out(I*8 + 1)
        );

       AVGX_R0 : avger port map(
        A => pix_wire_in(I*10 + 780),
        B => pix_wire_in(I*10 + 780 + 2),
        C => pix_wire_in(I*10 + 2340),
        D => pix_wire_in(I*10 + 2340 + 2),
        Y => pix_wire_out(I*8 + 624)
       );
       
       AVGX_G1  : avger_g port map(
       A => pix_wire_in(I*10 + 780 + 1),
       B => pix_wire_in(I*10 + 780 + 3),
       C => pix_wire_in(I*10 + 1560),
       D => pix_wire_in(I*10 + 1560 + 2),
       E => pix_wire_in(I*10 + 1560),
       F => pix_wire_in(I*10 + 1560 + 2),
       G => pix_wire_in(I*10 + 2340 + 1),
       H => pix_wire_in(I*10 + 2340 + 3),
       Y => pix_wire_out(I*8 + 624 + 1));
       
       AVGX_G2  : avger_g port map(
         A => pix_wire_in(I*10 + 1560),
         B => pix_wire_in(I*10 + 1560 + 2),
         C => pix_wire_in(I*10 + 2340 + 1),
         D => pix_wire_in(I*10 + 2340 + 3),
         E => pix_wire_in(I*10 + 2340 + 1),
         F => pix_wire_in(I*10 + 2340 + 3),
         G => pix_wire_in(I*10 + 3120),
         H => pix_wire_in(I*10 + 3120 + 2),
         Y => pix_wire_out(I*8 + 1248));
         
        AVGX_B1 : avger port map(
         A => pix_wire_in(I*10 + 1560 + 1),
         B => pix_wire_in(I*10 + 1560 + 3),
         C => pix_wire_in(I*10 + 3120 + 1),
         D => pix_wire_in(I*10 + 3120 + 3),
         Y => pix_wire_out(I*8 + 1248 + 1)
         );
         
        AVGX_R1 : avger port map(
         A => pix_wire_in(I*10 + 2340),
         B => pix_wire_in(I*10 + 2340 + 2),
         C => pix_wire_in(I*10 + 3900),
         D => pix_wire_in(I*10 + 3900 + 2),
         Y => pix_wire_out(I*8 + 1872)
        );
        
        AVGX_G3  : avger_g port map(
        A => pix_wire_in(I*10 + 2340 + 1),
        B => pix_wire_in(I*10 + 2340 + 3),
        C => pix_wire_in(I*10 + 3120),
        D => pix_wire_in(I*10 + 3120 + 2),
        E => pix_wire_in(I*10 + 3120),
        F => pix_wire_in(I*10 + 3120 + 2),
        G => pix_wire_in(I*10 + 3900 + 1),
        H => pix_wire_in(I*10 + 3900 + 3),
        Y => pix_wire_out(I*8 + 1872 + 1));
        
    -- column 2
       AVGX_G4  : avger_g port map(
         A => pix_wire_in(I*10 + 2),
         B => pix_wire_in(I*10 + 4),
         C => pix_wire_in(I*10 + 780 + 3),
         D => pix_wire_in(I*10 + 780 + 5),
         E => pix_wire_in(I*10 + 780 + 3),
         F => pix_wire_in(I*10 + 780 + 5),
         G => pix_wire_in(I*10 + 1560 + 2),
         H => pix_wire_in(I*10 + 1560 + 4),
         Y => pix_wire_out(I*8 + 2));
 
        AVGX_B2 : avger port map(
         A => pix_wire_in(I*10 + 3),
         B => pix_wire_in(I*10 + 5),
         C => pix_wire_in(I*10 + 1560 + 3),
         D => pix_wire_in(I*10 + 1560 + 5),
         Y => pix_wire_out(I*8 + 3)
         );
 
        AVGX_R2 : avger port map(
         A => pix_wire_in(I*10 + 780 + 2),
         B => pix_wire_in(I*10 + 780 + 4),
         C => pix_wire_in(I*10 + 2340 + 2),
         D => pix_wire_in(I*10 + 2340 + 4),
         Y => pix_wire_out(I*8 + 624 + 2)
        );
        
        AVGX_G5  : avger_g port map(
        A => pix_wire_in(I*10 + 780 + 3),
        B => pix_wire_in(I*10 + 780 + 5),
        C => pix_wire_in(I*10 + 1560 + 2),
        D => pix_wire_in(I*10 + 1560 + 4),
        E => pix_wire_in(I*10 + 1560 + 2),
        F => pix_wire_in(I*10 + 1560 + 4),
        G => pix_wire_in(I*10 + 2340 + 3),
        H => pix_wire_in(I*10 + 2340 + 5),
        Y => pix_wire_out(I*8 + 624 + 3));
        
        AVGX_G6  : avger_g port map(
          A => pix_wire_in(I*10 + 1560 + 2),
          B => pix_wire_in(I*10 + 1560 + 4),
          C => pix_wire_in(I*10 + 2340 + 3),
          D => pix_wire_in(I*10 + 2340 + 5),
          E => pix_wire_in(I*10 + 2340 + 3),
          F => pix_wire_in(I*10 + 2340 + 5),
          G => pix_wire_in(I*10 + 3120 + 2),
          H => pix_wire_in(I*10 + 3120 + 4),
          Y => pix_wire_out(I*8 + 1248 + 2));
          
         AVGX_B3 : avger port map(
          A => pix_wire_in(I*10 + 1560 + 3),
          B => pix_wire_in(I*10 + 1560 + 5),
          C => pix_wire_in(I*10 + 3120 + 3),
          D => pix_wire_in(I*10 + 3120 + 5),
          Y => pix_wire_out(I*8 + 1248 + 3)
          );
          
         AVGX_R3 : avger port map(
          A => pix_wire_in(I*10 + 2340 + 2),
          B => pix_wire_in(I*10 + 2340 + 4),
          C => pix_wire_in(I*10 + 3900 + 2),
          D => pix_wire_in(I*10 + 3900 + 4),
          Y => pix_wire_out(I*8 + 1872 + 2)
         );
         
         AVGX_G7  : avger_g port map(
         A => pix_wire_in(I*10 + 2340 + 3),
         B => pix_wire_in(I*10 + 2340 + 5),
         C => pix_wire_in(I*10 + 3120 + 2),
         D => pix_wire_in(I*10 + 3120 + 4),
         E => pix_wire_in(I*10 + 3120 + 2),
         F => pix_wire_in(I*10 + 3120 + 4),
         G => pix_wire_in(I*10 + 3900 + 3),
         H => pix_wire_in(I*10 + 3900 + 5),
         Y => pix_wire_out(I*8 + 1872 + 3));
         
   
    -- column 3
        AVGX_G8  : avger_g port map(
          A => pix_wire_in(I*10 + 4),
          B => pix_wire_in(I*10 + 6),
          C => pix_wire_in(I*10 + 780 + 5),
          D => pix_wire_in(I*10 + 780 + 7),
          E => pix_wire_in(I*10 + 780 + 5),
          F => pix_wire_in(I*10 + 780 + 7),
          G => pix_wire_in(I*10 + 1560 + 4),
          H => pix_wire_in(I*10 + 1560 + 6),
          Y => pix_wire_out(I*8 + 4));
  
         AVGX_B4 : avger port map(
          A => pix_wire_in(I*10 + 5),
          B => pix_wire_in(I*10 + 7),
          C => pix_wire_in(I*10 + 1560 + 5),
          D => pix_wire_in(I*10 + 1560 + 7),
          Y => pix_wire_out(I*8 + 5)
          );
  
         AVGX_R4 : avger port map(
          A => pix_wire_in(I*10 + 780 + 4),
          B => pix_wire_in(I*10 + 780 + 6),
          C => pix_wire_in(I*10 + 2340 + 4),
          D => pix_wire_in(I*10 + 2340 + 6),
          Y => pix_wire_out(I*8 + 624 + 4)
         );
         
         AVGX_G9  : avger_g port map(
         A => pix_wire_in(I*10 + 780 + 5),
         B => pix_wire_in(I*10 + 780 + 7),
         C => pix_wire_in(I*10 + 1560 + 4),
         D => pix_wire_in(I*10 + 1560 + 6),
         E => pix_wire_in(I*10 + 1560 + 4),
         F => pix_wire_in(I*10 + 1560 + 6),
         G => pix_wire_in(I*10 + 2340 + 5),
         H => pix_wire_in(I*10 + 2340 + 7),
         Y => pix_wire_out(I*8 + 624 + 5));
         
         AVGX_G10  : avger_g port map(
           A => pix_wire_in(I*10 + 1560 + 4),
           B => pix_wire_in(I*10 + 1560 + 6),
           C => pix_wire_in(I*10 + 2340 + 5),
           D => pix_wire_in(I*10 + 2340 + 7),
           E => pix_wire_in(I*10 + 2340 + 5),
           F => pix_wire_in(I*10 + 2340 + 7),
           G => pix_wire_in(I*10 + 3120 + 4),
           H => pix_wire_in(I*10 + 3120 + 6),
           Y => pix_wire_out(I*8 + 1248 + 4));
           
          AVGX_B5 : avger port map(
           A => pix_wire_in(I*10 + 1560 + 5),
           B => pix_wire_in(I*10 + 1560 + 7),
           C => pix_wire_in(I*10 + 3120 + 5),
           D => pix_wire_in(I*10 + 3120 + 7),
           Y => pix_wire_out(I*8 + 1248 + 5)
           );
           
          AVGX_R5 : avger port map(
           A => pix_wire_in(I*10 + 2340 + 4),
           B => pix_wire_in(I*10 + 2340 + 6),
           C => pix_wire_in(I*10 + 3900 + 4),
           D => pix_wire_in(I*10 + 3900 + 6),
           Y => pix_wire_out(I*8 + 1872 + 4)
          );
          
          AVGX_G11  : avger_g port map(
          A => pix_wire_in(I*10 + 2340 + 5),
          B => pix_wire_in(I*10 + 2340 + 7),
          C => pix_wire_in(I*10 + 3120 + 4),
          D => pix_wire_in(I*10 + 3120 + 6),
          E => pix_wire_in(I*10 + 3120 + 4),
          F => pix_wire_in(I*10 + 3120 + 6),
          G => pix_wire_in(I*10 + 3900 + 5),
          H => pix_wire_in(I*10 + 3900 + 7),
          Y => pix_wire_out(I*8 + 1872 + 5));
          
          
    -- column 4
          AVGX_G12  : avger_g port map(
            A => pix_wire_in(I*10 + 6),
            B => pix_wire_in(I*10 + 8),
            C => pix_wire_in(I*10 + 780 + 7),
            D => pix_wire_in(I*10 + 780 + 9),
            E => pix_wire_in(I*10 + 780 + 7),
            F => pix_wire_in(I*10 + 780 + 9),
            G => pix_wire_in(I*10 + 1560 + 6),
            H => pix_wire_in(I*10 + 1560 + 8),
            Y => pix_wire_out(I*8 + 6));
    
           AVGX_B6 : avger port map(
            A => pix_wire_in(I*10 + 7),
            B => pix_wire_in(I*10 + 9),
            C => pix_wire_in(I*10 + 1560 + 7),
            D => pix_wire_in(I*10 + 1560 + 9),
            Y => pix_wire_out(I*8 + 7)
            );
    
           AVGX_R6 : avger port map(
            A => pix_wire_in(I*10 + 780 + 6),
            B => pix_wire_in(I*10 + 780 + 8),
            C => pix_wire_in(I*10 + 2340 + 6),
            D => pix_wire_in(I*10 + 2340 + 8),
            Y => pix_wire_out(I*8 + 624 + 6)
           );
           
           AVGX_G13  : avger_g port map(
           A => pix_wire_in(I*10 + 780 + 7),
           B => pix_wire_in(I*10 + 780 + 9),
           C => pix_wire_in(I*10 + 1560 + 6),
           D => pix_wire_in(I*10 + 1560 + 8),
           E => pix_wire_in(I*10 + 1560 + 6),
           F => pix_wire_in(I*10 + 1560 + 8),
           G => pix_wire_in(I*10 + 2340 + 7),
           H => pix_wire_in(I*10 + 2340 + 9),
           Y => pix_wire_out(I*8 + 624 + 7));
           
           AVGX_G14  : avger_g port map(
             A => pix_wire_in(I*10 + 1560 + 6),
             B => pix_wire_in(I*10 + 1560 + 8),
             C => pix_wire_in(I*10 + 2340 + 7),
             D => pix_wire_in(I*10 + 2340 + 9),
             E => pix_wire_in(I*10 + 2340 + 7),
             F => pix_wire_in(I*10 + 2340 + 9),
             G => pix_wire_in(I*10 + 3120 + 6),
             H => pix_wire_in(I*10 + 3120 + 8),
             Y => pix_wire_out(I*8 + 1248 + 6));
             
            AVGX_B7 : avger port map(
             A => pix_wire_in(I*10 + 1560 + 7),
             B => pix_wire_in(I*10 + 1560 + 9),
             C => pix_wire_in(I*10 + 3120 + 7),
             D => pix_wire_in(I*10 + 3120 + 9),
             Y => pix_wire_out(I*8 + 1248 + 7)
             );
             
            AVGX_R7 : avger port map(
             A => pix_wire_in(I*10 + 2340 + 6),
             B => pix_wire_in(I*10 + 2340 + 8),
             C => pix_wire_in(I*10 + 3900 + 6),
             D => pix_wire_in(I*10 + 3900 + 8),
             Y => pix_wire_out(I*8 + 1872 + 6)
            );
            
            AVGX_G15  : avger_g port map(
            A => pix_wire_in(I*10 + 2340 + 7),
            B => pix_wire_in(I*10 + 2340 + 9),
            C => pix_wire_in(I*10 + 3120 + 6),
            D => pix_wire_in(I*10 + 3120 + 8),
            E => pix_wire_in(I*10 + 3120 + 6),
            F => pix_wire_in(I*10 + 3120 + 8),
            G => pix_wire_in(I*10 + 3900 + 7),
            H => pix_wire_in(I*10 + 3900 + 9),
            Y => pix_wire_out(I*8 + 1872 + 7));
                                
  end generate GENAVGX;
  
end Behavioral;
