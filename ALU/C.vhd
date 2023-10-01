Library ieee;
Use ieee.std_logic_1164.all;

entity rotateLeftCarryOI is
port(
  A : IN std_logic_vector (7 DOWNTO 0);
  F : OUT std_logic_vector (7 DOWNTO 0);
  Cout: OUT std_logic;
  Cin : IN std_logic
);
end entity;
ARCHITECTURE arch1 OF rotateLeftCarryOI IS
BEGIN
Cout <= A(7);
F(7 DOWNTO  0) <= A(6 DOWNTO 0)&Cin;
END ARCHITECTURE;

Library ieee;
Use ieee.std_logic_1164.all;
entity ZeroF is
port(
  F : OUT std_logic_vector (7 DOWNTO 0);
  Cout: OUT std_logic
);
end entity;
ARCHITECTURE arch2 OF ZeroF IS
BEGIN
Cout <= '0';
F(7 DOWNTO  0) <= x"00";
END ARCHITECTURE;
