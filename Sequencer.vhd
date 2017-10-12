Library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

Entity Sequencer is
	Port (clok: IN std_logic;
			Binary: OUT unsigned (5 downto 0));
end Sequencer;

Architecture lum of Sequencer is
Signal Q: unsigned (5 downto 0) :="100001";

Begin
	Process(Q)
	Begin
	if clok'event AND clok='1' then
	
	if Q="000000" then
		Q<="100001";
	else
		Q<=Q-"000001";
	end if;
	end if;
	end process;

Binary<=Q;


end lum;




