Library ieee;
Use ieee.std_logic_1164.all;
Use ieee.numeric_std.all;

Entity LB07 is
	Port (
		SW : in std_logic_vector(17 downto 0);
		LEDR : out std_logic_vector(17 downto 0) := (others => '0');
		LEDG : out std_logic_vector(8 downto 0 ) := (others => '0');
		KEY : in std_logic_vector(3 downto 0);
		CLOCK_50 : in std_logic;

		I2C_SDAT : inout std_logic;
		I2C_SCLK, AUD_XCK : out std_logic;
		AUD_ADCDAT : in std_logic;
		AUD_DACDAT : out std_logic;
		AUD_ADCLRCK, AUD_DACLRCK, AUD_BCLK : in std_logic );
End Entity LB07;


Architecture structural of LB07 is

	Signal	AudioIn, AudioOut : signed(15 downto 0);
	Signal	SamClk : std_logic;
 --Signal   OpX, OpY: signed (3 downto 0);
	Signal   Sum: signed (4 downto 0);
	Signal   clr1, clr2: std_logic;
	

Begin
--***********************************************************************************
-- You must enter the last five digits from the student number of one group member.
-- example: 
--	
--		work.AudioInterface generic map ( SID => xxxxx ) - where xxxxx are the last 5 digits.
--
--***********************************************************************************

--***********************************************************************************
--OpX <= signed (SW (3 downto 0));
--OpY <= signed (SW(7 downto 4));
--Sum <= ('0' & OpX) + ('0' & OpY);
--LEDR (4 downto 0) <= std_logic_vector(Sum);
--***********************************************************************************


ASSM: Entity work.AudioInterface	generic map ( SID => 06459 )
			port map (
			Clock_50 => CLOCK_50, AudMclk => AUD_XCK,	-- period is 80 ns ( 12.5 Mhz )
			init => KEY(3), 									-- +ve edge initiates I2C data
			I2C_Sclk => I2C_SCLK,
			I2C_Sdat => I2C_SDAT,
			AUD_BCLK => AUD_BCLK, AUD_ADCLRCK => AUD_ADCLRCK, AUD_DACLRCK => AUD_DACLRCK,
			AUD_ADCDAT => AUD_ADCDAT, AUD_DACDAT => AUD_DACDAT,

			AudioOut => AudioOut, AudioIn => AudioIn, SamClk => SamClk );

lights: Entity work.MorseGenerator port map(clock=>SamClk, PulseOut=> clr1);

LEDG(0)<= clr1;

create: Entity work.ToneGenerator port map (Freq=> unsigned(SW (15 downto 0)), Clk=>SamClk, Clear=>clr2, WaveOut=>AudioOut);			
clr2<= not(clr1) OR not(KEY (1));
	--AudioOut <= AudioIn;
	
	
	
	
End Architecture structural;
