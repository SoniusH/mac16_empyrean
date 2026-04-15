read_lef {./lef/N551P6M_fix.lef \
          ./lef/ics55_LLSC_H9CR_ant.lef}
read_verilog   ./cts/cts.v.gz
read_mmmc_file ./cts/mmmc_cts.tcl
read_def       ./cts/cts.def.gz

optimize -post_cts

extract_rc
report_qor -type min
report_density

optimize -post_cts -hold

extract_rc
report_qor -type min

