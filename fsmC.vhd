library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;


entity fsmC is
	port(	CLK :in std_logic;
			RST :in std_logic;
			START:in std_logic;
			SEM_CREDITO:in std_logic;
			RST_CONTADOR: out std_logic;
			RODADAS: out std_logic_vector(3 downto 0);
			ESTADOS: out std_logic_vector(3 downto 0);
		   HABILITA_PREMIO:out std_logic;
			C0: out std_logic;
			C1: out std_logic;
			C2: out std_logic
			);
end;
		
architecture fsmC_behv of fsmC is
	type States is (e1,e2,e3,e4,e5,e6,e7);
	signal EA,PE:States;
	signal contador:std_logic_vector(7 downto 0);
	signal rodada;
	
begin
	
	RODADAS <= rodada;

	process(CLK,RST)
	begin
		if RST = '0' then
			EA <= inicio;
		elsif CLK'event and CLK ='1' then
			EA <= PE;
		end if;
	end process;
		
	process(CLK,EA)
	begin
		if CLK'event and CLK ='0' then
			case EA is
				
				when e0 then =>
					RESET_CONTADOR = '1';
					HABILITA_PREMIO = '0';
					C0 = '0';
					C1 = '0';
					C2 = '0';
					PE <= e1;
				
				when e1 then =>
					RESET_CONTADOR = '1';
					CREDITO_23 = '1';
					RODADAS = '0';
					PE <= e2
				
				when e2 then =>
					if SEM_CREDITO = '1' then
						PE <= e0;
					else
						PE <= e3;
					end if; 
				CREDITO_23 = '0';
				HABILITA_PREMIO = '0';
				
				when e3 then =>
					if start = '1' then
						PE <= e3;
				
				else =>
					C0 = '1';
					C1 = '1';
					C2 = '1';
					PE <= e4;
				end if;
				
				
				when e4 =>
					if start = '1' then
						PE <= e4;
					else
						C0 = '0';
						C1 = '1';
						C2 = '1';
						PE <= e5;
					end if;
					
					
				when e5 =>
					if start = '1' then
						PE <= e5;
					else 
						C0 = '0';
						C1 = '0';
						C2 = '1';
						PE <= e6;
					end if;
					
				when e6 =>
					if start = '1' then
						PE <= e6;
					else 
						C0 = '0';
						C1 = '0';
						C2 = '0';
						PE <= e7;
					end if;
					
				when e7 =>
					RODADAS = RODADAS+'1';
					HABILITA_PREMIO = '1';
					if RODADAS = "10" then
						PE <=  E0;
					else 
						PE <= E2;
					
				
