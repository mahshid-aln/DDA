library ieee;
use ieee.std_logic_1164.all;
entity SRB3 is
	port(clk,r,w:in std_logic;
		 new_en, from_left, from_right : in std_logic_vector(7 downto 0);
		 comp_res_in: in std_logic;
		 to_left, to_right: out std_logic_vector(7 downto 0);
		 comp_res_out: out std_logic);
end entity;
architecture arch of SRB3 is
type st_type is (start, reading_to_right, reading_from_left, 
				 writing, writing_hold, writing_hold2, writing_new_to_left,
				 writing_new_from_new, writing_shift_to_left, writing_shift_from_right);
signal cur : st_type;
signal hold_sig : std_logic_vector(7 downto 0):="00000000";
begin
process(clk)
begin
if(rising_edge(clk))then
case cur is
when start =>
	if(r='0' and w='0')then
		cur <= start;
	elsif(r='1')then
		cur <= reading_to_right;
	elsif(r='0' and w='1' and new_en/="00000000")then
		cur <= writing;
	else
		cur <= start;
	end if;
when reading_to_right=>
	cur <= reading_from_left;
when reading_from_left =>
	if(r='0' and w='0')then
		cur <= start;
	elsif(r='1')then
		cur <= reading_to_right;
	elsif(r='0' and w='1' and new_en/="00000000")then
		cur <= writing;
	else
		cur <= start;
	end if;
when writing =>
	if(new_en(2 downto 0) < hold_sig(2 downto 0) or 
		new_en(2 downto 0) = hold_sig(2 downto 0))then
		cur <= writing_hold;
	elsif(comp_res_in='1')then
		cur <= writing_shift_to_left;
	elsif(comp_res_in='0' and new_en(2 downto 0)>hold_sig(2 downto 0)
		  and new_en(2 downto 0)/=hold_sig(2 downto 0))then
		cur <= writing_new_to_left;
	end if;
when writing_hold =>
	cur <= writing_hold2;
when writing_hold2 =>
	if(r='0' and w='0')then
		cur <= start;
	elsif(r='1')then
		cur <= reading_to_right;
	elsif(r='0' and w='1' and new_en/="00000000")then
		cur <= writing;
	else
		cur <= start;
	end if;
when writing_shift_to_left =>
	cur <= writing_shift_from_right;
when writing_shift_from_right =>
	if(r='0' and w='0')then
		cur <= start;
	elsif(r='1')then
		cur <= reading_to_right;
	elsif(r='0' and w='1' and new_en/="00000000")then
		cur <= writing;
	else
		cur <= start;
	end if;
when writing_new_to_left =>
	cur <= writing_new_from_new;
when writing_new_from_new =>
	if(r='0' and w='0')then
		cur <= start;
	elsif(r='1')then
		cur <= reading_to_right;
	elsif(r='0' and w='1' and new_en/="00000000")then
		cur <= writing;
	else
		cur <= start;
	end if;
end case;
end if;
end process;
process(cur)
begin
case cur is
when start =>
	hold_sig <= hold_sig;
when reading_to_right=>
	to_right <= hold_sig;
when reading_from_left =>
	hold_sig <= from_left;
when writing =>
	if(hold_sig = "00000000")then
		comp_res_out <= '1';
	elsif(new_en(2 downto 0) > hold_sig(2 downto 0))then
		comp_res_out <= '1';
	else
		comp_res_out <= '0';
	end if;
when writing_hold =>
	hold_sig <= hold_sig;		
when writing_hold2 =>
	hold_sig <= hold_sig;
when writing_shift_to_left =>
	to_left <= hold_sig;
when writing_shift_from_right =>
	hold_sig <= from_right;
when writing_new_to_left =>
	to_left <= hold_sig;
when writing_new_from_new =>
	hold_sig <= new_en;
end case;
end process;
end architecture;