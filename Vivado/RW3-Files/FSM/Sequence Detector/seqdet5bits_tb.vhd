library ieee;
use ieee.std_logic_1164.all; 

entity seqdet_tb IS 
end seqdet_tb;

architecture behavior of seqdet_tb is
-- Component Declaration for the Unit Under Test (UUT)
component seqdet
port ( 
    clk, rst, din: in std_logic;
    dout: out std_logic
); 
end component;

signal clk, rst, din: std_logic; 
signal dout: std_logic;

constant clk_period : time := 10 ns;

begin
    -- Instantiate the Unit Under Test (UUT) 
    uut: seqdet port map (
        clk => clk, rst => rst, din => din, dout => dout
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

    din <= '0';
    wait for clk_period*2;
    din <= '1';
    wait for clk_period;
    din <= '0';
    wait for clk_period;
    din <= '1';
    wait for clk_period*2;
    din <= '0';
    wait for clk_period;
    din <= '1';
    wait for clk_period*2;
    din <= '0';
    wait for clk_period;
        
end process; 
end;