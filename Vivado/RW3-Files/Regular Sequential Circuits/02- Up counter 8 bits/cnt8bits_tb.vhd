LIBRARY ieee;
USE ieee.std_logic_1164.ALL; 

ENTITY cnt8bits_tb IS 
END cnt8bits_tb;

ARCHITECTURE behavior OF cnt8bits_tb IS
    constant clk_period : time := 10 ns;
-- Component Declaration for the Unit Under Test (UUT)
COMPONENT cnt8bits
PORT( 
    clk, rst, up: in std_logic;
    dout: out std_logic_vector (7 downto 0)
); 
END COMPONENT;

signal clk, rst, up: std_logic; 
signal dout: std_logic_vector (7 downto 0);

BEGIN
    -- Instantiate the Unit Under Test (UUT) 
    uut: cnt8bits port map (
        clk => clk, rst => rst, up => up, dout => dout
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

    up <= '1';
    wait for clk_period*10;

    up <= '0';
    wait for clk_period*10;

end process; 
END;