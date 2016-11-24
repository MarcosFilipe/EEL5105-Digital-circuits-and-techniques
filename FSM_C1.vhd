library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity FSM_C1 is
	port(	K3: in std_logic;
			 	clock: in std_logic;
		   	reset: in std_logic;
			 	Saida: out std_logic_vector(3 downto 0)
		  );
	end;

architecture FSM_arch of FSM_C1 is
	type STATES is (s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, sA, sB, sC, sD, sE, sF);
	signal EA, PE : STATES;
	
	constant print0 : std_logic_vector:= "0000";
	constant print1 : std_logic_vector:= "0001";
	constant print2 : std_logic_vector:= "0010";
	constant print3 : std_logic_vector:= "0011";
	constant print4 : std_logic_vector:= "0100";
	constant print5 : std_logic_vector:= "0101";
	constant print6 : std_logic_vector:= "0110";
	constant print7 : std_logic_vector:= "0111";
	constant print8 : std_logic_vector:= "1000";
	constant print9 : std_logic_vector:= "1001";
	constant printA : std_logic_vector:= "1010";
	constant printB : std_logic_vector:= "1011";
	constant printC : std_logic_vector:= "1100";
	constant printD : std_logic_vector:= "1101";
	constant printE : std_logic_vector:= "1110";
	constant printF : std_logic_vector:= "1111";

	begin
		process(clock, reset)
			begin
				if reset = '0' then
					EA <= S0;

				elsif  rising_edge(clock) then
					EA <= PE;
				end if;
		end process;

		process(EA, K3)
			begin

	case EA is

	-- type STATES is (s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, sA, sB, sC, sD, sE, sF)

	when s0 => 	-- 0, 5, c, 9, 2, e, 1, d, 7, 3, 4, 6, f, 8, b, a
		Saida <= print0;

		if K3 = '0' then PE <= s5;
			else PE <= s0;
		end if;

	when s1 => 	-- 0, 5, c, 9, 2, e, 1, d, 7, 3, 4, 6, f, 8, b, a
		Saida <= print1;

		if K3 = '0' then PE <= sD;
			else PE <= s1;
		end if;

		when s2 => 	-- 0, 5, c, 9, 2, e, 1, d, 7, 3, 4, 6, f, 8, b, a
			Saida <= print2;

			if K3 = '0' then PE <= sE;
				else PE <= s2;
			end if;

		when s3 => 	-- 0, 5, c, 9, 2, e, 1, d, 7, 3, 4, 6, f, 8, b, a
			Saida <= print3;

			if K3 = '0' then PE <= s4;
				else PE <= s3;
			end if;

		when s4 => 	-- 0, 5, c, 9, 2, e, 1, d, 7, 3, 4, 6, f, 8, b, a
			Saida <= print4;

			if K3 = '0' then PE <= s6;
				else PE <= s4;
			end if;

		when s5 => 	-- 0, 5, c, 9, 2, e, 1, d, 7, 3, 4, 6, f, 8, b, a
			Saida <= print5;

			if K3 = '0' then PE <= sC;
				else PE <= s5;
			end if;

			when s6 => 	-- 0, 5, c, 9, 2, e, 1, d, 7, 3, 4, 6, f, 8, b, a
				Saida <= print6;

				if K3 = '0' then PE <= sF;
					else PE <= s6;
				end if;

			when s7 => 	-- 0, 5, c, 9, 2, e, 1, d, 7, 3, 4, 6, f, 8, b, a
				Saida <= print7;

				if K3 = '0' then PE <= s3;
					else PE <= s7;
				end if;

			when s8 => 	-- 0, 5, c, 9, 2, e, 1, d, 7, 3, 4, 6, f, 8, b, a
				Saida <= print8;

				if K3 = '0' then PE <= sB;
					else PE <= s8;
				end if;

			when s9 => 	-- 0, 5, c, 9, 2, e, 1, d, 7, 3, 4, 6, f, 8, b, a
				Saida <= print9;

				if K3 = '0' then PE <= s2;
					else PE <= s9;
				end if;

			when sA => 	-- 0, 5, c, 9, 2, e, 1, d, 7, 3, 4, 6, f, 8, b, a
				Saida <= printA;

				if K3 = '0' then PE <= s0;
					else PE <= sA;
				end if;

			when sB => 	-- 0, 5, c, 9, 2, e, 1, d, 7, 3, 4, 6, f, 8, b, a
				Saida <= printB;

				if K3 = '0' then PE <= sA;
					else PE <= sB;
				end if;

			when sC => 	-- 0, 5, c, 9, 2, e, 1, d, 7, 3, 4, 6, f, 8, b, a
				Saida <= printC;

				if K3 = '0' then PE <= s9;
					else PE <= sC;
				end if;

			when sD => 	-- 0, 5, c, 9, 2, e, 1, d, 7, 3, 4, 6, f, 8, b, a
				Saida <= printD;

				if K3 = '0' then PE <= s7;
					else PE <= sD;
				end if;

			when sE => 	-- 0, 5, c, 9, 2, e, 1, d, 7, 3, 4, 6, f, 8, b, a
				Saida <= printE;

				if K3 = '0' then PE <= s1;
					else PE <= sE;
				end if;

			when sF => 	-- 0, 5, c, 9, 2, e, 1, d, 7, 3, 4, 6, f, 8, b, a
				Saida <= printF;

				if K3 = '0' then PE <= s8;
					else PE <= sF;
				end if;

	end case;
    end process;
end FSM_arch;
