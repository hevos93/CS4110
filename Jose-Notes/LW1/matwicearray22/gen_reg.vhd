-- Listing 4.5
library ieee;
use ieee.std_logic_1164.all;
entity reg is
   port(
      clk, reset, load: in std_logic;
      d: in std_logic_vector(16 downto 0);
      q: out std_logic_vector(16 downto 0)
   );
end reg;

architecture arch of reg is
begin
   process(clk,reset)
   begin
      if (reset='1') then
         q <=(others=>'0');
      elsif (clk'event and clk='1') then
        if (load='1') then
            q <= d;
        end if;
      end if;
   end process;
end arch;