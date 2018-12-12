library ieee;
use ieee.std_logic_1164.all;
entity tanab_tb is
end entity;
architecture test of tanab_tb is
component tanab is
	port(rst,clk,rp,lp : in std_logic; winner: out std_logic_vector(1 downto 0); 
	led: out std_logic_vector(9 downto 1));
end component;
signal reset,clock,rrr,lll : std_logic:='0';
signal win:std_logic_vector(1 downto 0);
signal light: std_logic_vector(9 downto 1);
begin
clock <= not clock after 20ns;
reset <= '1' after 110ns, '0' after 130ns;
rrr<= '1' after 15ns, '0' after 30ns, '1' after 55ns, '0' after 85ns, '1' after 110ns,
 '0' after 135ns, '1' after 155ns, '0' after  175ns, '1' after 190ns, '0' after 210ns, 
'1' after 245ns, '0' after 295ns, '1' after 325ns, '0' after 350ns, '1' after 390ns, '0' after  410ns;

lll<= '0', '1' after 20ns, '0' after 35ns, '1' after 65ns, '0' after 90ns, '1' after 125ns,
 '0' after 135ns, '1' after 170ns, '0' after 185ns, '1' after 200ns, '0' after 215ns, '1' after 260ns, '0' after 295ns,
 '1' after 330ns, '0' after 355ns, '1' after  385ns, '0' after 430ns, '1' after 465ns;
t1 : tanab port map(reset,clock,rrr,lll,win,light);
end architecture;