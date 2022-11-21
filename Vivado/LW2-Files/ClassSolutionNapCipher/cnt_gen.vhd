-- Listing 4.10
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity counter is
   generic(N: integer := 10);
   port(
      clk, reset: in std_logic;
      syn_clr, inc: in std_logic;
      q: out std_logic_vector(N-1 downto 0)
   );
end counter;

architecture arch of counter is
   signal r_reg: unsigned(N-1 downto 0);
   signal r_next: unsigned(N-1 downto 0);
begin
   -- register
   process(clk,reset)
   begin
      if (reset='1') then
         r_reg <= (others=>'0');
      elsif (clk'event and clk='1') then
         r_reg <= r_next;
      end if;
   end process;
   -- next-state logic
   r_next <= (others=>'0') when syn_clr='1' else
             r_reg + 1     when inc ='1' else
             r_reg;
   -- output logic
   q <= std_logic_vector(r_reg);

end arch;