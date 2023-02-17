----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/04/2015 07:12:36 PM
-- Design Name: 
-- Module Name: 8to1MUX - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity 8to1MUX is
PORT(r:IN STD_LOGIC_VECTOR(7 DOWNTO 0);
     --SEL:IN STD_LOGIC_VECTOR(2 DOWNTO 0);
     temp_data: OUT STD_LOGIC_VECTOR(3 downto 0);
     AN:OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
     );     
     
end 8to1MUX;

architecture Behavioral of 8to1MUX is

begin
PROCESS(r)

variable display_selection : std_logic_vector(2 downto 0);

BEGIN
CASE display_selection IS

WHEN"000"=> temp_data <= r(3 downto 0);
--sel_A <= '0';
--sel_B <= '1';
--sel_C <= '1';
--sel_D <= '1';
--sel_E <= '1';
--sel_F <= '1';
--sel_G <= '1';
AN <= "01111111";

display_selection := display_selection+'1';

WHEN"001"=>temp_data <= r(7 downto 4);
--sel_A <= '1';
--sel_B <= '0';
--sel_C <= '1';
--sel_D <= '1';
--sel_E <= '1';
--sel_F <= '1';
--sel_G <= '1';
AN <= "10111111";
display_selection := display_selection+'1';


WHEN"010"=>temp_data <= "1111";

--sel_A <= '1';
--sel_B <= '1';
--sel_C <= '0';
--sel_D <= '1';
--sel_E <= '1';
--sel_F <= '1';
--sel_G <= '1';
AN <= "11011111";

display_selection := display_selection+'1';
WHEN"011"=>temp_data <= "1111";

--sel_A <= '1';
--sel_B <= '1';
--sel_C <= '1';
--sel_D <= '0';
--sel_E <= '1';
--sel_F <= '1';
--sel_G <= '1';
AN <= "11101111";

display_selection := display_selection+'1';

WHEN"100"=>temp_data <= "1111";
--sel_A <= '1';
--sel_B <= '1';
--sel_C <= '1';
--sel_D <= '1';
--sel_E <= '0';
--sel_F <= '1';
--sel_G <= '1';
AN <= "11110111";

display_selection := display_selection+'1';

WHEN"101"=>temp_data <= "1111";

--sel_A <= '1';
--sel_B <= '1';
--sel_C <= '1';
--sel_D <= '1';
--sel_E <= '0';
--sel_F <= '1';
--sel_G <= '1';
AN <= "11111011";

display_selection := display_selection+'1';


WHEN"110"=>temp_data <= "1111";
--sel_A <= '1';
--sel_B <= '1';
--sel_C <= '1';
--sel_D <= '1';
--sel_E <= '1';
--sel_F <= '0';
--sel_G <= '1';
AN <= "11111101";

display_selection := display_selection+'1';

WHEN OTHERS=>temp_data <= "1111";

--sel_A <= '1';
--sel_B <= '1';
--sel_C <= '1';
--sel_D <= '1';
--sel_E <= '1';
--sel_F <= '1';
--sel_G <= '0';

AN <= "11111110";
END CASE;
END PROCESS;


end Behavioral;
