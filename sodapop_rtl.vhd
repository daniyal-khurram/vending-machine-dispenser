library IEEE;
use ieee.std_logic_1164.all;

entity sodapop is
port(S,A : in  std_logic_vector(7 downto  0);
     clk,reset : in std_logic;
     C : in std_logic;
     D : out std_logic;
      AN : out std_logic_vector(7 downto 0);
      DP : out std_logic;
     segment7 : out std_logic_vector(6 downto 0));
end sodapop;
     
--SP_Controller and SP_Datapath will be created as separate entities that will then be used inside a greater entity aka sodapopmachine
architecture structure of sodapop is
      component SP_Controller
         port(clk,reset : in std_logic;
              C : in std_logic;
              D : out std_logic;
              tot_ld, tot_clr,tot_sub : out std_logic;
              tot_lt_s : in std_logic);
      end component;
      
      component SP_Datapath
         port(clk : in std_logic;
              S,A : in std_logic_vector(7 downto 0);
              --D : out std_logic;
              tot_ld, tot_clr,tot_sub : in std_logic;
              tot_lt_s : out std_logic;
               AN : out std_logic_vector(7 downto 0);
               DP : out std_logic;
              segment7 : out std_logic_vector(6 downto 0)); 
      end component;
 --Done to ensure that tot_ld, tot_clr,tot_lt_s are seen as multiport signals i.e could be input, output depending on the application
      signal tot_ld, tot_clr,tot_sub : std_logic;
      signal tot_lt_s : std_logic  ;
      
  begin
  --portmaps used to connect component ports to the rest of the circuit . Useful when you have one compoent e.g one half adder but used as two component in the circuit to connect to different signals http://vhdlguru.blogspot.ca/2010/03/usage-of-components-and-port-mapping.html
     
     SP_Controller_1 : entity work.SP_Controller 
         port map (clk,reset,C,D,
                   tot_ld,tot_clr,tot_sub,tot_lt_s);
                 
     SP_Datapath_1 : entity work.SP_Datapath
         port map (clk,S,A,
                   tot_ld, tot_clr, tot_sub,tot_lt_s,AN,DP,segment7);
end structure;
                   