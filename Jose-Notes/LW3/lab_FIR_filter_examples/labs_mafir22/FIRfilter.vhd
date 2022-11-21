----------------------------------------------------------------------------------
-- Top design module 
----------------------------------------------------------------------------------
library IEEE; 
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity FIRfilter is
    port ( 
        clk, rst: in std_logic;
		xn: in std_logic_vector(7 downto 0);
        y:  out std_logic_vector(7 downto 0)
        );
end FIRfilter;

architecture arch of FIRfilter is
    signal reg_xn1_out, reg_xn2_out, reg_out_in: std_logic_vector(7 downto 0);

----------------------------------------------------------------------------------
begin

-- module 1
    reg_xn1: entity work.fir_reg(arch)
        port map ( clk=>clk, reset=>rst, d=>xn, q=>reg_xn1_out );

-- module 2 
    reg_xn2: entity work.fir_reg(arch)
        port map ( clk=>clk, reset=>rst, d=>reg_xn1_out, q=>reg_xn2_out );

-- module 3
    reg_out: entity work.fir_reg(arch)
        port map ( clk=>clk, reset=>rst, d=>reg_out_in, q=>y );

-- other statements at the top level
reg_out_in <= std_logic_vector(unsigned(xn)/3 + unsigned(reg_xn1_out)/3 + unsigned(reg_xn2_out)/3);

end arch;