-- USN VHDL 101 course
-- 3 to 8 decoder
-- outputs are active high
-- structural description
-- author: josemmf@usn.no

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

entity dec3to8 is
    Port ( in2, in1, in0: in STD_LOGIC;
           out7, out6, out5, out4: out STD_LOGIC;
           out3, out2, out1, out0: out STD_LOGIC
	 );
end dec3to8;

architecture sarch1 of dec3to8 is
--  signal ...

    component dec2to4
        Port (in1, in0, en: in STD_LOGIC;
           out3, out2, out1, out0: out STD_LOGIC);
    end component;
begin
    U1: dec2to4 Port Map 
	(en => in2, in1 => in1, in0 => in0,
	 out3 => out7, out2 => out6, out1 => out5, out0 => out4);
    U2: dec2to4 Port Map 
	(en => not(in2), in1 => in1, in0 => in0,
	 out3 => out3, out2 => out2, out1 => out1, out0 => out0);
end sarch1;
