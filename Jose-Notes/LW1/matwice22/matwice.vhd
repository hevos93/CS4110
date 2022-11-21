----------------------------------------------------------------------------------
-- Top design module 
----------------------------------------------------------------------------------
library IEEE; 
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity matwice is
    port ( 
        clk, rst: in std_logic;
		x, a, b, c: in std_logic_vector(7 downto 0);
        y:   out std_logic_vector(16 downto 0)
        );
end matwice;

architecture arch of matwice is
    signal mul_in0, mul_in1, mux_below_in0, mux_below_in1: unsigned(7 downto 0);
    signal ctr_mux_above, ctr_mux_below, load_temp_reg, load_out_reg: std_logic;
    signal mux_below_out: unsigned(7 downto 0);
    signal  mul_out: unsigned(15 downto 0);
    signal  mux_above_out, adder_out, temp_reg_out: unsigned(16 downto 0);
    signal temp_reg_d, temp_reg_q, out_reg_d: std_logic_vector(16 downto 0);

----------------------------------------------------------------------------------
begin

-- module 1
    temp_reg: entity work.reg(arch)
        port map (  clk=>clk, reset=>rst, load=>load_temp_reg, d =>temp_reg_d, q=>temp_reg_q );

-- module 2 
    out_reg: entity work.reg(arch)
        port map (  clk=>clk, reset=>rst, load=>load_out_reg, d=>out_reg_d, q=>y );

-- module 3
    ctr_path: entity work.ctr_path(arch)
        port map (  clk=>clk, rst=>rst, ctr_mux_above=>ctr_mux_above, ctr_mux_below=>ctr_mux_below, 
                    load_temp_reg=>load_temp_reg, load_out_reg=>load_out_reg );

-- other statements at the top level
mul_in0 <= unsigned(x);
mul_in1 <= unsigned(a);
mux_below_in0 <= unsigned(b);
mux_below_in1 <= unsigned(c);
temp_reg_d <= std_logic_vector(adder_out);
temp_reg_out <= unsigned(temp_reg_q);
out_reg_d <= std_logic_vector(temp_reg_out);

mul_out <= mul_in0*mul_in1;
mux_above_out <= '0' & mul_out when (ctr_mux_above='1') else temp_reg_out;
mux_below_out <= mux_below_in1 when (ctr_mux_below='1') else mux_below_in0;
adder_out <= mux_above_out + mux_below_out;

end arch;