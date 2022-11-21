-- USN VHDL 101 course
-- template for FSM development
-- (Moore and/or Mealy outputs)
-- author | date

library ieee;
use ieee.std_logic_1164.all;

entity template_fsm is
   port ( clk, rst: in std_logic;
          ctr_mux_above, ctr_mux_below, load_reg_temp, clr_reg_temp, load_reg_out: out std_logic
	    );
end template_fsm;

architecture arch of template_fsm is
type state is (S0, S1, S2, S3);
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
process (st_reg)
begin
   st_nxt <= st_reg; -- stay in current state by default
   ctr_mux_above <= '0';
   ctr_mux_below <= '0';
   load_reg_temp <= '0';
   clr_reg_temp <= '0';
   load_reg_out <= '0';
   -- repeat for all outputs

   case st_reg is
      when S0 =>
	     clr_reg_temp <= '1';
	     st_nxt <= 'S1';
      when S1 =>
          ctr_mux_above <= '1';
          
         end if;
   end case;
end process;


end arch;










