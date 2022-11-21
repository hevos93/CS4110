-- USN VHDL 101 course
-- template for FSM development
-- (Moore and/or Mealy outputs)
-- author | date

library ieee;
use ieee.std_logic_1164.all;

entity ctr_path is
   port ( clk, rst, zero: in std_logic;
          ctr_mux_above, ctr_mux_below, load_temp_reg: out std_logic;
          ram_cnt_clr, ram_cnt_inc, loop_cnt_load, loop_cnt_dec, rom_cnt_clr, rom_cnt_inc, wr: out std_logic
	    );
end ctr_path;

architecture arch of ctr_path is
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
process (st_reg, zero)
begin
   st_nxt <= st_reg; -- stay in current state by default
   ctr_mux_above <= '0';
   ctr_mux_below <= '0';
   load_temp_reg <= '0';
   ram_cnt_clr <= '0';
   ram_cnt_inc <= '0';
   loop_cnt_load <= '0';
   loop_cnt_dec <= '0';
   rom_cnt_clr <= '0';
   rom_cnt_inc <= '0';
   wr <= '0';

   case st_reg is
      when S0 =>
         rom_cnt_clr <= '1';
         ram_cnt_clr <= '1';
         loop_cnt_load <= '1';
         st_nxt <= S1;
         
      when S1 =>
	     ctr_mux_above <= '1';
	     load_temp_reg <= '1';
         st_nxt <= S2;
         
      when S2 =>
	     ctr_mux_below <= '1';
	     load_temp_reg <= '1';
         st_nxt <= S3;     
         
      when S3 =>
	     wr <= '1';
	     ram_cnt_inc <= '1';
	     rom_cnt_inc <= '1';
	     if (zero='1') then
	           st_nxt <= S0;
	     else
               loop_cnt_dec <= '1';
               st_nxt <= S1; 
         end if;
   end case;
end process;


end arch;










