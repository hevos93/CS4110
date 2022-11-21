-- Listing 11.1
-- Single-port RAM with synchronous read
-- Modified from XST 8.1i rams_07
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity ram is
   generic(
      ADDR_WIDTH: integer:=10;
      DATA_WIDTH: integer:=8
   );
   port(
      clk: in std_logic;
      write: in std_logic;
      counter_in: in std_logic_vector(ADDR_WIDTH-1 downto 0);
      ram_in: in std_logic_vector(DATA_WIDTH-1 downto 0);
      ram_out: out std_logic_vector(DATA_WIDTH-1 downto 0)
    );
end ram;


architecture arch of ram is
   type ram_array_type is array (2**ADDR_WIDTH-1 downto 0)
        of std_logic_vector (DATA_WIDTH-1 downto 0);
   signal ram: ram_array_type;
--   signal current_addr: std_logic_vector(ADDR_WIDTH-1 downto 0);
begin
   process (clk)
   begin
      if (clk'event AND clk='1') then
         if (write='1') then
            ram(to_integer(unsigned(counter_in))) <= ram_in;
         end if;
--         current_addr <= counter_in;
      end if;
   end process;
   ram_out <= ram(to_integer(unsigned(counter_in)));
--   ram_out <= ram(to_integer(unsigned(current_addr)));
end arch;