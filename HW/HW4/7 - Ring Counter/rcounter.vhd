library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity rcounter is
	generic (n :integer:= 4);
	port(start,clok:in std_logic; Qsig:inout std_logic_vector(n-1 downto 0):= (others => '0'));
end entity;
architecture rtl1 of rcounter is
signal Qs : std_logic_vector(n-1 downto 0):= (others => '0');
begin
p1: process(clok)
begin
	if(rising_edge(clok)) then
		if(start = '1')then
			Qs(0) <= '1';
			Qs(n-1 downto 1) <= (others => '0');	
		else
			for i in 1 to n-1 loop
				Qs(i) <= Qs(i-1);
			end loop;
			Qs(0) <= QS(n-1);
		end if;
	end if;
	Qsig <= Qs;
end process p1;
end architecture;



--architecture rtl2 of rcounter is
--component Dff is
--	port(rst, pst, D, clk:in std_logic; Q, Qnot:out std_logic);
--end component;
--signal Qnots: std_logic_vector(n-1 downto 0);
--signal startnot: std_logic;
--begin
--	
--	startnot <= not start;
--	rr: Dff port map('1', startnot, Qsig(n-1), clok, Qsig(0), Qnots(0));
--	fff:for i in 1 to n-1 generate
--	rrr: Dff port map(startnot, '1', Qsig(i-1), clok, Qsig(i), Qnots(i));
--	end generate;
--end architecture;
