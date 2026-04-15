read_lef {./lef/N551P6M_fix.lef \
          ./lef/ics55_LLSC_H9CR_ant.lef}
read_verilog   ./route/route.v.gz
read_mmmc_file ./route/mmmc_route.tcl
read_def       ./route/route.def.gz

extract_rc
report_qor
report_timing -nets 

insert_buffer -net n490 -cell BUFX3H9R -name test_eco -location {31000 21000}

route
extract_rc
report_timing -from b\[2\] -to sum_out_reg\[15\] -nets
report_qor

size_cell -insts u263 -cell AOI32X2H9R

route
extract_rc
report_timing -from b\[2\] -to sum_out_reg\[15\] -nets
report_qor

