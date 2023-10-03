LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY B IS
    PORT (
     A,B : IN std_logic_vector (7 DOWNTO 0);
     SEL : IN std_logic_vector (3 DOWNTO 0);
     F : OUT std_logic_vector (7 DOWNTO 0);
     Cout: OUT std_logic;
     Cin : IN std_logic
    );
END ENTITY B;

ARCHITECTURE ArchB OF B IS
BEGIN
    F <= A OR B WHEN SEL = "0100"
        ELSE
        A AND B WHEN SEL = "0101"
        ELSE
        A NOR B WHEN SEL = "0110"
        ELSE
        NOT A WHEN SEL = "0111";
    COUT <= '0';
END ARCHITECTURE;
