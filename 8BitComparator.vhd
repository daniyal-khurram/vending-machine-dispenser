library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all; 
 
entity EightbitComparator is  
  port(Tot,S : in std_logic_vector(7 downto 0);  
      tot_lt_s : out std_logic);  
end EightbitComparator;  
architecture archi2 of EightbitComparator is  
  begin  
    tot_lt_s <= '1' when (S > Tot)   
            else '0';  
end archi2; 