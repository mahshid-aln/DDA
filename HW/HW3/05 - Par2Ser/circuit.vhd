library IEEE;
use IEEE.std_logic_1164.all;
entity circuit is
	port(clock1, load1: in std_logic; inp:in std_logic_vector(7 downto 1); sout: out std_logic);
end entity;

architecture structural of circuit is
component counter is
	port(clk , reset: in std_logic; count: out std_logic_vector(2 downto 0):= "000");
end component;

component Dff is
port(D, clk:in std_logic; Q, Qnot:out std_logic);
end component;

component fsm is 
	port(w, rst, clk: in std_logic; p: out std_logic);
end component;   
component mux is
port(d0,d1,s:in std_logic; output:out std_logic);
end component;

component shiftreg7 is
	port(input: in std_logic_vector(7 downto 1); clock, load : in std_logic; output: out std_logic);
end component;
signal clear, wout, pout,sel, muxout, soutnot: std_logic;
signal c: std_logic_vector(2 downto 0);
begin
clear <= not load1;
sel <= c(0) and c(1) and c(2);
m1: counter port map(clock1, clear,c);
m2: Dff port map(muxout, clock1, sout, soutnot);
m3: fsm port map(wout, clear, clock1, pout);
m4: mux port map(wout, pout, sel, muxout);
m5: shiftreg7 port map(inp, clock1, load1, wout);
end architecture;
