library ieee;
use ieee.std_logic_1164.all;

entity flipflopD is
port ( D, clk : in std_logic;
				Q : out std_logic);
end;

architecture behav of flipflopD is 
begin 
PROCESS(D,clk)
begin
	if(clk ' EVENT and clk = '1' and D = '1') then
		Q <= '1';
	elsif(clk ' EVENT and clk = '1' and D = '0') then
		Q <= '0';
	end if;
end process;
end;