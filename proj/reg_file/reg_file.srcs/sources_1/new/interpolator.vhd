----------------------------------------------------------------------------------
-- Company: IP Bondaruk
-- Engineer: Maksim Bondaruk
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
    DISP_MCLK : out std_logic;
    ADC_CLK : out std_logic;
    HPHI1 : out std_logic;
    HPHI2 : out std_logic;
    CLAMP : out std_logic;
    SAMPLE : out std_logic;
    PHIRG : out std_logic;
    D_IN : in std_logic_vector(7 downto 0);
    D_OUT : out std_logic_vector(23 downto 0)
    );
end interpolator;

architecture Behavioral of interpolator is
component clk_wiz_0
port
 (-- Clock in ports
  -- Clock out ports
  hphi_2          : out    std_logic;
  clamp          : out    std_logic;
  sample          : out    std_logic;
  phirg          : out    std_logic;
  hphi_1          : out    std_logic;
  adc          : out    std_logic;
  -- Status and control signals
  reset             : in     std_logic;
  clk_in1           : in     std_logic
 );
end component;
--component declaration
--Not needed for test design
--component clk_div is
--  port ( 
--  EN : in std_logic;
--  CLK_IN : in std_logic;
--  CLK_OUT : out std_logic
--);
--end component;
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
     --DIN : in std_logic_vector (2 downto 0);
     COUNT : out std_logic_vector (2 downto 0)
);
end component;
component reg_file is 
  port ( 
   D_IN : in std_logic_vector(7 downto 0);
   COL_NUM : in std_logic_vector(9 downto 0);
   ROW_NUM : in std_logic_vector(2 downto 0);
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
--type creg_file_line_t is array (0 to 623) of std_logic_vector(7 downto 0);
--type creg_file_w_t is array (0 to 3) of creg_file_line_t;
type creg_file_w_t is array (0 to 2495) of std_logic_vector(7 downto 0);
signal creg_file_w : creg_file_w_t;
--signal interp_w_brbr : creg_file_w_t;
--signal interp_w_gbrg : creg_file_w_t;

type interp_w_t is array (0 to 2495) of std_logic_vector(7 downto 0);
signal interp_w_brbr : interp_w_t;
signal interp_w_gbrg : interp_w_t;

type display_line_t is array (0 to 623) of std_logic_vector(23 downto 0);
type display_t is array (0 to 3) of display_line_t;
signal display : display_t;

--pix_counter signals
--signal start : std_logic := '0';
--signal up : std_logic := '1';
signal ld : std_logic;
signal wr_en: std_logic;
signal converter_pix_idx : integer range 0 to 623;
signal converter_ln_idx : integer range 0 to 3;
--signal wr_en : std_logic := '0';
signal reset_pix_cnt : std_logic := '0';
signal reset_pix_cnt_display : std_logic := '0';
signal reset_ln_cnt : std_logic := '0';
signal reset_reg_file_idx : std_logic := '0';
signal reset_converter_idx : std_logic := '0';
--signal din_pix_cnt : std_logic_vector(9 downto 0) := "0000000000";
--signal din_ln_cnt : std_logic_vector(9 downto 0) := "0000000000";
signal count_pix : std_logic_vector(9 downto 0);
signal count_ln : std_logic_vector(9 downto 0);
signal count_reg_file : std_logic_vector(2 downto 0);
signal count_pix_display : std_logic_vector(9 downto 0);
signal converter_count : std_logic_vector(2 downto 0);
--signal reg_file_idx : std_logic_vector(2 downto 0);
signal shift : std_logic := '0';
--signal wr_en_trig : std_logic;
--signal rgb : std_logic_vector(23 downto 0);
--signal en_line_delay : std_logic := '0';
--signal display_clk : std_logic;
begin
ccd_clocks : clk_wiz_0
   port map ( 
  -- Clock out ports  
   hphi_2 => HPHI2,
   clamp => CLAMP,
   sample => SAMPLE,
   phirg => PHIRG,
   hphi_1 => HPHI1,
   adc => ADC_CLK,
  -- Status and control signals                
   reset => '0',
   -- Clock in ports
   clk_in1 => CLK
 );
--  SET_WIRES:  
--  for I in 0 to 4679 generate
--    reg_file_w(I) <= pix_data(I*8 + 7) & pix_data(I*8 + 6) & pix_data(I*8 + 5) & pix_data(I*8 + 4) & pix_data(I*8 + 3) & pix_data(I*8 + 2) & pix_data(I*8 + 1) & pix_data(I*8);    
--  end generate SET_WIRES;
  DISP_MCLK <= CLK_DISPLAY;

----
----  CCD image sensor sequence
----
--  process
--  begin
--    if(EN = '1' and ld = '0') then
--      for I in 0 to 17117 loop --vsync 18*944 clocks + 124 hsync + 2 discarded pixels
--          wait until rising_edge(CLK);
--      end loop;
--      ld <= '1';
--    end if;
--  end process;
  
--  process
--  begin
--    if (reset_pix_cnt = '1') then
--      if(unsigned(count_ln) < 581) then
--        shift <= '1';
--        wait until rising_edge(CLK);
--        shift <= '0';
--        for I in 0 to 161 loop  --hsync: optical black & sync + 2 discarded pixels = 102+19=121 is sync, + 3 o.b. =124 + 38 o.b. = 
--          wait until rising_edge(CLK);
--        end loop;
--        reset_pix_cnt <= '0';
--      else
--        for I in 0 to 37 loop
--          wait until rising_edge(CLK); --optical black
--         end loop;
--      end if;
--    elsif (reset_ln_cnt = '1') then -- vsync: 25*944 pixels
--      for I in 0 to 23599 loop
--        wait until rising_edge(CLK);
--      end loop;
--      ld <= '0';
--      reset_pix_cnt <= '0';
--      reset_ln_cnt <= '0'; -- reset pretty much like LD prevents timer from counting
--    end if;
--   end process;
      
--  process(CLK)
--  begin
--    if(unsigned(count_pix) = 779) then
--      reset_pix_cnt <= '1';
--    elsif(unsigned(count_reg_file) = 5) then
--      shift <= '1';
--    elsif (unsigned(count_ln) = 581) then
--      reset_ln_cnt <= '1';
--    end if;
--  end process;
      
      
--  --
--  --  Display sequence (60Hz mode : 858x525 total display area) (Orbit -10 pixels UP)
--  --
--  -- -  +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--  -- |  +                                        ^                  +
--  -- |  +                                        |  38+6-10=34      +
--  -- |  +                                       v          96       +
--  -- |  +          **********************************<------------->++++++++++++++++++++++++++++++++++                                 
--  -- |  +          *<-----------624-------------^-->*                                                +
--  -- |  +          *                            |   *             96+437=533                         +
--  -- |  +          *                           388  *<---------------------------------------------->+
--  -- |  +          *                            |   *                                                +
--  --525 +          *                            |   *                                                +
--  -- |  +          *                            v   *                                                +                                
--  -- |  + <------> **********************************                +++++++++++++++++++++++++++++++++
--  -- |  +122+16=138                               ^                  +
--  -- |  +                                         |                  +
--  -- |  +                                         |                  +
--  -- |  +                                         | 87+6=93          +
--  -- |  +                                         |                  +
--  -- |  +                                         v                  +
--  -- -  ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--  --    |-------------------------------858--------------------------|
--  --    |----------------------------------------------------1295-------------------------------------|
  
  
  
--  process
--  begin
--    if(EN = '1' and wr_en = '0') then  --vsync: 34x858=29172 display clocks
--      for I in 0 to 29171 loop
--        wait until rising_edge(CLK_DISPLAY);
--      end loop;
--      wr_en <= '1';
--    end if;
--  end process;
  
--  process --(reset_pix_cnt, CLK_DISPLAY)
--  begin
--    if(unsigned(count_ln) > 5) then
--      if (unsigned(count_ln) < 581) then
--        for I in 0 to 121 loop
--          wait until rising_edge(CLK_DISPLAY); --sync
--        end loop;
--        for I in 0 to 623 loop
--          wait until falling_edge(CLK_DISPLAY);
--          if((I rem 2) = 0) then
--            D_OUT <= creg_file_w(1872 + I) & interp_w_gbrg(1872 + I) & interp_w_brbr(1872 + I);
--          else
--            D_OUT <= interp_w_brbr(1872 + I) & creg_file_w(1872 + I) & interp_w_gbrg(1872 + I);
--          end if;
--        end loop;
--        for I in 0 to 101 loop
--          wait until rising_edge(CLK_DISPLAY); --sync
--        end loop;
--        for I in 0 to 121 loop
--          wait until rising_edge(CLK_DISPLAY); --sync
--        end loop;
--        for I in 0 to 623 loop
--          wait until falling_edge(CLK_DISPLAY);
--          if((I rem 2) = 0) then
--            D_OUT <=  interp_w_gbrg(I + 1872) & creg_file_w(I + 1872) & interp_w_brbr(I + 1872);
--          else
--            D_OUT <= interp_w_brbr(I + 1872)  & interp_w_gbrg(I + 1872) & creg_file_w(I + 1872);
--          end if;
--        end loop;
--        for I in 0 to 101 loop
--          wait until rising_edge(CLK_DISPLAY); --sync
--        end loop;
--      else
      
--       for I in 0 to 121 loop
--         wait until rising_edge(CLK_DISPLAY); --sync
--       end loop;
--       for I in 0 to 623 loop
--         wait until falling_edge(CLK_DISPLAY);
--         if((I rem 2) = 0) then
--           D_OUT <= creg_file_w(1872 + I) & interp_w_gbrg(1872 + I) & interp_w_brbr(1872 + I);
--         else
--           D_OUT <= interp_w_brbr(1872 + I) & creg_file_w(1872 + I) & interp_w_gbrg(1872 + I);
--         end if;
--       end loop;
--       for I in 0 to 101 loop
--         wait until rising_edge(CLK_DISPLAY); --sync
--       end loop;
       
--       for I in 0 to 121 loop
--         wait until rising_edge(CLK_DISPLAY); --sync
--       end loop;
--       for I in 0 to 623 loop
--         wait until falling_edge(CLK_DISPLAY);
--         if((I rem 2) = 0) then
--           D_OUT <= interp_w_gbrg(I + 1248) & creg_file_w(I + 1248) & interp_w_brbr(I + 1248);
--         else
--           D_OUT <= interp_w_brbr(I + 1248)  & interp_w_gbrg(I + 1248) & creg_file_w(I + 1248);
--         end if;
--       end loop;
--       for I in 0 to 101 loop
--         wait until rising_edge(CLK_DISPLAY); --sync
--       end loop;
          
--       for I in 0 to 121 loop
--         wait until rising_edge(CLK_DISPLAY); --sync
--       end loop;
--       for I in 0 to 623 loop
--         wait until falling_edge(CLK_DISPLAY);
--         if((I rem 2) = 0) then
--           D_OUT <= creg_file_w(624 + I) & interp_w_gbrg(624 + I) & interp_w_brbr(624 + I);
--         else
--           D_OUT <= interp_w_brbr(624 + I) & creg_file_w(624 + I) & interp_w_gbrg(624 + I);
--         end if;
--       end loop;
--       for I in 0 to 101 loop
--         wait until rising_edge(CLK_DISPLAY); --sync
--       end loop;
       
--       for I in 0 to 121 loop
--         wait until rising_edge(CLK_DISPLAY); --sync
--       end loop;
--       for I in 0 to 623 loop
--         wait until falling_edge(CLK_DISPLAY);
--         if((I rem 2) = 0) then
--           D_OUT <= interp_w_gbrg(I) & creg_file_w(I) & interp_w_brbr(I);
--         else
--           D_OUT <= interp_w_brbr(I)  & interp_w_gbrg(I) & creg_file_w(I);
--         end if;
--       end loop;
--       for I in 0 to 101 loop
--         wait until rising_edge(CLK_DISPLAY); --sync
--       end loop;
       
--       for I in 0 to 161567 loop
--         wait until rising_edge(CLK_DISPLAY); --vsync
--       end loop;
--       wr_en <= '0';
--      end if; 
--    end if;
--  end process;


  --Input counters
  PIX_CNT : counter_10b port map(RESET => reset_pix_cnt, CLK => CLK, LD => ld, UP => '1', 
  --DIN => "0000000000", 
  COUNT => count_pix);
  LN_CNT : counter_10b port map(RESET => reset_ln_cnt, CLK => reset_pix_cnt, LD => ld, UP => '1', 
  --DIN => "0000000000", 
  COUNT => count_ln);
  REG_FILE_CNT : counter_3b port map(RESET => reset_reg_file_idx, CLK => reset_pix_cnt, LD => ld, UP => '1',
    --DIN => "101",
    COUNT => count_reg_file);
    
  --Output counters    
  PIX_CNT_DISPLAY: counter_10b port map(RESET => reset_pix_cnt_display, CLK => CLK_DISPLAY, LD => wr_en, UP => '1', COUNT => count_pix_display);
  CONVERTER_CNT_DISPLAY: counter_3b port map(RESET => reset_converter_idx, CLK => reset_pix_cnt_display, LD => wr_en, UP => '1', COUNT => converter_count);
    
    --Not needed for test design
  --CLK_DISPLAY_DIV: clk_div port map(EN => en_line_delay, CLK_IN => CLK_DISPLAY, CLK_OUT => display_clk);
  
  RFX: reg_file port map(D_IN => D_IN, COL_NUM => count_pix, ROW_NUM => count_reg_file, SHIFT => shift, CLK => CLK, PIX_DATA => pix_data);
  --Test design: this is just to estimate the amount of logic cells required
  -- Input counters
  ld <= NOT EN;
  with count_reg_file select
    reset_reg_file_idx <= '1' when "101",
    '0' when others;
  with count_pix select
    reset_pix_cnt <= '1' when "1100001011", --779
    '0' when others;
  with count_reg_file select
    shift <= '1' when "101",
    '0' when others;
  
  --wr_en_trig <= shift OR reset_converter_idx;
  process(shift, reset_converter_idx)
  begin
    if(reset_converter_idx = '1') then
       wr_en <= '0';
    elsif(shift = '1') then
       wr_en <= '1';
    end if;
  end process;
  -- Output counters
  with count_pix_display select
    reset_pix_cnt_display <= '1' when "1001101111",
    '0' when others;
  with converter_count select
    reset_converter_idx <= '1' when "011",
    '0' when others;
  converter_pix_idx <= to_integer(unsigned(count_pix_display));
  converter_ln_idx <= to_integer(unsigned(converter_count));
  with wr_en select
    D_OUT <= "000000000000000000000000" when '0',
    display(converter_ln_idx)(converter_pix_idx) when others;

  
  --D_OUT <= rgb;
--  process(shift, CLK_DISPLAY)
--  begin
--    if(shift = '1') then
--    --ld <= '0';
--    for I in 0 to 623 loop
--      if(rising_edge(CLK_DISPLAY)) then
--           if((I rem 2) = 0) then
--                  rgb <= creg_file_w(1872 + I) & interp_w_gbrg(1872 + I) & interp_w_brbr(1872 + I);
--                else
--                  rgb <= interp_w_brbr(1872 + I) & creg_file_w(1872 + I) & interp_w_gbrg(1872 + I);
--            end if;
--      end if;
--    end loop;
--    for I in 0 to 623 loop
--      if(rising_edge(CLK_DISPLAY)) then
--        if((I rem 2) = 0) then
--          rgb <=  interp_w_gbrg(I + 1248) & creg_file_w(I + 1248) & interp_w_brbr(I + 1248);
--        else
--          rgb <= interp_w_brbr(I + 1248)  & interp_w_gbrg(I + 1248) & creg_file_w(I + 1248);
--        end if;
--      end if;
--    end loop;
--    for I in 0 to 623 loop
--      if(rising_edge(CLK_DISPLAY)) then
--           if((I rem 2) = 0) then
--                  rgb <= creg_file_w(624 + I) & interp_w_gbrg(624 + I) & interp_w_brbr(624 + I);
--                else
--                  rgb <= interp_w_brbr(624 + I) & creg_file_w(624 + I) & interp_w_gbrg(624 + I);
--            end if;
--      end if;
--    end loop;
--    for I in 0 to 623 loop
--      if(rising_edge(CLK_DISPLAY)) then
--        if((I rem 2) = 0) then
--          rgb <=  interp_w_gbrg(I) & creg_file_w(I) & interp_w_brbr(I);
--        else
--          rgb <= interp_w_brbr(I)  & interp_w_gbrg(I) & creg_file_w(I);
--        end if;
--      end if;
--    end loop;
--    end if;
--  end process;
  
  DISPGENX0 : 
  for I in 0 to 311 generate
    display(0)(I*2) <= creg_file_w(1872 + I*2) & interp_w_gbrg(1872 + I*2) & interp_w_brbr(1872 + I*2);
    display(0)(I*2 + 1) <= interp_w_brbr(1872 + I*2 + 1) & creg_file_w(1872 + I*2 + 1) & interp_w_gbrg(1872 + I*2 + 1);
  end generate DISPGENX0;
  DISPGENX1 :
  for I in 0 to 311 generate
    display(1)(I*2) <= interp_w_gbrg(I + 1248) & creg_file_w(I + 1248) & interp_w_brbr(I + 1248);
    display(1)(I*2 + 1) <= interp_w_brbr(I + 1248)  & interp_w_gbrg(I + 1248) & creg_file_w(I + 1248);
  end generate DISPGENX1;
  DISPGENX2 : 
  for I in 0 to 311 generate
    display(2)(I*2) <= creg_file_w(624 + I*2) & interp_w_gbrg(624 + I*2) & interp_w_brbr(624 + I*2);
    display(2)(I*2 + 1) <= interp_w_brbr(624 + I*2 + 1) & creg_file_w(624 + I*2 + 1) & interp_w_gbrg(624 + I*2 + 1);
  end generate DISPGENX2;
  DISPGENX3 :
  for I in 0 to 311 generate
    display(3)(I*2) <= interp_w_gbrg(I*2) & creg_file_w(I*2) & interp_w_brbr(I*2);
    display(3)(I*2 + 1) <= interp_w_brbr(I*2 + 1)  & interp_w_gbrg(I*2 + 1) & creg_file_w(I*2 + 1);
  end generate DISPGENX3;
  
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
