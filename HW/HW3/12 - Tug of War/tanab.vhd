library ieee;
use ieee.std_logic_1164.all;
entity tanab is
	port(rst,clk,rp,lp : in std_logic; winner: out std_logic_vector(1 downto 0); 
	led: out std_logic_vector(9 downto 1));
end entity;
architecture match of tanab is 
type state is (l1,l2,l3,l4,l5,l6,l7,l8,l9);
signal curr, nex : state := l5; 
--signal l : std_logic:=lp;
--signal r : std_logic:=rp;
begin
process(clk,rst)
begin
	if(rst = '1')then
		curr <= l5;
	elsif(rising_edge(clk))then 
		curr <= nex;
	end if;
end process;
process(curr, rp, lp)
variable l,r : std_logic;
begin
	l := lp;
	r := rp;	 
	case curr is 
		when l1 => 
			if(r = '1' and l = '0')then
				nex <= l1;
				r := '0';
			elsif(r = '0' and l = '1')then
				nex <= l1;
				l := '0';
			else
				nex <= l1;
			end if;
		when l2 => 
			if(r = '1' and l = '0')then
				nex <= l3;
				r := '0';
			elsif(r = '0' and l = '1')then
				nex <= l1;
				l := '0';
			else
				nex <= l2;
			end if;
		when l3 => 
			if(r = '1' and l = '0')then
				nex <= l4;
				r := '0';
			elsif(r = '0' and l = '1')then
				nex <= l2;
				l := '0';
			else
				nex <= l3;
			end if;
		when l4 => 
			if(r = '1' and l = '0')then
				nex <= l5;
				r := '0';
			elsif(r = '0' and l = '1')then
				nex <= l3;
				l := '0';
			else
				nex <= l4;
			end if;
		when l5 => 
			if(r = '1' and l = '0')then
				nex <= l6;
				r := '0';
			elsif(r = '0' and l = '1')then
				nex <= l4;
				l := '0';
			else
				nex <= l5;
			end if;
		when l6 => 
			if(r = '1' and l = '0')then
				nex <= l7;
				r := '0';
			elsif(r = '0' and l = '1')then
				nex <= l5;
				l := '0';
			else
				nex <= l6;
			end if;
		when l7 => 
			if(r = '1' and l = '0')then
				nex <= l8;
				r := '0';
			elsif(r = '0' and l = '1')then
				nex <= l6;
				l := '0';
			else
				nex <= l7;
			end if;
		when l8 => 
			if(r = '1' and l = '0')then
				nex <= l9;
				r := '0';
			elsif(r = '0' and l = '1')then
				nex <= l7;
				l := '0';
			else
				nex <= l8;
			end if;
		when l9 => 
			if(r = '1' and l = '0')then
				nex <= l9;
				r := '0';
			elsif(r = '0' and l = '1')then
				nex <= l9;
				l := '0';
			else
				nex <= l9;
			end if;
	end case;
end process;
process(curr)
begin 
	case curr is 
		when l1 => 
			winner <= "10";
			led <= "100000000";
		when l2 => 
			winner <= "00";
			led <= "010000000";
		when l3 => 
			winner <= "00";
			led <= "001000000";
		when l4 => 
			winner <= "00";
			led <= "000100000";
		when l5 => 
			winner <= "00";
			led <= "000010000";
		when l6 => 
			winner <= "00";
			led <= "000001000";
		when l7 => 
			winner <= "00";
			led <= "000000100";
		when l8 => 
			winner <= "00";
			led <= "000000010";
		when l9 => 
			winner <= "01";
			led <= "000000001";
	end case;
end process;
end architecture;