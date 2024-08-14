library ieee;
use ieee.std_logic_1164.all;

entity mux_2x1_16bits is
    port(
        I0, I1: in std_logic_vector(15 downto 0);
        s0: in std_logic;
        D: out std_logic_vector(15 downto 0)
    );
end mux_2x1_16bits;

architecture behav of mux_2x1_16bits is

    signal ia0, ia1, ia2, ia3, ia4, ia5, ia6, ia7, ia8, ia9, ia10, ia11, ia12, ia13, ia14, ia15 : std_logic;
    signal ib0, ib1, ib2, ib3, ib4, ib5, ib6, ib7, ib8, ib9, ib10, ib11, ib12, ib13, ib14, ib15 : std_logic;
    signal d0, d1, d2, d3, d4, d5, d6, d7, d8, d9, d10, d11, d12, d13, d14, d15 : std_logic;
    
    component mux_2x1 is
        port(
            i0, i1, s0: in std_logic;
            d: out std_logic
        );
    end component;

begin
    
    ia0 <= I0(0);
    ia1 <= I0(1);
    ia2 <= I0(2);
    ia3 <= I0(3);
    ia4 <= I0(4);
    ia5 <= I0(5);
    ia6 <= I0(6);
    ia7 <= I0(7);
    ia8 <= I0(8);
    ia9 <= I0(9);
    ia10 <= I0(10);
    ia11 <= I0(11);
    ia12 <= I0(12);
    ia13 <= I0(13);
    ia14 <= I0(14);
    ia15 <= I0(15);
    ib0 <= I1(0);
    ib1 <= I1(1);
    ib2 <= I1(2);
    ib3 <= I1(3);
    ib4 <= I1(4);
    ib5 <= I1(5);
    ib6 <= I1(6);
    ib7 <= I1(7);
    ib8 <= I1(8);
    ib9 <= I1(9);
    ib10 <= I1(10);
    ib11 <= I1(11);
    ib12 <= I1(12);
    ib13 <= I1(13);
    ib14 <= I1(14);
    ib15 <= I1(15);

    u0: mux_2x1 port map(i0 => ia0, i1 => ib0, s0 => s0, d => d0);
    u1: mux_2x1 port map(i0 => ia1, i1 => ib1, s0 => s0, d => d1);
    u2: mux_2x1 port map(i0 => ia2, i1 => ib2, s0 => s0, d => d2);
    u3: mux_2x1 port map(i0 => ia3, i1 => ib3, s0 => s0, d => d3);
    u4: mux_2x1 port map(i0 => ia4, i1 => ib4, s0 => s0, d => d4);
    u5: mux_2x1 port map(i0 => ia5, i1 => ib5, s0 => s0, d => d5);
    u6: mux_2x1 port map(i0 => ia6, i1 => ib6, s0 => s0, d => d6);
    u7: mux_2x1 port map(i0 => ia7, i1 => ib7, s0 => s0, d => d7);
    u8: mux_2x1 port map(i0 => ia8, i1 => ib8, s0 => s0, d => d8);
    u9: mux_2x1 port map(i0 => ia9, i1 => ib9, s0 => s0, d => d9);
    u10: mux_2x1 port map(i0 => ia10, i1 => ib10, s0 => s0, d => d10);
    u11: mux_2x1 port map(i0 => ia11, i1 => ib11, s0 => s0, d => d11);
    u12: mux_2x1 port map(i0 => ia12, i1 => ib12, s0 => s0, d => d12);
    u13: mux_2x1 port map(i0 => ia13, i1 => ib13, s0 => s0, d => d13);
    u14: mux_2x1 port map(i0 => ia14, i1 => ib14, s0 => s0, d => d14);
    u15: mux_2x1 port map(i0 => ia15, i1 => ib15, s0 => s0, d => d15);

    D <= d15 & d14 & d13 & d12 & d11 & d10 & d9 & d8 & d7 & d6 & d5 & d4 & d3 & d2 & d1 & d0;
    
end architecture behav;