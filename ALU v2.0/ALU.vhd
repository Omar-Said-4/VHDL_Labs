Library ieee;
Use ieee.std_logic_1164.all;

ENTITY ALU IS
GENERIC (n : integer := 8);
    PORT (
        Cin : IN STD_LOGIC;
        A_ALU, B_ALU : IN STD_LOGIC_VECTOR(n-1 DOWNTO 0);
        SEL : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        F : OUT STD_LOGIC_VECTOR(n-1 DOWNTO 0);
        Cout : OUT STD_LOGIC
    );
END entity;
ARCHITECTURE ArchALU OF ALU IS
    COMPONENT A IS
       PORT(
            A,B : IN std_logic ;
            SEL : IN std_logic_vector (1 DOWNTO 0);
            F : OUT std_logic ;
            Cout: OUT std_logic;
            Cin : IN std_logic;
            BFLAG: IN STD_LOGIC
          );
    END COMPONENT;
    COMPONENT B IS
    GENERIC (n : integer := 8);
        PORT (
            A,B : IN std_logic_vector (n-1 DOWNTO 0);
            SEL : IN std_logic_vector (1 DOWNTO 0);
            F : OUT std_logic_vector (n-1 DOWNTO 0);
            Cout: OUT std_logic;
            Cin : IN std_logic
         );
    END COMPONENT;
    COMPONENT C IS
    GENERIC (n : integer := 8);
        PORT(
            A : IN std_logic_vector (n-1 DOWNTO 0);
            SEL : IN std_logic_vector (1 DOWNTO 0);
            F : OUT std_logic_vector (n-1 DOWNTO 0);
            Cout: OUT std_logic;
            Cin : IN std_logic
            );
    END COMPONENT;
    COMPONENT D IS
    GENERIC (n : integer := 8);
        PORT(
            A : IN std_logic_vector (n-1 DOWNTO 0);
            SEL : IN std_logic_vector (1 DOWNTO 0);
            F : OUT std_logic_vector (n-1 DOWNTO 0);
            Cout: OUT std_logic;
            Cin : IN std_logic
           );
    END COMPONENT;
    SIGNAL AX1 :std_logic_vector (n-1 DOWNTO 0);
    SIGNAL AX2 :std_logic;
    SIGNAL BX1 :std_logic_vector (n-1 DOWNTO 0);
    SIGNAL BX2 :std_logic;
    SIGNAL CX1 :std_logic_vector (n-1 DOWNTO 0);
    SIGNAL CX2 :std_logic;
    SIGNAL DX1 :std_logic_vector (n-1 DOWNTO 0);
    SIGNAL DX2 :std_logic;
    SIGNAL temp : std_logic_vector(n DOWNTO 0);
    BEGIN
    temp(0) <= Cin;
    loopA: FOR i IN 0 to n-1 GENERATE
    genA: A PORT MAP(
       A_ALU(i),
       B_ALU(i),
       SEL(1 DOWNTO 0),
       AX1(i),
       temp(i+1),
       temp(i),
       Cin
    );
    end GENERATE loopA;
    AX2<=temp(n);
     comB : B GENERIC MAP (n) PORT MAP(
        A_ALU,
        B_ALU,
        SEL(1 DOWNTO 0),
        BX1,
        BX2,
        Cin
    );
    comC : C GENERIC MAP (n) PORT MAP(
        A_ALU,
        SEL(1 DOWNTO 0),
        CX1,
        CX2,
        Cin
    );
     comD: D GENERIC MAP (n) PORT MAP(
        A_ALU,
        SEL(1 DOWNTO 0),
        DX1,
        DX2,
        Cin
    );

    -- MUX
    F <= AX1 WHEN SEL(3 DOWNTO 2) = "00"
        ELSE
        BX1 WHEN SEL(3 DOWNTO 2) = "01"
        ELSE
        CX1 WHEN SEL(3 DOWNTO 2) = "10"
        ELSE
        DX1 WHEN SEL(3 DOWNTO 2) = "11";
    Cout <= AX2 WHEN SEL(3 DOWNTO 2) = "00"
        ELSE
        BX2 WHEN SEL(3 DOWNTO 2) = "01"
        ELSE
        CX2 WHEN SEL(3 DOWNTO 2) = "10"
        ELSE
        DX2 WHEN SEL(3 DOWNTO 2) = "11";
END ARCHITECTURE;
        



