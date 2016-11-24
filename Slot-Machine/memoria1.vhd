library ieee;
use ieee.std_logic_1164.all;

entity memoria1 is
port (CLK: in std_logic;
		RST: in std_logic;
		EN: in std_logic;
		D: in std_logic_vector(10 downto 0);
		Q: out Std_logic_vector(10 downto 0)
		);
		end memoria1;
		
		architecture memoria1_behv of memoria1 is
		begin
		process(CLK,RST,EN,D)
		begin
		if RST = '1' then
		Q <= "00000010111";
		elsif CLK'event and CLK = '1'
		then
		if EN = '1' then
		Q <= D;
		end if;
		end if;
		end process;
		end memoria1_behv;
		