LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

USE work.utils.ALL;

ENTITY sha_constants IS
  PORT (
    round_constant : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    round          : IN INTEGER RANGE 0 TO 63
  );
END ENTITY;

ARCHITECTURE Behavioural OF sha_constants IS

BEGIN

  WITH round SELECT round_constant <=
    x"428a2f98" WHEN 0, x"71374491" WHEN 1, x"b5c0fbcf" WHEN 2, x"e9b5dba5" WHEN 3,
    x"3956c25b" WHEN 4, x"59f111f1" WHEN 5, x"923f82a4" WHEN 6, x"ab1c5ed5" WHEN 7,
    x"d807aa98" WHEN 8, x"12835b01" WHEN 9, x"243185be" WHEN 10, x"550c7dc3" WHEN 11,
    x"72be5d74" WHEN 12, x"80deb1fe" WHEN 13, x"9bdc06a7" WHEN 14, x"c19bf174" WHEN 15,
    x"e49b69c1" WHEN 16, x"efbe4786" WHEN 17, x"0fc19dc6" WHEN 18, x"240ca1cc" WHEN 19,
    x"2de92c6f" WHEN 20, x"4a7484aa" WHEN 21, x"5cb0a9dc" WHEN 22, x"76f988da" WHEN 23,
    x"983e5152" WHEN 24, x"a831c66d" WHEN 25, x"b00327c8" WHEN 26, x"bf597fc7" WHEN 27,
    x"c6e00bf3" WHEN 28, x"d5a79147" WHEN 29, x"06ca6351" WHEN 30, x"14292967" WHEN 31,
    x"27b70a85" WHEN 32, x"2e1b2138" WHEN 33, x"4d2c6dfc" WHEN 34, x"53380d13" WHEN 35,
    x"650a7354" WHEN 36, x"766a0abb" WHEN 37, x"81c2c92e" WHEN 38, x"92722c85" WHEN 39,
    x"a2bfe8a1" WHEN 40, x"a81a664b" WHEN 41, x"c24b8b70" WHEN 42, x"c76c51a3" WHEN 43,
    x"d192e819" WHEN 44, x"d6990624" WHEN 45, x"f40e3585" WHEN 46, x"106aa070" WHEN 47,
    x"19a4c116" WHEN 48, x"1e376c08" WHEN 49, x"2748774c" WHEN 50, x"34b0bcb5" WHEN 51,
    x"391c0cb3" WHEN 52, x"4ed8aa4a" WHEN 53, x"5b9cca4f" WHEN 54, x"682e6ff3" WHEN 55,
    x"748f82ee" WHEN 56, x"78a5636f" WHEN 57, x"84c87814" WHEN 58, x"8cc70208" WHEN 59,
    x"90befffa" WHEN 60, x"a4506ceb" WHEN 61, x"bef9a3f7" WHEN 62, x"c67178f2" WHEN 63;

END ARCHITECTURE;
