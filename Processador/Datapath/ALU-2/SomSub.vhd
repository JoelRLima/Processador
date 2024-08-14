library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SomSub is
	port(
		A, B : in std_logic_vector(15 downto 0);
		subtrai : in std_logic;
		n : out std_logic_vector(15 downto 0)
	);
end SomSub;

architecture behavior of SomSub is
	signal carry : std_logic_vector(15 downto 0);
	signal inv : std_logic_vector(15 downto 0);
	component fulladder is
		port(
			carry, n1, n2 : in std_logic;
			s, co : out std_logic
		);
	end component;
	component Mux6 is
		PORT(
			  I : IN std_logic_vector(15 downto 0);
			  sub : IN std_logic;
			  d : OUT std_logic_vector(15 downto 0)
		 );
	 end component;
begin
	inv <= B;
	u1 : fulladder port map(carry => subtrai, n1 => A(0), n2 => inv(0), s => n(0), co => carry(0));
	u2 : fulladder port map(carry => carry(0), n1 => A(1), n2 => inv(1), s => n(1), co => carry(1));
	u3 : fulladder port map(carry => carry(1), n1 => A(2), n2 => inv(2), s => n(2), co => carry(2));
	u4 : fulladder port map(carry => carry(2), n1 => A(3), n2 => inv(3), s => n(3), co => carry(3));
	u5 : fulladder port map(carry => carry(3), n1 => A(4), n2 => inv(4), s => n(4), co => carry(4));
	u6 : fulladder port map(carry => carry(4), n1 => A(5), n2 => inv(5), s => n(5), co => carry(5));
	u7 : fulladder port map(carry => carry(5), n1 => A(6), n2 => inv(6), s => n(6), co => carry(6));
	u8 : fulladder port map(carry => carry(6), n1 => A(7), n2 => inv(7), s => n(7), co => carry(7));
	u9 : fulladder port map(carry => carry(7), n1 => A(8), n2 => inv(8), s => n(8), co => carry(8));
	u10 : fulladder port map(carry => carry(8), n1 => A(9), n2 => inv(9), s => n(9), co => carry(9));
	u11 : fulladder port map(carry => carry(9), n1 => A(10), n2 => inv(10), s => n(10), co => carry(10));
	u12 : fulladder port map(carry => carry(10), n1 => A(11), n2 => inv(11), s => n(11), co => carry(11));
	u13 : fulladder port map(carry => carry(11), n1 => A(12), n2 => inv(12), s => n(12), co => carry(12));
	u14 : fulladder port map(carry => carry(12), n1 => A(13), n2 => inv(13), s => n(13), co => carry(13));
	u15 : fulladder port map(carry => carry(13), n1 => A(14), n2 => inv(14), s => n(14), co => carry(14));
	u16 : fulladder port map(carry => carry(14), n1 => A(15), n2 => inv(15), s => n(15), co => carry(15));
end behavior;