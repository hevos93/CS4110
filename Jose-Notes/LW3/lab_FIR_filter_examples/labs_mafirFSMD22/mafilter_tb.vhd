----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Erica Fegri
-- time to snd/rcv 11 bits: ca. 573 us
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mafirfsmd_tb is
   -- Port ();
end mafirfsmd_tb;

architecture arch of mafirfsmd_tb is
constant clk_period : time := 10 ns;
constant bit_period : time := 52083ns; -- time for 1 bit.. 1bit/19200bps = 52.08 us

constant rx_data_ascii_A: std_logic_vector(7 downto 0) := x"41"; -- receive A
constant rx_data_ascii_z: std_logic_vector(7 downto 0) := x"7A"; -- receive z
constant rx_data_ascii_enter: std_logic_vector(7 downto 0) := x"0D"; -- receive enter

Component mafirfsmd
Port ( rst, clk, rx: in std_logic;
       tx: out std_logic);
end Component;

signal clk, rst: std_logic;
signal srx, stx: std_logic;

begin

    uut: mafirfsmd
    Port Map(clk => clk, rst => rst, 
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
        rst <= '1';
        wait for clk_period*2;
        rst <= '0';
        wait for clk_period*2;
        
        -- Test ASCII char A
                srx <= '0'; -- start bit = 0
                wait for bit_period;
                for i in 0 to 7 loop
                    srx <= rx_data_ascii_A(i);   -- 8 data bits
                    wait for bit_period;
                end loop;
                srx <= '1'; -- stop bit = 1
                wait for 2.5ms;
        
        -- Test ASCII char A
                srx <= '0'; -- start bit = 0
                wait for bit_period;
                for i in 0 to 7 loop
                    srx <= rx_data_ascii_A(i);   -- 8 data bits
                    wait for bit_period;
                end loop;
                srx <= '1'; -- stop bit = 1
                wait for 2.5ms;

        -- Test ASCII char A
                srx <= '0'; -- start bit = 0
                wait for bit_period;
                for i in 0 to 7 loop
                    srx <= rx_data_ascii_A(i);   -- 8 data bits
                    wait for bit_period;
                end loop;
                srx <= '1'; -- stop bit = 1
                wait for 2.5ms;

        -- Test ASCII char A
                srx <= '0'; -- start bit = 0
                wait for bit_period;
                for i in 0 to 7 loop
                    srx <= rx_data_ascii_A(i);   -- 8 data bits
                    wait for bit_period;
                end loop;
                srx <= '1'; -- stop bit = 1
                wait for 2.5ms;

        -- Test ASCII char A
                srx <= '0'; -- start bit = 0
                wait for bit_period;
                for i in 0 to 7 loop
                    srx <= rx_data_ascii_A(i);   -- 8 data bits
                    wait for bit_period;
                end loop;
                srx <= '1'; -- stop bit = 1
                wait for 2.5ms;

        -- Test ASCII char A
                srx <= '0'; -- start bit = 0
                wait for bit_period;
                for i in 0 to 7 loop
                    srx <= rx_data_ascii_A(i);   -- 8 data bits
                    wait for bit_period;
                end loop;
                srx <= '1'; -- stop bit = 1
                wait for 2.5ms;
                                 
         -- Test ASCII char z
                srx <= '0'; -- start bit = 0
                wait for bit_period;
                for i in 0 to 7 loop
                    srx <= rx_data_ascii_z(i);   -- 8 data bits
                    wait for bit_period;
                end loop;
                srx <= '1'; -- stop bit = 1
                wait for 2.5ms;

 
         -- Test ASCII char z
                srx <= '0'; -- start bit = 0
                wait for bit_period;
                for i in 0 to 7 loop
                    srx <= rx_data_ascii_z(i);   -- 8 data bits
                    wait for bit_period;
                end loop;
                srx <= '1'; -- stop bit = 1
                wait for 2.5ms;
 
         -- Test ASCII char z
                srx <= '0'; -- start bit = 0
                wait for bit_period;
                for i in 0 to 7 loop
                    srx <= rx_data_ascii_z(i);   -- 8 data bits
                    wait for bit_period;
                end loop;
                srx <= '1'; -- stop bit = 1
                wait for 2.5ms;
                                                
         -- Test ASCII char z
                srx <= '0'; -- start bit = 0
                wait for bit_period;
                for i in 0 to 7 loop
                    srx <= rx_data_ascii_z(i);   -- 8 data bits
                    wait for bit_period;
                end loop;
                srx <= '1'; -- stop bit = 1
                wait for 2.5ms;

        wait;
       
        end process;

end arch;
