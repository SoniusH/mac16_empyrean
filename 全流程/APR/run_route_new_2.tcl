read_db ./cts_opt_db

add_filler -cell {FILLER16H9R FILLER8H9R FILLER4H9R FILLER2H9R FILLER1H9R}

route_global
route_track
route_detail

#setting
set_options route.wire_spread 1
#route
route -wire_optimize


