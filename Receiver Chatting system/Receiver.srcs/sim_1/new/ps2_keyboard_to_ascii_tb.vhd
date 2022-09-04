library ieee;
use ieee.std_logic_1164.all;

entity ps2_keyboard_to_ascii_tb is
end ps2_keyboard_to_ascii_tb;

architecture Behavioral of ps2_keyboard_to_ascii_tb is
    component ps2_keyboard_to_ascii 
      port(
      clk: IN  STD_LOGIC;                     --system clock input
      reset: in std_logic;

      ps2_clk    : IN  STD_LOGIC;                     --clock signal from PS2 keyboard
      tx :out std_logic;                  
      ps2_data   : IN  STD_LOGIC;                     --data signal from PS2 keyboard
      
      torecieve: in std_logic_vector(7 downto 0);
      test:out std_logic;
           
      ascii_new  : OUT STD_LOGIC;                     --output flag indicating new ASCII value
      totransmit: out std_logic_vector(7 downto 0);
      transmission:out std_logic:='0';
      reception :in std_logic;
      recieving_enable: in std_logic;
      transmission_enable:out std_logic:='0');
END component;

     signal clk_tb: STD_LOGIC;   --Done                  
     signal reset_tb: std_logic:= '0'; --Done
     signal ps2_clk_tb: STD_LOGIC := '1';                
     signal tx_tb: std_logic;   --Done             
     signal ps2_data_tb: STD_LOGIC := '1';                      
     signal torecieve_tb: std_logic_vector(7 downto 0) := X"00";  --Related to Reception, in this case always zero
     signal test_tb: std_logic; --Done
     signal ascii_new_tb: STD_LOGIC; --output                     
     signal totransmit_tb: std_logic_vector(7 downto 0);
     signal transmission_tb: std_logic:='0';
     signal reception_tb: std_logic; --Done
     signal recieving_enable_tb: std_logic; --Done
     signal transmission_enable_tb: std_logic:='0'; --Done
     
Begin
    UUT: ps2_keyboard_to_ascii port map(clk_tb,reset_tb,ps2_clk_tb,tx_tb,ps2_data_tb,torecieve_tb,test_tb,ascii_new_tb,totransmit_tb,transmission_tb,reception_tb,recieving_enable_tb,transmission_enable_tb);
    recieving_enable_tb <= '0';
    transmission_enable_tb <= '1';
    reception_tb <= '0';
    
    clk_process: process
    begin 
    wait for 5ns;
    clk_tb <= '1';
    wait for 5ns;
    clk_tb <= '0';
    end process;
    
--    ps2c_process: process
--    begin
    
--    --wait for 300ns;
--    ps2_clk_tb <= '1'; wait for 100 ns;
--    for i in 0 to 1000 loop
--        wait for 5ns;
--        ps2_clk_tb <= '1';
--        wait for 5ns;
--        ps2_clk_tb <= '0';
--    end loop;
--    wait;
    
