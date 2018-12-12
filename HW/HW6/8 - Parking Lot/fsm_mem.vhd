library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use ieee.numeric_std.all;
entity fsm_mem is
	port(clk,a,b : in std_logic; state0:in std_logic_vector(3 downto 0); 
nex: out std_logic_vector(3 downto 0); en, ex: out std_logic
 );
end entity;
architecture arch11 of fsm_mem is
subtype row is std_logic_vector(5 downto 0);
type mem_block is array (36 downto 1) of row;
signal mem: mem_block;
signal addr : std_logic_vector(5 downto 0);
signal curr: std_logic_vector(3 downto 0):=state0;
begin
addr <= a&b&curr;
nex <= mem(conv_integer(addr))(5 downto 2);
en <=  mem(conv_integer(addr))(1);
ex <=  mem(conv_integer(addr))(0);
process(clk, addr)
begin
	if(rising_edge(clk))then
		case curr is 
		when "0000" =>		--start
			if(a='1' and b='0')then
				mem(conv_integer(addr)) <= "000100";		--a1 & enter & exit
			elsif(a='0' and b='1')then
				mem(conv_integer(addr)) <= "001000";
			else
				mem(conv_integer(addr)) <= "000000";
			end if;
		when "0001" =>		--a1
			if(a='1' and b='0')then
				mem(conv_integer(addr)) <= "000100";
			elsif(a='1' and b='1')then
				mem(conv_integer(addr)) <= "001100";
			else
				mem(conv_integer(addr)) <= "000000";
			end if;
		when "0010" =>		--b1
			if(a='0' and b='1')then
				mem(conv_integer(addr)) <= "001000";
			elsif(a='1' and b='1')then
				mem(conv_integer(addr)) <= "001100";
			else
				mem(conv_integer(addr)) <= "000000";
			end if;
		when "0011" =>		--ab1
			if(a='1' and b='0')then
				mem(conv_integer(addr)) <= "000100";
			elsif(a='0' and b='1')then
				mem(conv_integer(addr)) <= "001000";
			elsif(a='1' and b='1')then
				mem(conv_integer(addr)) <= "001100";
			else 
				mem(conv_integer(addr)) <= "010010";
			end if;
		when "0100" =>		--en
				mem(conv_integer(addr)) <= "000000";
		when "0101" =>		--a2
			if(a='1' and b='0')then
				mem(conv_integer(addr)) <= "010100";
			elsif(a='1' and b='1')then
				mem(conv_integer(addr)) <= "011100";
			else
				mem(conv_integer(addr)) <= "000000";
			end if;
		when "0110" =>		--b2 
			if(a='0' and b='1')then
				mem(conv_integer(addr)) <= "011000";
			elsif(a='1' and b='1')then
				mem(conv_integer(addr)) <= "011100";
			else
				mem(conv_integer(addr)) <= "000000";
			end if;
		when "0111" =>		--ab2
			if(a='1' and b='0')then
				mem(conv_integer(addr)) <= "010100";
			elsif(a='0' and b='1')then
				mem(conv_integer(addr)) <= "011000";
			elsif(a='1' and b='1')then
				mem(conv_integer(addr)) <= "011100";
			else
				mem(conv_integer(addr)) <= "100001";
			end if;
		when "1000" =>		--ex
				mem(conv_integer(addr)) <= "0000000";
		when others => 
				mem(conv_integer(addr)) <= "0000000";
	end case;
	end if;
end process;
end architecture;







