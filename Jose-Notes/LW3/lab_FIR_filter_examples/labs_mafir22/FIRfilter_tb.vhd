-- USN VHDL 101 course
-- template for test bench development
-- author | date

library ieee;
use ieee.std_logic_1164.all;

entity tb_FIRfilter is
end tb_FIRfilter;

architecture tb of tb_FIRfilter is

    component FIRfilter
        port (clk, rst : in std_logic;
              xn : in std_logic_vector(7 downto 0);
              y : out std_logic_vector(7 downto 0)
			  );
    end component;

    signal clk, rst : std_logic;
    signal xn : std_logic_vector(7 downto 0); -- module inputs
    signal y : std_logic_vector(7 downto 0); -- module outputs

    constant clk_period : time := 10 ns;

begin

    uut : FIRfilter
    port map (clk => clk, rst => rst,
              xn=>xn,
              y=>y);

clk_process: process 
   begin
      clk <= '0';
      wait for clk_period/2;
      clk <= '1';
      wait for clk_period/2;
   end process;

-- Stimuli process 
   stim_proc: process
      begin
         xn <= "00000101";
         rst <= '1';      
         wait for clk_period;
         rst <= '0';      
         wait for clk_period*5;
         xn <= "00000100";
         wait for clk_period;
         xn <= "00000011";
         wait for clk_period*4;
                 
      end process ;

end tb;
