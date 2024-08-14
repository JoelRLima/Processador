library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity cinext is
    Port (
        x : in STD_LOGIC;
        y : in STD_LOGIC;
        z : in STD_LOGIC;
        cin : out STD_LOGIC
    );
end cinext;

architecture Behavioral of cinext is
begin
    cin <= (not x and y and not z);
end Behavioral;