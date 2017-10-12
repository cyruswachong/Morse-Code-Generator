Library ieee;
use ieee.std_logic_1164.all;
Use ieee.numeric_std.all;

Entity ToneGenerator is
	Port (Freq: IN unsigned (15 downto 0);
			Clk : IN std_logic;
			Clear : IN std_logic;
			WaveOut: OUT signed (15 downto 0));
End ToneGenerator;

Architecture Music of ToneGenerator is
	SIGNAL Regist: signed (21 downto 0);
	Begin
		Process(Clk,  Clear)
	Begin
		if Clear='1' then --KEY1 IS CLEAR
			Regist <= "0000000000000000000000";
		WaveOut<= "0000000000000000";

		elsif Rising_edge(Clk) then -- KEY0 IS CLOCK
			Regist <= Regist + ("000000" & signed(Freq));
			WaveOut<= Regist (21 downto 6);
end if;
end process;
end Music;
