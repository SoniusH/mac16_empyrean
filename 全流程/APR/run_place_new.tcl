
#Stage Init
#read_lef ./lef/N551P6M_fix_NDR.lef
#read_lef ./lef/ics55_LLSC_H9CR_ant.lef
read_db fp_db

#Stage Place
#set_options route.top_routing_layer MET4
set_options global.infra.max_thread_count 8
set_options place.effort high

place -global
gui_show
place -legalize
early_route
place -detail 

check_place
report_density
extract_rc
report_qor
write_verilog       ./place/place.v.gz
write_def -wire_via ./place/place.def.gz
write_db -force     ./place_db



