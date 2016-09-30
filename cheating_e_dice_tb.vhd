----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/24/2016 10:16:26 PM
-- Design Name: 
-- Module Name: cheating_e_dice_tb - Behavioral
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

entity cheating_e_dice_tb is
--  Port ( );
end cheating_e_dice_tb;

architecture Behavioral of cheating_e_dice_tb is
    component cheating_e_dice 
    Port ( clk, reset : in STD_LOGIC;
           M : in STD_LOGIC_VECTOR(1 downto 0);
           S : in STD_LOGIC;
           R : in STD_LOGIC_VECTOR(2 downto 0);
           output : out STD_LOGIC_VECTOR (2 downto 0));
    end component;
    
    signal clk, reset : std_logic; 
    signal M : std_logic_vector(1 downto 0); 
    signal S : std_logic; 
    signal R, output : std_logic_vector(2 downto 0); 
    
    constant clk_period : time := 10 ns; 
begin
    uut: cheating_e_dice
    port map(   clk => clk, reset => reset,
                M => M, S => S, R => R, output => output); 
               
clk_process: process 
    begin 
        clk <= '0'; 
        wait for clk_period/2; 
        clk <= '1'; 
        wait for clk_period/2;
end process; 

---- stimuli process 
--    stim_proc: process 
--        begin 
--            M <= "00"; 
--            r <= "000"; 
--            reset <= '0'; 
--            wait for 200 ns; 
--    end process; 
    
--    stim_proc_S: process
--        begin 
--           S <= '1';
--           wait for  15 ns;
--           S <= '0';
--           wait for 15 ns; 
--    end process;

    
    stim_proc1 : process
    begin
        R<="000";
        wait for 200 ns;
        R<="001";
        wait for 200 ns;
        R<="010";
        wait for 200 ns;
        R<="011";
        wait for 200 ns;
        R<="100";
        wait for 200 ns;
        R<="101";
        wait for 200 ns;
        R<="110";
        wait for 200 ns;
        R<="111";
        wait for 200 ns;
        -- 800ns
    end process;
    
    stim_proc2 : process
    begin
        S<='0';
        wait for 5 ns;
        S<='1';
        wait for 5 ns;
    end process;
    
    stim_proc3 : process
    begin
        M<="00";
        wait for 1600 ns;
        M<="01";
        wait for 1600 ns;
        M<="10";
        wait for 1600 ns;
        M<="11";
        wait for 1600 ns;
    end process;        

end Behavioral;
