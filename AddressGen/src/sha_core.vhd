LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

USE work.utils.ALL;

ENTITY sha_core IS
  PORT (
    calculated_hash : OUT CALCULATED_SHA_T;
    state           : OUT CORE_STATE_T;
    clk             : IN STD_LOGIC;
    reset           : IN STD_LOGIC;
    ecdsa_pubkey    : IN GENERATED_ECDSA_T
  );
END ENTITY;

ARCHITECTURE Behavioural OF sha_core IS

BEGIN

END ARCHITECTURE;
