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

architecture barch1 of dec2to4 is
begin
	out3 <= '1' when (en='1' AND in1='1' AND in0='1') 
		    else '0';
	out2 <= '1' when (en='1' AND in1='1' AND in0='0') 
		    else '0';
	out1 <= '1' when (en='1' AND in1='0' AND in0='1') 
		    else '0';
	out0 <= '1' when (en='1' AND in1='0' AND in0='0') 
		    else '0';
end barch1;

