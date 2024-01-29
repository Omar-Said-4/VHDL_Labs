library IEEE;
USE IEEE.std_logic_1164.all;
USE ieee.numeric_std.ALL;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use std.textio.all;
entity alu_tb is
end alu_tb;
architecture Behavioral of alu_tb is
    COMPONENT ALU IS
    GENERIC (n : integer := 8);
    PORT (
        Cin : IN STD_LOGIC;
        A_ALU, B_ALU : IN STD_LOGIC_VECTOR(n-1 DOWNTO 0);
        SEL : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        F : OUT STD_LOGIC_VECTOR(n-1 DOWNTO 0);
        Cout : OUT STD_LOGIC
    );
    END COMPONENT;
    signal tCout, tCin: std_logic;
    signal tA, tB, tF: std_logic_vector(7 DOWNTO 0);
    signal tSEL: std_logic_vector(3 DOWNTO 0);
    FUNCTION VectorToString(V: std_logic_vector) RETURN STRING IS
    VARIABLE StrVal: LINE;
BEGIN
   hwrite(StrVal,V);
   return StrVal.all;
   END FUNCTION VectorToString;
    begin
        comALU : ALU GENERIC MAP (8) PORT MAP(
            tCin,
            tA,
            tB,
            tSEL,
            tF,
            tCout
        );
    process
    begin

 tSEL<= "0100" ;
 tA<= "11110000";
 tB<= "10110000";
wait for 1 ns ;
assert (tF = "11110000") report "A: " & VectorToString(tA)
			&" B: "& VectorToString(tB)
            &" SEL: "& VectorToString(tSEL)
			severity error;
 tB<= "00001011";
 tSEL<= "0101";
wait for 1 ns ;
assert (tF = "00000000") report "A: " & VectorToString(tA)
			&" B: "& VectorToString(tB)
			&" SEL: "& VectorToString(tSEL)
			severity error;
 tB<= "10110000";
 tSEL<= "0110";
wait for 1 ns ;
assert (tF = "00001111") report "A: " & VectorToString(tA)
			&" B: "& VectorToString(tB)
			&" SEL: "& VectorToString(tSEL)
			severity error;
 tSEL<= "0111";
wait for 1 ns ;
assert (tF = "00001111") report "A: " & VectorToString(tA)
			&" B: "& VectorToString(tB)
			&" SEL: "& VectorToString(tSEL)
			severity error;
 tSEL<= "1000";
wait for 1 ns ;
assert (tF = "11100000") report "A: " & VectorToString(tA)
			&" B: "& VectorToString(tB)
			&" SEL: "& VectorToString(tSEL)
			severity error;
 tSEL<= "1001";
wait for 1 ns ;
assert (tF = "11100001") report "A: " & VectorToString(tA)
			&" B: "& VectorToString(tB)
			&" SEL: "& VectorToString(tSEL)
			severity error;
 tCin<= '0';
 tSEL<= "1010";
wait for 1 ns ;
assert (tF = "11100000") report "A: " & VectorToString(tA)
			&" B: "& VectorToString(tB)
			&" SEL: "& VectorToString(tSEL)
			severity error;
 tSEL<= "1011";
wait for 1 ns ;
assert (tF = "00000000") report "A: " & VectorToString(tA)
			&" B: "& VectorToString(tB)
			&" SEL: "& VectorToString(tSEL)
			severity error;
 tSEL<= "1100";
wait for 1 ns ;
assert (tF = "01111000") report "A: " & VectorToString(tA)
			&" B: "& VectorToString(tB)
			&" SEL: "& VectorToString(tSEL)
			severity error;
 tSEL<= "1101";
wait for 1 ns ;
assert (tF = "01111000") report "A: " & VectorToString(tA)
			&" B: "& VectorToString(tB)
			&" SEL: "& VectorToString(tSEL)
			severity error;
 tCin<= '0';
 tSEL<= "1110";
wait for 1 ns ;
assert (tF = "01111000") report "A: " & VectorToString(tA)
			&" B: "& VectorToString(tB)
			&" SEL: "& VectorToString(tSEL)
			severity error;
 tSEL<= "1111" ;
wait for 1 ns ;
assert (tF = "11111000") report "A: " & VectorToString(tA)
			&" B: "& VectorToString(tB)
			&" SEL: "& VectorToString(tSEL)
			severity error;
 tSEL<= "1010";
 tCin<= '1';
wait for 1 ns ;
assert (tF = "11100001") report "A: " & VectorToString(tA)
			&" B: "& VectorToString(tB)
			&" SEL: "& VectorToString(tSEL)
			severity error;
 tSEL<= "1110";
wait for 1 ns ;
assert (tF = "11111000") report "A: " & VectorToString(tA)
			&" B: "& VectorToString(tB)
			&" SEL: "& VectorToString(tSEL)
			severity error;
 tSEL<= "0000";
 tB<= "10110000";
 tCin<= '0';
wait for 1 ns ;
assert (tF = "11110000") report "A: " & VectorToString(tA)
			&" B: "& VectorToString(tB)
			&" SEL: "& VectorToString(tSEL)
			severity error;
 tSEL<= "0001";
wait for 1 ns ;
assert (tF = "10100000") report "A: " & VectorToString(tA)
			&" B: "& VectorToString(tB)
			&" SEL: "& VectorToString(tSEL)
			severity error;
 tSEL<= "0010";
wait for 1 ns ;
assert (tF = "00111111") report "A: " & VectorToString(tA)
			&" B: "& VectorToString(tB)
			&" SEL: "& VectorToString(tSEL)
			severity error;
 tSEL<= "0011";
wait for 1 ns ;
assert (tF = "11101111") report "A: " & VectorToString(tA)
			&" B: "& VectorToString(tB)
			&" SEL: "& VectorToString(tSEL)
			severity error;
 tSEL<= "0000";
 tCin<= '1';
wait for 1 ns ;
assert (tF = "11110001") report "A: " & VectorToString(tA)
			&" B: "& VectorToString(tB)
			&" SEL: "& VectorToString(tSEL)
			severity error;
 tSEL<= "0001";
wait for 1 ns ;
assert (tF = "10100001") report "A: " & VectorToString(tA)
			&" B: "& VectorToString(tB)
			&" SEL: "& VectorToString(tSEL)
			severity error;
 tSEL<= "0010";
wait for 1 ns ;
assert (tF = "01000000") report "A: " & VectorToString(tA)
			&" B: "& VectorToString(tB)
			&" SEL: "& VectorToString(tSEL)
			severity error;
 tSEL<= "0011";
wait for 1 ns ;
assert (tF = "10110000") report "A: " & VectorToString(tA)
			&" B: "& VectorToString(tB)
			&" SEL: "& VectorToString(tSEL)
			severity error;
wait;
end process;
end architecture;