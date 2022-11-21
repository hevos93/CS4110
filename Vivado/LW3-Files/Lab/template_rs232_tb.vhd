----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Erica Fegri
-- 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity napoleon_tb is
   -- Port ();
end napoleon_tb;

architecture arch of napoleon_tb is
constant clk_period : time := 10 ns;
constant bit_period : time := 52083ns; -- time for 1 bit.. 1bit/19200bps = 52.08 us

constant rx_data_ascii_5: std_logic_vector(7 downto 0) := x"35"; -- receive 5
-- ...

Component napoleon
Port ( reset, clk: in std_logic;
           rx:      in std_logic;
           tx:     out std_logic);
end Component;

signal clk, reset: std_logic;
signal srx, stx: std_logic;

begin

    uut: napoleon
    Port Map(clk => clk, reset => reset, 
              rx => srx, tx => stx);
    
    clk_process: process 
            begin
               clk <= '0';
               wait for clk_period/2;
               clk <= '1';
               wait for clk_period/2;
            end process; 
        
     stim: process
        begin
        reset <= '1';
        wait for clk_period*2;
        reset <= '0';
        wait for clk_period*2;
        
        -- Test ASCII char 5
                srx <= '0'; -- start bit = 0
                wait for bit_period;
                for i in 0 to 7 loop
                    srx <= rx_data_ascii_5(i);   -- 8 data bits
                    wait for bit_period;
                end loop;
                srx <= '1'; -- stop bit = 1
                wait for 1ms;

	-- ...
      
        end process;

end arch;
