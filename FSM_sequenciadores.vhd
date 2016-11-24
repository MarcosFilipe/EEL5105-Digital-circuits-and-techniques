Library ieee;
use ieee.std_logic_1164.all;

entity FSM_sequenciadores is
port (K3, reset, clock : in std_logic;
		stopC1, stopC2, stopC3 : out std_logic
		);
		
end;

architecture FSM_arch of FSM_sequenciadores is
	type STATES is (espera, start, FSM_C1, FSM_C2, FSM_C3);
	signal EA, PE : STATES;
	signal rodadas : integer range 0 to 10;
	
begin
	process(clock, reset)
		begin
			if reset = '0' then
				EA <= espera;

			elsif rising_edge(clock) then
				EA <= PE;
			end if;
		end process;

	process(EA, K3)	
		begin
		PE <= EA;
		
		case EA is

			when espera => 
			
				if K3 = '0' then PE <= espera;
				else PE <= start;
				end if;

			when start => 
			
				if K3 = '0' then PE <= start;
				else PE <= FSM_C1;
				end if;

			when FSM_C1 => 
			
				if K3 = '0' then PE <= FSM_C1;
				else PE <= FSM_C2;
				end if;

			when FSM_C2 => 
			
				if K3 = '0' then PE <= FSM_C2;
				else PE <= FSM_C3;
				end if;

			when FSM_C3 => 

				if K3 = '1' and rodadas > 0 then PE <= start;
				elsif rodadas = 0 then PE <= espera;
				
				end if;
				
		end case;
	end process;
	
	process(K3,EA)
	begin
		case EA is
			when espera =>
				stopC1 <= '1';
				stopC2 <= '1';
				stopC3 <= '1';
				rodadas <= 10;
				
			when start =>
				if K3 = '1' then
					stopC1 <= '0';
					stopC2 <= '0';
					stopC3 <= '0';
				end if;
				
			when FSM_C1 =>
				if K3 = '1' then
					stopC1 <= '1';
				end if;
				
			when FSM_C2 =>
				if K3 = '1' then
					stopC2 <= '1';
				end if;
				
			when FSM_C3 =>
				if K3 = '1' then
					rodadas <= rodadas -1;
					stopC3 <= '1';
				end if;
			end case;
end process;

end FSM_arch;
				
				
					
				
	
		
		