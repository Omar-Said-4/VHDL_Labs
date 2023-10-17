Library ieee;
Use ieee.std_logic_1164.all;

entity D is
GENERIC (n : integer := 8);
PORT(
  A : IN std_logic_vector (n-1 DOWNTO 0);
  SEL : IN std_logic_vector (1 DOWNTO 0);
  F : OUT std_logic_vector (n-1 DOWNTO 0);
  Cout: OUT std_logic;
  Cin : IN std_logic
);
end entity;
ARCHITECTURE ArchD OF  D IS
BEGIN
 F <= '0'&A(n-1 DOWNTO 1) WHEN SEL = "00"
        ELSE
        A(0)&A(n-1 DOWNTO 1) WHEN SEL = "01"
        ELSE
        Cin&A(n-1 DOWNTO 1) WHEN SEL = "10"
        ELSE
        A(n-1)&A(n-1 DOWNTO 1) WHEN SEL = "11";
Cout <= A(0) WHEN SEL = "00"
        ELSE
        A(0) WHEN SEL = "01"
        ELSE
        A(0) WHEN SEL = "10";
END ARCHITECTURE;



