library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
entity flipflop is
    port (
        d : in std_logic;       -- entrada de dados
        clk : in std_logic;     -- sinal de clock
        load : in std_logic;    -- sinal de habilitação
        reset : in std_logic;   -- sinal de reset
        q : out std_logic       -- saída do registrador
    );
end flipflop;
architecture behavioral of flipflop is -- comportamental
begin
    process(clk, reset)
    begin
        if reset = '1' then
            q <= '0';
        elsif (rising_edge(clk) and load = '1') then
            q <= d;
        end if;
    end process;
end behavioral;