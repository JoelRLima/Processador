library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity Datapath is
	port(
		clock : in std_logic;
		R_data : in std_logic_vector(15 downto 0);
		RF_W_data : in std_logic_vector(7 downto 0);
		RF_s1, RF_s0 : in std_logic;
		RF_W_addr, RF_Rp_addr, RF_Rq_addr : in std_logic_vector(3 downto 0);
		W_wr, Rp_rd, Rq_rd, 
		alu_s2, alu_s1, alu_s0 : in std_logic;
		W_data_o : out std_logic_vector(15 downto 0);
		RF_Rp_Zero : out std_logic
	);
end Datapath;

architecture behav of Datapath is

signal mux_out : std_logic_vector(15 downto 0);
signal ALUA, ALUB : std_logic_vector(15 downto 0);
signal ALU_out : std_logic_vector(15 downto 0);
signal nulo : std_logic_vector(15 downto 0) := "0000000000000000";

component mux_4x1_16bits is
    port(
        I0, I1, I2, I3: in std_logic_vector(15 downto 0);
        s0, s1: in std_logic;
        D: out std_logic_vector(15 downto 0)
    );
end component;


component regfile_processador_4x16 is
	Port(
		clk, W_en, Rp_en, Rq_en		: in std_logic;
		W_data						: in std_logic_vector(15 downto 0);
		W_addr, Rp_addr, Rq_addr	: in std_logic_vector(3 downto 0);
		Rp_data, Rq_data			: out std_logic_vector(15 downto 0)
	);
end component;

component ALU is
	port(
		A, B : in std_logic_vector (15 downto 0);
		x, y, z : in std_logic;
		S : out std_logic_vector (15 downto 0)
	);
end component;

begin
u0 : mux_4x1_16bits port map(I0 => ALU_out, I1 => R_data, I2 => "00000000"&RF_w_data, I3 => nulo, s1 => RF_s1, s0 => RF_s0, D => mux_out);
u1 : regfile_processador_4x16 port map(clk => clock, W_en => W_wr, Rp_en => Rp_rd, Rq_en => Rq_rd, 
	W_data => mux_out, W_addr => RF_W_addr, Rp_addr => RF_Rp_addr, Rq_addr => RF_Rq_addr,
	Rp_data => ALUA, Rq_data => ALUB
	);
u2 : ALU port map(A => ALUA, B => ALUB, x => alu_s2, y => alu_s1, z => alu_s0, S => ALU_out);
W_data_o <= ALUA;

end;