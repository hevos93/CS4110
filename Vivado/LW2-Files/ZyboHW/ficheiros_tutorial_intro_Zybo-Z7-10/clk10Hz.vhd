----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.03.2019 16:59:47
-- Design Name: 
-- Module Name: clk8Hz - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity clk10Hz is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           en_in : in STD_LOGIC;
           en_out : out STD_LOGIC);
end clk10Hz;

architecture Behavioral of clk10Hz is

signal counter: INTEGER range 0 to 12500000 := 0;

begin

process (clk)
	begin

	if clk'event and clk = '1' then
		if reset = '1' then
			counter <= 0;
			en_out <= '0';

		elsif en_in = '1' then
			counter <= counter+1;

			if (counter = 12500000) then
				en_out <= '1';
				counter <= 0;
			else
				en_out <= '0';
			end if;
		end if;
	end if;

end process;

end Behavioral;
