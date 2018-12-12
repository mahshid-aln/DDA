library ieee;
use ieee.std_logic_1164.all;

Entity sevsegv is Port 
(d0, d1, d2, d3 :IN bit;  a, b, c, d, e, f, g : OUT bit); 
End sevsegv;  
Architecture behave1 Of sevsegv IS 
signal data : bit_vector(3 downto 0); 
begin 
data<= d3&d2&d1&d0; 
decode: Process(d3,d2,d1,d0) 
begin
  a<='1';
 b<='1'; 
c<='1'; 
d<='1'; 
e<='1'; 
f<='1'; 
g<='1';  
case data is  
when "0000" => a<='0';b<='0';c<='0';d<='0';e<='0';f<='0';g<='1';
  when "0001" => a<='1';b<='0';c<='0';d<='1';e<='1';f<='1';g<='1';
  when "0010" => a<='0';b<='0';c<='1';d<='0';e<='0';f<='1';g<='0';
  when "0011" => a<='0';b<='0';c<='0';d<='1';e<='1';f<='0';g<='1'; 
 when "0100" => a<='1';b<='0';c<='0';d<='1';e<='1';f<='0';g<='0'; 
 when "0101" => a<='0';b<='1';c<='0';d<='0';e<='1';f<='0';g<='0';
  when "0110" => a<='0';b<='1';c<='0';d<='0';e<='0';f<='0';g<='0';
  when "0111" => a<='0';b<='0';c<='0';d<='1';e<='1';f<='1';g<='1'; 
 when "1000" => a<='0';b<='0';c<='0';d<='0';e<='0';f<='0';g<='0'; 
 when others => a<='1';b<='1';c<='1';d<='1';e<='1';f<='1';g<='0';

  end case; 
end process decode; 
end behave1;  

------ Second   
Architecture behave2 Of sevsegv IS 
begin
--type vlbit_2d is array(0 to 9, 10 downto 0); 
--constant tbl : vlbit_2d := (B"0000_0000001 " , B"0001_1001111 " ,
-- B"0010_0010010 " , B"0011_0000110 " , B"0100_1001100 " , B"0101_0100100 " ,
-- B"0110_0100000 " , B"0111_0001111 " , B"1000_0000000 " , B"1001_0000100" ); 
--signal data : bit_vector(3 downto 0); 
--signal outv : bit_vector(6 downto 0); 
--begin 
--data<= d3&d2&d1&d0;
-- pla_table(data,outv , tbl);
-- a<=outv(0);
-- b<=outv(1); 
--c<=outv(2);
-- d<=outv(3); 
--e<=outv(4);
-- f<=outv(5);
-- g<=outv(6);
 end behave2;   
