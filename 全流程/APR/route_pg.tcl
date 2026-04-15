set_power_net VDD
set_ground_net VSS
#create_pg_pin -name VDD -direction input -net VDD -shape_layer MET5 -shape_box {38.134 20.675 38.6 20.765}
#create_pg_pin -name VSS -direction input -net VSS -shape_layer MET5 -shape_box {38.134 22.675 38.6 22.765}
connect_pg_net -pins VDD -pg_net VDD -type pg_pin
connect_pg_net -pins VSS -pg_net VSS -type pg_pin

set_options create_ring.layers {MET5 MET4}
set_options create_ring.spacing 0.5
set_options create_ring.ring_type core_ring
set_options create_ring.width  0.3
set_options create_ring.offset 1.0
create_ring -nets {VDD VSS}

set_options create_stripe.end_extend_to first_ring
create_stripe -layer MET5 -width 0.2 -start_offset_from_core 2 -nets VDD -pitch 5 -generate_via true
create_stripe -layer MET5 -width 0.2 -start_offset_from_core 4 -nets VSS -pitch 5 -generate_via true
create_stripe -layer MET4 -width 0.2 -start_offset_from_core 2 -nets VDD -pitch 5 -generate_via true
create_stripe -layer MET4 -width 0.2 -start_offset_from_core 4 -nets VSS -pitch 5 -generate_via true

set_options route_special.core_pin_target core_ring
route_special -nets {VDD VSS}