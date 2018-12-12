library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
--use IEEE.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
entity vending_machine is 
	port(coin_in : in std_logic; 
		 coin_in_1 : in std_logic;
	     coin_in_10 : in std_logic; 
		 coin_in_100 : in std_logic;
         buy_in : in std_logic;
		 price : in std_logic_vector(7 downto 0);
		 coin_return : out std_logic;
		 coin_return_1 : out std_logic_vector(7 downto 0);
		 coin_return_10 : out std_logic_vector(7 downto 0);
		 coin_return_100 : out std_logic_vector(7 downto 0));
end entity; 
architecture arch of vending_machine is
type state is (canbuy, start, getmoney);
signal curr: state := start;
signal clk : std_logic;
signal num1, num10, num100 : unsigned(7 downto 0);


begin
process(clk , curr)
variable no1, no10, no100 : integer;
variable money: std_logic_vector(7 downto 0);
begin
	money := std_logic_vector(to_unsigned(no100*100 + no10*10 + no1, 8));
	
	case curr is 
	when start =>
		no1 := 0;
		no10 := 0;
		no100 := 0;
		if(coin_in = '1')then
			curr <= getmoney;
		else
			curr <= start;
		end if;
		coin_return <= '0';
		coin_return_1   <= "00000000";
		coin_return_10 <= "00000000";
        coin_return_100	 <= "00000000";
	when getmoney =>
		if(coin_in_1 = '1')then
			no1 := no1 +1;
		elsif(coin_in_10 = '1')then
			no10 := no10+1;
		elsif(coin_in_100 = '1')then
			no100 := no100 + 1;
		end if;
		if(buy_in='1' and money>=price)then
			curr <= canbuy;
		else
			curr <= getmoney;	
		end if;	
		coin_return <= '0';
		coin_return_1  <= "00000000";
		coin_return_10 <= "00000000";
        coin_return_100	<= "00000000";
	when canbuy => 
		if(money = price)then
			coin_return <= '0';
			coin_return_1  <= "00000000";
			coin_return_10 <= "00000000";
	        coin_return_100	<= "00000000";
		else
			coin_return <= '1';
			num100 <= (unsigned(money))/100;
			coin_return_100 <= std_logic_vector(unsigned(num100));
			num10 <= (unsigned(money) - unsigned(num100)*100)/10;
			coin_return_10 <= std_logic_vector(unsigned(num10));
			num1 <= unsigned(money) - (unsigned(num100)*100) - (unsigned(num10)*10);	
			coin_return_1 <= std_logic_vector(unsigned(num1));
		end if;
	end case;
end process;
end architecture;