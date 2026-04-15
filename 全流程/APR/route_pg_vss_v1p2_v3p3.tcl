#set_power_net  {V1P2 V3P3}
set_power_net V1P2
set_ground_net VSS
#create_pg_pin -name VDD -direction input -net VDD -shape_layer MET5 -shape_box {38.134 20.675 38.6 20.765}
#create_pg_pin -name VSS -direction input -net VSS -shape_layer MET5 -shape_box {38.134 22.675 38.6 22.765}
connect_pg_net -pins VDD -pg_net V1P2 -type pg_pin
#connect_pg_net -pins V3P3 -pg_net V3P3 -type pg_pin
connect_pg_net -pins VSS -pg_net  VSS  -type pg_pin

set_options create_ring.layers {MET4 MET5}
#set_options create_ring.spacing 0.5
set_options create_ring.spacing 0.4

set_options create_ring.ring_type core_ring
#set_options create_ring.width  0.3
set_options create_ring.width  1.2

#set_options create_ring.offset 1.0
set_options create_ring.offset 0.5
create_ring -nets {V1P2 VSS}

#set_options create_stripe.end_extend_to first_ring
set_options create_stripe.end_extend_to die_boundary
set_options create_stripe.direction horizontal

#create_stripe -layer T4M2 -width 10 -start 94.395 -nets V1P2  -generate_via true -sets_number 1
#create_stripe -layer T4M2 -width 10 -start 16.395 -nets V3P3 -generate_via true -sets_number 1
#create_stripe -layer T4M2 -width 10 -start 4.395 -nets VSS  -generate_via true -sets_number 1

create_stripe -layer T4M2 -width 10 -start 83.295 -nets VSS  -generate_via true -sets_number 1
# create_stripe -layer T4M2 -width 10 -start 11.395 -nets V3P3 -generate_via true -sets_number 1
# Stripe can not beyond die area, 4.395-10/2 < 0, So use 0.395 replace
create_stripe -layer T4M2 -width 10 -start 15.395  -nets V1P2  -generate_via true -sets_number 1
create_stripe -layer MET5 -width 5 -start 15.395  -nets V1P2  -generate_via true -sets_number 1 

set_options route_special.core_pin_target core_ring
route_special -nets {V1P2 VSS}

check_pg_vias
