-- Listing 4.10
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity loop_cnt is
   generic(N: integer := 2);
   port(
      clk, reset: in std_logic;
      load, dec: in std_logic;
      zero: out std_logic;
      q: out std_logic_vector(N-1 downto 0)
   );
end loop_cnt;

architecture arch of loop_cnt is
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
   r_next <= "11"   when load='1' else
             r_reg-1 when dec ='1' else
             r_reg;
   -- output logic
   q <= std_logic_vector(r_reg);
   zero <= '1' when r_reg=0 else '0';
end arch;