library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;


entity fsm is
	port(	CLK :in std_logic;
			RST :in std_logic;
			F :out std_logic_vector(7 downto 0)
			);
end;
		
architecture fsm_behv of fsm is
	type States is (inicio,testefim,incrementa);
	signal EA,PE:States;
	signal contador:std_logic_vector(7 downto 0);
	

begin

	F<= contador;

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
				when inicio =>
					contador<= "01000001";
					PE <= testefim;
				when testefim =>
					if contador = "01011011" then
						PE <= inicio;
					else
						PE <= incrementa;
					end if;
				when incrementa =>
					contador <= contador  + '1';
					PE <= testefim;
				
			end case;
		end if;
	end process;

end fsm_behv;