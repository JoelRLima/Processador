library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ALU is
	port(
		A, B : in std_logic_vector (15 downto 0);
		x, y, z : in std_logic;
		S : out std_logic_vector (15 downto 0)
	);
end ALU;

architecture behavioral of ALU is

	signal iA : std_logic_vector(15 downto 0);
	signal IB : std_logic_vector(15 downto 0);
	signal cin : STD_LOGIC;
	signal enable : std_logic := '1';
	component abext is
		port(
			An, Bn : in std_logic;
			x, y, z : in std_logic;
			iA, iB : out std_logic
		);
	end component;
		
	component cinext is
		port(
			x, y, z : in std_logic;
			cin : out std_logic
		);
	end component;
	
	component Calc is
		port(
			A, B : in std_logic_vector (15 downto 0);
			f: in std_logic;
			saida : out std_logic_vector (15 downto 0)
		);
	end component;

begin
	
	u0 : abext port map(An =>A(0), Bn=>B(0), x=>x, y=>y, z=>z, iA=>iA(0), iB=>iB(0));
	u1 : abext port map(An =>A(1), Bn=>B(1), x=>x, y=>y, z=>z, iA=>iA(1), iB=>iB(1));
	u2 : abext port map(An =>A(2), Bn=>B(2), x=>x, y=>y, z=>z, iA=>iA(2), iB=>iB(2));
	u3 : abext port map(An =>A(3), Bn=>B(3), x=>x, y=>y, z=>z, iA=>iA(3), iB=>iB(3));
	u4 : abext port map(An =>A(4), Bn=>B(4), x=>x, y=>y, z=>z, iA=>iA(4), iB=>iB(4));
	u5 : abext port map(An =>A(5), Bn=>B(5), x=>x, y=>y, z=>z, iA=>iA(5), iB=>iB(5));
	u6 : abext port map(An =>A(6), Bn=>B(6), x=>x, y=>y, z=>z, iA=>iA(6), iB=>iB(6));
	u7 : abext port map(An =>A(7), Bn=>B(7), x=>x, y=>y, z=>z, iA=>iA(7), iB=>iB(7));
	u8 : abext port map(An =>A(8), Bn=>B(8), x=>x, y=>y, z=>z, iA=>iA(8), iB=>iB(8));
	u9 : abext port map(An =>A(9), Bn=>B(9), x=>x, y=>y, z=>z, iA=>iA(9), iB=>iB(9));
	u10: abext port map(An =>A(10), Bn=>B(10), x=>x, y=>y, z=>z, iA=>iA(10), iB=>iB(10));
	u11: abext port map(An =>A(11), Bn=>B(11), x=>x, y=>y, z=>z, iA=>iA(11), iB=>iB(11));
	u12: abext port map(An =>A(12), Bn=>B(12), x=>x, y=>y, z=>z, iA=>iA(12), iB=>iB(12));
	u13: abext port map(An =>A(13), Bn=>B(13), x=>x, y=>y, z=>z, iA=>iA(13), iB=>iB(13));
	u14: abext port map(An =>A(14), Bn=>B(14), x=>x, y=>y, z=>z, iA=>iA(14), iB=>iB(14));
	u15: abext port map(An =>A(15), Bn=>B(15), x=>x, y=>y, z=>z, iA=>iA(15), iB=>iB(15));	
	u16 : cinext port map(x=>x, y=>y, z=>z, cin=>cin);
	u17 : Calc port map(A=>iA, B=>iB, f=>cin, saida=>S);
	
end behavioral;
	
