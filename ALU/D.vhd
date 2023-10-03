Library ieee;
Use ieee.std_logic_1164.all;

entity D is
port(
  A,B : IN std_logic_vector (7 DOWNTO 0);
  SEL : IN std_logic_vector (3 DOWNTO 0);
  F : OUT std_logic_vector (7 DOWNTO 0);
  Cout: OUT std_logic;
  Cin : IN std_logic
);
end entity;
ARCHITECTURE ArchD OF  D IS
BEGIN
 F <= '0'&A(7 DOWNTO 1) WHEN SEL = "1100"
        ELSE
        A(0)&A(7 DOWNTO 1) WHEN SEL = "1101"
        ELSE
        Cin&A(7 DOWNTO 1) WHEN SEL = "1110"
        ELSE
        A(7)&A(7 DOWNTO 1) WHEN SEL = "1111";
Cout <= A(0) WHEN SEL = "1100"
        ELSE
        A(0) WHEN SEL = "1101"
        ELSE
        A(0) WHEN SEL = "1110";
END ARCHITECTURE;


