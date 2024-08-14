library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
entity instreg is
    port(
        clk : in std_logic;
        IR_ld : in std_logic;                   -- sinal de load
        I : in std_logic_vector(15 downto 0);  -- entrada de dados
        IR : out std_logic_vector(15 downto 0) -- saída do registrador
    );
end instreg;
architecture behav of instreg is
    component flipflop
        port (
            d : in std_logic;       -- entrada de dados
            clk : in std_logic;     -- sinal de clock
            load : in std_logic;    -- sinal de habilitação
            q : out std_logic       -- saída do registrador
        );
    end component;

    signal q_internal : std_logic_vector(15 downto 0);  
begin
    ff0: flipflop port map (d => I(0), clk => clk, load => IR_ld, q => q_internal(0));
    ff1: flipflop port map (d => I(1), clk => clk, load => IR_ld, q => q_internal(1));
    ff2: flipflop port map (d => I(2), clk => clk, load => IR_ld, q => q_internal(2));
    ff3: flipflop port map (d => I(3), clk => clk, load => IR_ld, q => q_internal(3));
    ff4: flipflop port map (d => I(4), clk => clk, load => IR_ld, q => q_internal(4));
    ff5: flipflop port map (d => I(5), clk => clk, load => IR_ld, q => q_internal(5));
    ff6: flipflop port map (d => I(6), clk => clk, load => IR_ld, q => q_internal(6));
    ff7: flipflop port map (d => I(7), clk => clk, load => IR_ld, q => q_internal(7));
    ff8: flipflop port map (d => I(8), clk => clk, load => IR_ld, q => q_internal(8));
    ff9: flipflop port map (d => I(9), clk => clk, load => IR_ld, q => q_internal(9));
    ff10: flipflop port map (d => I(10), clk => clk, load => IR_ld, q => q_internal(10));
    ff11: flipflop port map (d => I(11), clk => clk, load => IR_ld, q => q_internal(11));
    ff12: flipflop port map (d => I(12), clk => clk, load => IR_ld, q => q_internal(12));
    ff13: flipflop port map (d => I(13), clk => clk, load => IR_ld, q => q_internal(13));
    ff14: flipflop port map (d => I(14), clk => clk, load => IR_ld, q => q_internal(14));
    ff15: flipflop port map (d => I(15), clk => clk, load => IR_ld, q => q_internal(15));

    IR <= q_internal;
end behav;