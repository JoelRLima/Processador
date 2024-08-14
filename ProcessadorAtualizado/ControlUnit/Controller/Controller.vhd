library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity controller is
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
end controller;

architecture behav of controller is

signal Init, Fetch, Decode, Load, Store, Add, Load_constant, Subtract, Jump_if_Zero, Jump_if_Zero_jmp, EAND, EOR, ENOT : std_logic;

begin

Init <= (not CS(3) and not CS(2) and not CS(1) and not CS(0));
Fetch <= (not CS(3) and not CS(2) and not CS(1) and CS(0));
Decode <= (not CS(3) and not CS(2) and  CS(1) and not CS(0));
Load <= (not CS(3) and not CS(2) and CS(1) and CS(0));
Store <= (not CS(3) and CS(2) and not CS(1) and not CS(0));
Add <= (not CS(3) and CS(2) and not CS(1) and CS(0));
Load_constant <= (not CS(3) and CS(2) and CS(1) and not CS(0));
Subtract <= (not CS(3) and CS(2) and CS(1) and CS(0));
Jump_if_Zero <= (CS(3) and not CS(2) and not CS(1) and not CS(0));
Jump_if_Zero_jmp <= (CS(3) and not CS(2) and not CS(1) and CS(0));
EAND <= (CS(3) and not CS(2) and CS(1) and not CS(0));
EOR <= (CS(3) and not CS(2) and CS(1) and CS(0));
ENOT <= (CS(3) and CS(2) and not CS(1) and not CS(0));

-- Estado Init
PC_clr <= Init;

-- Estado Fetch
PC_inc <= Fetch;
i_rd <= Fetch;
IR_ld <= Fetch;

-- Estados de Operações
D_rd <= (Load);
D_wr <= (Store);

RF_s1 <= (Load_constant);
RF_s0 <= (Load);

RF_Rp_rd <= (Store or Add or Subtract or Jump_if_Zero or EAND or EOR or ENOT);
RF_Rq_rd <= (Add or Subtract or EAND or EOR);

RF_W_wr <= (Load or Add or Load_constant or Subtract or EAND or EOR or ENOT);


PC_ld <= (Jump_if_Zero_Jmp);


alu_s2 <= (EOR or ENOT);
alu_s1 <= (Subtract or EAND);
alu_s0 <= (Add or EAND or ENOT);

-- Próximo Estado
NS(3) <= (Decode and not OP(3) and OP(2) and not OP(1) and OP(0)) or
			(Decode and not OP(3) and OP(2) and OP(1) and not OP(0)) or
			(Decode and not OP(3) and OP(2) and OP(1) and OP(0)) or
			(Decode and OP(3) and not OP(2) and not OP(1) and not OP(0)) or
			(Jump_if_Zero and RF_RP_zero);
NS(2) <= (Decode and not OP(3) and not OP(2) and not OP(1) and OP(0)) or
			(Decode and not OP(3) and not OP(2) and OP(1) and not OP(0)) or
			(Decode and not OP(3) and not OP(2) and OP(1) and OP(0)) or
			(Decode and not OP(3) and OP(2) and not OP(1) and not OP(0)) or
			(Decode and OP(3) and not OP(2) and not OP(1) and not OP(0));
NS(1) <= Fetch or
			(Decode and not OP(3) and not OP(2) and not OP(1) and not OP(0)) or
			(Decode and not OP(3) and not OP(2) and OP(1) and OP(0)) or
			(Decode and not OP(3) and OP(2) and not OP(1) and not OP(0)) or
			(Decode and not OP(3) and OP(2) and OP(1) and not OP(0)) or
			(Decode and not OP(3) and OP(2) and OP(1) and OP(0));
NS(0) <= Init or
			(Decode and not OP(3) and not OP(2) and not OP(1) and not OP(0)) or
			(Decode and not OP(3) and not OP(2) and OP(1) and not OP(0)) or
			(Decode and not OP(3) and OP(2) and not OP(1) and not OP(0)) or
			(Decode and not OP(3) and OP(2) and OP(1) and OP(0)) or 
			Load or Store or Add or Load_constant or Subtract or Jump_if_Zero or
			Jump_if_Zero_jmp or EAND or EOR or ENOT;
	
	
-- Multiplos Bits

process(Init, Fetch, Decode, Load, Store, Add, Load_constant, Subtract, Jump_if_Zero, Jump_if_Zero_jmp, EAND, EOR, ENOT)

