library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

Entity MorseGenerator is 
	Port(clock: IN std_logic; 
		  PulseOut: OUT std_logic);
	
End MorseGenerator;

Architecture prprpr of MorseGenerator is
		SIGNAL slowclock: std_logic;
		SIGNAL f: unsigned (5 downto 0);
		SIGNAL clock1: std_logic;
	begin

	
			ligh: Entity work.PreScale14 port map(clk=>clock, Clckout=>slowclock);
			sequen: entity work.Sequencer port map (clok=>Slowclock, Binary=>f);
			--PulseOut <= slowclock; --PUSHING VALUE INTO OUTPUT TO CALL SOMEWHERE ELSE
	
			
		with f select (PulseOut)<=
						'1' when "100001",--33
						'1' when "011111",--31
						'1' when "011101",--29
						'1' when "011001",--25
						'1' when "011000",--24
						'1' when "010111",--23
						'1' when "010101",--21
						'1' when "010100",--20
						'1' when "010011",--19
						'1' when "010001",--17
						'1' when "010000",--16
						'1' when "001111",--15
						'1' when "001011",--11
						'1' when "001001",--09
						'1' when "000111",  --07 
						'0' when others;


end prprpr;