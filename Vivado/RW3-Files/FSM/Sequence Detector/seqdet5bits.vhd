-- USN VHDL 101 course
-- 5-bit sequence detector for 10110
-- josemmf@usn.no

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity seqdet is
   Port ( clk, rst, din: in std_logic;
          dout: out std_logic
	    );
end seqdet;

architecture arch of seqdet is
type state is (S0, S1, S2, S3, S4, S5);
signal st_pre, st_nxt: state;

begin
-- state register section
process (clk, rst)
begin
   if (rst = '1') then
	  st_pre <= S0;
   elsif rising_edge(clk) then
	  st_pre <= st_nxt;
   end if;
end process;

-- next-state outputs section
process (st_pre, din)
begin
   case st_pre is
      when S0 =>
         if din='1' then st_nxt <= S1;
            else st_nxt <= S0;
         end if;
      when S1 =>
         if din='1' then st_nxt <= S1;
         else st_nxt <= S2;
         end if;
      when S2 =>
         if din='1' then st_nxt <= S3;
         else st_nxt <= S0;
         end if;
      when S3 =>
         if din='1' then st_nxt <= S4;
         else st_nxt <= S2;
         end if;
      when S4 =>
         if din='1' then st_nxt <= S1;
         else st_nxt <= S5;
         end if;
      when S5 =>
         if din='1' then st_nxt <= S3;
         else st_nxt <= S0;
         end if;
   end case;
end process;

-- Moore outputs section
process (st_pre)
begin
   case st_pre is 
      when S0 | S1 | S2 | S3 | S4 =>  
         dout <= '0';
      when S5 =>
         dout <= '1'; 
   end case;
end process;
       
-- Mealy outputs section (void)

end arch;