begin

if Init='1' then
				D_addr03 <= "0000";
				D_addr47 <= "0000";
				RF_W_data03 <= "0000";
				RF_W_data47 <= "0000";
				RF_W_addr <= "0000";
				RF_Rp_addr <= "0000";
				RF_Rq_addr <= "0000";
elsif Fetch ='1' then
				D_addr03 <= "0000";
				D_addr47 <= "0000";
				RF_W_data03 <= "0000";
				RF_W_data47 <= "0000";
				RF_W_addr <= "0000";
				RF_Rp_addr <= "0000";
				RF_Rq_addr <= "0000";
elsif Decode ='1' then
				D_addr03 <= "0000";
				D_addr47 <= "0000";
				RF_W_data03 <= "0000";
				RF_W_data47 <= "0000";
				RF_W_addr <= "0000";
				RF_Rp_addr <= "0000";
				RF_Rq_addr <= "0000";
elsif Load ='1' then
				D_addr03 <= IR03;
				D_addr47 <= IR47;
				RF_W_data03 <= "0000";
				RF_W_data47 <= "0000";
				RF_W_addr <= IR811;
				RF_Rp_addr <= "0000";
				RF_Rq_addr <= "0000";
elsif Store ='1' then
				D_addr03 <= IR03;
				D_addr47 <= IR47;
				RF_W_data03 <= "0000";
				RF_W_data47 <= "0000";
				RF_W_addr <= "0000";
				RF_Rp_addr <= IR811;
				RF_Rq_addr <= "0000";
elsif Add ='1' then
				D_addr03 <= "0000";
				D_addr47 <= "0000";
				RF_W_data03 <= "0000";
				RF_W_data47 <= "0000";
				RF_W_addr <= IR811;
				RF_Rp_addr <= IR47;
				RF_Rq_addr <= IR03;
elsif Load_constant ='1' then
				D_addr03 <= "0000";
				D_addr47 <= "0000";
				RF_W_data03 <= IR03;
				RF_W_data47 <= IR47;
				RF_W_addr <= IR811;
				RF_Rp_addr <= "0000";
				RF_Rq_addr <= "0000";
elsif Subtract ='1' then
				D_addr03 <= "0000";
				D_addr47 <= "0000";
				RF_W_data03 <= "0000";
				RF_W_data47 <= "0000";
				RF_W_addr <= IR811;
				RF_Rp_addr <= IR47;
				RF_Rq_addr <= IR03;
elsif Jump_If_Zero ='1' then
				D_addr03 <= "0000";
				D_addr47 <= "0000";
				RF_W_data03 <= "0000";
				RF_W_data47 <= "0000";
				RF_W_addr <= "0000";
				RF_Rp_addr <= IR811;
				RF_Rq_addr <= "0000";
elsif Jump_If_Zero_Jmp ='1' then
				D_addr03 <= "0000";
				D_addr47 <= "0000";
				RF_W_data03 <= "0000";
				RF_W_data47 <= "0000";
				RF_W_addr <= "0000";
				RF_Rp_addr <= "0000";
				RF_Rq_addr <= "0000";
elsif EAND ='1' then
				D_addr03 <= "0000";
				D_addr47 <= "0000";
				RF_W_data03 <= "0000";
				RF_W_data47 <= "0000";
				RF_W_addr <= IR03;
				RF_Rp_addr <= IR811;
				RF_Rq_addr <= IR47;
elsif EOR ='1' then
				D_addr03 <= "0000";
				D_addr47 <= "0000";
				RF_W_data03 <= "0000";
				RF_W_data47 <= "0000";
				RF_W_addr <= IR03;
				RF_Rp_addr <= IR811;
				RF_Rq_addr <= IR47;
elsif ENOT ='1' then
				D_addr03 <= "0000";
				D_addr47 <= "0000";
				RF_W_data03 <= "0000";
				RF_W_data47 <= "0000";
				RF_W_addr <= IR03;
				RF_Rp_addr <= IR47;
				RF_Rq_addr <= "0000";
else
				D_addr03 <= "0000";
				D_addr47 <= "0000";
				RF_W_data03 <= "0000";
				RF_W_data47 <= "0000";
				RF_W_addr <= "0000";
				RF_Rp_addr <= "0000";
				RF_Rq_addr <= "0000";

end if;

end process;

end behav;