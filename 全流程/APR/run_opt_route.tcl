read_lef {./lef/N551P6M_fix.lef \
          ./lef/ics55_LLSC_H9CR_ant.lef}
read_verilog    ./route/route.v.gz
read_mmmc_file  ./route/mmmc_route.tcl
read_def        ./route/route.def.gz

optimize -post_route
extract_rc
report_qor

