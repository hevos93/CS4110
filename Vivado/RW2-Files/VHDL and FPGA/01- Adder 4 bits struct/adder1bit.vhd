-- USN VHDL 101 course
-- 1-bit adder
-- author: josemmf@usn.no

library ieee;
use ieee.std_logic_1164.all;

entity adder1bit is
    Port ( Cin, A, B: in STD_LOGIC;
           Cout, S: out STD_LOGIC
	 );
end adder1bit;

architecture darch of adder1bit is
begin
	Cout <= (not(Cin) and A and B) or (Cin and not(A) and B) or (Cin and A and not(B)) or (Cin and A and B);
	S <= (not(Cin) and not(A) and B) or (not(Cin) and A and not(B)) or (Cin and not(A) and not(B)) or (Cin and A and B);
end darch;
