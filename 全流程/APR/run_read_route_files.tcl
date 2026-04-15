read_lef       ../../../Common/ics55_LLSC_H9CR_0917/lef/N551P6M_fix_NDR.lef         
read_lef       ../../../Common/ics55_LLSC_H9CR_0917/lef/ics55_LLSC_H9CR_ant.lef 
read_verilog   ./o_data/route.v
read_mmmc_file ./mmmc.tcl
read_def       ./o_data/route.def.gz

extract_rc
write_gds -units 2000 ./o_data/route.gds
write_lef ./o_data/route.lef
write_verilog ./post_sim/route_post_sim.v
write_sdf -view v_tt_1p2_25c ./post_sim/v_tt_1p2_25c.sdf
write_sdf -view v_rcbest_1p32_m40c ./post_sim/v_rcbest_1p32_m40c.sdf 
write_sdf -view v_cworst_1p08_m40c ./post_sim/v_cworst_1p08_m40c.sdf

return
