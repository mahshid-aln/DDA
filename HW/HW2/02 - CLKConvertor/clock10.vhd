--clock10
Library IEEE;
use IEEE.std_logic_1164.all;
entity clock10 is
	port(clockin: in std_logic; clockout: out std_logic);
end entity;
architecture Behavioral of clock10 is
signal a:integer := 0;	
signal tmp:std_logic := '0';
begin	
	clockout <= tmp;
	process(clockin)
	begin
		if(rising_edge(clockin) or falling_edge(clockin))then
			a <= a+1;
			if(a >= 4) then
				a <= 0;
				tmp <= not tmp;
			end if;
		end if;
	end process;
end Behavioral;
