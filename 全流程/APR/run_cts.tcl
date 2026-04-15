
##Stage Init
read_lef       ./lef/N551P6M_fix_NDR.lef         
read_lef       ./lef/ics55_LLSC_H9CR_ant.lef 
read_verilog   ./prects/prects.v.gz
read_mmmc_file ./mmmc.tcl
read_def       ./prects/prects.def.gz


##Stage CTS
#Buffer Cells 
#set_options cts.buffer_cells   {BUFX4H9R BUFX5H9R BUFX6H9R}
set_options cts.buffer_cells   {BUFX4H9R}

#Special Pins
set_options cts.stop_pins    {prev_prod_reg\[15\]/CK}
set_options cts.ignore_pins  {prev_prod_reg\[1\]/CK}

#Non-Default Rules
set_options cts.top_net_routing_layer_range {MET3 MET5}
set_options cts.top_net_routing_rule 2W2S
set_options cts.top_net_routing_shield_net VSS
set_options cts.top_net_routing_shield_side two_side

set_options cts.trunk_net_routing_layer_range {MET3 MET4}
set_options cts.trunk_net_routing_rule 2W2S
set_options cts.trunk_net_routing_shield_net VSS
set_options cts.trunk_net_routing_shield_side two_side

set_options cts.leaf_net_routing_layer_range {MET2 MET4}

set_options cts.max_fanout 10
set_options cts.primary_analysis_corner ac_cworst_1p08_m40c

#Run CTS
synthesize_clock_tree
extract_rc
report_qor
report_clock_timing -type skew
report_cts_clock_tree_structure -show_sinks

write_verilog       ./cts/cts.v.gz
write_def -wire_via ./cts/cts.def.gz

gui_show

return
