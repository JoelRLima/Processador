library ieee;
use ieee.std_logic_1164.all;

entity registradorFlipFlop is
port (
    I    : in std_logic_vector(5 downto 0); 
    CLK  : in std_logic;
    load : in std_logic;
    Q    : out std_logic_vector(5 downto 0)
);
end registradorFlipFlop;

architecture behav of registradorFlipFlop is

component flipflopD is
port (
    D, clk : in std_logic;
    Q      : out std_logic
);
end component;

signal Q_internal : std_logic_vector(5 downto 0);
signal D_internal : std_logic_vector(5 downto 0);

begin

    process(I, Q_internal, load)
    begin
        for j in 0 to 5 loop
            if load = '1' then
                D_internal(j) <= I(j);
            else
                D_internal(j) <= Q_internal(j);
            end if;
        end loop;
    end process;

    u1: flipflopD port map(D => D_internal(0), clk => CLK, Q => Q_internal(0));
    u2: flipflopD port map(D => D_internal(1), clk => CLK, Q => Q_internal(1));
    u3: flipflopD port map(D => D_internal(2), clk => CLK, Q => Q_internal(2));
    u4: flipflopD port map(D => D_internal(3), clk => CLK, Q => Q_internal(3));
    u5: flipflopD port map(D => D_internal(4), clk => CLK, Q => Q_internal(4));
    u6: flipflopD port map(D => D_internal(5), clk => CLK, Q => Q_internal(5));

    Q <= Q_internal;

end architecture behav;