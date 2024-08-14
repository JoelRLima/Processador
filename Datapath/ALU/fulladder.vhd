library ieee;
use ieee.std_logic_1164.all;

entity fulladder is
port(
	carry, n1, n2 : in std_logic;
	s, co : out std_logic
);
end fulladder;

architecture behavior of fulladder is
begin
	s <= n1 XOR n2 XOR carry;
	co <= (n1 AND n2) OR (carry AND n1) OR (carry AND n2);
end behavior;