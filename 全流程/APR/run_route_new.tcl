read_db ./cts_opt_db

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
report_route -nets n499

write_verilog -pg      ./route/route.v.gz
write_def -wire_via    ./route/route.def.gz
write_db -force        ./route_db

