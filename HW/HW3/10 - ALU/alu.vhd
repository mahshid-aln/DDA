
library ieee;
use ieee.std_logic_1164.all;
entity alu is
	port(a,b :in std_logic_vector(3 downto 0); alucode: in std_logic_vector(2 downto 0); 
result: out std_logic_vector(3 downto 0); z: out std_logic);
end entity;
architecture myalu of alu is
component mainp is
	port(a , b: in std_logic_vector(3 downto 0); cin1: in std_logic;
	cout: out std_logic; sum: out std_logic_vector(3 downto 0));
end component;
signal ands, small, rts, rrs: std_logic_vector(3 downto 0) := "0000";
signal adds,subs: std_logic_vector(4 downto 0):= "00000";
signal andz, comps, parity:std_logic;
begin
	sumss: mainp port map(a,b,'0',adds(4),adds(3 downto 0));
	subss: mainp port map(a,b,'1',subs(4),subs(3 downto 0));
	ands <= a and b;
	
	small <= b
		when (a>b)else
			 a;
	rts <= a(2 downto 0) & '0';
	rrs <= '0' & a(3 downto 1);

	andz <= '1'	
		when (((a(0)and b(0))='1') and ((a(1)and b(1))='1') and ((a(2)and b(2))='1') and 
		((a(3) and b(3))='1'))else	
		 	'0';
	comps <= '1'
		when (((a(0)xnor b(0))='1') and ((a(1)xnor b(1))='1') and ((a(2)xnor b(2))='1') and 
		((a(3) xnor b(3))='1')) else
			'0';
	parity <= a(0) xor a(1) xor a(2) xor a(3);
	with alucode select 
		result <= 	 adds(3 downto 0) when "000",
					 subs(3 downto 0) when "001",
					 ands when "010",
					 small when "011",
					 rts when "100",
					 rrs when "101",
					 a when others;
	with alucode select 
		z <= 		 adds(4) when "000",
					 subs(4) when "001",
					 andz when "010",
					 comps when "011",
					 a(3) when "100",
					 a(0) when "101",
					 parity when others;
					 
	
end architecture;

