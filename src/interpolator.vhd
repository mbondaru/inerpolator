----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/02/2024 03:57:21 AM
-- Design Name: 
-- Module Name: interpolator - Behavioral
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

entity interpolator is
  Port ( 
    EN : in std_logic;
    CLK : in std_logic;
    CLK_DISPLAY : in std_logic;
    D_IN : in std_logic_vector(7 downto 0);
    D_OUT : out std_logic_vector(23 downto 0)
    );
end interpolator;

architecture Behavioral of interpolator is

--component declaration
component counter_10b is
 port(
     RESET,CLK,LD,UP : in std_logic;
     --DIN : in std_logic_vector (9 downto 0);
     COUNT : out std_logic_vector (9 downto 0)
   );
end component;
component counter_3b is
port (
     RESET,CLK,LD,UP : in std_logic;
     DIN : in std_logic_vector (2 downto 0);
     COUNT : out std_logic_vector (2 downto 0)
);
end component;
component reg_file is 
  port ( 
   D_IN : in std_logic_vector(7 downto 0);
   COL_NUM : in std_logic_vector(9 downto 0);
   ROW_NUM : in std_logic_vector(9 downto 0);
   SHIFT : in std_logic;
   --LD : in std_logic;
   CLK : in std_logic;
   PIX_DATA : out std_logic_vector(37439 downto 0)
  );
end component;
component converter is
  port ( PIX_DATA_IN : in std_logic_vector(37439 downto 0);
    PIX_DATA_OUT : out std_logic_vector(19967 downto 0)
  );
end component;
component interp_1_sqrt5_3 is
    port ( CLOSEST : in std_logic_vector (7 downto 0);
       CLOSER : in std_logic_vector (7 downto 0);
       FARTHEST : in std_logic_vector(7 downto 0);
       RES : out std_logic_vector (7 downto 0));
end component;

--component signals
signal pix_data : std_logic_vector(37439 downto 0);
type reg_file_w_t is array (0 to 4679) of std_logic_vector(7 downto 0);
signal reg_file_w : reg_file_w_t;

signal cpix_data : std_logic_vector(19967 downto 0);
type creg_file_w_t is array (0 to 2495) of std_logic_vector(7 downto 0);
signal creg_file_w : creg_file_w_t;

type interp_w_t is array (0 to 2495) of std_logic_vector(7 downto 0);
signal interp_w_brbr : interp_w_t;
signal interp_w_gbrg : interp_w_t;

--pix_counter signals
signal start : std_logic := '0';
signal up : std_logic := '1';
signal ld : std_logic := '0';
signal wr_en : std_logic := '0';
signal reset_pix_cnt : std_logic := '0';
signal reset_ln_cnt : std_logic := '0';
signal reset_reg_file_idx : std_logic := '0';
--signal din_pix_cnt : std_logic_vector(9 downto 0) := "0000000000";
--signal din_ln_cnt : std_logic_vector(9 downto 0) := "0000000000";
signal count_pix : std_logic_vector(9 downto 0);
signal count_ln : std_logic_vector(9 downto 0);
signal count_reg_file : std_logic_vector(2 downto 0);
signal reg_file_idx : std_logic_vector(2 downto 0);
signal shift : std_logic := '0';

begin

--  SET_WIRES:  
--  for I in 0 to 4679 generate
--    reg_file_w(I) <= pix_data(I*8 + 7) & pix_data(I*8 + 6) & pix_data(I*8 + 5) & pix_data(I*8 + 4) & pix_data(I*8 + 3) & pix_data(I*8 + 2) & pix_data(I*8 + 1) & pix_data(I*8);    
--  end generate SET_WIRES;


