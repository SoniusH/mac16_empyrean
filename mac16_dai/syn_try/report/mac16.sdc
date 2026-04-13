create_clock -name {clk} -period 1.000000 -waveform { 0.000000 0.500000 } [get_ports {clk}]
set_clock_uncertainty 0.050000 [get_clocks {clk}]
set_false_path \
    -from [get_ports {rst_n}]
set_load -pin_load 0.025000 [get_ports {sum_out}]
set_load -pin_load 0.025000 [get_ports {out_ready}]
set_load -pin_load 0.025000 [get_ports {carry}]
