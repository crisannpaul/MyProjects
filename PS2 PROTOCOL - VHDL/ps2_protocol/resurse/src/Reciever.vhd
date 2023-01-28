library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all; 

entity Reciever is
	
	port(
		clk_ps2 : in std_logic; 
		D : in bit;	 	
		code_current : out bit_vector(7 downto 0);
		code_prev : out bit_vector(7 downto 0);
		received : out std_logic;
		parity_check : out bit;
		test : out bit_vector(10 downto 0) 
		);
	
end; 

architecture arch_reciever of Reciever is		
 
signal bit_reception : std_logic_vector(10 downto 0); 
	 
begin
	
	process(clk_ps2, D)
	variable counter : std_logic_vector(3 downto 0) := "0000";
	variable bit_reception : bit_vector(10 downto 0) := "11111111111";  
	variable prev : bit_vector(7 downto 0) := "11111111";
	variable current : bit_vector(7 downto 0) := "11111111";	

	begin 
		
		if (clk_ps2'event and clk_ps2 = '0') then
			counter := counter + "0001";
			bit_reception := bit_reception sll 1;
			bit_reception(0) := D;
         	received <= '0';
			test <= bit_reception;
			if (counter = "1011") then                             
			prev := current;		 	
			current(0) := bit_reception(9); 
			current(1) := bit_reception(8);
			current(2) := bit_reception(7);
			current(3) := bit_reception(6);					
			current(4) := bit_reception(5);
			current(5) := bit_reception(4);
			current(6) := bit_reception(3);
			current(7) := bit_reception(2);	
			parity_check <= (bit_reception(9) xor bit_reception(8) xor bit_reception(7) xor bit_reception(6) xor bit_reception(5) xor bit_reception(4) xor bit_reception(3) xor bit_reception(2) xor bit_reception(1));	
			received <= '1';				
			bit_reception := "11111111111";
			counter := "0000"; 
			
			end if;
				
		end if;		
		
		code_prev <= prev; 
		code_current <= current;   
		
	end process; 
	
end arch_reciever;