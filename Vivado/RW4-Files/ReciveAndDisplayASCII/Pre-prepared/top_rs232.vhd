----------------------------------------------------------------------------------
-- Top design module 
----------------------------------------------------------------------------------
library IEEE; 
use IEEE.STD_LOGIC_1164.ALL;

entity top_rs232 is
    port ( 
        clk, rst, rx : in std_logic;
        led :   out std_logic_vector(7 downto 0)
        );
end top_rs232;

architecture arch of top_rs232 is
    signal s_tick, rx_done_tick:    std_logic;
    signal led_reg, led_nxt, dout:  std_logic_vector(7 downto 0);   

----------------------------------------------------------------------------------
begin

-- Baud generator
    Baud_Generator: entity work.mod_m(arch)
        port map (  clk=>clk, rst=>rst, to_s_tick=>s_tick );

-- UART 
    UART: entity work.uart(arch)
        port map (  clk=>clk, rst=>rst, rx=>rx, to_dout=>dout,
                    from_s_tick=>s_tick, rx_done_tick=>rx_done_tick );

-- led driver register

    process(clk, rst) begin
        if rst = '1' then
            led_reg <= (others=>'0'); -- all leds off
        elsif rising_edge(clk) then
            led_reg <= led_nxt;
        end if;
    end process;

    process (rx_done_tick)
    begin
        if (rx_done_tick='1') then led_nxt <= dout;
        else led_nxt <= led_reg;
        end if;
    end process;
    
    led <= led_reg;
    
end arch;