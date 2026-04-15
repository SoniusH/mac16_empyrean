
#Stage Init
#read_lef ./lef/N551P6M_fix_NDR.lef
#read_lef ./lef/ics55_LLSC_H9CR_ant.lef
read_lef { ./lef/N551P6M_fix_NDR.lef         \
           ./lef/ics55_LLSC_H9CR_ant.lef }
read_verilog ./init/8bitnetlist.v
read_mmmc_file mmmc.tcl

#Stage Floorplan
#initialize_floorplan -site core9 -utilization 0.7 -core_to_die_offset { 3 3 3 3 }
initialize_floorplan -site core9 -boundary {5.4 5.4 94.6 93.6} -core_to_die_offset {5.4 5.4 5.4 6.4}
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
return

write_verilog       ./fp/fp.v.gz
write_def -wire_via ./fp/fp.def.gz
write_db -force     ./fp_db


