-- USN VHDL 101 course
-- 4-bit adder
-- author: josemmf@usn.no

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity add4bits is
    Port ( opA, opB: in STD_LOGIC_VECTOR (3 downto 0);
           resC: out STD_LOGIC_VECTOR (4 downto 0)
	 );
end add4bits;

architecture arch of add4bits is
signal valA, valB: unsigned (4 downto 0);
signal valC: unsigned (4 downto 0);

begin
	valA <= unsigned('0' & opA);
	valB <= unsigned('0' & opB);
	valC <= valA + valB;
	resC <= std_logic_vector(valC);

end arch;
