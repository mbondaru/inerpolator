----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/14/2024 03:50:26 PM
-- Design Name: 
-- Module Name: testbench - Behavioral
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
--use IEEE.numeric_std.ALL; -- 'pos attribute conflict
use IEEE.numeric_bit.ALL;

library std;
use std.textio.all;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity testbench is
--  Port ( );
end testbench;

architecture Behavioral of testbench is
  type t_char_file is file of character;
  type t_byte_arr IS ARRAY (natural range <>) of bit_vector(7 downto 0);
  signal read_arr_byte : t_byte_arr(0 to 453959); --780x582 bayer pattern
  signal write_arr_byte : t_byte_arr(0 to 1361879);
  
  component interpolator is
    Port ( 
        CLK : in std_logic;
        D_IN : in std_logic_vector(7 downto 0);
        D_OUT : out std_logic_vector(23 downto 0)
      );
  end component;

  signal start_read : std_logic := '0';
  signal end_read : std_logic := '0';
  signal end_processing : std_logic := '0';

  signal clk : std_logic := '0';
  signal clk_display : std_logic := '0';
  
  signal gated_clk : std_logic := end_read AND clk;
  
  signal data : std_logic_vector(7 downto 0);
  signal rgb : std_logic_vector(23 downto 0);
  
  signal i : integer range 0 to 453959 := 0;
  
  constant clk_period: time := 34 ns;
  constant clk_display_period : time := 37 ns;
    
begin
  UUT: interpolator port map (CLK => gated_clk, D_IN => data, D_OUT => rgb); --unit under test

  read_file: process (start_read) is
    FILE file_in: t_char_file OPEN read_mode is "./wolf.bayer";
    variable char_buffer : character;
  begin
    if start_read'EVENT and start_read = '1' then
      for i in read_arr_byte'RANGE loop
        read(file_in, char_buffer);
        read_arr_byte(i) <= bit_vector(to_unsigned(character'POS(char_buffer), 8));
      end loop;
      file_close(file_in);
      end_read <= '1';
    end if;
  end process read_file;
  
--  process_file: process (end_read) is
--  begin
--    if end_read'EVENT and end_read = '1' then
--      start_processing
--    end if;
--  end process process_file;
  
  write_file: process (end_processing) is
    FILE file_out: t_char_file OPEN write_mode is "./wolf.rgb";
    variable char_buffer : character;
  begin
    if end_processing'EVENT and end_processing = '1' then
      for i in write_arr_byte'RANGE loop
        char_buffer := character'val(bit_vector'pos(write_arr_byte(i)));
        write(file_out, char_buffer);
      end loop;
      file_close(file_out);
    end if;
  end process write_file;
  
  
  clk_process: process
  begin
    clk <= '0';
    wait for clk_period/2;
    clk <= '1';
    wait for clk_period/2;
  end process;
  
  clk_display_process: process
  begin
    clk_display <= '0';
    wait for clk_display_period/2;
    clk_display <= '1';
    wait for clk_display_period/2;
  end process;
  
  test_process: process
  begin  
    start_read <= '1';
    wait for 100 ns;
  end process;
  
  data_process: process(gated_clk)
  begin
    if (rising_edge(gated_clk)) then
      data <= to_stdlogicvector(read_arr_byte(i));
      i <= i + 1;
    end if;
  end process;

end Behavioral;


--begin
--  type pixel_data is array (0 to 59) of std_logic_vector(7 downto 0);
--  constant my_rom : pixel_data := (
--    0 => X"73",
--    1 => X"94",
--    2 => X"86",
--    3 => X"7D",
--    4 => X"54",
--    5 => X"38",
--    6 => X"7F",
--    7 => X"75",
--    8 => X"64",
--    9 => X"45",
--    10 => X"6B",
--    11 => X"80",
--    12 => X"A6",
--    13 => X"69",
--    14 => X"30",
--    15 => X"19",
--    16 => X"54",
--    17 => X"66",
--    18 => X"7C",
--    19 => X"50",
--    20 => X"9C",
--    21 => X"8A",
--    22 => X"AF",
--    23 => X"7D",
--    24 => X"92",
--    25 => X"4C",
--    26 => X"76",
--    27 => X"60",
--    28 => X"7B",
--    29 => X"5F",
--    30 => X"83",
--    31 => X"89",
--    32 => X"99",
--    33 => X"68",
--    34 => X"72",
--    35 => X"34",
--    36 => X"6A",
--    37 => X"66",
--    38 => X"5E",
--    39 => X"57",
--    40 => X"87",
--    41 => X"85",
--    42 => X"C6",
--    43 => X"DF",
--    44 => X"DC",
--    45 => X"B3",
--    46 => X"C1",
--    47 => X"BB",
--    48 => X"86",
--    49 => X"52",
--    50 => X"73",
--    51 => X"67",
--    52 => X"6F",
--    53 => X"7C",
--    54 => X"E2",
--    55 => X"DB",
--    56 => X"CF",
--    57 => X"9A",
--    58 => X"55",
--    59 => X"32");
