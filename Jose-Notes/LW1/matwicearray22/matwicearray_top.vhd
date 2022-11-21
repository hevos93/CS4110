----------------------------------------------------------------------------------
-- Top design module 
----------------------------------------------------------------------------------
library IEEE; 
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity matwicearray is
    port ( 
        clk, rst: in std_logic;
		a, b, c: in std_logic_vector(7 downto 0)
        );
end matwicearray;

architecture arch of matwicearray is
    signal mul_in0, mul_in1, mux_below_in0, mux_below_in1: unsigned(7 downto 0);
    signal ctr_mux_above, ctr_mux_below, load_temp_reg, load_out_reg: std_logic;
    signal mux_below_out: unsigned(7 downto 0);
    signal mul_out: unsigned(15 downto 0);
    signal mux_above_out, adder_out, temp_reg_out: unsigned(16 downto 0);
    signal temp_reg_d, temp_reg_q: std_logic_vector(16 downto 0);
    
    signal rom_addr, ram_addr: std_logic_vector(1 downto 0);
    signal rom_cnt_clr, rom_cnt_inc, ram_cnt_clr, ram_cnt_inc, wr: std_logic;
    signal loop_cnt_load, loop_cnt_dec, zero: std_logic;
    signal rom_dout: std_logic_vector(7 downto 0);
    signal ram_din: std_logic_vector(16 downto 0);

----------------------------------------------------------------------------------
begin 

-- module 0a
    rom_cnt: entity work.mem_cnt(arch)
        port map ( clk=>clk, reset=>rst, syn_clr=>rom_cnt_clr, inc =>rom_cnt_inc, q=>rom_addr );
        
-- module 0b
    rom: entity work.rom(arch)
        port map ( addr=>rom_addr, data=>rom_dout );        

-- module 1
    temp_reg: entity work.reg(arch)
        port map ( clk=>clk, reset=>rst, load=>load_temp_reg, d =>temp_reg_d, q=>temp_reg_q );

-- module 2 
    loop_cnt: entity work.loop_cnt(arch)
        port map ( clk=>clk, reset=>rst, load=>loop_cnt_load, dec=>loop_cnt_dec, zero=>zero );

-- module 3
    ctr_path: entity work.ctr_path(arch)
        port map ( clk=>clk, rst=>rst, ctr_mux_above=>ctr_mux_above, ctr_mux_below=>ctr_mux_below, load_temp_reg=>load_temp_reg,
                   rom_cnt_clr=>rom_cnt_clr, rom_cnt_inc=>rom_cnt_inc, loop_cnt_load=>loop_cnt_load, loop_cnt_dec=>loop_cnt_dec,
                   zero=>zero, ram_cnt_clr=>ram_cnt_clr, ram_cnt_inc=>ram_cnt_inc, wr=>wr );

-- module 4a
    ram_cnt: entity work.mem_cnt(arch)
        port map ( clk=>clk, reset=>rst, syn_clr=>ram_cnt_clr, inc =>ram_cnt_inc, q=>ram_addr );
        
-- module 4b
    ram: entity work.xilinx_one_port_ram_sync(arch)
        port map ( clk=>clk, wr=>wr, addr=>ram_addr, din=>temp_reg_q );        

-- other statements at the top level
mul_in0 <= unsigned(rom_dout);
mul_in1 <= unsigned(a);
mux_below_in0 <= unsigned(b);
mux_below_in1 <= unsigned(c);
temp_reg_d <= std_logic_vector(adder_out);
temp_reg_out <= unsigned(temp_reg_q);

mul_out <= mul_in0*mul_in1;
mux_above_out <= '0' & mul_out when (ctr_mux_above='1') else temp_reg_out;
mux_below_out <= mux_below_in1 when (ctr_mux_below='1') else mux_below_in0;
adder_out <= mux_above_out + mux_below_out;

end arch;
