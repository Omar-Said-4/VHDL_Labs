Library ieee;
Use ieee.std_logic_1164.all;

entity C is
port(
  A,B : IN std_logic_vector (7 DOWNTO 0);
  SEL : IN std_logic_vector (3 DOWNTO 0);
  F : OUT std_logic_vector (7 DOWNTO 0);
  Cout: OUT std_logic;
  Cin : IN std_logic
);
end entity;
ARCHITECTURE ArchC OF  C IS
BEGIN
 F <= A(6 DOWNTO 0)&'0' WHEN SEL = "1000"
        ELSE
        A(6 DOWNTO 0) & A(7) WHEN SEL = "1001"
        ELSE
        A(6 DOWNTO 0)&Cin WHEN SEL = "1010"
        ELSE
        "00000000" WHEN SEL = "1011";
 COUT <= A(7) WHEN SEL = "1000"
        ELSE
        A(7) WHEN SEL = "1001"
        ELSE
        A(7) WHEN SEL = "1010"
        ELSE
       '0' WHEN SEL = "1011";
END ARCHITECTURE;

