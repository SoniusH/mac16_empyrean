#### setting ####
set script_dir [file dirname [file normalize [info script]]]
set case_dir $script_dir
set lib_dir ../Common/ics55_LLSC_H9CR_0917/liberty/lib
set src_dir $case_dir/rtl
set rpt_dir $case_dir/report

set design mult16

# 创建report目录
file mkdir $rpt_dir

# 添加搜索路径
set search_path [concat $search_path $lib_dir]

# 编译库文件
compile_lib -f lib ${lib_dir}/ics55_LLSC_H9CR_ff_cbest_1p32_125_nldm.lib
compile_lib -f lib ${lib_dir}/ics55_LLSC_H9CR_ff_rcbest_1p08_125_nldm.lib
compile_lib -f lib ${lib_dir}/ics55_LLSC_H9CR_ff_rcbest_1p32_m40_nldm.lib
compile_lib -f lib ${lib_dir}/ics55_LLSC_H9CR_ss_cworst_1p08_m40_nldm.lib
compile_lib -f lib ${lib_dir}/ics55_LLSC_H9CR_ss_rcworst_1p08_125_nldm.lib
compile_lib -f lib ${lib_dir}/ics55_LLSC_H9CR_ss_rcworst_1p2_m40_nldm.lib
compile_lib -f lib ${lib_dir}/ics55_LLSC_H9CR_typ_tt_1p2_25_nldm.lib

set target_lib { ics55_LLSC_H9CR_ff_cbest_1p32_125_nldm.lib ics55_LLSC_H9CR_ff_rcbest_1p08_125_nldm.lib ics55_LLSC_H9CR_ff_rcbest_1p32_m40_nldm.lib ics55_LLSC_H9CR_ss_cworst_1p08_m40_nldm.lib ics55_LLSC_H9CR_ss_rcworst_1p08_125_nldm.lib ics55_LLSC_H9CR_ss_rcworst_1p2_m40_nldm.lib ics55_LLSC_H9CR_typ_tt_1p2_25_nldm.lib }

set link_priority "* ics55_LLSC_H9CR_ff_cbest_1p32_125_nldm ics55_LLSC_H9CR_ff_rcbest_1p08_125_nldm ics55_LLSC_H9CR_ff_rcbest_1p32_m40_nldm ics55_LLSC_H9CR_ss_cworst_1p08_m40_nldm ics55_LLSC_H9CR_ss_rcworst_1p08_125_nldm ics55_LLSC_H9CR_ss_rcworst_1p2_m40_nldm ics55_LLSC_H9CR_typ_tt_1p2_25_nldm" 

read_design -format verilog "$src_dir/mult16.v"

set current_design $design

link_design
make_unique
write_design -format verilog -hierarchy -o $rpt_dir/pre_mapped.v

#### set timing constraints ####
source $script_dir/sdc/mult16.sdc

#optimize -mode timing -structure_effort high -map_effort high
optimize

#### report ####
analyze_qor -summary -precision 6 > $rpt_dir/qor.rpt
analyze_area > $rpt_dir/area.rpt
analyze_resources > $rpt_dir/resource.rpt
analyze_constraint -verbose -all_violators > $rpt_dir/cstr.rpt
analyze_design > $rpt_dir/design.rpt
analyze_power > $rpt_dir/power.rpt
analyze_timing -delay_type max -input_pins -precision 6 > $rpt_dir/timing.rpt
write_design -format verilog -hierarchy -o $rpt_dir/mapped.v
write_sdc > $rpt_dir/mult16.sdc
run_stat > $rpt_dir/stat.log
mem_usage > $rpt_dir/memusage.rpt