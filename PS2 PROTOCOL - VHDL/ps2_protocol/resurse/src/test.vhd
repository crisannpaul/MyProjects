library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity test is
	port (
	clk : in std_logic;
	d : in std_logic;
	vec : out std_logic_vector (0 to 2)
	);
end entity;

architecture arh of test is
begin
	process (clk, d)
	variable reg : std_logic_vector (0 to 2);
	begin 
		reg(0) := reg(1);
		reg(1) := reg(2);
		reg(2) := d;
		vec <= reg;
	end process;
end architecture;
	