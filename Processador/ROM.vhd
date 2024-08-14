LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY ROM IS
PORT(
           clock : IN STD_LOGIC; 
           rom_enable : IN STD_LOGIC;
           address : IN STD_LOGIC_VECTOR(15 DOWNTO 0); -- mudar para 15 downto 0?
           data_output : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
);
END ROM;
ARCHITECTURE behav OF ROM IS
     TYPE rom_type IS ARRAY(0 to 15) OF STD_LOGIC_VECTOR(15 DOWNTO 0); -- 16 endereços de 16 bits (utilizar 15 downto 0?)
    --- INSTRUÇÕES
    --- CARREGAR: 0000 R3R2R1R0 D7D6D5D4D3D2D1D0
    --- ARMAZENAR: 0001 R3R2R1R0 D7D6D5D4D3D2D1D0
    --- SOMAR: 0010 RA3RA2RA1RA0 RB3RB2RB1RB0 RC3RC2RC1RC0
    --- CARREGAR CONSTANTE: 0011 R3R2R1R0 C7C6C5C4C3C2C1C0
    --- SUBTRAIR: 0100 RA3RA2RA1RA0 RB3RB2RB1RB0 RC3RC2RC1RC0
    --- SALTAR SE ZERO: 0101 RA3RA2RA1RA0 O7O6O5O4O3O2O1O0
    --- SALTAR SE MAIOR: 0110 RA3RA2RA1RA0 RB3RB2RB1RB0 RC3RC2RC1RC0
     CONSTANT mem: rom_type := (
        0 => "0000000000000000", -- Carregar D[0] em RF[0]
        1 => "0000010100000001", -- Carregar D[1] em RF[1]
        2 => "0010000000010010", -- Somar RF[0] + RF[1] => RF[2]
        3 => "0001001000000010", -- Armazenar RF[2] em D[2]
        4 => "0000001100001000", -- Carregar D[8] em RF[3]
        5 => "0110001000000011", -- Saltar se RF[2] > RF[1] para RF[3]
        6 => "0001000000000111", -- Armazenar RF[3] em D[7]
        7 => "0000000100000111", -- Carregar D[7] em RF[0]
        8 => "0001000000000000", -- Armazenar RF[0] em D[0]
		  9 => "0000000000000001", -- Carregar D[1] em RF[0]
        others => "0000000000000000"
            );

BEGIN

PROCESS(clock) IS
BEGIN
    IF (RISING_EDGE(clock) AND rom_enable = '1') THEN
            data_output <= mem(conv_integer(unsigned(address)));
    END IF;
END PROCESS;
END behav;