--
--  CCD image sensor sequence
--
  process
  begin
    if(EN = '1' and ld = '0') then
      for I in 0 to 17117 loop --vsync 18*944 clocks + 124 hsync + 2 discarded pixels
          wait until rising_edge(CLK);
      end loop;
      ld <= '1';
    end if;
  end process;
  
  process
  begin
    if (reset_pix_cnt = '1') then
      if(unsigned(count_ln) < 581) then
        shift <= '1';
        wait until rising_edge(CLK);
        shift <= '0';
        for I in 0 to 161 loop  --hsync: optical black & sync + 2 discarded pixels = 102+19=121 is sync, + 3 o.b. =124 + 38 o.b. = 
          wait until rising_edge(CLK);
        end loop;
        reset_pix_cnt <= '0';
      else
        for I in 0 to 37 loop
          wait until rising_edge(CLK); --optical black
         end loop;
      end if;
    elsif (reset_ln_cnt = '1') then -- vsync: 25*944 pixels
      for I in 0 to 23599 loop
        wait until rising_edge(CLK);
      end loop;
      ld <= '0';
      reset_pix_cnt <= '0';
      reset_ln_cnt <= '0'; -- reset pretty much like LD prevents timer from counting
    end if;
   end process;
      
  process(CLK)
  begin
    if(unsigned(count_pix) = 779) then
      reset_pix_cnt <= '1';
    elsif(unsigned(count_reg_file) = 5) then
      shift <= '1';
    elsif (unsigned(count_ln) = 581) then
      reset_ln_cnt <= '1';
    end if;
  end process;
      
      
  --
  --  Display sequence
  --
  process
  begin
    if(EN = '1' and wr_en = '0') then  --vsync: 38x864 display clocks
      for I in 0 to 32831 loop
        wait until rising_edge(CLK_DISPLAY);
      end loop;
      wr_en <= '1';
    end if;
  end process;
  
  process --(reset_pix_cnt, CLK_DISPLAY)
  begin
    if(unsigned(count_ln) > 4) then
      if (unsigned(count_ln) < 581) then
        for I in 0 to 121 loop
          wait until rising_edge(CLK_DISPLAY); --sync
        end loop;
        for I in 0 to 623 loop
          wait until falling_edge(CLK_DISPLAY);
          if((I rem 2) = 0) then
            D_OUT <= creg_file_w(1872 + I) & interp_w_gbrg(1872 + I) & interp_w_brbr(1872 + I);
          else
            D_OUT <= interp_w_brbr(1872 + I) & creg_file_w(1872 + I) & interp_w_gbrg(1872 + I);
          end if;
        end loop;
        for I in 0 to 101 loop
          wait until rising_edge(CLK_DISPLAY); --sync
        end loop;
        for I in 0 to 121 loop
          wait until rising_edge(CLK_DISPLAY); --sync
        end loop;
        for I in 0 to 623 loop
          wait until falling_edge(CLK_DISPLAY);
          if((I rem 2) = 0) then
            D_OUT <=  interp_w_gbrg(I + 1872) & creg_file_w(I + 1872) & interp_w_brbr(I + 1872);
          else
            D_OUT <= interp_w_brbr(I + 1872)  & interp_w_gbrg(I + 1872) & creg_file_w(I + 1872);
          end if;
        end loop;
        for I in 0 to 101 loop
          wait until rising_edge(CLK_DISPLAY); --sync
        end loop;
      else
      
       for I in 0 to 121 loop
         wait until rising_edge(CLK_DISPLAY); --sync
       end loop;
       for I in 0 to 623 loop
         wait until falling_edge(CLK_DISPLAY);
         if((I rem 2) = 0) then
           D_OUT <= creg_file_w(1872 + I) & interp_w_gbrg(1872 + I) & interp_w_brbr(1872 + I);
         else
           D_OUT <= interp_w_brbr(1872 + I) & creg_file_w(1872 + I) & interp_w_gbrg(1872 + I);
         end if;
       end loop;
       for I in 0 to 101 loop
         wait until rising_edge(CLK_DISPLAY); --sync
       end loop;
       
       for I in 0 to 121 loop
         wait until rising_edge(CLK_DISPLAY); --sync
       end loop;
       for I in 0 to 623 loop
         wait until falling_edge(CLK_DISPLAY);
         if((I rem 2) = 0) then
           D_OUT <= interp_w_gbrg(I + 1248) & creg_file_w(I + 1248) & interp_w_brbr(I + 1248);
         else
           D_OUT <= interp_w_brbr(I + 1248)  & interp_w_gbrg(I + 1248) & creg_file_w(I + 1248);
         end if;
       end loop;
       for I in 0 to 101 loop
         wait until rising_edge(CLK_DISPLAY); --sync
       end loop;
          
       for I in 0 to 121 loop
         wait until rising_edge(CLK_DISPLAY); --sync
       end loop;
       for I in 0 to 623 loop
         wait until falling_edge(CLK_DISPLAY);
         if((I rem 2) = 0) then
           D_OUT <= creg_file_w(624 + I) & interp_w_gbrg(624 + I) & interp_w_brbr(624 + I);
         else
           D_OUT <= interp_w_brbr(624 + I) & creg_file_w(624 + I) & interp_w_gbrg(624 + I);
         end if;
       end loop;
       for I in 0 to 101 loop
         wait until rising_edge(CLK_DISPLAY); --sync
       end loop;
       
       for I in 0 to 121 loop
         wait until rising_edge(CLK_DISPLAY); --sync
       end loop;
       for I in 0 to 623 loop
         wait until falling_edge(CLK_DISPLAY);
         if((I rem 2) = 0) then
           D_OUT <= interp_w_gbrg(I) & creg_file_w(I) & interp_w_brbr(I);
         else
           D_OUT <= interp_w_brbr(I)  & interp_w_gbrg(I) & creg_file_w(I);
         end if;
       end loop;
       for I in 0 to 101 loop
         wait until rising_edge(CLK_DISPLAY); --sync
       end loop;
       
       for I in 0 to 161567 loop
         wait until rising_edge(CLK_DISPLAY); --vsync
       end loop;
       wr_en <= '0';
      end if; 
    end if;
  end process;
  
  PIX_CNT : counter_10b port map(RESET => reset_pix_cnt, CLK => CLK, LD => ld, UP => '1', 
  --DIN => "0000000000", 
  COUNT => count_pix);
  LN_CNT : counter_10b port map(RESET => reset_ln_cnt, CLK => reset_pix_cnt, LD => ld, UP => '1', 
  --DIN => "0000000000", 
  COUNT => count_ln);
  REG_FILE_CNT : counter_3b port map(RESET => reset_reg_file_idx, CLK => reset_pix_cnt, LD => ld, UP => '1',
    DIN => "101",
    COUNT => count_reg_file);
    
  RFX: reg_file port map(D_IN => D_IN, COL_NUM => count_pix, ROW_NUM => count_reg_file, SHIFT => shift, CLK => CLK, PIX_DATA => pix_data);
  
  CONVERTERX: converter port map(PIX_DATA_IN => pix_data, PIX_DATA_OUT => cpix_data);
  
  GEN_CONV_WIRES:
  for I in 0 to 2495 generate 
     creg_file_w(I) <= cpix_data(I*8) & cpix_data(I*8 + 1) & cpix_data(I*8 + 2) & cpix_data(I*8 + 3) & cpix_data(I*8 + 4) & cpix_data(I*8 + 5) & cpix_data(I*8 + 6) & cpix_data(I*8 + 7);
  end generate GEN_CONV_WIRES;
  
  GEN_INTRX:
  for I in 0 to 77 generate
  -- row 1
    BX0: interp_1_sqrt5_3 port map(CLOSEST => creg_file_w(I*8 + 1), CLOSER => creg_file_w(I*8 + 1248 + 1), FARTHEST => creg_file_w(I*8 + 3), RES => interp_w_brbr(I*8));
    RX0: interp_1_sqrt5_3 port map(CLOSEST => creg_file_w(I*8 + 624), CLOSER => creg_file_w(I*8 + 624 + 2), FARTHEST => creg_file_w(I*8 + 1872), RES => interp_w_gbrg(I*8));
    
    RX1: interp_1_sqrt5_3 port map(CLOSEST => creg_file_w(I*8 + 624), CLOSER => creg_file_w(I*8 + 1872 + 2), FARTHEST => creg_file_w(I*8 + 1872 + 4), RES => interp_w_brbr(I*8 + 1));
    GX1: interp_1_sqrt5_3 port map(CLOSEST => creg_file_w(I*8 + 2), CLOSER => creg_file_w(I*8 + 624 + 3), FARTHEST => creg_file_w(I*8 + 4), RES => interp_w_gbrg(I*8 + 1));
    
    BX2: interp_1_sqrt5_3 port map(CLOSEST => creg_file_w(I*8 + 3), CLOSER => creg_file_w(I*8 + 1248 + 3), FARTHEST => creg_file_w(I*8 + 5), RES => interp_w_brbr(I*8 + 2));
    RX2: interp_1_sqrt5_3 port map(CLOSEST => creg_file_w(I*8 + 624 + 2), CLOSER => creg_file_w(I*8 + 624), FARTHEST => creg_file_w(I*8 + 1872 + 2), RES => interp_w_gbrg(I*8 + 2));
    
    RX3: interp_1_sqrt5_3 port map(CLOSEST => creg_file_w(I*8 + 624 + 4), CLOSER => creg_file_w(I*8 + 624 + 7), FARTHEST => creg_file_w(I*8 + 1872 + 6), RES => interp_w_brbr(I*8 + 3));
    GX3: interp_1_sqrt5_3 port map(CLOSEST => creg_file_w(I*8 + 4), CLOSER => creg_file_w(I*8 + 624 + 5), FARTHEST => creg_file_w(I*8 + 6), RES => interp_w_gbrg(I*8 + 3));
    
    BX4: interp_1_sqrt5_3 port map(CLOSEST => creg_file_w(I*8 + 5), CLOSER => creg_file_w(I*8 + 1248 + 5), FARTHEST => creg_file_w(I*8 + 7), RES => interp_w_brbr(I*8 + 4));
    RX4: interp_1_sqrt5_3 port map(CLOSEST => creg_file_w(I*8 + 624 + 4), CLOSER => creg_file_w(I*8 + 624 + 2), FARTHEST => creg_file_w(I*8 + 1872 + 4), RES => interp_w_gbrg(I*8 + 4));
    
    RX5: interp_1_sqrt5_3 port map(CLOSEST => creg_file_w(I*8 + 624 + 6), CLOSER => creg_file_w(I*8 + 1872 + 6), FARTHEST => creg_file_w(I*8 + 1872 + 2), RES => interp_w_brbr(I*8 + 5));
    GX5: interp_1_sqrt5_3 port map(CLOSEST => creg_file_w(I*8 + 6), CLOSER => creg_file_w(I*8 + 624 + 6), FARTHEST => creg_file_w(I*8 + 2), RES => interp_w_gbrg(I*8 + 5));
    
    BX6: interp_1_sqrt5_3 port map(CLOSEST => creg_file_w(I*8 + 7), CLOSER => creg_file_w(I*8 + 1248 + 7), FARTHEST => creg_file_w(I*8 + 3), RES => interp_w_brbr(I*8 + 6));
    RX6: interp_1_sqrt5_3 port map(CLOSEST => creg_file_w(I*8 + 624 + 6), CLOSER => creg_file_w(I*8 + 624 + 4), FARTHEST => creg_file_w(I*8 + 1872 + 6), RES => interp_w_gbrg(I*8 + 6));
    
    RX7: interp_1_sqrt5_3 port map(CLOSEST => creg_file_w(I*8 + 624 + 6), CLOSER => creg_file_w(I*8 + 1872 + 6), FARTHEST => creg_file_w(I*8 + 1872 + 4), RES => interp_w_brbr(I*8 + 7));
    GX7: interp_1_sqrt5_3 port map(CLOSEST => creg_file_w(I*8 + 624 + 7), CLOSER => creg_file_w(I*8 + 1248 + 6), FARTHEST => creg_file_w(I*8 + 1872 + 7), RES => interp_w_gbrg(I*8 + 7));
    
    --row 2
    BX8: interp_1_sqrt5_3 port map(CLOSEST => creg_file_w(I*8 + 1), CLOSER => creg_file_w(I*8 + 3), FARTHEST => creg_file_w(I*8 + 5), RES => interp_w_brbr(I*8+ 624));
    GX8: interp_1_sqrt5_3 port map(CLOSEST => creg_file_w(I*8 + 624 + 1), CLOSER => creg_file_w(I*8 + 1248 + 2), FARTHEST => creg_file_w(I*8 + 624 + 3), RES => interp_w_gbrg(I*8+ 624));
    
    RX9: interp_1_sqrt5_3 port map(CLOSEST => creg_file_w(I*8 + 624), CLOSER => creg_file_w(I*8 + 1872 + 2), FARTHEST => creg_file_w(I*8 + 624 + 4), RES => interp_w_brbr(I*8+ 624 + 1));
    BX9: interp_1_sqrt5_3 port map(CLOSEST => creg_file_w(I*8 + 1248 + 1), CLOSER => creg_file_w(I*8 + 1248 + 3), FARTHEST => creg_file_w(I*8 + 1248 + 5), RES => interp_w_gbrg(I*8+ 624 + 1));
    
    BX10: interp_1_sqrt5_3 port map(CLOSEST => creg_file_w(I*8 + 1248 +1), CLOSER => creg_file_w(I*8 + 1248 + 5), FARTHEST => creg_file_w(I*8 + 1248 + 7), RES => interp_w_brbr(I*8+ 624 + 2));
    GX10: interp_1_sqrt5_3 port map(CLOSEST => creg_file_w(I*8 + 624 + 3), CLOSER => creg_file_w(I*8 + 1248 + 4), FARTHEST => creg_file_w(I*8 + 624 + 5), RES => interp_w_gbrg(I*8+ 624 + 2));
    
    RX11: interp_1_sqrt5_3 port map(CLOSEST => creg_file_w(I*8 + 624 + 4), CLOSER => creg_file_w(I*8 + 1872 + 4), FARTHEST => creg_file_w(I*8 + 624 + 6), RES => interp_w_brbr(I*8 + 624+ 3));
    BX11: interp_1_sqrt5_3 port map(CLOSEST => creg_file_w(I*8 + 3), CLOSER => creg_file_w(I*8 + 5), FARTHEST => creg_file_w(I*8 + 7), RES => interp_w_gbrg(I*8 + 624+ 3));
    
    BX12: interp_1_sqrt5_3 port map(CLOSEST => creg_file_w(I*8 + 5), CLOSER => creg_file_w(I*8 + 1248 + 1), FARTHEST => creg_file_w(I*8 + 1), RES => interp_w_brbr(I*8 + 624+ 4));
    GX12: interp_1_sqrt5_3 port map(CLOSEST => creg_file_w(I*8 + 624 + 5), CLOSER => creg_file_w(I*8 + 1248 + 6), FARTHEST => creg_file_w(I*8 + 624 + 7), RES => interp_w_gbrg(I*8+ 624 + 4));
    
    RX13: interp_1_sqrt5_3 port map(CLOSEST => creg_file_w(I*8 + 624 + 6), CLOSER => creg_file_w(I*8 + 1872 + 6), FARTHEST => creg_file_w(I*8 + 624 + 2), RES => interp_w_brbr(I*8+ 624 + 5));
    BX13: interp_1_sqrt5_3 port map(CLOSEST => creg_file_w(I*8 + 1248 + 5), CLOSER => creg_file_w(I*8 + 1248 + 7), FARTHEST => creg_file_w(I*8 + 1248 + 1), RES => interp_w_gbrg(I*8 + 624+ 5));
    
    BX14: interp_1_sqrt5_3 port map(CLOSEST => creg_file_w(I*8 + 7), CLOSER => creg_file_w(I*8 + 1248 + 3), FARTHEST => creg_file_w(I*8 + 1248 + 1), RES => interp_w_brbr(I*8 + 624+ 6));
    GX14: interp_1_sqrt5_3 port map(CLOSEST => creg_file_w(I*8 + 1248 + 6), CLOSER => creg_file_w(I*8 + 4), FARTHEST => creg_file_w(I*8 + 624 + 3), RES => interp_w_gbrg(I*8+ 624 + 6));
    
    RX15: interp_1_sqrt5_3 port map(CLOSEST => creg_file_w(I*8 + 624 + 6), CLOSER => creg_file_w(I*8 + 1872 + 6), FARTHEST => creg_file_w(I*8 + 624 + 4), RES => interp_w_brbr(I*8 + 624+ 7));
    BX15: interp_1_sqrt5_3 port map(CLOSEST => creg_file_w(I*8 + 1248 + 7), CLOSER => creg_file_w(I*8 + 1248 + 5), FARTHEST => creg_file_w(I*8 + 1248 + 3), RES => interp_w_gbrg(I*8 + 624+ 7));
    
    --row 3
    BX16: interp_1_sqrt5_3 port map(CLOSEST => creg_file_w(I*8 + 1248 + 1), CLOSER => creg_file_w(I*8 + 1), FARTHEST => creg_file_w(I*8 + 1248 + 3), RES => interp_w_brbr(I*8 + 1248));
    RX16: interp_1_sqrt5_3 port map(CLOSEST => creg_file_w(I*8 + 624), CLOSER => creg_file_w(I*8 + 624 + 2), FARTHEST => creg_file_w(I*8 + 624 + 4), RES => interp_w_gbrg(I*8 + 1248));
    
    RX17: interp_1_sqrt5_3 port map(CLOSEST => creg_file_w(I*8 + 624 + 2), CLOSER => creg_file_w(I*8 + 1872 + 4), FARTHEST => creg_file_w(I*8 + 1872 + 6), RES => interp_w_brbr(I*8 + 1248+ 1));
    GX17: interp_1_sqrt5_3 port map(CLOSEST => creg_file_w(I*8 + 1248 + 2), CLOSER => creg_file_w(I*8 + 1872 + 3), FARTHEST => creg_file_w(I*8 + 1248 + 5), RES => interp_w_gbrg(I*8+ 1248 + 1));
    
    BX18: interp_1_sqrt5_3 port map(CLOSEST => creg_file_w(I*8 + 1248 + 3), CLOSER => creg_file_w(I*8 + 3), FARTHEST => creg_file_w(I*8 + 1248 + 5), RES => interp_w_brbr(I*8+ 1248 + 2));
    RX18: interp_1_sqrt5_3 port map(CLOSEST => creg_file_w(I*8 + 624 + 2), CLOSER => creg_file_w(I*8 + 624 + 4), FARTHEST => creg_file_w(I*8 + 624 + 6), RES => interp_w_gbrg(I*8 + 1248+ 2));
    
    RX19: interp_1_sqrt5_3 port map(CLOSEST => creg_file_w(I*8 + 1872 + 4), CLOSER => creg_file_w(I*8 + 1872 + 6), FARTHEST => creg_file_w(I*8 + 624), RES => interp_w_brbr(I*8+ 1248 + 3));
    GX19: interp_1_sqrt5_3 port map(CLOSEST => creg_file_w(I*8 + 1248 + 4), CLOSER => creg_file_w(I*8 + 1872 + 5), FARTHEST => creg_file_w(I*8 + 1248 + 6), RES => interp_w_gbrg(I*8+ 1248 + 3));
    
    BX20: interp_1_sqrt5_3 port map(CLOSEST => creg_file_w(I*8 + 1248 + 5), CLOSER => creg_file_w(I*8 + 5), FARTHEST => creg_file_w(I*8 + 1248 + 7), RES => interp_w_brbr(I*8+ 1248 + 4));
    RX20: interp_1_sqrt5_3 port map(CLOSEST => creg_file_w(I*8 + 624 + 4), CLOSER => creg_file_w(I*8 + 624 + 6), FARTHEST => creg_file_w(I*8 + 624), RES => interp_w_gbrg(I*8 + 1248+ 4));
    
    RX21: interp_1_sqrt5_3 port map(CLOSEST => creg_file_w(I*8 + 624 + 6), CLOSER => creg_file_w(I*8 + 624 + 2), FARTHEST => creg_file_w(I*8 + 1872), RES => interp_w_brbr(I*8 + 1248+ 5));
    GX21: interp_1_sqrt5_3 port map(CLOSEST => creg_file_w(I*8 + 1248 + 4), CLOSER => creg_file_w(I*8 + 4), FARTHEST => creg_file_w(I*8 + 1248 +2), RES => interp_w_gbrg(I*8 + 1248+ 5));
    
    BX22: interp_1_sqrt5_3 port map(CLOSEST => creg_file_w(I*8 + 1248 + 7), CLOSER => creg_file_w(I*8 + 5), FARTHEST => creg_file_w(I*8 + 3), RES => interp_w_brbr(I*8 + 1248+ 6));
    RX22: interp_1_sqrt5_3 port map(CLOSEST => creg_file_w(I*8 + 624 + 6), CLOSER => creg_file_w(I*8 + 624 + 4), FARTHEST => creg_file_w(I*8 + 1872 + 2), RES => interp_w_gbrg(I*8 + 1248+ 6));
    
    RX23: interp_1_sqrt5_3 port map(CLOSEST => creg_file_w(I*8 + 624 + 6), CLOSER => creg_file_w(I*8 + 1872 + 4), FARTHEST => creg_file_w(I*8 + 1872 + 2), RES => interp_w_brbr(I*8 + 1248 + 7));
    GX23: interp_1_sqrt5_3 port map(CLOSEST => creg_file_w(I*8 + 1872 + 7), CLOSER => creg_file_w(I*8 + 1872 + 5), FARTHEST => creg_file_w(I*8 + 1248 + 4), RES => interp_w_gbrg(I*8+ 1248 + 7));
    
    --row 4
    BX24: interp_1_sqrt5_3 port map(CLOSEST => creg_file_w(I*8 + 1248 + 1), CLOSER => creg_file_w(I*8 + 1248 + 3), FARTHEST => creg_file_w(I*8 + 1248 + 5), RES => interp_w_brbr(I*8 + 1872));
    GX24: interp_1_sqrt5_3 port map(CLOSEST => creg_file_w(I*8 + 1872 + 1), CLOSER => creg_file_w(I*8 + 1248 + 2), FARTHEST => creg_file_w(I*8 + 1872 + 3), RES => interp_w_gbrg(I*8 + 1872));
    
    RX25: interp_1_sqrt5_3 port map(CLOSEST => creg_file_w(I*8 + 1872), CLOSER => creg_file_w(I*8 + 624), FARTHEST => creg_file_w(I*8 + 1872 + 4), RES => interp_w_brbr(I*8+ 1872 + 1));
    BX25: interp_1_sqrt5_3 port map(CLOSEST => creg_file_w(I*8 + 1248 + 1), CLOSER => creg_file_w(I*8 + 1248 + 3), FARTHEST => creg_file_w(I*8 + 1), RES => interp_w_gbrg(I*8 + 1872+ 1));
    
    BX26: interp_1_sqrt5_3 port map(CLOSEST => creg_file_w(I*8 + 1248 + 1), CLOSER => creg_file_w(I*8 + 1), FARTHEST => creg_file_w(I*8 + 1248 + 7), RES => interp_w_brbr(I*8+ 1872 + 2));
    GX26: interp_1_sqrt5_3 port map(CLOSEST => creg_file_w(I*8 + 1248 + 2), CLOSER => creg_file_w(I*8 + 624 + 3), FARTHEST => creg_file_w(I*8 + 2), RES => interp_w_gbrg(I*8 + 1872+ 2));
      
    RX27: interp_1_sqrt5_3 port map(CLOSEST => creg_file_w(I*8 + 1872 + 4), CLOSER => creg_file_w(I*8 + 624 + 4), FARTHEST => creg_file_w(I*8 + 1872 + 6), RES => interp_w_brbr(I*8 + 1872+ 3));
    BX27: interp_1_sqrt5_3 port map(CLOSEST => creg_file_w(I*8 + 1248 + 3), CLOSER => creg_file_w(I*8 + 1248 + 1), FARTHEST => creg_file_w(I*8 + 3), RES => interp_w_gbrg(I*8 + 1872+ 3));
    
    BX28: interp_1_sqrt5_3 port map(CLOSEST => creg_file_w(I*8 + 1248 + 3), CLOSER => creg_file_w(I*8 + 1248 + 1), FARTHEST => creg_file_w(I*8 + 1), RES => interp_w_brbr(I*8 + 1872+ 4));
    GX28: interp_1_sqrt5_3 port map(CLOSEST => creg_file_w(I*8 + 1872 + 5), CLOSER => creg_file_w(I*8 + 1248 + 6), FARTHEST => creg_file_w(I*8 + 1872 + 7), RES => interp_w_gbrg(I*8 + 1872+ 4));
    
    RX29: interp_1_sqrt5_3 port map(CLOSEST => creg_file_w(I*8 + 1872 + 6), CLOSER => creg_file_w(I*8 + 624  + 6), FARTHEST => creg_file_w(I*8 + 1872 + 2), RES => interp_w_brbr(I*8 + 1872+ 5));
    BX29: interp_1_sqrt5_3 port map(CLOSEST => creg_file_w(I*8 + 1248 + 5), CLOSER => creg_file_w(I*8 + 1248 + 3), FARTHEST => creg_file_w(I*8 + 3), RES => interp_w_gbrg(I*8 + 1872+ 5));
    
    BX30: interp_1_sqrt5_3 port map(CLOSEST => creg_file_w(I*8 + 1248 + 5), CLOSER => creg_file_w(I*8 + 1248 + 3), FARTHEST => creg_file_w(I*8 + 1248 + 1), RES => interp_w_brbr(I*8 + 1872+ 6));
    GX30: interp_1_sqrt5_3 port map(CLOSEST => creg_file_w(I*8 + 1872 + 5), CLOSER => creg_file_w(I*8 + 1248 + 4), FARTHEST => creg_file_w(I*8 + 1872 + 3), RES => interp_w_gbrg(I*8 + 1872+ 6));
    
    RX31: interp_1_sqrt5_3 port map(CLOSEST => creg_file_w(I*8 + 1872 + 6), CLOSER => creg_file_w(I*8 + 624 + 6), FARTHEST => creg_file_w(I*8 + 1872 + 4), RES => interp_w_brbr(I*8 + 1872+ 7));
    BX31: interp_1_sqrt5_3 port map(CLOSEST => creg_file_w(I*8 + 1248 + 7), CLOSER => creg_file_w(I*8 + 1248 + 5), FARTHEST => creg_file_w(I*8 + 7), RES => interp_w_gbrg(I*8 + 1872+ 7));
    
  end generate GEN_INTRX;
  
  
end Behavioral;
