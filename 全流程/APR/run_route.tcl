read_lef {./lef/N551P6M_fix.lef \
          ./lef/ics55_LLSC_H9CR_ant.lef}
read_verilog   ./cts_opt/cts_opt.v.gz
read_mmmc_file ./cts_opt/mmmc_cts_opt.tcl
read_def       ./cts_opt/cts_opt.def.gz

add_filler -cell {FILLER16H9R FILLER8H9R FILLER4H9R FILLER2H9R FILLER1H9R}
route

gui_show
report_route
set_selected n499
gui_zoom -selected
check_drc
extract_rc
report_qor
check_connectivity
check_antenna
report_congestion

unroute
route_global
route_track
route_detail

##settings
set_options route.timing_driven true
set_options route.si_driven true
#route
route

#settings
set_options route.antenna_repair true
set_options route.clock_net_use_antenna_diode true
set_options route.regular_net_use_antenna_diode true
set_options route.antenna_cells BUFX1H9R
#route
route

#setting
set_options route.wire_spread 1
#route
route -wire_optimize

#setting
set_options route.top_routing_layer MET4
set_options route.bottom_routing_layer MET2
#route
route
