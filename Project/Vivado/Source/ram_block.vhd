-- (adapted from) Listing 11.1
-- Single-port RAM with synchronous read
-- Modified from XST 8.1i rams_07
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity ram_block is
   generic(
      ADDR_WIDTH: integer:=4; -- 1KB RAM
      DATA_WIDTH: integer:=8
   );
   port(
      clk: in std_logic;
      wr: in std_logic;
      addr: in std_logic_vector(ADDR_WIDTH-1 downto 0);
      din: in std_logic_vector(DATA_WIDTH-1 downto 0);
      dout: out std_logic_vector(DATA_WIDTH-1 downto 0)
    );
end ram_block;

architecture arch of ram_block is
   type ram_type is array (2**ADDR_WIDTH-1 downto 0)
        of std_logic_vector (DATA_WIDTH-1 downto 0);
   signal ram: ram_type;

begin
   process (clk)
   begin
      if rising_edge(clk) then
         if (wr='1') then
            ram(to_integer(unsigned(addr))) <= din;
         end if;
      end if;
   end process;
   dout <= ram(to_integer(unsigned(addr)));
end arch;