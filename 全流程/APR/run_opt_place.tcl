read_lef {./lef/N551P6M_fix.lef \
          ./lef/ics55_LLSC_H9CR_ant.lef}
read_verilog   ./place/place.v.gz
read_mmmc_file ./place/mmmc_place.tcl
read_def       ./place/place.def.gz

early_route
extract_rc
report_qor
report_timing
report_density

optimize -post_place

extract_rc
report_qor
report_density

report_timing -through u637 -through u721 -from prev_prod_reg\[0\]/Q -to sum_out_reg\[15\]/D
report_timing -through POPTPP_rebuffer3
report_timing -through POPTPP_rebuffer8
report_timing -nets
