-- USN VHDL 101 course
-- template for FSM development
-- (Moore and/or Mealy outputs)
-- author | date

library ieee;
use ieee.std_logic_1164.all;

entity _name_ is
   port ( clk, rst, _din1_, _din2_, ...: in std_logic;
          _dout1_, _dout2_, ...: out std_logic
	    );
end _name_;

architecture arch of _name_ is
type state is (S0, S1, S2, ...);
signal st_reg, st_nxt: state;  -- current state, next state

begin
-- state register 
process (clk, rst)
begin
   if (rst = '1') then
	  st_reg <= S0; -- initial state
   elsif rising_edge(clk) then
	  st_reg <= st_nxt;
   end if;
end process;

-- next-state logic and Moore/Mealy outputs
process (st_reg, _din1_, _din2_, ...)
begin
   st_nxt <= st_reg; -- stay in current state by default
   _dout_ <= '..';
   -- repeat for all outputs

   case st_reg is
      when S0 =>
	     _Mooredout_ <= '..';
         if _condition_ then 
			_Mealydout_ <= '..';
			st_nxt <= _st_; -- unnecessary if the same
         else 
			_Mealydout_ <= '..';
			st_nxt <= _st_; -- unnecessary if the same
         end if;
      when S1 =>
       
      ...

         end if;
   end case;
end process;


end arch;










