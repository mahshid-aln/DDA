library ieee;
use ieee.std_logic_1164.all;
entity seg7 is
 port(d11,d22,d33,d44: in bit_vector(3 downto 0); o1,o2,o3,o4: out bit_vector(6 downto 0));
end entity;
architecture useseg7 of seg7 is
component s7 is
	port(d0, d1, d2, d3 :IN bit;  a, b, c, d, e, f, g : OUT bit); 
End component;  
for m1,m2: s7 use entity work.sevsegv(behave1);
for others : s7 use entity work.sevsegv(behave2);
begin
m1: s7 port map (d11(0), d11(1), d11(2), d11(3), o1(0), o1(2), o1(3), o1(4), o1(5), o1(6));
m2: s7 port map (d22(0), d22(1), d22(2), d22(3), o2(0), o2(2), o2(3), o2(4), o2(5), o2(6));
m3: s7 port map (d33(0), d33(1), d33(2), d33(3), o3(0), o3(2), o3(3), o3(4), o3(5), o3(6));
m4: s7 port map (d44(0), d44(1), d44(2), d44(3), o4(0), o4(2), o4(3), o4(4), o4(5), o4(6));
end architecture;
architecture useseg2 of seg7 is
component s7 is
	port(d0, d1, d2, d3 :IN bit;  a, b, c, d, e, f, g : OUT bit); 
End component;  
begin
m1: s7 port map (d11(0), d11(1), d11(2), d11(3), o1(0), o1(2), o1(3), o1(4), o1(5), o1(6));
m2: s7 port map (d22(0), d22(1), d22(2), d22(3), o2(0), o2(2), o2(3), o2(4), o2(5), o2(6));
m3: s7 port map (d33(0), d33(1), d33(2), d33(3), o3(0), o3(2), o3(3), o3(4), o3(5), o3(6));
m4: s7 port map (d44(0), d44(1), d44(2), d44(3), o4(0), o4(2), o4(3), o4(4), o4(5), o4(6));
end architecture;
