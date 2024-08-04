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
    
    --wires
    GENWIREX:
     for J in 0 to 5 generate
        GENWIRE:
          pix_wire_in(I*60 + J*8) <= PIX_DATA_IN(I*60 + J*780 + 7) & PIX_DATA_IN(I*60 + J*780 + 6) & PIX_DATA_IN(I*60 + J*780 + 5) & PIX_DATA_IN(I*60 + J*780 + 4) & PIX_DATA_IN(I*60 + J*780 + 3) & PIX_DATA_IN(I*60 + J*780 + 2) & PIX_DATA_IN(I*60 + J*780 + 1) & PIX_DATA_IN(I*60 + J*780);
          pix_wire_in(I*60 + J*8 + 1) <= PIX_DATA_IN(I*60 + J*780 + 1 + 15) & PIX_DATA_IN(I*60 + J*780 + 1 + 14) & PIX_DATA_IN(I*60 + J*780  + 1 + 13) & PIX_DATA_IN(I*60 + J*780  + 1 + 12) & PIX_DATA_IN(I*60 + J*780 + 11) & PIX_DATA_IN(I*60 + J*780  + 1 + 10) & PIX_DATA_IN(I*60 + J*780 + 9) & PIX_DATA_IN(I*60 + J*780 + 8);
          pix_wire_in(I*60 + J*8 + 2) <= PIX_DATA_IN(I*60 + J*780 + 23) & PIX_DATA_IN(I*60 + J*780 + 22) & PIX_DATA_IN(I*60 + J*780 + 21) & PIX_DATA_IN(I*60 + J*780 + 20) & PIX_DATA_IN(I*60 + J*780 + 19) & PIX_DATA_IN(I*60 + J*780 + 18) & PIX_DATA_IN(I*60 + J*780 + 17) & PIX_DATA_IN(I*60 + J*780 + 16);
          pix_wire_in(I*60 + J*8 + 3) <= PIX_DATA_IN(I*60 + J*780 + 31) & PIX_DATA_IN(I*60 + J*780 + 30) & PIX_DATA_IN(I*60 + J*780 + 29) & PIX_DATA_IN(I*60 + J*780 + 28) & PIX_DATA_IN(I*60 + J*780 + 27) & PIX_DATA_IN(I*60 + J*780 + 26) & PIX_DATA_IN(I*60 + J*780 + 25) & PIX_DATA_IN(I*60 + J*780 + 24);
          pix_wire_in(I*60 + J*8 + 4) <= PIX_DATA_IN(I*60 + J*780 + 39) & PIX_DATA_IN(I*60 + J*780 + 38) & PIX_DATA_IN(I*60 + J*780 + 37) & PIX_DATA_IN(I*60 + J*780 + 36) & PIX_DATA_IN(I*60 + J*780 + 35) & PIX_DATA_IN(I*60 + J*780 + 34) & PIX_DATA_IN(I*60 + J*780 + 33) & PIX_DATA_IN(I*60 + J*780 + 32);
          pix_wire_in(I*60 + J*8 + 5) <= PIX_DATA_IN(I*60 + J*780 + 47) & PIX_DATA_IN(I*60 + J*780 + 46) & PIX_DATA_IN(I*60 + J*780 + 45) & PIX_DATA_IN(I*60 + J*780 + 44) & PIX_DATA_IN(I*60 + J*780 + 43) & PIX_DATA_IN(I*60 + J*780 + 42) & PIX_DATA_IN(I*60 + J*780 + 41) & PIX_DATA_IN(I*60 + J*780 + 40);
          pix_wire_in(I*60 + J*8 + 6) <= PIX_DATA_IN(I*60 + J*780 + 55) & PIX_DATA_IN(I*60 + J*780 + 54) & PIX_DATA_IN(I*60 + J*780 + 53) & PIX_DATA_IN(I*60 + J*780 + 52) & PIX_DATA_IN(I*60 + J*780 + 51) & PIX_DATA_IN(I*60 + J*780 + 50) & PIX_DATA_IN(I*60 + J*780 + 49) & PIX_DATA_IN(I*60 + J*780 + 48);
          pix_wire_in(I*60 + J*8 + 7) <= PIX_DATA_IN(I*60 + J*780 + 63) & PIX_DATA_IN(I*60 + J*780 + 62) & PIX_DATA_IN(I*60 + J*780 + 61) & PIX_DATA_IN(I*60 + J*780 + 60) & PIX_DATA_IN(I*60 + J*780 + 59) & PIX_DATA_IN(I*60 + J*780 + 58) & PIX_DATA_IN(I*60 + J*780 + 57) & PIX_DATA_IN(I*60 + J*780 + 56);
          pix_wire_in(I*60 + J*8 + 8) <= PIX_DATA_IN(I*60 + J*780 + 71) & PIX_DATA_IN(I*60 + J*780 + 70) & PIX_DATA_IN(I*60 + J*780 + 69) & PIX_DATA_IN(I*60 + J*780 + 68) & PIX_DATA_IN(I*60 + J*780 + 67) & PIX_DATA_IN(I*60 + J*780 + 66) & PIX_DATA_IN(I*60 + J*780 + 65) & PIX_DATA_IN(I*60 + J*780 + 64);
          pix_wire_in(I*60 + J*8 + 9) <= PIX_DATA_IN(I*60 + J*780 + 79) & PIX_DATA_IN(I*60 + J*780 + 78) & PIX_DATA_IN(I*60 + J*780 + 77) & PIX_DATA_IN(I*60 + J*780 + 76) & PIX_DATA_IN(I*60 + J*780 + 75) & PIX_DATA_IN(I*60 + J*780 + 74) & PIX_DATA_IN(I*60 + J*780 + 73) & PIX_DATA_IN(I*60 + J*780 + 72);
    
          
    end generate GENWIREX;
    GENWIREX_OUT:
      for J in 0 to 3 generate
      BLINEX: 
       for K in 0 to 7 generate
         BLINE:
         PIX_DATA_OUT(I*32 + J*624 + K*8) <= pix_wire_out(I*32 + J*623 + K*8)(0);
         PIX_DATA_OUT(I*32 + J*624 + 1 + K*8) <= pix_wire_out(I*32 + J*623 + K*8)(1);
         PIX_DATA_OUT(I*32 + J*624 + 2 + K*8) <= pix_wire_out(I*32 + J*623 + K*8)(2);
         PIX_DATA_OUT(I*32 + J*624 + 3 + K*8) <= pix_wire_out(I*32 + J*623 + K*8)(3);
         PIX_DATA_OUT(I*32 + J*624 + 4 + K*8) <= pix_wire_out(I*32 + J*623 + K*8)(4);
         PIX_DATA_OUT(I*32 + J*624 + 5 + K*8) <= pix_wire_out(I*32 + J*623 + K*8)(5);
         PIX_DATA_OUT(I*32 + J*624 + 6 + K*8) <= pix_wire_out(I*32 + J*623 + K*8)(6);
         PIX_DATA_OUT(I*32 + J*624 + 7 + K*8) <= pix_wire_out(I*32 + J*623 + K*8)(7);
       end generate BLINEX;
    end generate GENWIREX_OUT;
    
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
