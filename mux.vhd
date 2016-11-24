library ieee;
use ieee.std_logic_1164.all;

entity mux is
port (A: in std_logic_vector(10 downto 0);
		B: in std_Logic_vector(10 downto 0);
		S: in std_Logic_vector(0);
		F: out Std_Logic_vector(10 downto 0)
		);
		end mux;
		
		architecture mux_behv of mux is
		begin
		F <= A when S = "00" else
			  B when S = "01" else
			  C when S = "10" else
			  D;
	end mux_behv;
		