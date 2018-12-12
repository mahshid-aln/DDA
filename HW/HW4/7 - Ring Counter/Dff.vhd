library IEEE;
use ieee.std_logic_1164.all;
entity Dff is
	port(rst, pst, D, clk:in std_logic; Q, Qnot:out std_logic);
end Dff;

architecture Behavioral of Dff is

begin

	process(clk)
	begin
		if(rising_edge(clk))then
			if(rst = '0')then
				Q <= '0';
			elsif(pst = '0')then
				Q <= '1';
			else
				Q <= D;
			end if;
			Qnot <= not D;
		end if;
	end process;
end Behavioral;
