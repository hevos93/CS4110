-- Listing 4.5
library ieee;
use ieee.std_logic_1164.all;

entity fir_reg is
   port(
      clk, reset: in std_logic;
      d: in std_logic_vector(7 downto 0);
      q: out std_logic_vector(7 downto 0)
   );
end fir_reg;

architecture arch of fir_reg is
begin
   process(clk,reset)
   begin
      if (reset='1') then
         q <=(others=>'0');
      elsif rising_edge(clk) then
         q <= d;
      end if;
   end process;
end arch;