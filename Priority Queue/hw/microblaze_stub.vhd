-------------------------------------------------------------------------------
-- microblaze_stub.vhd
-------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

entity microblaze_stub is
  port (
    RESET : in std_logic;
    CLK_P : in std_logic;
    CLK_N : in std_logic;
    RR : out std_logic;
    WW : out std_logic;
    NEW_EN : out std_logic_vector(31 downto 0);
    HP_EN : in std_logic_vector(31 downto 0)
  );
end microblaze_stub;

architecture STRUCTURE of microblaze_stub is

  component microblaze is
    port (
      RESET : in std_logic;
      CLK_P : in std_logic;
      CLK_N : in std_logic;
      RR : out std_logic;
      WW : out std_logic;
      NEW_EN : out std_logic_vector(31 downto 0);
      HP_EN : in std_logic_vector(31 downto 0)
    );
  end component;

 attribute BOX_TYPE : STRING;
 attribute BOX_TYPE of microblaze : component is "user_black_box";

begin

  microblaze_i : microblaze
    port map (
      RESET => RESET,
      CLK_P => CLK_P,
      CLK_N => CLK_N,
      RR => RR,
      WW => WW,
      NEW_EN => NEW_EN,
      HP_EN => HP_EN
    );

end architecture STRUCTURE;

