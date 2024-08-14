library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity regfile_processador_4x16 is
	Port(
		clk, W_en, Rp_en, Rq_en		: in std_logic;
		W_data						: in std_logic_vector(15 downto 0);
		W_addr, Rp_addr, Rq_addr	: in std_logic_vector(3 downto 0);
		Rp_data, Rq_data			: out std_logic_vector(15 downto 0)
	);
end regfile_processador_4x16;

architecture behav of regfile_processador_4x16 is

	type tmp_array is array(0 to 15) of std_logic_vector(15 downto 0);

	signal reg_ld: std_logic_vector(15 downto 0);
	signal out_regs: tmp_array;
	
	component dcd_4x16 is
		port(
			en	: in std_logic;
			i	: in std_logic_vector(3 downto 0);
			D	: out std_logic_vector(15 downto 0)
		);
	end component;

	component reg_16bits is
		port(
			clk, load	: in std_logic;
			D			: in std_logic_vector(15 downto 0);
			Q			: out std_logic_vector(15 downto 0)
		);
	end component;

begin

	deco0	: dcd_4x16 port map(en => W_en, i => W_addr, D => reg_ld);
	
	reg0 	: reg_16bits port map(clk => clk, load => reg_ld(0), D => W_data, Q => out_regs(0));
	reg1 	: reg_16bits port map(clk => clk, load => reg_ld(1), D => W_data, Q => out_regs(1));
	reg2 	: reg_16bits port map(clk => clk, load => reg_ld(2), D => W_data, Q => out_regs(2));
	reg3 	: reg_16bits port map(clk => clk, load => reg_ld(3), D => W_data, Q => out_regs(3));

	process(clk, out_regs)
	begin
		if (clk'event and clk = '1') then
			Rp_data <= out_regs(conv_integer(unsigned(Rp_addr)));
			Rq_data <= out_regs(conv_integer(unsigned(Rq_addr)));
		end if;
		if (Rp_en = '1') then
			Rp_data <= out_regs(conv_integer(unsigned(Rp_addr)));
		end if;
		if (Rq_en = '1') then
			Rq_data <= out_regs(conv_integer(unsigned(Rq_addr)));
		end if;
	end process;

end behav;
		