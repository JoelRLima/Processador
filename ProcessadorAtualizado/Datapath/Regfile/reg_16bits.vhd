library ieee;
use ieee.std_logic_1164.all;

entity reg_16bits is
	port(
		clk, load	    : in std_logic;
		D				: in std_logic_vector(15 downto 0);
		Q				: out std_logic_vector(15 downto 0)
    );
end reg_16bits;

architecture behav of reg_16bits is
    
    signal d0, d1, d2, d3, d4, d5, d6, d7, d8, d9, d10, d11, d12, d13, d14, d15 : std_logic;
    signal q0, q1, q2, q3, q4, q5, q6, q7, q8, q9, q10, q11, q12, q13, q14, q15 : std_logic;
    
    component reg_1bit is
        port(
            clk, load	    : in std_logic;
            d				: in std_logic;
            q				: out std_logic
        );
    end component;

begin

    d0 <= D(0);
    d1 <= D(1);
    d2 <= D(2);
    d3 <= D(3);
    d4 <= D(4);
    d5 <= D(5);
    d6 <= D(6);
    d7 <= D(7);
    d8 <= D(8);
    d9 <= D(9);
    d10 <= D(10);
    d11 <= D(11);
    d12 <= D(12);
    d13 <= D(13);
    d14 <= D(14);
    d15 <= D(15);

    u0: reg_1bit port map(d => d0, q => q0, clk => clk, load => load);
    u1: reg_1bit port map(d => d1, q => q1, clk => clk, load => load);
    u2: reg_1bit port map(d => d2, q => q2, clk => clk, load => load);
    u3: reg_1bit port map(d => d3, q => q3, clk => clk, load => load);
    u4: reg_1bit port map(d => d4, q => q4, clk => clk, load => load);
    u5: reg_1bit port map(d => d5, q => q5, clk => clk, load => load);
    u6: reg_1bit port map(d => d6, q => q6, clk => clk, load => load);
    u7: reg_1bit port map(d => d7, q => q7, clk => clk, load => load);
    u8: reg_1bit port map(d => d8, q => q8, clk => clk, load => load);
    u9: reg_1bit port map(d => d9, q => q9, clk => clk, load => load);
    u10: reg_1bit port map(d => d10, q => q10, clk => clk, load => load);
    u11: reg_1bit port map(d => d11, q => q11, clk => clk, load => load);
    u12: reg_1bit port map(d => d12, q => q12, clk => clk, load => load);
    u13: reg_1bit port map(d => d13, q => q13, clk => clk, load => load);
    u14: reg_1bit port map(d => d14, q => q14, clk => clk, load => load);
    u15: reg_1bit port map(d => d15, q => q15, clk => clk, load => load);

    Q <= q15 & q14 & q13 & q12 & q11 & q10 & q9 & q8 & q7 & q6 & q5 & q4 & q3 & q2 & q1 & q0;
    
end architecture behav;
