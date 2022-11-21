----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04.03.2019 19:05:11
-- Design Name: 
-- Module Name: counter - Behavioral
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

entity counter is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           en : in STD_LOGIC; 
           direction : in STD_LOGIC;
           count_out : out STD_LOGIC_VECTOR (3 downto 0));
end counter;

architecture Behavioral of counter is

signal count_int : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');

begin

process (clk)
begin
   if clk='1' and clk'event then
      if reset = '1' then
         count_int <= (others => '0');
      elsif en = '1' then
         if direction = '1' then
            count_int <= STD_LOGIC_VECTOR (SIGNED (count_int) + 1);
         else
            count_int <= STD_LOGIC_VECTOR (SIGNED (count_int) - 1);
         end if;
      end if;
   end if;
end process;

count_out <= count_int;

end Behavioral;
