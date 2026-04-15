
##Stage Init
read_db prects_db

##Stage CTS
#Run CTS
synthesize_clock_tree
gui_show

extract_rc
report_qor
report_clock_timing -type skew
report_clock_timing -type latency -to acc_reg_reg\[9\]/CK
report_clock_timing -type skew -verbose
report_cts_clock_tree_structure -show_sinks
report_clocks

#write_verilog       ./cts/cts.v.gz
#write_def -wire_via ./cts/cts.def.gz

write_verilog       ./cts/cts.v.gz
write_def -wire_via ./cts/cts.def.gz
write_db -force     ./cts_db


