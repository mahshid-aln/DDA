
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--use IEEE.NUMERIC_STD.ALL;


entity top_module is
	port(
			RESET: in std_logic;
			CLK_P: in std_logic;
			CLK_N: in std_logic;
			CLK:   in std_logic);
			
end top_module;

architecture Behavioral of top_module is
component microblaze_top is
  port (
    RESET : in std_logic;
    CLK_P : in std_logic;
    CLK_N : in std_logic;
    RR : out std_logic_vector(31 downto 0);
    WW : out std_logic_vector(31 downto 0);
    NEW_EN : out std_logic_vector(31 downto 0);
    HP_EN : in std_logic_vector(31 downto 0)
  );
end component;
component SRPQ3 is
	generic (n : integer := 4);
	port(clock: in std_logic;
		 rr,ww,new_entry: in std_logic_vector(31 downto 0);
		 hp_entry: out std_logic_vector(31 downto 0):= (others =>'0'));
end component;
signal rr,ww : std_logic_vector(31 downto 0);
signal new_entry: std_logic_vector(31 downto 0); 
signal hp_entry: std_logic_vector(31 downto 0):= (others =>'0');
begin

u1: microblaze_top port map(
	 RESET => RESET,
    CLK_P => CLK_P,
    CLK_N => CLK_N,
    RR => rr,
    WW => ww,
    NEW_EN => new_entry,
    HP_EN => hp_entry
	 );
u2: SRPQ3 port map(
	 clock => CLK,
	 rr => rr,
	 ww => ww,
	 new_entry => new_entry,
	 hp_entry => hp_entry
	 );

end Behavioral;

