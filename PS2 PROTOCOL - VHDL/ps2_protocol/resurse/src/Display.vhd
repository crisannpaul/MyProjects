library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity Display is
	
	port(
	keyboard_clk : in std_logic;
	fpga_clk : in std_logic;
	enable : in std_logic;   
	parity : in bit;
	outbits_current : in bit_vector(7 downto 0);			
	outbits_prev : in bit_vector(7 downto 0);	 
	cathode_out : out std_logic_vector(7 downto 0);
	anode_out : out std_logic_vector(3 downto 0)); 
	
end entity;

architecture arch_display of Display is 	 

signal bcd1, bcd2, bcd3, bcd4 : std_logic_vector(7 downto 0);

component Freq_divider
	
port(
clk : in std_logic;
divided_clk : out std_logic_vector(1 downto 0));

end component;

signal divided_clk : std_logic_vector (1 downto 0);

begin
	
div_frecventa : Freq_divider port map (fpga_clk, divided_clk); 

process(keyboard_clk)

variable code1 : std_logic_vector (7 downto 0) := "11111111";
variable code2 : std_logic_vector (7 downto 0) := "11111111";
variable code3 : std_logic_vector (7 downto 0) := "11111111"; 
variable code_current : std_logic_vector (7 downto 0) := "11111111";
variable poz_p : std_logic_vector (1 downto 0) := "00";

begin
	
if (enable = '1' and parity = '1' and keyboard_clk'event and keyboard_clk = '0' ) then
		code3 := code2;
		code2 := code1;
 		code1 := code_current;
	 case outbits_current is
				when "01000101" => code_current := "10000001"; -- 0
				when "00010110" => code_current := "11001111"; -- 1
				when "00011110" => code_current := "10010010"; -- 2
				when "00100110" => code_current := "10000110"; -- 3
				when "00100101" => code_current := "11001100"; -- 4				 
				when "00101110" => code_current := "10100100"; -- 5
            	when "00110110" => code_current := "10100000"; -- 6
				when "00111101" => code_current := "10001111"; -- 7
				when "00111110" => code_current := "10000000"; -- 8
				when "01000110" => code_current := "10000100"; -- 9
				when "00100100" => code_current := "10110000"; -- E
				when "00101011" => code_current := "10111000"; -- F
				when "00111100" => code_current := "11000001"; -- U
				when "01000011" => code_current := "11001111"; -- I
				when "01000100" => code_current := "10000001"; -- O
				when "01001101" => code_current := "10011000"; -- P
				when "00110011" => code_current := "11001000"; -- H
				when "01001011" => code_current := "11110001"; -- L
				when "00011100" => code_current := "10001000"; -- A
				when "00110101" => code_current := "11000100"; -- Y
				when "00110010" => code_current := "11100000"; -- b 
		        when "00100001" => code_current := "10110001"; -- C
		        when "00100011" => code_current := "11000010"; -- d
				when "00110001" => code_current := "11101010"; -- n
				when "00011011" => code_current := "10100100"; -- S
				when "00110100" => code_current := "10000100"; -- G
				when "00111011" => code_current := "11000011"; -- J
				when "01001001" => code_current := "01111111"; -- .
				when "01011010" => code_current := "11111111"; -- ENTER
				                   code3 := "11111111";
		                           code2 := "11111111";
 		                           code1 := "11111111";
				when "01101011"	=> if poz_p < "11" then poz_p := poz_p + "01"; -- left arrow 
								   end if;
				when "01110010"	=> if poz_p > "00" then poz_p := poz_p - "01"; -- right arrow
								   end if;
				when others => code_current := "10110000"; -- E de la ERRO		
	end case;	
end if;

case poz_p is 
	when "00" => code_current(7) := '0'; code1(7) := '1'; code2(7) := '1'; code3(7) := '1';
	when "01" => code_current(7) := '1'; code1(7) := '0'; code2(7) := '1'; code3(7) := '1';
	when "10" => code_current(7) := '1'; code1(7) := '1'; code2(7) := '0'; code3(7) := '1';
	when "11" => code_current(7) := '1'; code1(7) := '1'; code2(7) := '1'; code3(7) := '0';
	when others => null;
end case;
bcd4 <= code3;
bcd3 <= code2;
bcd2 <= code1;
bcd1 <= code_current;

end process;

process(keyboard_clk, bcd4, bcd3, bcd2, bcd1)

variable anod : std_logic_vector (1 downto 0) := "00";

begin	   

	case anod is
		when "00" => anode_out(0) <= '0'; anode_out(1) <= '1'; anode_out(2) <= '1'; anode_out(3) <= '1'; cathode_out <= bcd4;
		when "01" => anode_out(0) <= '1'; anode_out(1) <= '0'; anode_out(2) <= '1'; anode_out(3) <= '1'; cathode_out <= bcd3;
		when "10" => anode_out(0) <= '1'; anode_out(1) <= '1'; anode_out(2) <= '0'; anode_out(3) <= '1'; cathode_out <= bcd2;
		when "11" => anode_out(0) <= '1'; anode_out(1) <= '1'; anode_out(2) <= '1'; anode_out(3) <= '0'; cathode_out <= bcd1;
		when others => anode_out(0) <= '1' ; anode_out(1) <= '1' ; anode_out(2) <= '1'; anode_out(3) <= '1';	-- don't care
	end case;
	
	if falling_edge(keyboard_clk) and anod < "11" then anod := anod + "01";
	elsif anod = "11" then anod := "00";
	end if;
	
	 end process;

end arch_display;

