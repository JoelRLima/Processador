library ieee;
use ieee.std_logic_1164.all;

entity processor is
    port(
        clock : in std_logic;
        PC_addr : out std_logic_vector(15 downto 0);
        IR_data : out std_logic_vector(15 downto 0);
        D_W_data : out std_logic_vector(15 downto 0);
        D_R_data : out std_logic_vector(15 downto 0);
        D_addr : out std_logic_vector(7 downto 0);
        D_R_enable : out std_logic);
end processor;

architecture behav of processor is


signal sig_I_rd, sig_D_rd, sig_D_wr, sig_rpzero, sig_W_wr, sig_RF_s1, sig_RF_s0,
sig_RF_RP_rd, sig_RF_RQ_rd, sig_alu_s2, sig_alu_s1, sig_alu_s0

: std_logic;
signal sig_I_addr, sig_I_data, sig_R_data, sig_W_data : std_logic_vector(15 downto 0);
signal sig_D_addr, sig_RF_W_data : std_logic_vector(7 downto 0);

signal sig_RF_W_addr, sig_RF_RP_addr, sig_RF_RQ_addr : std_logic_vector(3 downto 0);


component ROM IS
PORT(
           clock : IN STD_LOGIC; 
           rom_enable : IN STD_LOGIC;
           address : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
           data_output : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
);
END component;

component RAM IS
	PORT(
		clock : IN STD_LOGIC;
		r_enable, w_enable : IN STD_LOGIC;
		mem_enable : IN STD_LOGIC;
		address : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		data_input : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		data_output : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
END component;

component ControlUnit is
	port(
		clock : in std_logic;
		RF_RP_zero: in std_logic;
		I_data : in std_logic_vector(15 downto 0);
		i_rd, D_rd, D_wr, RF_W_wr, RF_s1,
		RF_s0, RF_Rp_rd, RF_Rq_rd, alu_s2, alu_s1, alu_s0
		: out std_logic;
		D_addr03, D_addr47, RF_W_data03, RF_W_data47, RF_W_addr, RF_Rp_addr,
		RF_Rq_addr : out std_logic_vector(3 DOWNTO 0);
		I_addr : out std_logic_vector(15 downto 0) -- Endereço da Memória ROM
		);
end component;

component Datapath is
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
end component;

begin

MemoriaROM: ROM port map(clock => clock, rom_enable => sig_I_rd, address => sig_I_addr, data_output => sig_I_data);
MemoriaRAM: RAM port map(clock => clock, r_enable => sig_D_rd, w_enable => sig_D_wr, mem_enable => '1', address => sig_D_addr, data_input => sig_W_data, data_output => sig_R_data);
UnidadedeControle: ControlUnit port map(clock => clock, RF_RP_zero => sig_rpzero, I_data => sig_I_data, i_rd => sig_I_rd, D_rd => sig_D_rd, D_wr => sig_D_wr,
													RF_W_wr => sig_W_wr, RF_s1 => sig_RF_s1, RF_s0 => sig_RF_s0, RF_Rp_rd => sig_RF_RP_rd, RF_Rq_rd => sig_RF_RQ_rd, 
													alu_s2 => sig_alu_s2, alu_s1 => sig_alu_s1, alu_s0 => sig_alu_s0, D_addr03 => sig_D_addr(3 downto 0), D_addr47 => sig_D_addr(7 downto 4),
													RF_W_data03 => sig_RF_W_data(3 downto 0), RF_W_data47 => sig_RF_W_data(7 downto 4), RF_W_addr => sig_RF_W_addr, RF_Rp_addr => sig_RF_RP_addr,
													RF_Rq_addr => sig_RF_RQ_addr, I_addr => sig_I_addr);
CaminhodeDados: Datapath port map(clock => clock, R_data => sig_R_data, RF_W_data => sig_RF_W_data, RF_s1 => sig_RF_s1, RF_s0 => sig_RF_s0, RF_W_addr => sig_RF_W_addr,
											RF_Rp_addr => sig_RF_RP_addr, RF_Rq_addr => sig_RF_RQ_addr, W_wr => sig_W_wr, Rp_rd => sig_RF_RP_rd, Rq_rd => sig_RF_RQ_rd,
											alu_s2 => sig_alu_s2, alu_s1 => sig_alu_s1, alu_s0 => sig_alu_s0, W_data_o => D_W_data
											);

PC_addr <= sig_I_addr;
IR_data <= sig_I_data;
D_R_data <= sig_R_data;
D_addr <= sig_D_addr;
end behav;
