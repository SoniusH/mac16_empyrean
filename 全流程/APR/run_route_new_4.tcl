read_db ./cts_opt_db

add_filler -cell {FILLER16H9R FILLER8H9R FILLER4H9R FILLER2H9R FILLER1H9R}

#settings
set_options route.antenna_repair true
set_options route.clock_net_use_antenna_diode true
set_options route.regular_net_use_antenna_diode true
set_options route.antenna_cells BUFX1H9R
#route
route

