Library ieee;
Use ieee.std_logic_1164.all;

ENTITY ALU IS
    PORT (
        Cin : IN STD_LOGIC;
        A_ALU, B_ALU : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        SEL : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        F : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
        Cout : OUT STD_LOGIC
    );
END entity;
ARCHITECTURE ArchALU OF ALU IS
    COMPONENT B IS
        PORT (
              A,B : IN std_logic_vector (7 DOWNTO 0);
              SEL : IN std_logic_vector (3 DOWNTO 0);
              F : OUT std_logic_vector (7 DOWNTO 0);
              Cout: OUT std_logic;
              Cin : IN std_logic
        );
    END COMPONENT;
    COMPONENT C IS
        PORT (
            A,B : IN std_logic_vector (7 DOWNTO 0);
            SEL : IN std_logic_vector (3 DOWNTO 0);
            F : OUT std_logic_vector (7 DOWNTO 0);
            Cout: OUT std_logic;
            Cin : IN std_logic
        );
    END COMPONENT;
    COMPONENT D IS
        PORT (
            A,B : IN std_logic_vector (7 DOWNTO 0);
            SEL : IN std_logic_vector (3 DOWNTO 0);
            F : OUT std_logic_vector (7 DOWNTO 0);
            Cout: OUT std_logic;
            Cin : IN std_logic
        );
    END COMPONENT;
    SIGNAL BX1 :std_logic_vector (7 DOWNTO 0);
    SIGNAL BX2 :std_logic;
    SIGNAL CX1 :std_logic_vector (7 DOWNTO 0);
    SIGNAL CX2 :std_logic;
    SIGNAL DX1 :std_logic_vector (7 DOWNTO 0);
    SIGNAL DX2 :std_logic;
    BEGIN
     comB : B PORT MAP(
        A_ALU,
        B_ALU,
        SEL,
        BX1,
        BX2,
        Cin
    );
    comC : C PORT MAP(
      A_ALU,
        B_ALU,
        SEL,
        CX1,
        CX2,
        Cin
    );
     comD: D PORT MAP(
        A_ALU,
        B_ALU,
        SEL,
        DX1,
        DX2,
        Cin
    );
    -- MUX
    F <= BX1 WHEN SEL(3 DOWNTO 2) = "01"
        ELSE
        CX1 WHEN SEL(3 DOWNTO 2) = "10"
        ELSE
        DX1 WHEN SEL(3 DOWNTO 2) = "11";
    Cout <= BX2 WHEN SEL(3 DOWNTO 2) = "01"
        ELSE
        CX2 WHEN SEL(3 DOWNTO 2) = "10"
        ELSE
        DX2 WHEN SEL(3 DOWNTO 2) = "11";
END ARCHITECTURE;
        


