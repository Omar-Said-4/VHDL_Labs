Library ieee;
Use ieee.std_logic_1164.all;

entity ShiftRightCout is
port(
  A : IN std_logic_vector (7 DOWNTO 0);
  F : OUT std_logic_vector (7 DOWNTO 0);
  Cout: OUT std_logic
);
end entity;
ARCHITECTURE arch3 OF ShiftRightCout IS
BEGIN
Cout <= A(0);
F(7 DOWNTO  0) <= '0'&A(7 DOWNTO 1);
END ARCHITECTURE;

Library ieee;
Use ieee.std_logic_1164.all;

entity RotateRightCout is
port(
  A : IN std_logic_vector (7 DOWNTO 0);
  F : OUT std_logic_vector (7 DOWNTO 0);
  Cout: OUT std_logic
);
end entity;
ARCHITECTURE arch4 OF RotateRightCout IS
BEGIN
Cout <= A(0);
F(7 DOWNTO  0) <= A(0)&A(7 DOWNTO 1);
END ARCHITECTURE;


Library ieee;
Use ieee.std_logic_1164.all;

entity RotateRightCoutCin is
port(
  A : IN std_logic_vector (7 DOWNTO 0);
  F : OUT std_logic_vector (7 DOWNTO 0);
  Cout: OUT std_logic;
  Cin: IN std_logic
);
end entity;
ARCHITECTURE arch5 OF RotateRightCoutCin IS
BEGIN
Cout <= A(0);
F(7 DOWNTO  0) <= Cin&A(7 DOWNTO 1);
END ARCHITECTURE;

Library ieee;
Use ieee.std_logic_1164.all;

entity ArithShift is
port(
  A : IN std_logic_vector (7 DOWNTO 0);
  F : OUT std_logic_vector (7 DOWNTO 0)
);
end entity;
ARCHITECTURE arch6 OF ArithShift IS
BEGIN
F(7 DOWNTO  0) <= A(7)&A(7 DOWNTO 1);
END ARCHITECTURE;