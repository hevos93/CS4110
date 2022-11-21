-- (adapted from) Listing 5.1
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ctr_path is
   generic(
      N: integer := 13;     -- size of array
      M: integer := 8       -- size of RAM address bus
   );
   port(
      clk, reset: in std_logic;
      rx_done, tx_done, new_min: in std_logic;
	  ascii_r, data_out: in std_logic_vector(7 downto 0);
	  rec_value, lec_value: in std_logic_vector(M-1 downto 0);
      tx_start, ld_mvar, ld_ler, ld_mvr, clr_lec, inc_lec: out std_logic;
      clr_rec, inc_rec, ld_rec, wr: out std_logic;
      ctr_addr_mux, ctr_data_mux: out std_logic_vector(1 downto 0)
   );
end ctr_path;

architecture arch of ctr_path is
   type state_type is (S0, S1, S2, S3, S4, S5, S6, S7, S8, S9, S10, S11, S12);
   signal state_reg, state_nxt: state_type;
   
begin

   -- state register
   process(clk,reset)
   begin
      if (reset='1') then
         state_reg <= s0;
      elsif rising_edge(clk) then
         state_reg <= state_nxt;
      end if;
   end process;
   
   -- next-state and outputs logic
   process(state_reg, rx_done, tx_done, ascii_r, data_out, new_min, lec_value, rec_value)
   begin
   clr_lec <= '0';
   inc_lec <= '0';
   clr_rec <= '0';
   inc_rec <= '0';
   ld_rec <= '0';
   ld_mvar <= '0';
   ld_mvr <= '0';
   ld_ler <= '0';
   wr <= '0';
   tx_start <= '0';
   ctr_addr_mux <= "00"; -- 00: bottom (lec); 01 or 10: middle (mvar); 11: top (rec)
   ctr_data_mux <= "00"; -- 00: bottom (UART R); 01 or 10: middle (mvr); 11: top (data_out)
   state_nxt <= state_reg;
   
      case state_reg is
         when s0 =>
            clr_lec <= '1';
			clr_rec <= '1';
            state_nxt <= s1;
            
         when S1 =>
                                  -- sel addr from left elements cnt
            if (rx_done='1') then
               wr <= '1';
 			   if (ascii_r=x"0D") then  -- Enter key?
				   clr_lec <= '1';
				   state_nxt <= S2;
			   else
			       inc_lec <= '1';
 			   end if;
			end if;
			
         when S2 =>
                                  -- sel addr from left elements cnt
            ld_rec <= '1';
            ld_mvr <= '1';
            state_nxt <= S3;

		 when S3 =>
		    ld_mvar <= '1';
            state_nxt <= S4;

         when S4 =>
            inc_rec <= '1';
            state_nxt <= S5;

		 when S5 =>  
		    ctr_addr_mux <= "11"; -- sel addr from right elements cnt
		    if (new_min = '1') then
		        ld_mvar <= '1';
		        ld_mvr <= '1';
		        if (unsigned(rec_value) = N-1) then  -- right elements cnt reached end of array?
		            state_nxt <= S6;
		        else
		            state_nxt <= S4;
		        end if;
		    else
		        if (unsigned(rec_value) = N-1) then
		            state_nxt <= S6;
		        else
		            state_nxt <= S4;
		        end if;
		    end if;
  
             
         when S6 =>
                                     -- sel addr from left elements cnt
            if (new_min /= '1') then -- new_min/=1 means that current left element (data_out) >= min_value
                ld_ler <= '1';
                state_nxt <= S7;
            else
                state_nxt <= S9;
            end if;

		 when S7 =>
		    ctr_addr_mux <= "01"; -- sel addr from min value addr reg
		    ctr_data_mux <= "11"; -- sel data_in from left element value
		    wr <= '1';
		    state_nxt <= S8;

         when S8 =>
                                  -- sel addr from left elements cnt
		    ctr_data_mux <= "01"; -- sel data_in from min value reg
		    wr <= '1';
		    state_nxt <= S9;

		 when S9 =>
		    if (unsigned(lec_value) = N-2) then
		        state_nxt <= S10;
		    else
		        inc_lec <= '1';
		        state_nxt <= S2;
		    end if;

         when S10 =>
            clr_lec <= '1';
            state_nxt <= S11;

		 when S11 =>
		                          -- sel addr from left elements cnt
             if (data_out=x"0D") then
                 state_nxt <= S0;
             else
                 tx_start <= '1';
                 state_nxt <= S12;
             end if;
		 
		 when S12 =>
                                  -- sel addr from left elements cnt
             if (tx_done='1') then
                 inc_lec <= '1';
                 state_nxt <= S11;
             end if;
                 
      end case;
   end process;

end arch;