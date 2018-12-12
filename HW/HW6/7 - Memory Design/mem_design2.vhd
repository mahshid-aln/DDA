library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use ieee.numeric_std.all;
entity mem_design2 is
	port(clk:in std_logic; x,y: in std_logic_vector(5 downto 0); func: inout std_logic_vector(1 downto 0));
end entity;
architecture arch2 of mem_design2 is
subtype row is std_logic_vector(1 downto 0);
type mem_block is array (4096 downto 1) of row;
signal m4k2 : mem_block;
signal addr : std_logic_vector(12 downto 1);
signal funcint : integer range 0 to 4095;
signal functotal: std_logic_vector(12 downto 1);
begin
addr <= x & y;
funcint <= (conv_integer(x)*conv_integer(y))/(2*conv_integer(x)+ 2*(conv_integer(y)));
process(clk, x, y)
begin
	functotal <= (std_logic_vector(to_unsigned(funcint, 12)));
	func <= functotal(2 downto 1);
	m4k2(conv_integer(addr)) <= func;
end process;
end architecture;
