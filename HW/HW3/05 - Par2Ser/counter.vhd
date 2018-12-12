library IEEE;
use IEEE.std_logic_1164.all;
entity counter is
	port(clk , reset: in std_logic; count: out std_logic_vector(2 downto 0):= "000");
end entity;
architecture structural of counter is
component jk is
	port(J,K,CLOCK,rst: in std_logic; Q : inout std_logic);
end component;
signal q0q1, q0q1q2: std_logic; 
begin
q0q1 <= count(0) and count(1);
q0q1q2 <= q0q1 and count(2);
jk0: jk port map('1', '1', clk, not reset, count(0));
jk1: jk port map(count(0), count(0),clk, not reset, count(1));
jk2: jk port map(q0q1, q0q1, clk, not reset, count(2));
--jk3: jk port map(q0q1q2 , q0q1q2, clk, not reset, count(3));
end architecture; 