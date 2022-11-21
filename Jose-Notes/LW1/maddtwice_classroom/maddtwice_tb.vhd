-- USN VHDL 101 course
-- template for test bench development
-- author | date

library ieee;
use ieee.std_logic_1164.all;

entity tb_maddtwice is
end tb_maddtwice;

architecture tb of tb_maddtwice is

    component maddtwice
        port (clk, rst : in std_logic;
              x, a, b, c   : in std_logic_vector(7 downto 0);
              y   : out std_logic_vector(16 downto 0)
			  );
    end component;

    signal clk, rst : std_logic;
	signal x, a, b, c  : std_logic_vector(7 downto 0); -- module inputs
	signal y   : std_logic_vector(16 downto 0); -- module outputs

    constant clk_period : time := 10 ns;

begin

    uut : maddtwice
    port map (clk => clk, rst => rst,
              x => x, a => a, b => b, c => c, y => y );

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
         x <= "00000011";
         a <= "00000001";
         b <= "00000010";
         c <= "00000011";
         rst <= '1';      
         wait for clk_period;
         rst <= '0';      

         wait for clk_period*10;
        
      end process ;

end tb;
