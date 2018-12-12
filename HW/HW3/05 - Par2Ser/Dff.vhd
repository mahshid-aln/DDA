library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Dff is
port(D, clk:in std_logic; Q, Qnot:out std_logic);
end Dff;

architecture Behavioral of Dff is

begin

	process(clk)
	begin
		if(rising_edge(clk))then
			Q <= D;
			Qnot <= not D;
		end if;
	end process;
end Behavioral;
