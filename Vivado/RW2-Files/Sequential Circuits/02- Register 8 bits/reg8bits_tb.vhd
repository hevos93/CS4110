LIBRARY ieee;
USE ieee.std_logic_1164.ALL; 

ENTITY reg8bits_tb IS 
END reg8bits_tb;

ARCHITECTURE behavior OF reg8bits_tb IS
    constant clk_period : time := 10 ns;
-- Component Declaration for the Unit Under Test (UUT)
COMPONENT reg8bits
PORT( 
    clk: in std_logic;
    ffin: in std_logic_vector (7 downto 0);
    ffout: out std_logic_vector (7 downto 0)
); 
END COMPONENT;

signal clk: std_logic; 
signal ffin, ffout: std_logic_vector (7 downto 0);

BEGIN
    -- Instantiate the Unit Under Test (UUT) 
    uut: reg8bits port map (
        clk => clk, ffin => ffin, ffout => ffout
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
    ffin <= "00001111";
    wait for clk_period;

    ffin <= "01010101";
    wait for clk_period;

    ffin <= "10101010";
    wait for clk_period;

    ffin <= "11110000";
    wait for clk_period;

end process; 
END;