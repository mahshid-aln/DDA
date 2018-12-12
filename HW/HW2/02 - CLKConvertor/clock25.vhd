--closk25
Library IEEE;
use IEEE.std_logic_1164.all;
entity clock25 is
	port(clockin: in std_logic; clockout: out std_logic);
end entity;
architecture Behavioral of clock25 is
signal a:integer := 0;	
signal tmp:std_logic := '0';
begin	
	clockout <= tmp;
	process(clockin)
	begin
		if(rising_edge(clockin))then
			tmp <= not tmp;
		end if;
	end process;
end Behavioral;
