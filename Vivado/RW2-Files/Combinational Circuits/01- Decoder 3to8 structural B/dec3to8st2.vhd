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

architecture sarch2 of dec3to8 is
  signal in2_int: STD_LOGIC;
begin
-- instantiate two 2:4 decoders
    decoder1: entity work.dec2to4(darch)
        port map (in1 => in1, in0 => in0, en => in2,
           out3 => out7, out2 => out6, out1 => out5, out0 => out4);
    decoder2: entity work.dec2to4(darch)
        port map (in1 => in1, in0 => in0, en => in2_int,
           out3 => out3, out2 => out2, out1 => out1, out0 => out0);
    in2_int <= not(in2);
end sarch2;
