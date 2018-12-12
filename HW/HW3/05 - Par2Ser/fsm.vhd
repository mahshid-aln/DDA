library IEEE;
use IEEE.std_logic_1164.all;
entity fsm is 
	port(w, rst, clk: in std_logic; p: out std_logic);
end entity;
architecture myfsm of fsm is
type state is (rsts,one1,two1,three1,four1,five1,six1,seven1);
signal curr : state := rsts;
begin 
p1: process(clk)
	begin
		if(rising_edge(clk))then
			if(rst='1')then
				curr <= rsts;
			else
				case curr is
					when rsts => 
						if(w='1')then			
							curr <= one1;
						else
							curr <= rsts;
						end if;
					when one1 => 
						if(w='1')then			
							curr <= two1;
						else
							curr <= one1;
						end if;
					when two1 => 
						if(w='1')then			
							curr <= three1;
						else
							curr <= two1;
						end if;
					when three1 => 
						if(w='1')then			
							curr <= four1;
						else
							curr <= three1;
						end if;
					when four1 => 
						if(w='1')then			
							curr <= five1;
						else
							curr <= four1;
						end if;
					when five1 => 
						if(w='1')then			
							curr <= six1;
						else
							curr <= five1;
						end if;
					when six1 => 
						if(w='1')then			
							curr <= seven1;
						else
							curr <= six1;
						end if;
					when seven1 => 
						curr <= rsts;
				end case;
			end if;
		end if;
end process p1;
p2: process(curr)
	begin
		case curr is
					when rsts => 
						p <= '0';
					when one1 => 
						p <= '1';
					when two1 => 
						p <= '0';
					when three1 => 
						p <= '1';
					when four1 => 
						p <= '0';
					when five1 => 
						p <= '1';
					when six1 => 
						p <= '0';
					when seven1 => 
						p <= '1';

			end case;
end process p2;
end architecture;