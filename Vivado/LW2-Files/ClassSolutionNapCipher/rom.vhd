-- Listing 11.5
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity rom is
   port(
      addr: in std_logic_vector(4 downto 0);
      data: out std_logic_vector(7 downto 0)
   );
end rom;

architecture arch of rom is
   constant ADDR_WIDTH: integer:=5;
   constant DATA_WIDTH: integer:=8; 
   type rom_type is array (0 to 2**ADDR_WIDTH-1)
        of std_logic_vector(DATA_WIDTH-1 downto 0);
   -- ROM definition
   constant HEX2LED_ROM: rom_type:=(  -- 2^4-by-7
      "01001010",  -- addr 00 , value= J
      "01100101",  -- addr 01 , value= e 
      "01100001",  -- addr 02 , value= a
      "01101110",  -- addr 03 , value= n
      "01001010",  -- addr 04 , value= J
      "01100001",  -- addr 05 , value= a
      "01100011",  -- addr 06 , value= c
      "01110001",  -- addr 07 , value= q
      "01110101",  -- addr 08 , value= u
      "01100101",  -- addr 09 , value= e
      "01110011",  -- addr 10 , value= s
      "01010010",  -- addr 11 , value= R
      "01101111",  -- addr 12 , value= o
      "01110101",  -- addr 13 , value= u
      "01110011",  -- addr 14 , value= s
      "01110011",  -- addr 15 , value= s
      "01100101",  -- addr 16 , value= e
      "01100001",  -- addr 17 , value= a
      "01110101",  -- addr 18 , value= u
      "00000000",  -- addr 19
      "00000000",  -- addr 20
      "00000000",  -- addr 21
      "00000000",  -- addr 22
      "00000000",  -- addr 23
      "00000000",  -- addr 24
      "00000000",  -- addr 25
      "00000000",  -- addr 26
      "00000000",  -- addr 27
      "00000000",  -- addr 28
      "00000000",  -- addr 29
      "00000000",  -- addr 30
      "00000000"   -- addr 31
   );
begin
   data <= HEX2LED_ROM(to_integer(unsigned(addr)));
end arch;