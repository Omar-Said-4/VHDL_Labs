LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY B IS
GENERIC (n : integer := 8);
    PORT (
     A,B : IN std_logic_vector (n-1 DOWNTO 0);
     SEL : IN std_logic_vector (1 DOWNTO 0);
     F : OUT std_logic_vector (n-1 DOWNTO 0);
     Cout: OUT std_logic;
     Cin : IN std_logic
    );
END ENTITY B;

ARCHITECTURE ArchB OF B IS
BEGIN
    F <= A OR B WHEN SEL = "00"
        ELSE
        A AND B WHEN SEL = "01"
        ELSE
        A NOR B WHEN SEL = "10"
        ELSE
        NOT A WHEN SEL = "11";
    COUT <= '0';
END ARCHITECTURE;
