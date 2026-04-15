read_db cts_db

early_route
extract_rc
report_qor
report_density

optimize -post_cts

extract_rc
report_qor
report_qor -type min
report_density

optimize -post_cts -hold

extract_rc
report_qor -type min

optimize -post_cts -hold
extract_rc
report_qor -type min


write_verilog       ./cts_opt/cts_opt.v.gz
write_def -wire_via ./cts_opt/cts_opt.def.gz
write_db -force     ./cts_opt_db

