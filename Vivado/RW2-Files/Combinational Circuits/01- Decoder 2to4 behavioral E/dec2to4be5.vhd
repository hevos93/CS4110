-- USN VHDL 101 course
-- 2 to 4 decoder with enable input
-- outputs are active high
-- description using an CASE/WHEN statement
-- author: josemmf@usn.no

library ieee;
use ieee.std_logic_1164.all;

entity dec2to4 is
    Port ( in1, in0, en: in STD_LOGIC;
           out3, out2, out1, out0: out STD_LOGIC
	 );
end dec2to4;

architecture case_arch of dec2to4 is
signal sel: std_logic_vector(2 downto 0);

begin
   sel <= en & in1 & in0;
   process (sel)
    begin
	case sel is
	   when "000" | "001" | "010" | "011" =>
	      out3 <='0'; out2 <='0'; out1 <='0'; out0 <='0';
	   when "100" =>
	      out3 <='0'; out2 <='0'; out1 <='0'; out0 <='1';
	   when "101" =>
	      out3 <='0'; out2 <='0'; out1 <='1'; out0 <='0';
	   when "110" =>
	      out3 <='0'; out2 <='1'; out1 <='0'; out0 <='0';
	   when others =>
	      out3 <='1'; out2 <='0'; out1 <='0'; out0 <='0';
	end case;
    end process;
end case_arch;