--    end process;
    
   
process

        begin
    ps2_clk_tb <= '1';
     --ps2_data_tb <= '1';
 wait for 100 us;
 --ps2_data_tb <= '0';
 ps2_clk_tb <= '0' after 10 us, '1' after 35 us;
 wait for 100 us;
 end process;
 
 process
 begin
    --ps2_data_tb<='1'; wait for 100 ns;
    --send "H" = Scan Code 33 Ascii Value 68
    ps2_data_tb <= '0'; --Start Bit
    wait for 200us;
    ps2_data_tb <= '1'; -- Bit0
    wait for 200us;
    ps2_data_tb <= '1'; -- Bit1
    wait for 200us;
    ps2_data_tb <= '0'; -- Bit2
    wait for 200us;
    ps2_data_tb <= '0'; -- Bit3
    wait for 200us;
    ps2_data_tb <= '1'; -- Bit4
    wait for 200us;
    ps2_data_tb <= '1'; -- Bit5
    wait for 200us;
    ps2_data_tb <= '0'; -- Bit6
    wait for 200us;
    ps2_data_tb <= '0'; -- Bit7
    wait for 200us;
    ps2_data_tb <= '0'; -- Parity Bit
    wait for 200us;
    ps2_data_tb <= '1'; -- Stop Bit
    wait for 200us;
    
    --send "E"  = Scan Code 24 Ascii Value 65
    ps2_data_tb <= '0'; --Start Bit
    wait for 200us;
    ps2_data_tb <= '0'; -- Bit0
    wait for 200us;
    ps2_data_tb <= '0'; -- Bit1
    wait for 200us;
    ps2_data_tb <= '1'; -- Bit2
    wait for 200us;
    ps2_data_tb <= '0'; -- Bit3
    wait for 200us;
    ps2_data_tb <= '0'; -- Bit4
    wait for 200us;
    ps2_data_tb <= '1'; -- Bit5
    wait for 200us;
    ps2_data_tb <= '0'; -- Bit6
    wait for 200us;
    ps2_data_tb <= '0'; -- Bit7
    wait for 200us;
    ps2_data_tb <= '0'; -- Parity Bit
    wait for 200us;
    ps2_data_tb <= '1'; -- Stop Bit
    wait for 200us;
    --send "L"  = Scan Code 4B ASCII VALUE 6C
    ps2_data_tb <= '0'; --Start Bit
    wait for 200us;
    ps2_data_tb <= '0'; -- Bit0
    wait for 200us;
    ps2_data_tb <= '0'; -- Bit1
    wait for 200us;
    ps2_data_tb <= '1'; -- Bit2
    wait for 200us;
    ps2_data_tb <= '0'; -- Bit3
    wait for 200us;
    ps2_data_tb <= '1'; -- Bit4
    wait for 200us;
    ps2_data_tb <= '1'; -- Bit5
    wait for 200us;
    ps2_data_tb <= '0'; -- Bit6
    wait for 200us;
    ps2_data_tb <= '1'; -- Bit7
    wait for 200us;
    ps2_data_tb <= '1'; -- Parity Bit
    wait for 200us;
    ps2_data_tb <= '1'; -- Stop Bit
    wait for 200us;
    --send "L"  = Scan Code 6C
    ps2_data_tb <= '0'; --Start Bit
    wait for 200us;
    ps2_data_tb <= '0'; -- Bit0
    wait for 200us;
    ps2_data_tb <= '1'; -- Bit1
    wait for 200us;
    ps2_data_tb <= '1'; -- Bit2
    wait for 200us;
    ps2_data_tb <= '0'; -- Bit3
    wait for 200us;
    ps2_data_tb <= '0'; -- Bit4
    wait for 200us;
    ps2_data_tb <= '1'; -- Bit5
    wait for 200us;
    ps2_data_tb <= '1'; -- Bit6
    wait for 200us;
    ps2_data_tb <= '0'; -- Bit7
    wait for 200us;
    ps2_data_tb <= '1'; -- Parity Bit
    wait for 200us;
    ps2_data_tb <= '1'; -- Stop Bit
    wait for 200us;
    --send "O"  = Scan Code 6F
    ps2_data_tb <= '0'; --Start Bit
    wait for 200us;
    ps2_data_tb <= '1'; -- Bit0
    wait for 200us;
    ps2_data_tb <= '1'; -- Bit1
    wait for 200us;
    ps2_data_tb <= '1'; -- Bit2
    wait for 200us;
    ps2_data_tb <= '1'; -- Bit3
    wait for 200us;
    ps2_data_tb <= '0'; -- Bit4
    wait for 200us;
    ps2_data_tb <= '1'; -- Bit5
    wait for 200us;
    ps2_data_tb <= '1'; -- Bit6
    wait for 200us;
    ps2_data_tb <= '0'; -- Bit7
    wait for 200us;
    ps2_data_tb <= '1'; -- Parity Bit
    wait for 200us;
    ps2_data_tb <= '1'; -- Stop Bit
    wait for 200us;

    end process;

    
end Behavioral;