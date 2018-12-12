library ieee;
use ieee.std_logic_1164.all;
entity u_d_counter is
	port(clk,inc,dec : in std_logic; counter:inout integer:=0);
end entity;
architecture arch1 of u_d_counter is
type state is (start,a1,b1,ab1,en,a2,b2,ab2,ex);
signal curr: state:= start;
begin
process(clk, inc, dec)
begin
	if(rising_edge(clk))then
		if(inc = '1')then
			counter <= counter + 1;
		elsif(dec = '1')then
			if(counter >= 0)then
				counter <= counter - 1;
			end if;
		end if;
	end if;
end process;
end architecture;