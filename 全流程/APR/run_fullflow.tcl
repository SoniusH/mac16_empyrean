
#Stage Init
#read_lef ./lef/N551P6M_fix_NDR.lef
#read_lef ./lef/ics55_LLSC_H9CR_ant.lef


#Stage Init
#read_lef ./lef/N551P6M_fix_NDR.lef
#read_lef ./lef/ics55_LLSC_H9CR_ant.lef

read_lef { ../../../Common/ics55_LLSC_H9CR_0917/lef/N551P6M_fix_NDR.lef         \
           ../../../Common/ics55_LLSC_H9CR_0917/lef/ics55_LLSC_H9CR_ant.lef }
read_verilog ../FromSYN/mapped.v
read_mmmc_file ./mmmc.tcl

#Stage Floorplan
#initialize_floorplan -site core9 -utilization 0.7 -core_to_die_offset { 3 3 3 3 }
#
#4bitMac Golden: floorPlan -b <0.0 0.0 100 99 0 0 100 99 5.4 5.4 94.6 93.6> -fplanOrigin llcorner
initialize_floorplan -site core9 -boundary {5.4 5.4 90.6 88.6} -core_to_die_offset {3.4 3.4 3.4 4.4}

place_io_pins
source ./update_io_pin.tcl

# add end cap cell
set_options add_end_cap.bottom_edge ENDCAP2H9R
set_options add_end_cap.top_edge ENDCAP2H9R
set_options add_end_cap.left_edge ENDCAP2H9R
set_options add_end_cap.right_edge ENDCAP2H9R
add_end_cap -prefix end_cap_
# add well tap cell
set_options add_well_tap.cell_interval 20
set_options add_well_tap.cell FILLTAP4H9R
add_well_tap -prefix well_tap_

#Power Plan
#source route_pg.tcl
source route_pg_vss_v1p2_v3p3.tcl

set_options route.top_routing_layer MET4

write_verilog       ./fp/fp.v.gz
write_def -wire_via ./fp/fp.def.gz
write_db -force     ./fp_db

#Stage Place
set_options global.infra.max_thread_count 8
set_options place.effort high
place 
check_place
extract_rc
report_qor
write_verilog       ./place/place.v.gz
write_def -wire_via ./place/place.def.gz
write_db -force     ./place_db

#Stage Post_Place
optimize -post_place
extract_rc
report_qor

write_verilog       ./prects/prects.v.gz
write_def -wire_via ./prects/prects.def.gz
write_db -force     ./prects_db

#Stage CTS
synthesize_clock_tree
extract_rc
report_qor
report_clock_timing -type skew

write_verilog       ./cts/cts.v.gz
write_def -wire_via ./cts/cts.def.gz
write_db -force     ./cts_db

#Stage Post_CTS
optimize -post_cts
extract_rc
report_qor

#Hold
extract_rc
report_qor -type min
report_density
optimize -post_cts -hold
extract_rc
report_qor -type min

write_verilog       ./cts_opt/cts_opt.v.gz
write_def -wire_via ./cts_opt/cts_opt.def.gz
write_db -force     ./cts_opt_db

report_density
#Stage Route
add_filler -cell {FILLER16H9R FILLER8H9R FILLER4H9R FILLER2H9R FILLER1H9R}
route
extract_rc
report_qor

#Stage Post_Route
optimize -post_route
route
extract_rc
report_qor

extract_rc
report_qor -type min
report_density
optimize -post_route -hold -setup
route
extract_rc
report_qor -view v_tt_1p2_25c
report_qor -view v_tt_1p2_25c -type min

report_qor
report_qor -type min

optimize -post_route -hold
route
extract_rc
report_qor
report_qor -type min
optimize -post_route -hold
route
extract_rc
##fix drv
optimize -post_route -drv
route
extract_rc
report_qor

write_verilog -pg      ./route/route.v.gz
write_def -wire_via    ./route/route.def.gz
write_db -force        ./route_db


#Stage Output Design
write_def             o_data/route.def.gz
write_verilog -pg     o_data/route.v
write_gds -units 2000 o_data/route.gds
write_lef ./o_data/route.lef
#write_gds o_data/route.gds
write_sdc             o_data/route.sdc
all_rc_corners
write_spef -rc_corner tt_1p2_25c       o_data/route_tt_1p2_25c.spef.gz
write_spef -rc_corner rcbest_1p32_m40c o_data/route_rcbest_1p32_m40c.spef.gz
write_spef -rc_corner cworst_1p08_m40c o_data/route_cworst_1p08_m40c.spef.gz
#exit


