LIBRARY ieee;
USE ieee.std_logic_1164.ALL; 
USE ieee.numeric_std.all;

ENTITY add4bits_tb IS 
END add4bits_tb;

ARCHITECTURE behavior OF add4bits_tb IS

-- Component Declaration for the Unit Under Test (UUT)
COMPONENT add4bits
Port ( opA, opB: in STD_LOGIC_VECTOR (3 downto 0);
           resC: out STD_LOGIC_VECTOR (4 downto 0)
	 ); 
END COMPONENT;

signal opA, opB: STD_LOGIC_VECTOR (3 downto 0); -- module inputs
signal resC: STD_LOGIC_VECTOR (4 downto 0); -- module outputs

BEGIN
    -- Instantiate the Unit Under Test (UUT) 
    uut: add4bits PORT MAP (
        opA => opA, opB => opB, 
        resC => resC
    );

-- Stimulus process 
stim: process
begin 
    opA  <= "0001";
    opB  <= "0011";
    wait for 30 ns;

    opA  <= "0010";
    wait for 30 ns;

    opA  <= "0011";
    wait for 30 ns;

    opA  <= "0100";
    wait for 30 ns;

    opA  <= "0101";
    wait for 30 ns;

end process; 
END;