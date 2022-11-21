----------------------------------------------------------------------------------
-- Top design module 
----------------------------------------------------------------------------------
library IEEE; 
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity mafirfsmd is
    port ( 
        clk, rst: in std_logic;
		rx: in std_logic;
        tx: out std_logic
        );
end mafirfsmd;

architecture arch of mafirfsmd is
    signal s_tick, rx_done, tx_start, tx_done: std_logic;
    signal ld_reg_xn1, ld_reg_xn2, ld_reg_xn3, ld_reg_xn4, ld_reg_xn5: std_logic;
    signal mux_ctr: std_logic_vector(1 downto 0);
    signal uart_r_dout, uart_t_din, y: std_logic_vector(7 downto 0);

----------------------------------------------------------------------------------
begin

-- module 1
    UART_stick_cnt: entity work.mod_m_counter(arch)
        port map ( clk=>clk, reset=>rst, max_tick=>s_tick );

-- module 2
    UART_R: entity work.uart_rx(arch)
        port map ( clk=>clk, reset=>rst, rx=>rx, s_tick=>s_tick, 
                    rx_done_tick => rx_done, dout=>uart_r_dout );

-- module 3
    fir_filter: entity work.FIRfilter(arch)
        port map ( clk=>clk, rst=>rst, ld_reg_xn1=>ld_reg_xn1, ld_reg_xn2=>ld_reg_xn2, 
                   ld_reg_xn3=>ld_reg_xn3, ld_reg_xn4=>ld_reg_xn4, ld_reg_xn5=>ld_reg_xn5, 
                   xn=>uart_r_dout, y=>y );

-- module 6
    UART_T: entity work.uart_tx(arch)
        port map ( clk=>clk, reset=>rst, tx_start=>tx_start, s_tick=>s_tick, 
                   din=>uart_t_din, tx_done_tick=>tx_done, tx=>tx );

-- module 6
    ctr_path: entity work.ctr_path(arch)
        port map ( clk=>clk, rst=>rst, rx_done=>rx_done, 
                   ld_reg_xn1=>ld_reg_xn1, ld_reg_xn2=>ld_reg_xn2, 
                   ld_reg_xn3=>ld_reg_xn3, ld_reg_xn4=>ld_reg_xn4, ld_reg_xn5=>ld_reg_xn5, 
                   mux_ctr=>mux_ctr, tx_start=>tx_start, tx_done=>tx_done );

-- other statements at the top level
uart_t_din <= y when mux_ctr="00" else              -- FIR filter output
              "00001101" when mux_ctr="01" else     -- Line feed
              "00001010" when mux_ctr="10" else     -- Carriage return
              "00100000";                           -- space

end arch;