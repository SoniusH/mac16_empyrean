read_db place_db

early_route
extract_rc
report_qor
report_timing
report_density

optimize -post_place

extract_rc
report_qor
report_density

#report_timing -through u637 -through u721 -from prev_prod_reg\[0\]/Q -to sum_out_reg\[15\]/D
report_timing -through POPTPP_rebuffer13_Setup13
report_timing -through POPTPP_rebuffer18_Setup18
report_timing -nets

write_verilog       ./prects/prects.v.gz
write_def -wire_via ./prects/prects.def.gz
write_db -force     ./prects_db


