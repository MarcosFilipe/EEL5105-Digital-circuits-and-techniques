library ieee;

entity comb is
	port(RST: in std_logic;
		  RST_CONTADOR: in std_logic;
		  F: out std_logic
			);
	
	architecture comb_behv of comb is
		begin
			
			F <= RST or RST_CONTADOR;
			
		end comb_behv;