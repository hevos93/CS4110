library ieee;
use ieee.std_logic_1164.all;
entity fsm is
   port(
      clk, reset: in std_logic;
      rx_done, tx_done: in std_logic;
      wr, tx_start: out std_logic;
      ASCII_R, ASCII_T: in std_logic_vector(7 downto 0);
--      rom_clr_inc, ram_clr_inc: out std_logic_vector(1 downto 0)
      rom_clr, rom_inc, ram_clr, ram_inc: out std_logic
   );
end fsm;


architecture arch of fsm is
   type eg_state_type is (S0, S1, S2, S3);
   signal state_reg, state_next: eg_state_type;
begin
   -- state register
   process(clk,reset)
   begin
      if (reset='1') then
         state_reg <= s0;
      elsif (clk'event and clk='1') then
         state_reg <= state_next;
      end if;
   end process;
   -- next-state/output logic
   process(state_reg, rx_done, tx_done, ASCII_R, ASCII_T)
   begin
      state_next <= state_reg;  -- default back to same state
      wr <= '0';   -- default 0
      tx_start <= '0';   -- default 0
      rom_clr <= '0';
      rom_inc <= '0';
      ram_clr <= '0';
      ram_inc <= '0';
--      rom_clr_inc <= "00";   -- default 00
--      ram_clr_inc <= "00";   -- default 00
      
      case state_reg is
         when S0 =>
              rom_clr<='1';
              ram_clr<='1';
--            rom_clr_inc <= "10";
--            ram_clr_inc <= "10";
            state_next <= S1;
            
         when S1 =>
            if rx_done='1' then
                if ((ascii_r >= x"41" and ascii_r <= x"5A") or 
			       (ascii_r >= x"61" and ascii_r <= x"7A") or 
			           ascii_r = x"20" or ascii_r = x"0D") then
                    wr<='1';
                    if (ascii_r = x"0D") then
                        ram_clr<='1';
--                       ram_clr_inc <= "10";
                       state_next <= S2;
                    else
                        rom_inc<='1';
                        ram_inc<='1';
--                        rom_clr_inc <= "01";
--                        ram_clr_inc <= "01";
                    end if;
                end if;
            end if;    
            
         when S2 =>
            if (ascii_t = x"0D") then
                state_next <= S0;
            else
                tx_start <= '1';
                state_next <= S3;
            end if;
            
         when S3 =>
            if tx_done='1' then
                ram_inc<='1';
--                ram_clr_inc <= "01";
                state_next <= S2;
            end if;
      end case;
   end process;
end arch;