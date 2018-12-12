library IEEE;
use IEEE.std_logic_1164.all;
entity jazr8 is
	port(input: in std_logic_vector(7 downto 0); output: out std_logic_vector(3 downto 0) );
end entity;

architecture rtl of jazr8 is
component cell is
	port(a, b, p,cin:in std_logic;
        cout, s: out std_logic);
end component;
signal sums, couts: std_logic_vector(19 downto 0);
begin
p00 : cell port map(input(7), '0', 			'1', 	   couts(1), couts(0), sums(0));
p01 : cell port map(input(6), '1', 			'1', 	   '1', 	 couts(1), sums(1));
p02 : cell port map(sums(0),  '0',			 couts(0), couts(3), couts(2), sums(2));
p03 : cell port map(sums(1),  couts(0), 	 couts(0), couts(4), couts(3), sums(3));
p04 : cell port map(input(5), not couts(0),  couts(0), couts(5), couts(4), sums(4));
p05 : cell port map(input(4), '1', 			 couts(0), couts(0), couts(5), sums(5));
p06 : cell port map(sums(2),  '0', 			 couts(2), couts(7), couts(6), sums(6));
p07 : cell port map(sums(3),  '0', 			 couts(2), couts(8), couts(7), sums(7));
p08 : cell port map(sums(4),  couts(0), 	 couts(2), couts(9), couts(8), sums(8));
p09 : cell port map(sums(5),  couts(2), 	 couts(2), couts(10), couts(9), sums(9));
p10 : cell port map(input(3), not couts(2),  couts(2), couts(11), couts(10), sums(10));
p11 : cell port map(input(2), '1', 			 couts(2), couts(2),  couts(11), sums(11));
p12 : cell port map(sums(6),  '0', 			 couts(6), couts(13), couts(12), sums(12));
p13 : cell port map(sums(7),  '0', 			 couts(6), couts(14), couts(13), sums(13));
p14 : cell port map(sums(8),  '0', 			 couts(6), couts(15), couts(14), sums(14));
p15 : cell port map(sums(9),  couts(0), 	 couts(6), couts(16), couts(15), sums(15));
p16 : cell port map(sums(10), couts(2), 	 couts(6), couts(17), couts(16), sums(16));
p17 : cell port map(sums(11), couts(6), 	 couts(6), couts(18), couts(17), sums(17));
p18 : cell port map(input(1), not couts(6),  couts(6), couts(19), couts(18), sums(18));
p19 : cell port map(input(0), '1', 			 couts(6), couts(6), couts(19), sums(19));
output(0) <= couts(12);
output(1) <= couts(6);
output(2) <= couts(2);
output(3) <= couts(0);
end architecture;