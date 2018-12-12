-------------------------------------------------------------------------------
-- microblaze_tb.vhd
-------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

-- START USER CODE (Do not remove this line)

-- User: Put your libraries here. Code in this
--       section will not be overwritten.

-- END USER CODE (Do not remove this line)

entity microblaze_tb is
end microblaze_tb;

architecture STRUCTURE of microblaze_tb is

  constant CLK_P_PERIOD : time := 5000.000000 ps;
  constant CLK_N_PERIOD : time := 5000.000000 ps;
  constant RESET_LENGTH : time := 80000 ps;

  component microblaze is
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

  -- Internal signals

  signal CLK_N : std_logic;
  signal CLK_P : std_logic;
  signal HP_EN : std_logic_vector(31 downto 0);
  signal NEW_EN : std_logic_vector(31 downto 0);
  signal RESET : std_logic;
  signal RR : std_logic_vector(31 downto 0);
  signal WW : std_logic_vector(31 downto 0);

  -- START USER CODE (Do not remove this line)

  -- User: Put your signals here. Code in this
  --       section will not be overwritten.

  -- END USER CODE (Do not remove this line)

begin

  dut : microblaze
    port map (
      RESET => RESET,
      CLK_P => CLK_P,
      CLK_N => CLK_N,
      RR => RR,
      WW => WW,
      NEW_EN => NEW_EN,
      HP_EN => HP_EN
    );

  -- Clock generator for CLK_P

  process
  begin
    CLK_P <= '0';
    loop
      wait for (CLK_P_PERIOD/2);
      CLK_P <= not CLK_P;
    end loop;
  end process;

  -- Clock generator for CLK_N

  process
  begin
    CLK_N <= '1';
    loop
      wait for (CLK_N_PERIOD/2);
      CLK_N <= not CLK_N;
    end loop;
  end process;

  -- Reset Generator for RESET

  process
  begin
    RESET <= '1';
    wait for (RESET_LENGTH);
    RESET <= not RESET;
    wait;
  end process;

  -- START USER CODE (Do not remove this line)

  -- User: Put your stimulus here. Code in this
  --       section will not be overwritten.

  -- END USER CODE (Do not remove this line)

end architecture STRUCTURE;

