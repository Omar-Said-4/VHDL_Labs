LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
Entity sync_count is
    Port
    (rst,clk,en,load,mode : in std_logic;
    Data : in std_logic_vector(7 downto 0);
    Count : out std_logic_vector(7 downto 0));
End sync_count;
ARCHITECTURE behavsc OF sync_count IS
COMPONENT FA IS
       PORT(
          A,B : IN std_logic ;
          F : OUT std_logic ;
          Cout: OUT std_logic;
          Cin : IN std_logic
          );
         END COMPONENT;
         SIGNAL temp : std_logic_vector(8 DOWNTO 0);
         SIGNAL count_in : std_logic_vector(7 DOWNTO 0);
         SIGNAL count_out : std_logic_vector(7 DOWNTO 0);
BEGIN
        temp(0) <= '1';
        loopFA: FOR i IN 0 to 7 GENERATE
        genFA: FA PORT MAP(
           count_in(i),
            '0',
            count_out(i),
            temp(i+1),
            temp(i)
        );
END GENERATE loopFA;
    PROCESS(clk,rst)
       VARIABLE C_SIG : std_logic_vector(7 downto 0);
         BEGIN
             IF rst = '0' THEN
                 C_SIG := (OTHERS => '0');
                 Count <= C_SIG;
             ELSIF (rising_edge(clk)) THEN
                 IF (en = '0') THEN
                 IF (load = '0') THEN
                     C_SIG := Data;
                 ELSE 
                     C_SIG := count_out;                                             
                 END IF;
                 END IF;
                  -- load validation (if mode =1 doesn't load non suitable values)
                if(mode ='1' and (C_SIG(3 DOWNTO 0) > "1001" or C_SIG(7 DOWNTO 4) > "1001")) THEN
                C_SIG(7 DOWNTO 0) := "00000000";
                END IF;
                Count <= C_SIG;
             END IF;
             if(mode = '1') then
                if(C_SIG(3 DOWNTO 0) = "1001") then
                    if(C_SIG(7 DOWNTO 4) = "1001") then
                        C_SIG(7 DOWNTO 0) := "11111111";
                    else
                    C_SIG(3 DOWNTO 0) := "1111";                    
                end if;
                end if;
                end if;
             count_in <= C_SIG;
    END PROCESS;
END behavsc;
