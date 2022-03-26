library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
 
entity top is
  port (
    clk_in    : in  std_logic;
    rf : out std_logic
    );
end top;
 
architecture rtl of top is

  	component pll is
        PORT ( 
        refclk	: IN	STD_LOGIC;
		reset	: IN	STD_LOGIC;
		clk0_out	: OUT	STD_LOGIC);
    end component;
    
    signal clk0_out : std_logic;
    signal phase : std_logic;
    
    constant c_700HZ : natural := 34000;
	signal r_700HZ : natural range 0 to c_700HZ;
    
	constant c_morse_timer : natural := 4800000;
	signal morse_timer : natural range 0 to c_morse_timer;
	
	constant msg : std_logic_vector(0 to 59) := "101010100001000010111010100001011101010000111011101110000000";
	signal msg_bit : std_logic;
	signal msg_char : natural range 0 to 59;
	
begin

	pll_inst:
	pll port map (refclk => clk_in, reset => '0', clk0_out => clk0_out);

	rf <= clk0_out xor phase when msg_bit = '1' else clk0_out;
	
	process (clk_in) is
  	begin
    	if rising_edge(clk_in) then
    	  	if r_700HZ = c_700HZ-1 then
     	   		phase <= not phase;
     	   
     	   		r_700HZ   <= 0;
    	  	else
    	    	r_700HZ <= r_700HZ + 1;
    	  	end if;
   	 	end if;
  	end process;
  
  	process (clk_in) is
  	begin
    	if rising_edge(clk_in) then
      		if morse_timer = c_morse_timer-1 then
				msg_bit <= msg(msg_char);
		   		msg_char <= msg_char + 1;  
        
        		morse_timer   <= 0;
      		else
        		morse_timer <= morse_timer + 1;
      		end if;
    	end if;
  	end process;
  	
end rtl;