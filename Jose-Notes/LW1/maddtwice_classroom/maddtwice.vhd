----------------------------------------------------------------------------------
-- Top design module 
----------------------------------------------------------------------------------
library IEEE; 
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity maddtwice is
    port ( 
        clk, rst: in std_logic;
		x, a, b, c: in std_logic_vector(7 downto 0);
        y:   out std_logic_vector(16 downto 0)
        );
end maddtwice;

architecture arch of maddtwice is
    signal reg_temp_in, reg_temp_out, reg_out_in: std_logic_vector(16 downto 0);
    signal mult_out: unsigned(15 downto 0);  
    signal mux_ab_in0, mux_ab_out, adder_out, int_result: unsigned(16 downto 0);
    signal mux_ab_in1: unsigned(15 downto 0);
    signal mux_be_out: unsigned(7 downto 0);
    signal ctr_mux_above, ctr_mux_below, load_reg_temp, clr_reg_temp, load_reg_out: std_logic;

----------------------------------------------------------------------------------
begin

-- module 1
    reg_temp: entity work.reg_gen(arch)
        port map (  clk=>clk, reset=>rst, load=>load_reg_temp,
                    clr => clr_reg_temp, d => reg_temp_in, q => reg_temp_out );

-- module 2
    reg_out: entity work.reg_gen(arch)
        port map (  clk=>clk, reset=>rst, load=>load_reg_out,
                    clr => '0', d => reg_temp_out, q => y );
					
-- module 3
    ctr_path: entity work.ctr_path(arch)
        port map (  clk=>clk, rst=>rst, ctr_mux_above => ctr_mux_above, ctr_mux_below => ctr_mux_below, 
                    load_reg_temp=>load_reg_temp, clr_reg_temp=>clr_reg_temp, load_reg_out=>load_reg_out );

-- other statements at the top level
mult_out <= unsigned(x)*unsigned(a);
mux_ab_out <= unsigned(reg_temp_out) when ctr_mux_above='0' else '0'&mult_out;
mux_be_out <= unsigned(b) when ctr_mux_below='0' else unsigned(c);
adder_out <= mux_ab_out + mux_be_out;
reg_temp_in <= std_logic_vector(adder_out);






end arch;