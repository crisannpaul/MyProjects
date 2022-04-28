library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity Freq_divider is  
	
port(
	 clk: in std_logic;
     divided_clk: out std_logic_vector(1 downto 0));	  
	 
end Freq_divider;

architecture arch_divider of Freq_divider is	

signal counter : std_logic_vector(13 downto 0); 

begin
   process(clk)
   begin
      if (clk ='1' and clk'event) then
		counter <= counter+1;
		
      end if;	 
	  
   end process;
   
divided_clk<=counter(13 downto 12);

end arch_divider;
