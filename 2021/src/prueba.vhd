average_inst : average
generic map(
  g_data_size => g_data_size
)
port map(
  clk     => clk,
  reset   => reset,
  a_in    => a_in,
  b_in    => b_in,
  avg_out => avg_out
);