library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use ieee.numeric_std.all;
entity mem_design is
	port(clk:in std_logic; x,y: in std_logic_vector(4 downto 0); func: inout std_logic_vector(9 downto 0));
end entity;
architecture arch of mem_design is
subtype row is std_logic_vector(9 downto 0);
type mem_block is array (1024 downto 1) of row;
signal m1k10 : mem_block;
signal addr : std_logic_vector(10 downto 1);
signal funcint : integer range 0 to 1023;
begin
addr <= x & y;
funcint <= (conv_integer(x)*conv_integer(y))/(2*conv_integer(x)+ 2*(conv_integer(y)));
process(clk, x, y)
begin
	func <= (std_logic_vector(to_unsigned(funcint, 10)));
	m1k10(conv_integer(addr)) <= func;
end process;
end architecture;