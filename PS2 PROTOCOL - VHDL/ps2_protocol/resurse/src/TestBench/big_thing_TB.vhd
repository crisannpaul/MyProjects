library ieee;
use ieee.STD_LOGIC_UNSIGNED.all;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

	-- Add your library and packages declaration here ...

entity big_thing_tb is
end big_thing_tb;

architecture TB_ARCHITECTURE of big_thing_tb is
	-- Component declaration of the tested unit
	component big_thing
	port(
		data : in BIT;
		keyboard_clk : in STD_LOGIC;
		fpga_clk : in STD_LOGIC;
		cathode : out STD_LOGIC_VECTOR(7 downto 0);
		anode : out STD_LOGIC_VECTOR(3 downto 0) );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal data : BIT;
	signal keyboard_clk : STD_LOGIC;
	signal fpga_clk : STD_LOGIC;
	-- Observed signals - signals mapped to the output ports of tested entity
	signal cathode : STD_LOGIC_VECTOR(7 downto 0);
	signal anode : STD_LOGIC_VECTOR(3 downto 0);

	-- Add your code here ...

begin
	   fpga_clk <= '1', not fpga_clk after 20 ns;
    keyboard_clk <= '1', not keyboard_clk after 40 us;
    data <= '0' after 40 us,
    '0' after 80 us, '0' after 120 us, '1' after 160 us, '1' after 200 us, '1' after 240 us, '0' after 280 us, '0' after 320 us, '0' after 360 us,
    '0' after 400 us,
    '1' after 440 us;
	
	-- Unit Under Test port map
	UUT : big_thing
		port map (
			data => data,
			keyboard_clk => keyboard_clk,
			fpga_clk => fpga_clk,
			cathode => cathode,
			anode => anode
		);

	-- Add your stimulus here ...

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_big_thing of big_thing_tb is
	for TB_ARCHITECTURE
		for UUT : big_thing
			use entity work.big_thing(arch_big_thing);
		end for;
	end for;
end TESTBENCH_FOR_big_thing;

