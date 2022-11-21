----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.03.2019 18:07:11
-- Design Name: 
-- Module Name: top_counter - Behavioral
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


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top_counter is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           en : in STD_LOGIC;
           direction : in STD_LOGIC;
           count_out : out STD_LOGIC_VECTOR (3 downto 0));
end top_counter;

architecture Behavioral of top_counter is

COMPONENT clk10Hz
	PORT(
		clk : in  STD_LOGIC;
		reset : in  STD_LOGIC;
		en_in : in  STD_LOGIC; 
		en_out : out  STD_LOGIC
		);
END COMPONENT;
	
COMPONENT counter
	PORT(
		clk : in  STD_LOGIC;
		reset : in  STD_LOGIC;
		en : in  STD_LOGIC;
		direction : in  STD_LOGIC;          
		count_out : out STD_LOGIC_VECTOR (3 downto 0)
		);
END COMPONENT;

signal en_out : STD_LOGIC := '0';

begin

Inst_clk10Hz: clk10Hz PORT MAP(
					clk => clk,
					reset => reset,
					en_in => en,
					en_out => en_out
					);

	Inst_counter: counter PORT MAP(
					clk => clk,
					reset => reset,
					en => en_out,
					direction => direction,
					count_out => count_out
					);

end Behavioral;
