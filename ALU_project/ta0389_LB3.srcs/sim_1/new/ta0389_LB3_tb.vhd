
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
LIBRARY UNISIM;
USE UNISIM.Vcomponents.ALL;

entity ta0389_LB3_tb is
end ta0389_LB3_tb;

architecture Behavioral of ta0389_LB3_tb is

SIGNAL Clock : STD_LOGIC;
Signal a : STD_LOGIC_VECTOR(3 downto 0);
Signal b : STD_LOGIC_VECTOR(3 downto 0);
signal sel : STD_LOGIC_VECTOR(2 downto 0);
signal F : STD_LOGIC_VECTOR(7 downto 0);

Component ta0389_LB3
PORT(   a : in STD_LOGIC_VECTOR(3 downto 0);
        b : in STD_LOGIC_VECTOR(3 downto 0);
        sel : in STD_LOGIC_VECTOR(2 downto 0);
        Clock : IN STD_LOGIC;
        F : out STD_LOGIC_VECTOR(7 downto 0));
END Component;



begin
    
    UUT: ta0389_LB3 PORT MAP(   a => a,
                                b => b,
                                sel => sel,
                                Clock => Clock,
                                F => F);
                                
    -- Clock generation
    
    
    tb : PROCESS
        BEGIN
            Clock <= '0';
            a <= (others => '0');
            b <= (others => '0');
            sel <= (others => '0');
            
            --add
            a <= "0001"; b <= "0000"; sel <= "000"; 
            
            wait for 5 ms;
            clock <= '1';
            
            wait for 5 ms;
            clock <= '0';
            a <= "1111"; b <= "1111"; sel <= "000"; 
            
            wait for 5 ms;
            clock <= '1';
            
            wait for 5 ms;
            clock <= '0';
            --sub
            a <= "0010"; b <= "0001"; sel <= "001"; 
            
            wait for 5 ms;
            clock <= '1';
             
             wait for 5 ms;
             clock <= '0';
            a <= "0010"; b <= "0010"; sel <= "001"; 
            
            wait for 5 ms;
            clock <= '1';
             
             wait for 5 ms;
             clock <= '0';
            --mul
            a <= "0000"; b <= "0001"; sel <= "010"; 
            
            wait for 5 ms;
            clock <= '1';
             
             wait for 5 ms;
             clock <= '0';
            a <= "0010"; b <= "0001"; sel <= "010"; 
            
            wait for 5 ms;
            clock <= '1';
             
             wait for 5 ms;
             clock <= '0';
            --div
            a <= "0100"; b <= "0001"; sel <= "011"; 
            
            wait for 5 ms;
            clock <= '1';
             
             wait for 5 ms;
             clock <= '0';
            a <= "0100"; b <= "0010"; sel <= "011"; 
            
            wait for 5 ms;
            clock <= '1';
             
             wait for 5 ms;
             clock <= '0';
            --shiftL
            a <= "0001"; b <= "0001"; sel <= "100"; 
            
            wait for 5 ms;
            clock <= '1';
             
             wait for 5 ms;
            clock <= '0';
            a <= "0001"; b <= "0010"; sel <= "100"; 
            
            wait for 5 ms;
            clock <= '1';
             
             wait for 5 ms;
            clock <= '0';
            --shiftR
            a <= "1000"; b <= "0001"; sel <= "101"; 
            
            wait for 5 ms;
            clock <= '1';
             
             wait for 5 ms;
            clock <= '0';
            a <= "1000"; b <= "0010"; sel <= "101"; 
            
            wait for 5 ms;
            clock <= '1';
             
             wait for 5 ms;
            clock <= '0';
            --rotL
            a <= "1001"; b <= "0001"; sel <= "110"; 
            
            wait for 5 ms;
            clock <= '1';
             
             wait for 5 ms;
             clock <= '0';
            a <= "1001"; b <= "0010"; sel <= "110"; 
             wait for 5 ms;
            clock <= '1';
             
             wait for 5 ms;
             clock <= '0';
            --rotR
            a <= "1001"; b <= "0001"; sel <= "111"; 
             wait for 5 ms;
            clock <= '1';
             
             wait for 5 ms;
             clock <= '0';
            a <= "1001"; b <= "0010"; sel <= "111"; 
             wait for 5 ms;
            clock <= '1';
             
             wait for 5 ms;
             clock <= '0';
          
          WAIT; -- will wait forever
END PROCESS;

END behavioral;



