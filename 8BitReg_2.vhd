library ieee;
 use ieee.std_logic_1164.all;
 entity Reg8_2 is

 port (Result : in std_logic_vector(7 downto 0); -- system inputs
 r : out std_logic_vector(7 downto 0); -- system outputs
 sub : in std_logic; -- enable
 clk,clr : in std_logic); -- clock and reset
 end Reg8_2;
 -- purpose: Main architecture details for an 8 bit register
 architecture Reg_2 of Reg8_2 is

 begin 
 process(clk,clr)

 begin -- process
 -- activities triggered by asynchronous reset (active high)
 if clr = '1' then
 r <= "00000000";

 -- activities triggered by rising edge of clock
 elsif clk'event and clk = '1' then
 if sub ='1' then
 r <= Result;
 else
 null;
 end if;

 end if;
 end process;
 end Reg_2;