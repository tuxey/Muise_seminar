library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity average is
generic (
    g_data_size : integer:=10
);
    port (
        clk   : in std_logic;
        reset : in std_logic;
        a_in : in std_logic_vector(g_data_size-1 downto 0);
        b_in : in std_logic_vector(g_data_size-1 downto 0);
        avg_out : out std_logic_vector(g_data_size-1 downto 0)
    );
end entity;

architecture rtl of average is
    
  signal s_a_in : std_logic_vector(g_data_size-1 downto 0):=(others => '0') ;
  signal s_b_in : std_logic_vector(g_data_size-1 downto 0):=(others => '0') ;
    signal s_avg_out : std_logic_vector (g_data_size downto 0):=(others => '0') ;

begin
process (clk)
begin
    if rising_edge(clk) then
        if reset = '1' then
            s_avg_out<=(others => '0'); 
        else
            s_a_in<=a_in;
            s_b_in<=b_in;
            s_avg_out<= std_logic_vector(resize(unsigned(s_a_in),g_data_size+1)+resize(unsigned(s_b_in),g_data_size+1));
            avg_out<=std_logic_vector(resize(shift_right(unsigned(s_avg_out),1),g_data_size));
        end if;
    end if;
end process;

end architecture;