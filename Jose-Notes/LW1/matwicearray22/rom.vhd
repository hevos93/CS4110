-- (adapted from) Listing 11.5
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity rom is
   port(
      addr: in std_logic_vector(1 downto 0);
      data: out std_logic_vector(7 downto 0)
   );
end rom;

architecture arch of rom is
   constant ADDR_WIDTH: integer:=2;
   constant DATA_WIDTH: integer:=8;
   type rom_type is array (0 to 2**ADDR_WIDTH-1)
        of std_logic_vector(DATA_WIDTH-1 downto 0);
   -- ROM definition
   constant HEX2LED_ROM: rom_type:=(  -- jeanjacquesrousseau
      x"01",  -- addr 00: j
      x"02",  -- addr 01: e
      x"03",  -- addr 02: a
      x"04"  -- addr 03: n
   );
begin
   data <= HEX2LED_ROM(to_integer(unsigned(addr)));
end arch;