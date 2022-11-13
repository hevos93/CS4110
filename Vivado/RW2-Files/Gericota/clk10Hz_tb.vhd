----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.03.2019 17:03:29
-- Design Name: 
-- Module Name: clk8Hz_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY clk10Hz_tb IS
END clk10Hz_tb;

ARCHITECTURE behavior OF clk10Hz_tb IS 

	-- Component Declaration for the Unit Under Test (UUT)

	COMPONENT clk10Hz
	PORT(
		clk : in  STD_LOGIC;
		reset : in STD_LOGIC;
		en_in : in STD_LOGIC;
		en_out : out STD_LOGIC
		);
	END COMPONENT;

	--Inputs
	signal clk : STD_LOGIC := '0';
	signal reset : STD_LOGIC := '1';
	signal en_in : STD_LOGIC := '0';

	--Outputs
	signal en_out : STD_LOGIC;
	
	-- Clock period definitions
	constant clk_period : time := 8 ns;

begin

	-- Instantiate the Unit Under Test (UUT)
uut: clk10Hz PORT MAP (
				clk => clk,
				reset => reset,
				en_in => en_in,
				en_out => en_out
				);

	-- Clock process definitions
clk_process :process
begin
	clk <= '0';
	wait for clk_period/2;
	clk <= '1';
	wait for clk_period/2;
end process;

	-- Stimulus process
stim_proc: process
begin	
	reset <= '1';
	en_in <= '0';

	-- hold reset state for 100 ns.
	wait for 100 ns;	
	reset <= '0';

	wait for clk_period*10;

	-- insert stimulus here
	
	wait for 1 us;
	en_in <= '1';

	wait;
end process;

END;


