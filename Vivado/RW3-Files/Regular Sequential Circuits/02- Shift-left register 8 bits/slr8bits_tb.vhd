LIBRARY ieee;
USE ieee.std_logic_1164.ALL; 

ENTITY slr8bits_tb IS 
END slr8bits_tb;

ARCHITECTURE behavior OF slr8bits_tb IS
    constant clk_period : time := 10 ns;
-- Component Declaration for the Unit Under Test (UUT)
COMPONENT slr8bits
PORT( 
    clk, rst, sin: in std_logic;
    dout: out std_logic_vector (7 downto 0)
); 
END COMPONENT;

signal clk, rst, sin: std_logic; 
signal dout: std_logic_vector (7 downto 0);

BEGIN
    -- Instantiate the Unit Under Test (UUT) 
    uut: slr8bits port map (
        clk => clk, rst => rst, sin => sin, dout => dout
    );

clk_process: process 
   begin
      clk <= '0';
      wait for clk_period/2;
      clk <= '1';
      wait for clk_period/2;
   end process;

-- Stimulus process 
stim: process
begin 
    rst <= '1';
    wait for clk_period*2;
    rst <= '0';

    sin <= '1';
    wait for clk_period;

    sin <= '0';
    wait for clk_period;

    sin <= '1';
    wait for clk_period;

    sin <= '0';
    wait for clk_period*4;      
      
end process; 
end;