
#Stage Init
#read_lef ./lef/N551P6M_fix_NDR.lef
#read_lef ./lef/ics55_LLSC_H9CR_ant.lef
read_lef { ./lef/N551P6M_fix_NDR.lef         \
           ./lef/ics55_LLSC_H9CR_ant.lef }
read_verilog   ./fp/fp.v.gz
read_mmmc_file ./mmmc.tcl
read_def       ./fp/fp.def.gz

# set_options add end cap cell
set_options add_end_cap.bottom_edge ENDCAP2H9R
set_options add_end_cap.top_edge ENDCAP2H9R
set_options add_end_cap.left_edge ENDCAP2H9R
set_options add_end_cap.right_edge ENDCAP2H9R
# set_options add well tap cell
set_options add_well_tap.cell_interval 20
set_options add_well_tap.cell FILLTAP4H9R

#Stage Place
set_options route.top_routing_layer MET4
set_options global.infra.max_thread_count 8
set_options place.effort high
place 
check_place
extract_rc
report_qor
write_verilog       ./place/place.v.gz
write_def -wire_via ./place/place.def.gz
#write_db -force     ./place_db



