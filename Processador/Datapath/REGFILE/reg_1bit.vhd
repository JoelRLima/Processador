library ieee;
use ieee.std_logic_1164.all;

entity reg_1bit is
	port(
		clk, load	    : in std_logic;
		d				: in std_logic;
		q				: out std_logic
    );
end reg_1bit;

architecture behav of reg_1bit is
    
begin

	process(clk, load)
	begin
		if (clk'event and clk = '1' and load = '1') then
			q <= d;
		end if;
	end process;

end architecture behav;
