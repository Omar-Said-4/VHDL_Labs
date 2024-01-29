LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

entity FA is
  PORT(
    A,B : IN std_logic ;
    F : OUT std_logic ;
    Cout: OUT std_logic;
    Cin : IN std_logic
 );
 END ENTITY FA;
 ARCHITECTURE ArchFA OF FA IS
 BEGIN
    F <= A xor B xor Cin; 
    Cout <= (A AND B) or (Cin AND (A XOR B));       
 END ARCHITECTURE;

