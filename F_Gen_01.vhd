library IEEE;
use IEEE.STD_LOGIC_1164.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
-- use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
-- library UNISIM;
-- use UNISIM.VComponents.all;

entity F_Gen_01 is
	port (
		CLK_IN  : in STD_LOGIC; -- clock signal input
	S_OUT : out STD_LOGIC); -- clock signal output
end F_Gen_01;

architecture Behavioral of F_Gen_01 is
	signal temp : STD_LOGIC := '0';
	signal count : integer range 0 to 12E6 - 1;
begin
	S_OUT <= temp;
	process (CLK_IN) begin
	if rising_edge(CLK_IN) then
		if (count = 10800000 - 1) then -- rising edge of generated signal
			temp <= not(temp); -- low -> high
			count <= count + 1;
		elsif (count = 12E6 - 1) then -- falling edge of generated signal
			temp <= not(temp); --high -> low
			count <= 0;
		else
			count <= count + 1;
		end if;
	end if;
end process;
end Behavioral;
