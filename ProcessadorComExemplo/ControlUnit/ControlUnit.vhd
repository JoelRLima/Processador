
library ieee;
use ieee.std_logic_1164.all;

entity ControlUnit is
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
end ControlUnit;

architecture behav of ControlUnit is

signal sig_AmaisB, sig_ABmenos1, sig_IR, sig_Iaddr : std_logic_vector(15 downto 0);

signal sig_IR_ld, sig_PC_ld, sig_PC_clr, sig_PC_up : std_logic;

signal sig_NS, sig_CS : std_logic_vector(3 downto 0);

component controller is
	port(
		CS, IR811, IR47, IR03 : in std_logic_vector(3 downto 0); -- ESTADO ATUAL
		OP : in std_logic_vector(3 downto 0); --OP é o opcode
		RF_RP_zero: in std_logic;
		PC_ld, PC_clr, PC_inc, i_rd, IR_ld, D_rd, D_wr, RF_W_wr, RF_s1,
		RF_s0, RF_Rp_rd, RF_Rq_rd, alu_s2, alu_s1, alu_s0
		: out std_logic;
		D_addr03, D_addr47, RF_W_data03, RF_W_data47, RF_W_addr, RF_Rp_addr,
		RF_Rq_addr : out std_logic_vector(3 DOWNTO 0);
		NS : out std_logic_vector(3 downto 0) -- PRÓXIMO ESTADO
	);
end component;

component pc is
    port (
        clk      : in  std_logic;
        ld       : in  std_logic;
        clr      : in  std_logic;
        up       : in  std_logic;
        load_val : in  std_logic_vector(15 downto 0);
        count    : out std_logic_vector(15 downto 0)
    );
end component;

component instreg is
    port(
        clk : in std_logic;
        IR_ld : in std_logic;                   -- sinal de load
        I : in std_logic_vector(15 downto 0);  -- entrada de dados
        IR : out std_logic_vector(15 downto 0) -- saída do registrador
    );
end component;

component reg4 is
    port(
        d : in std_logic_vector(3 downto 0);  -- sinal de entrada
        clk : in std_logic;                   -- clock
        load : in std_logic;                  -- load
        reset : in std_logic;                 -- reset
        q : out std_logic_vector(3 downto 0)  -- sinal de saída
    );
end component;

component Calc is
	port(
		A, B : in std_logic_vector(15 downto 0);
		subtrai : in std_logic;
		n : out std_logic_vector(15 downto 0)
	);
end component;


begin

BlocoLogico: Controller port map(OP => sig_IR(15 downto 12), IR811 => sig_IR(11 downto 8), IR47 => sig_IR(7 downto 4), IR03 => sig_IR(3 downto 0),
										  RF_RP_zero => RF_RP_zero, PC_ld => sig_PC_ld, PC_clr => sig_PC_clr, PC_inc => sig_PC_up, i_rd => i_rd,
										  IR_ld => sig_IR_ld, D_rd => D_rd, D_wr => D_wr, RF_W_wr => RF_W_wr, RF_s1 => RF_s1, RF_s0 => RF_s0,
										  RF_Rp_rd => RF_Rp_rd, RF_Rq_rd => RF_Rq_rd, alu_s2 => alu_s2, alu_s1 => alu_s1, alu_s0 => alu_s0,
										  D_addr03 => D_addr03, D_addr47 => D_addr47, RF_W_data03 => RF_W_data03, RF_W_data47 => RF_W_data47,
										  RF_W_addr => RF_W_addr, RF_Rp_addr => RF_Rp_addr, RF_Rq_addr => RF_Rq_addr, NS => sig_NS, CS => sig_CS);
InstructionRegister: instreg port map(clk => clock, IR_ld => sig_IR_ld, I => I_data, IR => sig_IR);
ProgramCounter: pc port map(clk => clock, ld => sig_PC_ld, clr => sig_PC_clr, up => sig_PC_up, load_val => sig_ABmenos1, count => Sig_Iaddr);
SomaAcomB: Calc port map(A => sig_Iaddr, B => sig_IR, subtrai => '0', n => sig_AmaisB);
Somamenosum: Calc port map(A => sig_AmaisB, B => "0000000000000001", subtrai => '1', n => sig_ABmenos1); 
RegistradordeEstado: reg4 port map(d => sig_NS, clk => clock, load => '1', reset => '0', q => sig_CS);
I_addr <= Sig_Iaddr;

end behav;