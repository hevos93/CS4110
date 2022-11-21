----------------------------------------------------------------------------------
-- "Subtop" design module (for the FIR filter alone) 
----------------------------------------------------------------------------------
library IEEE; 
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity FIRfilter is
    port ( 
        clk, rst, ld_reg_xn1, ld_reg_xn2, ld_reg_xn3, ld_reg_xn4, ld_reg_xn5: in std_logic;
		xn: in std_logic_vector(7 downto 0);
        y:  out std_logic_vector(7 downto 0)
        );
end FIRfilter;

architecture arch of FIRfilter is
    signal reg_xn1_out, reg_xn2_out, reg_xn3_out, reg_xn4_out, reg_xn5_out: std_logic_vector(7 downto 0);

----------------------------------------------------------------------------------
begin

-- module 1
    reg_xn1: entity work.fir_reg(arch)
        port map ( clk=>clk, reset=>rst, load=>ld_reg_xn1, d=>xn, q=>reg_xn1_out );

-- module 2 
    reg_xn2: entity work.fir_reg(arch)
        port map ( clk=>clk, reset=>rst, load=>ld_reg_xn2, d=>reg_xn1_out, q=>reg_xn2_out );

-- module 3 
    reg_xn3: entity work.fir_reg(arch)
        port map ( clk=>clk, reset=>rst, load=>ld_reg_xn3, d=>reg_xn2_out, q=>reg_xn3_out );

-- module 4 
    reg_xn4: entity work.fir_reg(arch)
        port map ( clk=>clk, reset=>rst, load=>ld_reg_xn4, d=>reg_xn3_out, q=>reg_xn4_out );  

-- module 5 
    reg_xn5: entity work.fir_reg(arch)
        port map ( clk=>clk, reset=>rst, load=>ld_reg_xn5, d=>reg_xn4_out, q=>reg_xn5_out );
              
-- other statements at the top level
y <= std_logic_vector(unsigned(xn)/6 + unsigned(reg_xn1_out)/6 + unsigned(reg_xn2_out)/6 + 
                      unsigned(reg_xn3_out)/6 + unsigned(reg_xn4_out)/6 + unsigned(reg_xn5_out)/6);

end arch;