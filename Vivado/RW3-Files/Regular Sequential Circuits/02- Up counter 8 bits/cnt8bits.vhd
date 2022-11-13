-- USN VHDL 101 course
-- 8-bit up/down counter
-- author: josemmf@usn.no

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity cnt8bits is
    Port ( clk, rst, up: in std_logic;
           dout: out std_logic_vector (7 downto 0)
	 );
end cnt8bits;

architecture arch of cnt8bits is
signal ffin, ffout: unsigned (7 downto 0);

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
ffin <= ffout + 1 when up='1' else
        ffout - 1;
dout <= std_logic_vector (ffout);

end arch;
