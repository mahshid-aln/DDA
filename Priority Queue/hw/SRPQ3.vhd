library ieee;
use ieee.std_logic_1164.all;
entity SRPQ3 is
	generic (n : integer := 4);
	port(clock: in std_logic;
		 rr,ww,new_entry: in std_logic_vector(31 downto 0);
		 hp_entry: out std_logic_vector(31 downto 0):= (others =>'0'));
end entity;
architecture structural of SRPQ3 is
component SRB3 is
	port(clk,r,w:in std_logic;
		 new_en, from_left, from_right : in std_logic_vector(7 downto 0);
		 comp_res_in: in std_logic;
		 to_left, to_right: out std_logic_vector(7 downto 0);
		 comp_res_out: out std_logic);
end component;
subtype block_data is std_logic_vector(7 downto 0);
type data_array is array (0 to n-1) of block_data; 
signal right_out, left_out : data_array;
--subtype block_comp is std_logic_vector(1 downto 0);
--type comp_array is array (0 to n-1) of block_comp; 
signal all_comp : std_logic_vector(n-1 downto 0);
begin
		p0: SRB3 port map(clock, rr(0), ww(0),
						 new_entry(7 downto 0), right_out(1), new_entry(7 downto 0),
						 '0', 
						 left_out(0), hp_entry(7 downto 0),
						 all_comp(0));
		pn: SRB3 port map(clock, rr(0), ww(0),
						 new_entry(7 downto 0), "00000000", left_out(n-2), 
						 all_comp(n-2),
						 left_out(n-1), right_out(n-1), 
						 all_comp(n-1));
ff: for i in 1 to n-2 generate
		pi: SRB3 port map(clock, rr(0), ww(0),
						 new_entry(7 downto 0), right_out(i+1), left_out(i-1),
						 all_comp(i-1),
						 left_out(i), right_out(i), 
						 all_comp(i));	
	end generate;
end architecture;