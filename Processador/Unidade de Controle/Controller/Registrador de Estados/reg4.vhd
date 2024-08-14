library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
entity reg4 is
    port(
        d : in std_logic_vector(3 downto 0);  -- sinal de entrada
        clk : in std_logic;                   -- clock
        load : in std_logic;                  -- load
        reset : in std_logic;                 -- reset
        q : out std_logic_vector(3 downto 0)  -- sinal de saída
    );
end reg4;
architecture structural of reg4 is
    component flipflop
        port(
            d : in std_logic;       -- entrada de dados
            clk : in std_logic;     -- sinal de clock
            load : in std_logic;    -- sinal de habilitação
            q : out std_logic       -- saída do registrador
        );
    end component;

    signal q_internal : std_logic_vector(3 downto 0);  
begin
    -- Instanciando 4 flip-flops manualmente
    ff0: flipflop port map (d => d(0), clk => clk, load => load, q => q_internal(0));
    ff1: flipflop port map (d => d(1), clk => clk, load => load, q => q_internal(1));
    ff2: flipflop port map (d => d(2), clk => clk, load => load, q => q_internal(2));
    ff3: flipflop port map (d => d(3), clk => clk, load => load, q => q_internal(3));
    q <= q_internal;
end structural;