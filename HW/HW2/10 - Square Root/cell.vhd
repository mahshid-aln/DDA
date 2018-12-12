Library IEEE;
use IEEE.std_logic_1164.all;

entity cell is
        port(a, b, p,cin:in std_logic;
        cout, s: out std_logic);
end entity;

architecture behave of cell is
  signal w1,w2,w3, w0:std_logic;
begin
  w0 <= b xor p;
  w1 <= a xor w0;
  w2 <= cin and w1;
  w3 <= a and w0;
  s <= w1 xor cin;
  cout <= w2 or w3;
end architecture;
