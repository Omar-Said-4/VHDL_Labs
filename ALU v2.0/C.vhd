Library ieee;
Use ieee.std_logic_1164.all;

entity C is
GENERIC (n : integer := 8);
PORT(
  A : IN std_logic_vector (n-1 DOWNTO 0);
  SEL : IN std_logic_vector (1 DOWNTO 0);
  F : OUT std_logic_vector (n-1 DOWNTO 0);
  Cout: OUT std_logic;
  Cin : IN std_logic
);
end entity;
ARCHITECTURE ArchC OF  C IS
BEGIN
 F <= A(n-2 DOWNTO 0)&'0' WHEN SEL = "00"
        ELSE
        A(n-2 DOWNTO 0) & A(n-1) WHEN SEL = "01"
        ELSE
        A(n-2 DOWNTO 0)&Cin WHEN SEL = "10"
        ELSE
       (Others => '0') WHEN SEL = "11";
 COUT <= A(n-1) WHEN SEL = "00"
        ELSE
        A(n-1) WHEN SEL = "01"
        ELSE
        A(n-1) WHEN SEL = "10"
        ELSE
       '0' WHEN SEL = "11";
END ARCHITECTURE;


