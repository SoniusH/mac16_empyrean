#mcmm settings
create_rc_view -name rcbest
create_rc_view -name rcworst
create_corner -name fast_rcbest  -libsets fast -rc_view rcbest
create_corner -name slow_rcworst -libsets slow -rc_view rcworst
create_mode -name func -sdc_files $sdc_file(func)
create_mode -name test -sdc_files $sdc_file(test)
create_scenario -name func_fast -mode func -corner fast_rcbest
create_scenario -name func_slow -mode func -corner slow_rcworst
create_scenario -name test_fast -mode test -corner fast_rcbest
create_scenario -name test_slow -mode test -corner slow_rcworst
