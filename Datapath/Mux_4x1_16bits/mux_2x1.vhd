library ieee;
use ieee.std_logic_1164.all;

entity mux_2x1 is
    port(
        i0, i1, s0: in std_logic;
        d: out std_logic
    );
end mux_2x1;

architecture behav of mux_2x1 is
begin
    
    d <= (i0 and not(not(i1) and s0)) or (not(i0) and i1 and s0);

end architecture behav;