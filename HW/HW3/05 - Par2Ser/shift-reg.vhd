library IEEE;
use IEEE.std_logic_1164.all;
entity shiftreg7 is
	port(input: in std_logic_vector(7 downto 1); clock, load : in std_logic; output: out std_logic);
end entity;
architecture sss of shiftreg7 is
component Dff is
	port(D, clk:in std_logic; Q, Qnot:out std_logic);
end component;
signal data, datanot, datain: std_logic_vector(7 downto 1) := (others => 'X');
signal loadnot: std_logic;
begin
	df1 : component Dff 
			port map(input(1), clock, data(1), datanot(1));
	forgen : for i in 2 to 7 generate
	begin
	loadnot <= not load;
	datain(i) <= (data(i-1) nand loadnot) nand (load nand input(i));	
			df1 : component Dff
					port map(datain(i), clock, data(i), datanot(i));
	end generate;	
	output <= data(7);

end sss;
