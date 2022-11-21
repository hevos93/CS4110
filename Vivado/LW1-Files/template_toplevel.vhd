----------------------------------------------------------------------------------
-- Top design module 
----------------------------------------------------------------------------------
library IEEE; 
use IEEE.STD_LOGIC_1164.ALL;

entity top_module is
    port ( 
        clk, rst: in std_logic;
		x, a, b, c: in std_logic_vector(7 downto 0);
        y:   out std_logic_vector(17 downto 0)
        );
end top_module;

architecture arch of top_module is
    signal mult_out: std_logic_vector(16 downto 0);  
    signal mux_ab_in0, mux_ab_out, adder_out, int_result: std_logic_vector(16 downto 0);
    signal mux_ab_in1, mux: std_logic_vector(15 downto 0);
    signal ctr_mux_above, ctr_mux_below, load_reg_temp, clr_reg_temp, load_reg_out: std_logic
    

----------------------------------------------------------------------------------
begin

-- module 1
    reg_temp: entity work.register(arch)
        port map (clk=>clk, reset=>rst, load=>load_reg_tmp, clr=>clr_reg_temp, d=>adder_out, q=>int_result);

-- module 2 
    reg_out: entity work.register(arch)
        port map (clk=>clk, clr=>'0', reset=>rst, load=>load_reg_out, d=>int_result, q=>y);
					
-- module 3
    ctl_path: entity work.template_fsm(arch)
        port map (  clk=>clk, rst=>rst, ctr_mux_above=>ctr_mux_ab ctr_mux_below=>ctr_mux_below);

-- other statements at the top level
... <= ...;
    
end arch;