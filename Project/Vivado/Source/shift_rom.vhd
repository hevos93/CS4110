-- (adapted from) Listing 11.5
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity shift_rom is
   port(
      addr: in std_logic_vector(3 downto 0);
      data: out std_logic_vector(3 downto 0)
   );
end shift_rom;

architecture arch of shift_rom is
   --constant ADDR_WIDTH: integer:=5;
   --constant DATA_WIDTH: integer:=8;
   type rom_type is array (0 to 4)--2**ADDR_WIDTH-1)
        of std_logic_vector(3 downto 0);
   -- ROM definition
   constant shifts: rom_type:=(
        "0000", -- 0, addr: 0
        "0011", -- 3  addr: 1
        "0110", -- 6  addr: 2
        "1001", -- 9  addr: 3
        "1100"  -- 12 addr: 4
   );
   
   
--   constant HEX2LED_ROM: rom_type:=(  -- jeanjacquesrousseau
--      x"6A",  -- addr 00: j
--      x"65",  -- addr 01: e
--      x"61",  -- addr 02: a
--      x"6E",  -- addr 03: n
--      x"6A",  -- addr 04: j
--      x"61",  -- addr 05: a
--      x"63",  -- addr 06: c
--      x"71",  -- addr 07: q
--      x"75",  -- addr 08: u
--      x"65",  -- addr 09: e
--      x"73",  -- addr 10: s
--      x"72",  -- addr 11: r
--      x"6F",  -- addr 12: o
--      x"75",  -- addr 13: u
--      x"73",  -- addr 14: s
--      x"73",  -- addr 15: s
--	  x"65",  -- addr 16: e
--	  x"61",  -- addr 17: a
--	  x"75",  -- addr 18: u
--	  x"FF",  -- addr 19: (void)
--	  x"FF",  -- addr 20: (void)
--	  x"FF",  -- addr 21: (void)
--	  x"FF",  -- addr 22: (void)
--	  x"FF",  -- addr 23: (void)
--	  x"FF",  -- addr 24: (void)
--	  x"FF",  -- addr 25: (void)
--	  x"FF",  -- addr 26: (void)
--	  x"FF",  -- addr 27: (void)
--	  x"FF",  -- addr 28: (void)
--	  x"FF",  -- addr 29: (void)
--	  x"FF",  -- addr 30: (void)
--	  x"FF"   -- addr 31: (void)
--   );
begin
   data <= addr;
   --data <= HEX2LED_ROM(to_integer(unsigned(addr)));
end arch;