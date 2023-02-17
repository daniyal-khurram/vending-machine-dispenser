library ieee;  
use ieee.std_logic_1164.all;  
use ieee.std_logic_unsigned.all; 
 
entity EightbitSubtractor is  
  port(Tot,S : in std_logic_vector(7 downto 0);  
      Result : out std_logic_vector(7 downto 0));  
end EightbitSubtractor ;  
architecture archi of EightbitSubtractor is  
  begin  
    Result <= Tot - S;  
end archi; 