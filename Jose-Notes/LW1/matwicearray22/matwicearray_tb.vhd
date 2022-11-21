-- USN VHDL 101 course
-- template for test bench development
-- author | date

library ieee;
use ieee.std_logic_1164.all;

entity tb_matwicearray is
end tb_matwicearray;

architecture tb of tb_matwicearray is

    component matwicearray
        port (clk, rst : in std_logic;
              a, b, c : in std_logic_vector(7 downto 0)
			  );
    end component;

    signal clk, rst : std_logic;
    signal a, b, c : std_logic_vector(7 downto 0);

    constant clk_period : time := 10 ns;

begin

    uut : matwicearray
    port map ( clk => clk, rst => rst, 
               a=>a, b=>b, c=>c );

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
         rst <= '1';
         a <= "00000011";
         b <= "00000010";
         c <= "00000001";
         wait for clk_period;
         rst <= '0';
         wait for clk_period*20;
                 
      end process ;

end tb;
