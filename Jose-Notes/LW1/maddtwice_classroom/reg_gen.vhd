-- Listing 4.5
library ieee;
use ieee.std_logic_1164.all;
entity reg_gen is
   port(
      clk, reset, clr, load: in std_logic;
      d: in std_logic_vector(16 downto 0);
      q: out std_logic_vector(16 downto 0)
   );
end reg_gen;

architecture arch of reg_gen is
begin
   process(clk,reset)
   begin
      if (reset='1') then
         q <=(others=>'0');
      elsif (rising_edge(clk)) then    
        if (clr='1') then q <=(others=>'0');
        elsif (load='1') then q <= d;
        end if;        
      end if;
   end process;
end arch;