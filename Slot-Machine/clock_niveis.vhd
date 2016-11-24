LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

entity clock_niveis is
	port
	(
		IN_50MHz	: in  std_logic;
		
		-- Output ports
		OUT_0_1Hz : out std_logic;
		OUT_1Hz	: out std_logic;
		OUT_10Hz	: out std_logic
	);
end clock_niveis;

architecture clock_arch of clock_niveis is

signal count_a: integer range 0 to 5000000;
signal count_b,count_c: integer range 0 to 10;
signal aux,aux2: STD_LOGIC;

begin

process (aux)
begin
	if rising_edge(aux) then
		count_b <= count_b + 1;
		if (count_b < 5) then
			OUT_1Hz <= '0';
			aux2 <= '0';
		else
			OUT_1Hz <= '1';
			aux2 <= '1';
			if (count_b = 9) then
				count_b <= 0;
			end if;
		end if;	
	end if;
end process;

process (aux2)
begin
	if rising_edge(aux) then
		count_b <= count_b + 1;
		if (count_b < 5) then
			OUT_2Hz <= '0';
			aux2 <= '0';
		else
			OUT_2Hz <= '1';
			aux2 <= '1';
			if (count_b = 9) then
				count_b <= 0;
			end if;
		end if;	
	end if;
end process;
	
end clock_arch;