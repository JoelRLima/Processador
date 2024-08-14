library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity abext is
    Port (
        An : in STD_LOGIC;
        Bn : in STD_LOGIC;
        x : in STD_LOGIC;
        y : in STD_LOGIC;
        z : in STD_LOGIC;
        iA : out STD_LOGIC;
        iB : out STD_LOGIC
    );
end abext;

architecture Behavioral of abext is
begin
    iB <= ((not x and not y and z and bn)or
	 (not x and y and not z and not bn));
    
    iA <= ((not(x) and not(y) and not(z) and an) or
	 (not(x) and not(y) and z and an) or
	 (not(x) and y and not(z) and an) or
	 (not(x) and y and z and an and bn) or
	 (x and not y and not z and an and not bn) or
	 (x and not y and not z and not an and bn) or
	 (x and not y and not z and an and bn) or
	 (x and not y and z and not an)
     );
end Behavioral;