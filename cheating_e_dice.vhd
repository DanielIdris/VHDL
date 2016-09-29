----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/23/2016 10:30:12 PM
-- Design Name: 
-- Module Name: cheating_e_dice - Behavioral
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

entity cheating_e_dice is
    Port ( clk, reset : in STD_LOGIC;
           M : in STD_LOGIC_VECTOR(1 downto 0);
           S : in STD_LOGIC;
           R : in STD_LOGIC_VECTOR(2 downto 0);
           output : out STD_LOGIC_VECTOR (2 downto 0));
end cheating_e_dice;

architecture Behavioral of cheating_e_dice is
    type eg_state_type is (s0,s1,s2,s3,s4,s5,s6,s7); 
    signal state_reg, state_next: eg_state_type; 
begin   
    --state register
    process(clk, reset) 
    begin
        if(reset = '1') then 
            state_reg <= s0;
        elsif(clk'event and clk = '1') then
            state_reg <= state_next;
        end if;
    end process;
    --next-state logic 
    process(state_reg,M,R,S)
    begin
        case state_reg is
            when s0 =>          --number 1 
            if(S = '0') then
                if (M = "01" and R ="010") then 
                    state_next <= s2;
                elsif(M = "10" and R= "001") then 
                    state_next <= s0;
                elsif(M ="11" and R= "001") then 
                    state_next <= s6; 
                else 
                    state_next <= s1;
                end if;
            end if;
            when s1 =>          --number 2 
            if(S = '0') then
                if (M = "01" and R ="011") then 
                    state_next <= s3;
                elsif(M = "10" and R= "010") then 
                    state_next <= s1;
                elsif(M ="11" and R= "010") then 
                    state_next <= s6; 
                else 
                    state_next <= s2;
                end if;
            end if;
            when s2 =>          --number 3
            if(S = '0') then 
                if (M = "01" and R ="100") then 
                    state_next <= s4;
                elsif(M = "10" and R= "011") then 
                    state_next <= s2;
                elsif(M ="11" and R= "011") then 
                    state_next <= s6; 
                else 
                    state_next <= s3;
                end if;
            end if;
            when s3 =>          --number 4
            if(S = '0') then
                if (M = "01" and R ="101") then 
                    state_next <= s5;
                elsif(M = "10" and R= "100") then 
                    state_next <= s3;
                elsif(M ="11" and R= "100") then 
                    state_next <= s6; 
                else 
                    state_next <= s4;
                end if;
            end if;
            when s4 =>          --number 5
            if(S = '0') then
                if (M = "01" and R ="110") then 
                    state_next <= s0;
                elsif(M = "10" and R= "101") then 
                    state_next <= s4;
                elsif(M ="11" and R= "101") then 
                    state_next <= s6; 
                else 
                    state_next <= s5;
                end if;
            end if;
            when s5 =>          --nubmer 6
            if(S = '0') then
                if (M = "01" and R ="001") then 
                    state_next <= s1;
                elsif(M = "10" and R= "110") then 
                    state_next <= s5;
                elsif(M ="11" and R= "110") then 
                    state_next <= s6; 
                else 
                    state_next <= s0;
                end if; 
            end if;
            when s6 =>
            if(M = "11") then
                state_next <= s7;
            else 
                if (R = "001") then     
                    state_next <= s1; 
                elsif(R = "010") then 
                    state_next <= s2; 
                elsif(R = "011") then 
                    state_next <= s3; 
                elsif(R = "100") then 
                    state_next <= s4; 
                elsif(R = "101") then 
                    state_next <= s5; 
                else
                    state_next <= s0; 
                end if;
            end if;
            when s7 => 
            if(M = "11") then
                if (R = "001") then     
                    state_next <= s1; 
                elsif(R = "010") then 
                    state_next <= s2; 
                elsif(R = "011") then 
                    state_next <= s3; 
                elsif(R = "100") then 
                    state_next <= s4; 
                elsif(R = "101") then 
                    state_next <= s5; 
                else
                    state_next <= s0; 
                end if;
            else 
                if (R = "001") then     
                    state_next <= s1; 
                elsif(R = "010") then 
                    state_next <= s2; 
                elsif(R = "011") then 
                    state_next <= s3; 
                elsif(R = "100") then 
                    state_next <= s4; 
                elsif(R = "101") then 
                    state_next <= s5; 
                else
                    state_next <= s0; 
                end if;
            end if;
        end case;
    end process;
    
    process(S)
    begin 
    if (S = '0') then 
        output <= "000";
    else
        case state_reg is 
            when s0 =>
                if(M = "10") then
                    if(R /= "111") then 
                        output <= R;
                    else   
                        output <= "000"; 
                    end if;
                else 
                    output <= "001";
                end if;
            when s1 => 
                if(M = "10") then 
                    if(R /= "111") then 
                        output <= R; 
                    else 
                        output <= "000";
                    end if;
                else 
                    output <= "010";
                end if;
            when s2 => 
                if(M = "10") then 
                    if (R /= "111") then
                        output <= R;
                    else 
                        output <= "000";
                    end if;
                else 
                    output <= "011";
                end if;
            when s3 => 
                if(M = "10") then
                    if(R /= "111") then 
                        output <= R;
                    else 
                        output <= "000"; 
                    end if;
                else 
                    output <= "100";
                end if;
            when s4 => 
                if(M = "10") then
                    if (R /= "111") then    
                        output <= R;
                    else 
                        output <= "000"; 
                    end if;
                else 
                    output <= "101";
                end if;
            when s5 => 
                if(M = "10") then 
                    if (R /= "111") then 
                    output <= R;
                    else 
                    output <= "000"; 
                end if;
                else 
                    output <= "110"; 
                end if;
            --extra probabilty 
            when s6 => 
                if(R /= "111") then 
                    output <= R; 
                else 
                    output <= "000"; 
                end if;
                        
            when s7 => 
                if(R /= "111") then 
                    output <= R;
                else 
                    output <= "000"; 
                end if;
        end case;
    end if;
    end process; 
end Behavioral;
