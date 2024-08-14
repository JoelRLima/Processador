library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Calc is
	port(
		A, B : in std_logic_vector(15 downto 0);
		f: in std_logic;
		saida : out std_logic_vector(15 downto 0)
	);
end Calc;
architecture behavior of Calc is
	signal trasp : std_logic_vector(15 downto 0);
	component SomSub is
		port(
			A, B : in std_logic_vector(15 downto 0);
			subtrai : in std_logic;
			n : out std_logic_vector(15 downto 0)
		);
	end component;
begin
	u0 : SomSub port map(A=>A, B=>B, subtrai=>f, n=>saida);
end behavior;