-- USN VHDL 101 course
-- template for FSM development
-- (Moore and/or Mealy outputs)
-- author | date

library ieee;
use ieee.std_logic_1164.all;

entity ctr_path is
   port ( clk, rst, rx_done, tx_done: in std_logic;
          ld_reg_xn1, ld_reg_xn2, ld_reg_xn3, ld_reg_xn4, ld_reg_xn5, tx_start: out std_logic;
          mux_ctr: out std_logic_vector(1 downto 0)
	    );
end ctr_path;

architecture arch of ctr_path is
type state is (S0, S1, S2, S3, S4);
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
process (st_reg, rx_done, tx_done)
begin
   st_nxt <= st_reg; -- stay in current state by default
   ld_reg_xn1 <= '0';
   ld_reg_xn2 <= '0';
   ld_reg_xn3 <= '0';
   ld_reg_xn4 <= '0';
   ld_reg_xn5 <= '0';
   mux_ctr <= "00";
   tx_start <= '0';

   case st_reg is
         
      when S0 =>
	     if (rx_done='1') then
	           ld_reg_xn1 <= '1';
	           ld_reg_xn2 <= '1';
	           ld_reg_xn3 <= '1';
	           ld_reg_xn4 <= '1';
	           ld_reg_xn5 <= '1';
	           st_nxt <= S1;
	     end if;      
      
      when S1 =>
         tx_start <= '1';
         mux_ctr <= "11";   -- (send a space char)
         if (tx_done='1') then
             st_nxt <= S2;
         end if;
      
      when S2 =>
         tx_start <= '1';
         mux_ctr <= "00";   -- (send the FIR output)
         if (tx_done='1') then
             st_nxt <= S3;
         end if;

      when S3 =>
         tx_start <= '1';
         mux_ctr <= "10";   -- (send a carriage return char)
         if (tx_done='1') then
             st_nxt <= S4;
         end if;

      when S4 =>
         tx_start <= '1';
         mux_ctr <= "01";   -- (send a line feed char)
         if (tx_done='1') then
             st_nxt <= S0;
         end if;
         
   end case;
end process;


end arch;










