----------------------------------------------------------------------------------
-- Top design module 
----------------------------------------------------------------------------------
library IEEE; 
use IEEE.STD_LOGIC_1164.ALL;

entity napoleon is
    port ( 
        clk, rst, rx: in std_logic;
		tx: out std_logic
        );
end napoleon;

architecture arch of napoleon is
    signal stick, rx_done, tx_start, tx_done, wr: std_logic;
    signal rom_cnt_clr, rom_cnt_inc, ram_cnt_clr, ram_cnt_inc: std_logic;
    signal UART_R: std_logic_vector(7 downto 0);
    signal rom_addr: std_logic_vector(4 downto 0);
    signal cipher_in_key, cipher_in_uart_r: std_logic_vector(7 downto 0);
    signal ram_din, ram_dout: std_logic_vector(7 downto 0);
    signal ram_addr: std_logic_vector(9 downto 0);
    

----------------------------------------------------------------------------------
begin

-- module 1
    mod_m_cnt: entity work.mod_m_counter(arch)
        port map (  clk=>clk, reset=>rst, max_tick=>stick );

-- module 2 
    uartr: entity work.uart_rx(arch)
        port map (  clk=>clk, reset=>rst, rx=>rx,
                    s_tick=>stick, rx_done_tick=>rx_done, dout=>UART_R );
					
-- module 3
    rom_cnt: entity work.cnt_rom(arch)
        port map (  clk=>clk, reset=>rst, syn_clr=>rom_cnt_clr, 
                    load=>'0', en=>rom_cnt_inc, up=>'1', 
                    d=>(others=>'0'), max_tick=>open, min_tick=>open, q=>rom_addr );
					
-- module 4
    rom: entity work.rom(arch)
        port map (  addr=>rom_addr, data=>cipher_in_key );
					
-- module 5
    cipher: entity work.cipher(arch)
        port map (  ascii_r=>UART_R, key=>cipher_in_key, cphr_out=>ram_din );
					
-- module 6
    ram_cnt: entity work.counter(arch)
        port map (  clk=>clk, reset=>rst, syn_clr=>ram_cnt_clr, 
                    inc=>ram_cnt_inc, q=>ram_addr );
                    					
-- module 7
    ram: entity work.ram(arch)
        port map (  clk=>clk, write=>wr, counter_in=>ram_addr, 
                    ram_in=>ram_din, ram_out=>ram_dout );
                    					
-- module 8
    uartt: entity work.uart_tx(arch)
        port map (  clk=>clk, reset=>rst, tx_start=>tx_start, s_tick=>stick, 
                    din=>ram_dout, tx_done_tick=>tx_done, tx=>tx );                    
                    					
-- module 9
    ctr_path: entity work.fsm(arch)
        port map (  clk=>clk, reset=>rst, rx_done=>rx_done, tx_start=>tx_start, tx_done=>tx_done, wr=>wr,
                    ASCII_R=>UART_R, ASCII_T=>ram_dout, rom_clr=>rom_cnt_clr, 
                    rom_inc=>rom_cnt_inc, ram_clr=>ram_cnt_clr, ram_inc=>ram_cnt_inc );
                        
end arch;