library IEEE;
use ieee.std_logic_1164.all;

entity SP_Datapath is
     port(clk : in std_logic;
              S,A : in std_logic_vector(7 downto 0);
              --D : out std_logic;
              tot_ld, tot_clr,tot_sub : in std_logic;
              tot_lt_s : out std_logic;
              AN : out std_logic_vector(7 downto 0);
              DP : out std_logic;
              segment7 : out std_logic_vector(6 downto 0)
              ); 
end SP_Datapath;
      
architecture structure of SP_Datapath is

component Reg8
   port ( bigT : in std_logic_vector(7 downto 0);
          t : out std_logic_vector(7 downto 0);
          ld,clk,clr : in std_logic
          );
end component;

--trial
component Reg8_2
   port ( Result : in std_logic_vector(7 downto 0);
          r : out std_logic_vector(7 downto 0);
          sub,clk,clr : in std_logic
          );
end component;
--end trial

component EightbitComparator
   port ( Tot : in std_logic_vector(7 downto 0);         
          S : in std_logic_vector(7 downto 0);
          Comp : out std_logic
          );
end component;

component EightbitAdder
   port ( Tot : in std_logic_vector(7 downto 0);
          A : in std_logic_vector(7 downto 0);
          --CI : in std_logic;
          Sum : out std_logic_vector(7 downto 0)
          --CO  : out std_logic
          );
end component;

--trial
component EightbitSubtractor
   port(  Tot : in std_logic_vector(7 downto 0);
          S : in std_logic_vector(7 downto 0);
          Result : out std_logic_vector(7 downto 0)
          
          );
end component;

component 8to1MUX
   port(
          r:IN STD_LOGIC_VECTOR(7 DOWNTO 0);
     --SEL:IN STD_LOGIC_VECTOR(2 DOWNTO 0);
          temp_data: OUT STD_LOGIC_VECTOR(3 downto 0);
          AN:OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
        );   
--end trial 

end component;

component Dec
   port(  --clk : in std_logic;
          temp_data : in std_logic_vector(7 downto 0);
          --AN : out std_logic_vector(7 downto 0);
          --DP : out std_logic;
          Decode : out std_logic_vector(6 downto 0)
          
          );
end component;
--trial
 
     

--signal AN1,AN2,AN3,AN4,AN5,AN6,AN7 : std_logic;            
signal Summation : std_logic_vector(7 downto 0);
signal total : std_logic_vector(7 downto 0);
signal CI : std_logic;
signal CO : std_logic;
signal Result : std_logic_vector(7 downto 0);
--signal segment7 : std_logic_vector(6 downto 0);
signal r : std_logic_vector(7 downto 0);
signal temp_data : std_logic_vector(3 downto 0);

begin
   totReg : entity work.Reg8
      port map (Summation, total, tot_ld, clk, tot_clr);
   Adder : entity work.EightbitAdder
      port map(total, A, Summation);
   Comparator : entity work.EightbitComparator
      port map(total, S, tot_lt_s);
   Subtractor : entity work.EightbitSubtractor
      port map(total, S, Result);
   totReg_2 : entity work.Reg8_2    
      port map (Result, r, tot_sub, clk, tot_clr);
   --AN <= "11111110";
   DP <= '1';   
   bcddecoder : entity work.Dec
      port map (temp_data ,segment7,DP);   
   Mux : entity work.8to1MUX
      port map (r  ,temp_data, AN);
      
 end structure;              
   
      