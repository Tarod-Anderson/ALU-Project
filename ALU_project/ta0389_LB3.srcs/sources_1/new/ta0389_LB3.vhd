
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;

entity ta0389_LB3 is
    Port ( a : in STD_LOGIC_VECTOR(3 downto 0);
           b : in STD_LOGIC_VECTOR(3 downto 0);
           sel : in STD_LOGIC_VECTOR(2 downto 0);
           Clock : IN STD_LOGIC;
           F : out STD_LOGIC_VECTOR(7 downto 0));
end ta0389_LB3;

architecture Behavioral of ta0389_LB3 is


begin
PROCESS(Clock)
variable carry : STD_LOGIC;
begin
    if(clock' event and clock = '1')then
        case sel is
            --add FIXME
            when "000" => 
                F(7 downto 5) <= "000";
                carry := '0';
                if (A(0)='1' AND B(0)='1' AND carry='1') then
                    F(0) <= '1';
                elsif(A(0)='1' AND B(0)='1') OR (A(0)='1' AND carry='1') OR (B(0)='1' AND carry='1') then
                    carry := '1';
                    F(0) <= '0';
                elsif (A(0)='1' OR B(0)='1' OR carry = '1') then 
                    F(0)<='1';
                    carry := '0';
                else
                    F(0)<='0';
                    carry := '0';
                    
                end if;
                if (A(1)='1' AND B(1)='1' AND carry='1') then
                    F(1) <= '1';
                elsif(A(1)='1' AND B(1)='1') OR (A(1)='1' AND carry='1') OR (B(1)='1' AND carry='1') then
                    carry := '1';
                    F(1) <= '0';
                elsif (A(1)='1' OR B(1)='1' OR carry = '1') then 
                    F(1)<='1';
                    carry := '0';
                else
                    F(1)<='0';
                    carry := '0';
                end if;
                if (A(2)='1' AND B(2)='1' AND carry='1') then
                    F(2) <= '1';
                elsif(A(2)='1' AND B(2)='1') OR (A(2)='1' AND carry='1') OR (B(2)='1' AND carry='1') then
                    carry := '1';
                    F(2) <= '0';
                elsif (A(2)='1' OR B(2)='1' OR carry = '1') then 
                    F(2)<='1';
                    carry := '0';
                else
                    F(2)<='0';
                    carry := '0';
                end if;
                if (A(3)='1' AND B(3)='1' AND carry='1') then
                    F(3) <= '1';
                elsif(A(3)='1' AND B(3)='1') OR (A(3)='1' AND carry='1') OR (B(3)='1' AND carry='1') then
                    carry := '1';
                    F(3) <= '0';
                elsif (A(3)='1' OR B(3)='1' OR carry = '1') then 
                    F(3)<='1';
                    carry := '0';
                else
                    F(3)<='0';
                    carry := '0';
                end if;
                
                F(4) <= carry;

            
            

                 
                
                    
            --sub 
            when "001" => 
            F <= (others => '0');
            F(3 downto 0) <= std_logic_vector(unsigned(a) - unsigned(b));
            --mul 
            when "010" => F <= std_logic_vector(unsigned(a) * unsigned(b));
            --div 
            when "011" =>
                if b = "0000" then
                    F <= "00000000";
                else
                    F <= "0000"&std_logic_vector(unsigned(a) / unsigned(b));
                end if;
            --log shift left
            when "100" =>
                if b = "0001" then
                    F <= ("000"&a&'0');
                elsif b = "0010" then
                    F <= ("00"&a&'0'&'0');
                elsif b = "0011" then
                    F <= ('0'&a&'0'&'0'&'0');
                else
                    F <= "0000"&a;
                end if;
            --log shift right
            when "101" => 
                if b = "0001" then
                    F <= ("00000"&a(3 downto 1));
                elsif b = "0010" then
                    F <= ("000000"&a(3 downto 2));
                elsif b = "0011" then
                    F <= ("0000000"&a(3));
                else
                    F <= "0000"&a;
                end if;
            --log rotate left
            when "110" => 
                if b = "0001" then
                    F <= ("0000"&a(2 downto 0)&a(3));
                elsif b = "0010" then
                    F <= ("0000"&a(1 downto 0)&a(3 downto 2));
                elsif b = "0011" then
                    F <= ("0000"&a(0)&a(3 downto 1));
                else
                    F <= "0000"&a;
                end if;
            --log rotate right FIXME
            when "111" => 
                if b = "0001" then
                    F <= ("0000"&a(0)&a(3 downto 1));
                elsif b = "0010" then
                    F <= ("0000"&a(1 downto 0)&a(3 downto 2));
                elsif b = "0011" then
                    F <= ("0000"&a(2 downto 0)&a(3));
                else
                    F <= "0000"&a;
                end if;
            when others =>
        end case;
    end if;
end PROCESS;
end Behavioral;
