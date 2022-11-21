----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.03.2019 18:09:33
-- Design Name: 
-- Module Name: top_counter_tb - Behavioral
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

ENTITY top_counter_tb IS
END top_counter_tb;

ARCHITECTURE behavior OF top_counter_tb IS 

	-- Component Declaration for the Unit Under Test (UUT)

COMPONENT top_counter
	PORT(
		clk : in STD_LOGIC;
		reset : in STD_LOGIC;
		en : in STD_LOGIC;
		direction : in STD_LOGIC;
		count_out : out STD_LOGIC_VECTOR (3 downto 0)
		);
END COMPONENT;

	--Inputs

signal clk : STD_LOGIC := '0';
signal reset : STD_LOGIC := '1';
signal en : STD_LOGIC := '0';
signal direction : STD_LOGIC := '0';

	--Outputs

signal count_out : STD_LOGIC_VECTOR (3 downto 0);

	-- Clock period definitions

constant clk_period : time := 8 ns;

begin

	-- Instantiate the Unit Under Test (UUT)
uut: top_counter PORT MAP (
					clk => clk,
					reset => reset,
					en => en,
					direction => direction,
					count_out => count_out
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
	en <= '0';
	direction <= '0';
	
	-- hold reset state for 100 ns.

	wait for 100 ns;	

	reset <= '0';

	wait for clk_period*10;

	-- insert stimulus here 

	wait for 200 ms;	

	en <= '1';

	wait for 400 ms;

	direction <= '1';

	wait;

end process;

END;

