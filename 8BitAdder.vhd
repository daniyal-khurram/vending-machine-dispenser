library ieee;  
use ieee.std_logic_1164.all;  
use ieee.std_logic_arith.all;  
use ieee.std_logic_unsigned.all; 

library ieee;  
use ieee.std_logic_1164.all;  
use ieee.std_logic_unsigned.all; 
 
entity EightbitAdder is  
  port(Tot,A : in std_logic_vector(7 downto 0);  
      Sum : out std_logic_vector(7 downto 0));  
end EightbitAdder;  
architecture archi1 of EightbitAdder is  
  begin  
    Sum <= A + Tot;  
end archi1; 




 
--entity EightbitAdder is  
  --port(total,A : in std_logic_vector(7 downto 0);  
     -- CI  : in std_logic;  
      --Sum : out std_logic_vector(7 downto 0);  
      --CO  : out std_logic);  
--end EightbitAdder;  
--architecture archi1 of EightbitAdder is  
  --signal tmp: std_logic_vector(8 downto 0);  
  --begin  
    --tmp <= conv_std_logic_vector(  
                --(conv_integer(total) +   
               -- conv_integer(A) +  
               -- conv_integer(CI)),9);  
   -- Sum <= tmp(7 downto 0);  
   -- CO  <= tmp(8);  
--end archi1; --