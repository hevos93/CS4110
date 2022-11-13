-- USN VHDL 101 course
-- 2 to 4 decoder with enable input
-- outputs are active high
-- behavioral description
-- author: josemmf@usn.no

library ieee;
use ieee.std_logic_1164.all;

entity dec2to4 is
    Port ( in1, in0, en: in STD_LOGIC;
           out3, out2, out1, out0: out STD_LOGIC
	 );
end dec2to4;

architecture barch2 of dec2to4 is
signal sel: std_logic_vector (2 downto 0);

begin
	sel <= en & in1 & in0;
	with sel select
	out3 <= '1' when "111", '0' when others;
	with sel select
	out2 <= '1' when "110", '0' when others;
	with sel select
	out1 <= '1' when "101", '0' when others;
	with sel select
	out0 <= '1' when "100", '0' when others;

end barch2;
