library ieee;
use ieee.std_logic_1164.all;

entity mux_4x1_16bits is
    port(
        I0, I1, I2, I3: in std_logic_vector(15 downto 0);
        s0, s1: in std_logic;
        D: out std_logic_vector(15 downto 0)
    );
end mux_4x1_16bits;

architecture behav of mux_4x1_16bits is

    signal F1, F2 : std_logic_vector(15 downto 0);

    component mux_2x1_16bits is
        port(
            I0, I1: in std_logic_vector(15 downto 0);
            s0: in std_logic;
            D: out std_logic_vector(15 downto 0)
        );
    end component;

begin
    
    u1: mux_2x1_16bits port map(I0 => I0, I1 => I1, s0 => s0, d => F1);
    u2: mux_2x1_16bits port map(I0 => I2, I1 => I3, s0 => s0, d => F2);
    u3: mux_2x1_16bits port map(I0 => F1, I1 => F2, s0 => s1, d => D);

end architecture behav;