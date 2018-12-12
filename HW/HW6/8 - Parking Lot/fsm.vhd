library ieee;
use ieee.std_logic_1164.all;
entity fsm is
	port(clk,a,b : in std_logic; exitt, enter: out std_logic);
end entity;
architecture arch of fsm is
type state is (start,a1,b1,ab1,en,a2,b2,ab2,ex);
signal curr: state:= start;
begin
process(clk)
begin
	if(rising_edge(clk))then
	case curr is 
		when start =>
			if(a='1' and b='0')then
				curr <= a1;
			elsif(a='0' and b='1')then
				curr <= b1;
			else
				curr <= start;
			end if;
		when a1 =>
			if(a='1' and b='0')then
				curr <= a1;
			elsif(a='1' and b='1')then
				curr <= ab1;
			else
				curr <= start;
			end if;
		when b1 =>
			if(a='0' and b='1')then
				curr <= b1;
			elsif(a='1' and b='1')then
				curr <= ab2;
			else
				curr <= start;
			end if;
		when ab1 =>
			if(a='1' and b='0')then
				curr <= a1;
			elsif(a='0' and b='1')then
				curr <= b2;
			elsif(a='1' and b='1')then
				curr <= ab1;
			else 
				curr <= en;
			end if;
		when en =>
				curr <= start;
		when a2 =>
			if(a='1' and b='0')then
				curr <= a2;
			elsif(a='1' and b='1')then
				curr <= ab2;
			else
				curr <= start;
			end if;
		when b2 => 
			if(a='0' and b='1')then
				curr <= b2;
			elsif(a='1' and b='1')then
				curr <= ab2;
			else
				curr <= start;
			end if;
		when ab2 =>
			if(a='1' and b='0')then
				curr <= a2;
			elsif(a='0' and b='1')then
				curr <= b2;
			elsif(a='1' and b='1')then
				curr <= ab2;
			else
				curr <= ex;
			end if;
		when ex =>
				curr <= start;
	end case;
	end if;
end process;
process(clk, curr)
begin
if(rising_edge(clk))then
	case curr is 
		when start =>
			exitt <= '0';
			enter <= '0';
		when a1 =>
			exitt <= '0';
			enter <= '0';
		when b1 =>
			exitt <= '0';
			enter <= '0';
		when ab1 =>
			exitt <= '0';
			enter <= '0';
		when en =>
			exitt <= '0';
			enter <= '1';
		when a2 =>
			exitt <= '0';
			enter <= '0';
		when b2 => 
			exitt <= '0';
			enter <= '0';
		when ab2 =>
			exitt <= '0';
			enter <= '0';
		when ex =>
			exitt <= '1';
			enter <= '0';
	end case;
	end if;
end process;	
end architecture;
		
