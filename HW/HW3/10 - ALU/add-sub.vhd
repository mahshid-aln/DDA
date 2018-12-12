library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mainp is
	port(a , b: in std_logic_vector(3 downto 0); cin1: in std_logic;
	cout: out std_logic; sum: out std_logic_vector(3 downto 0));
end mainp;

architecture Behavioral of mainp is
component fa is
	port (a, b, cin:in std_logic;
        cout, s: out std_logic);
end component;
signal cin: std_logic_vector(4 downto 0);
signal c:std_logic_vector(3 downto 0);
begin
	cin(0) <= cin1;
	cout <= cin(4);
	c(0) <= b(0) xor cin(0);
	c(1) <= b(1) xor cin(0);
	c(2) <= b(2) xor cin(0);
	c(3) <= b(3) xor cin(0);
	for_gen: for i in 0 to 3 generate
		faww: fa port map(a(i), c(i), cin(i), cin(i+1), sum(i));
	end generate for_gen;

end Behavioral;

