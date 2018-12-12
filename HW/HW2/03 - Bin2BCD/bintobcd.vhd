--bintobcd
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;

entity bintobcd is
    Port ( binary : in  std_logic_vector(7 downto 0); unit : out  std_logic_vector(3 downto 0);
           tens : out  std_logic_vector(3 downto 0); hundreds : out  std_logic_vector(3 downto 0));
end entity;

architecture Behavioral of bintobcd is
begin
p1 :process(binary)
variable bintmp : std_logic_vector(7 downto 0);
variable bcd : std_logic_vector(11 downto 0) := (others => '0');
begin
	bcd := (others =>'0');
	bintmp := binary;
	for i in 0 to 7 loop
    	if (unsigned(bcd(3 downto 0)) > 3) then 
        	bcd(3 downto 0) := std_logic_vector(unsigned(bcd(3 downto 0)) + 3);
	    end if;
       	if (unsigned(bcd(7 downto 4)) > 3) then 
	        bcd(7 downto 4) := std_logic_vector(unsigned(bcd(7 downto 4)) + 3);
        end if;
        bcd := bcd(10 downto 0) & bintmp(7);
        bintmp := bintmp(6 downto 0) & '0';
    
    end loop;
	unit <= bcd(3 downto 0);
	tens <= bcd(7 downto 4);
	hundreds <= bcd(11 downto 8);
end process;            

end Behavioral;