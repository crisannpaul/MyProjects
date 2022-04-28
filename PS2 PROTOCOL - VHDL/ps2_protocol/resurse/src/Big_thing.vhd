library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;


entity big_thing is
	
	port(
	    data : in bit;	
		keyboard_clk : in std_logic;
		fpga_clk : in std_logic;
		cathode : out std_logic_vector (7 downto 0);
		anode : out std_logic_vector (3 downto 0));
		
end entity;
	
architecture arch_big_thing of big_thing is	

signal break, make : bit_vector (7 downto 0) := "11111111";
signal parity : bit;					
signal data_reception : std_logic;

component Reciever 
	
	port(
		clk_ps2 : in std_logic; 
		D : in bit;	 	
		code_current : out bit_vector(7 downto 0);
		code_prev : out bit_vector(7 downto 0);
		received : out std_logic;
		parity_check : out bit);
		
end component;

component Display 
	
	port( 	
		keyboard_clk : in std_logic;
		fpga_clk : in std_logic;
		enable : in std_logic;   
		parity : in bit;
		outbits_current : in bit_vector(7 downto 0);			
		outbits_prev : in bit_vector(7 downto 0);	 
		cathode_out : out std_logic_vector(7 downto 0);
		anode_out : out std_logic_vector(3 downto 0));
		
end component;


begin
	
	code_recieve : Reciever port map (keyboard_clk, data, make, break, data_reception, parity); 
	fpga_display : Display port map (keyboard_clk, fpga_clk, data_reception, parity, make, break, cathode, anode); 
	
end arch_big_thing;