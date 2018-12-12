library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux is
port(d0,d1,s:in std_logic; output:out std_logic);
end mux;

architecture Behavioral of mux is

begin
output <= (s and d1) or ((not s) and d0);
end Behavioral;
