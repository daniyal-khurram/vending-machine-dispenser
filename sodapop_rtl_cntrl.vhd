library IEEE;
use ieee.std_logic_1164.all;

entity SP_Controller is
         port(clk,reset : in std_logic;
              C : in std_logic;
              D : out std_logic;
              tot_ld, tot_clr,tot_sub : out std_logic;
              tot_lt_s : in std_logic
               );
      end SP_Controller;
      
architecture behavior of SP_Controller is
             type statetype is (Init,Hold,Add,Sub,Disp) ;
             signal presentstate, nextstate : statetype ; 
       begin
            statereg:
            process(clk,reset)
            begin
                if (reset = '1') then
                   presentstate <= Init;
                elsif (clk = '1' and clk'event) then
                   presentstate <= nextstate ;
                end if;
             end process;
             
             comblogic: process(presentstate, C,tot_lt_s)
             begin
                D <= '0';
                tot_ld <= '0';
                tot_clr <= '0';
                tot_sub <= '0';
                --tot_lt_s <= '0';
                case presentstate is
                    when Init =>
                    D <= '0'; -- only done to better visualize the behaviour, already initiliased to 0 earlier
                    tot_clr <= '1';
                    
                    nextstate <= Hold;
                    
                    when Hold =>
                    --if (C='1') then
                    if (tot_lt_s ='1') then 
                       nextstate <= Add;
                       
                    else 
                       --if (C='0') then 
                          --if (tot_lt_s ='1') then 
                           nextstate <= Sub;
                          --else 
                           --nextstate <= Disp;
                    --end if;
                    --end if;
                    end if;
                    
                    when Add =>
                    tot_ld <= '1';   
                    --tot_sub <= '1';
                    nextstate <= Hold;
                    
                    when Sub =>
                    tot_sub <= '1';
                    --tot_ld <= '0';-- only done to better visualize the behaviour, already initiliased to 0 earlier
                    
                    --D <= '1';
                    nextstate <= Disp;
                    
                    when Disp =>
                    --tot_sub <= '1';
                    tot_ld <= '0';-- only done to better visualize the behaviour, already initiliased to 0 earlier
                    
                    D <= '1';
                    nextstate <= Init;
              end case;
              end process;
end behavior;
              