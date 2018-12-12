library ieee;
use ieee. std_logic_1164.all;
use ieee. std_logic_arith.all;
use ieee. std_logic_unsigned.all;

entity jk is
	PORT( J,K,CLOCK,rst: in std_logic; Q: inout std_logic);
end jk;

Architecture behavioral of jk is
begin
PROCESS(CLOCK)
variable TMP: std_logic;
	begin
	if(rst = '1') then
		TMP := '0';
	else
		if(CLOCK='1' and CLOCK'EVENT) then
			if(J='0' and K='0')then
			TMP:=TMP;
			elsif(J='1' and K='1')then
			TMP:= not TMP;
			elsif(J='0' and K='1')then
			TMP:='0';
			else
			TMP:='1';
			end if;
		end if;
	end if;
	Q<=TMP;
	--QB<=not TMP;
end PROCESS;
end behavioral;

