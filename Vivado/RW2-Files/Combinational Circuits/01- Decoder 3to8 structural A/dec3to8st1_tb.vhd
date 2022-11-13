LIBRARY ieee;
USE ieee.std_logic_1164.ALL; 

ENTITY dec3to8_tb IS 
END dec3to8_tb;

architecture behavior OF dec3to8_tb IS

-- Component Declaration for the Unit Under Test (UUT)
COMPONENT dec3to8
PORT( 
    in2, in1, in0: in STD_LOGIC;
    out7, out6, out5, out4 : out STD_LOGIC;
    out3, out2, out1, out0 : out STD_LOGIC
); 
END COMPONENT;

signal in2, in1, in0: std_logic; -- module inputs
signal out7, out6, out5, out4 : std_logic; -- module outputs
signal out3, out2, out1, out0 : std_logic; -- module outputs

BEGIN
    -- Instantiate the Unit Under Test (UUT) 
    UUT: dec3to8 PORT MAP (
        in2 => in2, in1 => in1, in0 => in0, 
        out7 => out7, out6 => out6 , out5 => out5 , out4 => out4,
        out3 => out3, out2 => out2 , out1 => out1 , out0 => out0
    );

-- Stimulus process 
stim: process
begin 
    in2 <= '0';
    in1 <= '0';
    in0 <= '0';
    wait for 30 ns;
    
    in2 <= '0';
    in1 <= '0';
    in0 <= '1'; 
    wait for 30 ns;
    
    in2 <= '0';
    in1 <= '1';
    in0 <= '0'; 
    wait for 30 ns;
    
    in2 <= '0';
    in1 <= '1';
    in0 <= '1'; 
    wait for 30 ns;

    in2 <= '1';
    in1 <= '0';
    in0 <= '0';
    wait for 30 ns;
    
    in2 <= '1';
    in1 <= '0';
    in0 <= '1'; 
    wait for 30 ns;
    
    in2 <= '1';
    in1 <= '1';
    in0 <= '0'; 
    wait for 30 ns;
    
    in2 <= '1';
    in1 <= '1';
    in0 <= '1'; 
    wait for 30 ns;
    
    wait;
end process; 
END;