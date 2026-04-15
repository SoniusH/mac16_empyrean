read_db route_db

extract_rc
report_qor
report_density


optimize -post_route
extract_rc
report_qor
report_density
report_qor -type min

optimize -post_route -hold
extract_rc
report_qor -type min

optimize -post_route -hold
extract_rc
report_qor -type min

optimize -post_route -hold
extract_rc
report_qor -type min

optimize -post_route -hold



route
extract_rc
report_qor
report_density
report_qor -type min
check_drc
check_connectivity

write_verilog -pg      ./route/route.v.gz
write_def -wire_via    ./route/route.def.gz

write_def             o_data/route.def.gz
write_verilog -pg     o_data/route.v

