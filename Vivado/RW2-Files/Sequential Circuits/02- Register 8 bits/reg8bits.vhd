-- USN VHDL 101 course
-- 8-bit register
-- author: josemmf@usn.no

library ieee;
use ieee.std_logic_1164.all;

entity reg8bits is
    Port ( clk: in STD_LOGIC;
	       ffin: in STD_LOGIC_VECTOR (7 downto 0);
           ffout: out STD_LOGIC_VECTOR (7 downto 0)
	 );
end reg8bits;

architecture arch of reg8bits is

begin
-- state register section
process (clk)
   begin
   if rising_edge(clk) then
	  ffout <= ffin;
   end if;
end process;

-- outputs section
-- void

end arch;
