LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

entity A is
  PORT(
    A,B : IN std_logic ;
    SEL : IN std_logic_vector (1 DOWNTO 0);
    F : OUT std_logic ;
    Cout: OUT std_logic;
    Cin : IN std_logic;
    BFLAG: IN STD_LOGIC
 );
 END ENTITY A;
 ARCHITECTURE ArchA OF A IS
 BEGIN
  with SEL select
    F <= A xor Cin when "00",
         A xor B xor Cin when "01",
         A xor not B xor  Cin when "10",
         (B and BFLAG) or (not BFLAG and (not A xor Cin)) when "11",
         '0' when Others;

  with SEL select
    Cout <= (Cin AND (A)) when "00",
        (A AND B) or (Cin AND (A XOR B)) when "01",
        (A AND not B) or (Cin AND (A XOR not B)) when "10",
        ('0' and BFLAG) or (not BFLAG and (A or (Cin AND not A))) when "11",
        '0' when Others;
 END ARCHITECTURE;

