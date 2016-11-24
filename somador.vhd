library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;

entity somador is
	port (A: in std_logic_vector(10 downto 0);
			B: in std_Logic_vector(10 downto 0);
			F: out std_Logic_vector(10 downto 0)
			);
			
architecture somador_behv of somador is
	begin
		
	F <= A + B;
	
	end somador_behv;