-- USN VHDL 101 course
-- 8-bit shift-left register
-- author: josemmf@usn.no

library ieee;
use ieee.std_logic_1164.all;

entity slr8bits is
    Port ( clk, rst, sin: in std_logic;
           dout: out std_logic_vector (7 downto 0)
	 );
end slr8bits;

architecture arch of slr8bits is
signal ffin, ffout: std_logic_vector (7 downto 0);
begin
-- state register section
process (clk, rst)
   begin
   if (rst = '1') then
	  ffout <= (others => '0');
   elsif rising_edge(clk) then
	  ffout <= ffin;
   end if;
end process;

-- outputs section
ffin <= ffout (6 downto 0) & sin;
dout <= ffout;

end arch;
