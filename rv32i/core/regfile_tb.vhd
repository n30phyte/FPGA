LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY regfile_tb IS
END regfile_tb;

ARCHITECTURE behavior OF regfile_tb IS
    SIGNAL clk_tb : STD_LOGIC := '0';
    SIGNAL enable_tb : STD_LOGIC := '0';
    SIGNAL writeEnable_tb : STD_LOGIC := '0';
    SIGNAL registerInD_tb, registerOutA_tb, registerOutB_tb : STD_LOGIC_VECTOR (31 DOWNTO 0);
    SIGNAL registerDSel_tb, registerASel_tb, registerBSel_tb : STD_LOGIC_VECTOR (4 DOWNTO 0);
    CONSTANT clk_period : TIME := 10 ns;

    SIGNAL finished_tb : STD_LOGIC := '0';
BEGIN
    UUT : ENTITY work.regfile PORT MAP(
        clk => clk_tb,
        enable => enable_tb,
        writeEnable => writeEnable_tb,
        registerInD => registerInD_tb,
        registerOutA => registerOutA_tb,
        registerOutB => registerOutB_tb,
        registerDSel => registerDSel_tb,
        registerASel => registerASel_tb,
        registerBSel => registerBSel_tb);

    clk_tb <= NOT clk_tb AFTER clk_period / 2 WHEN finished_tb /= '1' ELSE
        '0';

    PROCESS IS
    BEGIN
        -- Write 0xDEADBEEF into r0
        enable_tb <= '1';
        registerDSel_tb <= "00000";
        registerInD_tb <= X"DEADBEEF";
        writeEnable_tb <= '1';
        WAIT FOR clk_period;

        -- Write 0x12345678 into r1
        registerDSel_tb <= "00001";
        registerInD_tb <= X"12345678";
        writeEnable_tb <= '1';
        WAIT FOR clk_period;

        -- test read from r0 and r1 from a and b respectively
        registerASel_tb <= "00000";
        registerBSel_tb <= "00001";
        registerDSel_tb <= "00001";
        registerInD_tb <= X"5678ABCD";
        writeEnable_tb <= '0';
        WAIT FOR clk_period;

        -- test r1 didn't get overwritten.
        enable_tb <= '1';
        registerASel_tb <= "00000";
        registerBSel_tb <= "00001";
        registerInD_tb <= X"5678ABCD";
        writeEnable_tb <= '0';
        WAIT FOR clk_period;

        finished_tb <= '1';
    END PROCESS;
END ARCHITECTURE behavior;
