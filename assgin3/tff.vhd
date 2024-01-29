Library ieee;
use ieee.std_logic_1164.all;
Entity tff is
Port
(T,rst,preset,clk : in std_logic;
Q,Q_bar : out std_logic);
End tff;
ARCHITECTURE behavtff of tff is
BEGIN
    PROCESS(clk,rst,preset)
    VARIABLE Q_SIG:std_logic;
    BEGIN
        IF(rst='1') THEN
            Q_SIG:='0';
        ELSIF(preset='1') THEN
            Q_SIG:='1';
        ELSIF(clk'EVENT AND clk='1') THEN
            Q_SIG:=T xor Q_SIG;
        END IF;
        Q<=Q_SIG;
        Q_bar<=NOT Q_SIG;
    END PROCESS;
END behavtff;
