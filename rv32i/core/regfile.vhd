LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY regfile IS
    PORT (
        clk : IN STD_LOGIC; -- register clock
        enable : IN STD_LOGIC; -- enable register file
        writeEnable : IN STD_LOGIC; -- enable write or read only
        registerInD : IN STD_LOGIC_VECTOR (31 DOWNTO 0); -- Input into selected register 
        registerOutA : OUT STD_LOGIC_VECTOR (31 DOWNTO 0); -- Output from selected register
        registerOutB : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
        registerDSel : IN STD_LOGIC_VECTOR(4 DOWNTO 0); -- Register input select
        registerASel : IN STD_LOGIC_VECTOR(4 DOWNTO 0); -- Register output select
        registerBSel : IN STD_LOGIC_VECTOR(4 DOWNTO 0));
END regfile;

ARCHITECTURE Behavioral OF regfile IS
    TYPE reg_storage IS ARRAY(0 TO 31) OF STD_LOGIC_VECTOR(31 DOWNTO 0); -- Set up internal memory
    SIGNAL regs : reg_storage := (OTHERS => X"00000000"); -- OTHERS: set all values to 0
BEGIN
    PROCESS (clk)
    BEGIN
        IF rising_edge(clk) AND enable = '1' THEN
            registerOutA <= regs(to_integer(unsigned(registerASel)));
            registerOutB <= regs(to_integer(unsigned(registerBSel)));
            IF (writeEnable = '1') THEN
                regs(to_integer(unsigned(registerDSel))) <= registerInD;
            END IF;
        END IF;
    END PROCESS;
END Behavioral;
