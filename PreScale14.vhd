library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

Entity PreScale14 is
	Port (clk: in std_logic;
			Clckout: out std_logic);
End Entity PreScale14;

Architecture slum of PreScale14 is
		SIGNAL R:unsigned(13 downto 0);
		Signal in1: unsigned (5 downto 0);
		Signal clock1: std_logic;
	Begin
 
	Process(clk)
		begin

	if (clk'event AND clk = '1') then 
		R<=R+"00000000000001";
	end if;
	end process;

		Clckout<=R(13);


End slum;