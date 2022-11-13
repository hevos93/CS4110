----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.03.2019 11:31:29
-- Design Name: 
-- Module Name: counter_tb - Behavioral
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

ENTITY counter_tb IS
END counter_tb;
 
ARCHITECTURE behavior OF counter_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT counter
    PORT(
         clk : in  STD_LOGIC;
         reset : in STD_LOGIC;
         en : in STD_LOGIC; 
         direction : in STD_LOGIC;
         count_out : out STD_LOGIC_VECTOR(3 downto 0)
        );
    END COMPONENT;
    
   --Inputs
   signal clk : STD_LOGIC := '0';
   signal reset : STD_LOGIC := '1';
   signal en : STD_LOGIC := '0';
   signal direction : STD_LOGIC := '0';

   --Outputs
   signal count_out : STD_LOGIC_VECTOR(3 downto 0);

   -- Clock period definitions
   constant clk_period : time := 8 ns;
 
BEGIN
   -- Instantiate the Unit Under Test (UUT)
   uut: counter PORT MAP (
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
      
      -- hold reset state for 100 ns
      wait for 100 ns;
      reset <= '0';
      
	 -- enable counter 200 ns after reset
      wait for 200 ns;
      en <= '1';

      -- insert stimulus here 
      
      DIRECTION <= '1' after 200 ns;

      wait;
   end process;
END; 
