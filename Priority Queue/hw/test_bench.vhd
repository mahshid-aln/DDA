LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
--USE ieee.numeric_std.ALL;
 
ENTITY test_bench IS
END test_bench;
 
ARCHITECTURE behavior OF test_bench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT top_module
    PORT(
         RESET : IN  std_logic;
         CLK_P : IN  std_logic;
         CLK_N : IN  std_logic;
         CLK : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal RESET : std_logic := '1';
   signal CLK_P : std_logic := '0';
   signal CLK_N : std_logic := '1';
   signal CLK : std_logic := '0';

   -- Clock period definitions
   constant CLK_P_period : time := 10 ns;
   constant CLK_N_period : time := 10 ns;
   constant CLK_period : time := 80 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: top_module PORT MAP (
          RESET => RESET,
          CLK_P => CLK_P,
          CLK_N => CLK_N,
          CLK => CLK
        );

	RESET <= '1', '0' after 100ns;
   -- Clock process definitions
   CLK_P_process :process
   begin
		CLK_P <= '0';
		wait for CLK_P_period/2;
		CLK_P <= '1';
		wait for CLK_P_period/2;
   end process;
 
   CLK_N_process :process
   begin
		CLK_N <= '1';
		wait for CLK_N_period/2;
		CLK_N <= '0';
		wait for CLK_N_period/2;
   end process;
 
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

END;
