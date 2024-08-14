library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity pc is
    port (
        clk      : in  std_logic;
        ld       : in  std_logic;
        clr      : in  std_logic;
        up       : in  std_logic;
        load_val : in  std_logic_vector(15 downto 0);
        count    : out std_logic_vector(15 downto 0)
    );
end pc;
architecture behavioral of pc is
    signal counter: unsigned(0 to 15) := (others => '0');
begin
    process(clk, clr)
    begin
        if clr = '1' then
            counter <= (others => '0');
        elsif rising_edge(clk) then
            if ld = '1' then
                counter <= unsigned(load_val);  -- Converte 'load_val' para unsigned
            elsif up = '1' then
                counter <= counter + 1;  -- Incrementa o contador
            end if;
        end if;
    end process;
    count <= std_logic_vector(counter);  -- Converte 'counter' para std_logic_vector para saída
end behavioral;