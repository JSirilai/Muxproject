library IEEE;
use IEEE.STD_LOGIC_1164.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MUX_TB is
end MUX_TB;

architecture Testbench of MUX_TB is
	component MUX is
		port (
			S    : in STD_LOGIC_VECTOR (1 downto 0);
			LED  : out STD_LOGIC;
			CLK  : in STD_LOGIC
		);
	end component;
	signal input : STD_LOGIC_VECTOR (1 downto 0);
	signal output, C_in : STD_LOGIC;
	constant Period : time := 83.3333 ns;
begin
	uut : MUX
	port map(S => input, LED => output, CLK => C_in);

	Clock : process
	begin
		C_in <= '0';
		wait for period/2;
		C_in <= '1';
		wait for period/2;
	end process Clock;

	simulus : process
	begin
		input <= "00";
		wait for 2 sec;
		input <= "01";
		wait for 2 sec;
		input <= "10";
		wait for 2 sec;
		input <= "11";
		wait for 2 sec;
	end process simulus;
end Testbench;
