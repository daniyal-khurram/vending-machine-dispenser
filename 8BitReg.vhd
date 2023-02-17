 library ieee;
 use ieee.std_logic_1164.all;
 entity Reg8 is

 port (bigT : in std_logic_vector(7 downto 0); -- system inputs
 t : out std_logic_vector(7 downto 0); -- system outputs
 ld : in std_logic; -- enable
 clk,clr : in std_logic); -- clock and reset
 end Reg8;
 -- purpose: Main architecture details for an 8 bit register
 architecture Reg of Reg8 is

 begin 
 process(clk,clr)

 begin -- process
 -- activities triggered by asynchronous reset (active high)
 if clr = '1' then
 t <= "00000000";

 -- activities triggered by rising edge of clock
 elsif clk'event and clk = '1' then
 if ld='1' then
 t <= bigT;
 else
 null;
 end if;

 end if;
 end process;
 end Reg;