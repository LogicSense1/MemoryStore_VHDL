library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.common.all;

entity dmem is
    port (reset : in  std_logic;
          clk   : in  std_logic;
          raddr : in  std_logic_vector(5 downto 0);
          dout  : out word;
          waddr : in  std_logic_vector(5 downto 0);
          din : in  word;
          we    : in  std_logic);
end entity dmem;

architecture memory of dmem is
type membank_t is array (0 to 63) of word;
signal membank0 : membank_t := (others => (others => '0'));
	
begin 

memory_proc : process (clk) is
    begin  
        if (reset = '1') then
		          membank0 <= (others => (others => '0'));
					 end if;
		  if rising_edge(clk) then
            if (we = '1') then
                membank0(to_integer(unsigned(waddr))) <= din;
            end if;
        end if;
    end process memory_proc;

    -- asynchronous read
    dout <= membank0(to_integer(unsigned(raddr)));
   
end architecture memory;