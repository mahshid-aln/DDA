LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

 
ENTITY SRPQ3_tb IS
END SRPQ3_tb;
 
ARCHITECTURE behavior OF SRPQ3_tb IS 
 
 
    COMPONENT SRPQ3
    PORT(
         clock : IN  std_logic;
         rr : IN  std_logic_vector(31 downto 0);
         ww : IN  std_logic_vector(31 downto 0);
         new_entry : IN  std_logic_vector(31 downto 0);
         hp_entry : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clock : std_logic := '0';
   signal rr :std_logic_vector(31 downto 0) := (others => '0');
   signal ww : std_logic_vector(31 downto 0) := (others => '0');
   signal new_entry : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal hp_entry : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: SRPQ3 PORT MAP (
          clock => clock,
          rr => rr,
          ww => ww,
          new_entry => new_entry,
          hp_entry => hp_entry
        );

	clock <= not clock after 10ns;
	rr(0) <= '0','1' after 65ns, '0' after 95ns, '1' after 215ns, '0' after 245ns, '1' after 305ns;
	ww(0) <= '1';
	new_entry(7 downto 0) <= "11111101", "00001011" after 100ns, "00001101" after 165ns, "10000001" after 240ns;

END;
