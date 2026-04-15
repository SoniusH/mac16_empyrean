
#netlist/spef/sdc and lib info
source design_setup.tcl

#Mission
create_mission mac8 -log_dir ./log
create_design -verilog_files $verilog_files
create_lib_set -name fast -file_list $lib_file(fast)
create_lib_set -name slow -file_list $lib_file(slow)
link_mission

#MCMM
source mcmm.tcl

#read sdc, single mode sdc, mcmm already load sdc
#read_sdc $sdc_file(func) -continue_on_error

#read_spef
read_spef -view rcbest  $spef_file(rcbest)
read_spef -view rcworst $spef_file(rcworst)


####
#common parameters setting
set_parameter enable_crpr true           ;#enable crpr
set_parameter crpr_threshold_ps 5        ;#crpr threshold 5ps
set_parameter max_thread_number 8        ;#max_thread 2~100

update_timing -full

#save mission
save_mission -force mission/mac8dualmode.mission


#report for each scen
file mkdir rpt
foreach one_scen [get_scenarios *] {
	file mkdir rpt/$one_scen
	report_analysis_coverage -scenario $one_scen  >  rpt/${one_scen}/coverage.rpt
	report_global_timing -scenario $one_scen  >  rpt/${one_scen}/global_timing.rpt
	report_constraint -all_violators -scenario $one_scen  >  rpt/${one_scen}/all.cons.rpt
	report_timing -delay_type max -path_type full_clock_expanded -input_pins -capacitance -transition -scenario $one_scen -slack_lesser_than 0 -max_paths 100 >  rpt/${one_scen}/setup.rpt
	report_timing -delay_type min -path_type full_clock_expanded -input_pins -capacitance -transition -scenario $one_scen -slack_lesser_than 0 -max_paths 100 >  rpt/${one_scen}/hold.rpt
}


#change current scenario
current_scenario func_slow
report_timing




