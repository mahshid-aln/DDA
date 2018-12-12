--termo
library IEEE;
use IEEE.std_logic_1164.all;
entity termo is
	port(wanted_temp, envior_temp: in integer; on_off: out boolean);
end entity;
architecture behave of termo is
signal when_on_off: integer;
--signal output : std_logic;
begin
when_on_off <= 3, -2 after 100ns; --wanted_temp - envior_temp ;
--on_off <= true when when_on_off >= 2 else
--		  false when when_on_off <= -2 else
--		  true;			
process(when_on_off)
begin
	if(when_on_off >= 2) then
		on_off <= true;
	elsif (when_on_off <= -2) then
		on_off <= false;
	else
		on_off <= true;
	end if;
end process;

end behave;

