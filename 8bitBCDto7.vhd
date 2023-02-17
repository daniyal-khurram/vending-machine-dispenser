library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Dec is
port (
      --clk : in std_logic;
       temp_data : in std_logic_vector(3 downto 0);  --BCD input
       --AN0,AN1,AN2,AN3,AN4,AN5,AN6,AN7,
       
        segment7 : out std_logic_vector(6 downto 0);  -- 7 bit decoded output.
        --AN : out std_logic_vector(7 downto 0);
        DP : out std_logic
    );
end Dec;
--'a' corresponds to MSB of segment7 and g corresponds to LSB of segment7.
architecture Decoder of Dec is

begin
--AN <= "01111111";
--AN0 <= '0';
--AN1 <= '1';
--AN2 <= '1';
--AN3 <= '1';
--AN4 <= '1';
--AN5 <= '1';
--AN6 <= '1';
--AN7 <= '1';
--DP <= '1';

--AN0 <= '0';
process (temp_data)
BEGIN
--if (clk'event and clk='1') then
case  temp_data is
when "0000"=> segment7 <="1111111";  -- '0'
when "0001"=> segment7 <="1111001";  -- '1'
when "0010"=> segment7 <="0100100";  -- '2'
when "0011"=> segment7 <="0110000";  -- '3'
when "0100"=> segment7 <="0011001";  -- '4' 
when "0101"=> segment7 <="0010010";  -- '5'
when "0110"=> segment7 <="0000010";  -- '6'
when "0111"=> segment7 <="1111000";  -- '7'
when "1000"=> segment7 <="0000000";  -- '8'
when "1001"=> segment7 <="0010000";  -- '9'
when "1010"=> segment7 <=  "0001000"; --'A'
when "1011"=> segment7 <=  "0000011"; --'B'
when "1100" => segment7 <= "1000110"; --'C'
when "1101" => segment7 <= "0100001"; --'D'
when "1110" => segment7 <= "0000110"; --'E'
when "1111" => segment7 <= "0001110"; --'F'
 --nothing is displayed when a number more than 9 is given as input. 
when others=> segment7 <="1111111"; 
end case;
--end if;

end process;

end Decoder;