create_analysis_mode -name CONSTRAINTS -constraint_file ../FromSYN/mult16.sdc
create_lib_set -name TTlib -timing_lib { \
  /headless/Desktop/digitial/digital_env/Common/ics55_LLSC_H9CR_0917/liberty/lib/ics55_LLSC_H9CR_typ_tt_1p2_25_nldm.lib \
}
create_lib_set -name FFlib -timing_lib { \
  /headless/Desktop/digitial/digital_env/Common/ics55_LLSC_H9CR_0917/liberty/lib/ics55_LLSC_H9CR_ff_rcbest_1p32_m40_nldm.lib \
}
create_lib_set -name SSlib -timing_lib { \
  /headless/Desktop/digitial/digital_env/Common/ics55_LLSC_H9CR_0917/liberty/lib/ics55_LLSC_H9CR_ss_cworst_1p08_m40_nldm.lib \
}
create_rc_corner -name tt_1p2_25c -rc_tech /headless/Desktop/digitial/digital_env/Common/ics55_LLSC_H9CR_0917/rc_tech/N55_typ.rc_tech
create_rc_corner -name rcbest_1p32_m40c -rc_tech /headless/Desktop/digitial/digital_env/Common/ics55_LLSC_H9CR_0917/rc_tech/N55_RCbest.rc_tech
create_rc_corner -name cworst_1p08_m40c -rc_tech /headless/Desktop/digitial/digital_env/Common/ics55_LLSC_H9CR_0917/rc_tech/N55_Cworst.rc_tech

create_analysis_corner -name ac_tt_1p2_25c       -lib_set TTlib -rc_corner tt_1p2_25c
create_analysis_corner -name ac_rcbest_1p32_m40c -lib_set FFlib -rc_corner rcbest_1p32_m40c
create_analysis_corner -name ac_cworst_1p08_m40c -lib_set SSlib -rc_corner cworst_1p08_m40c

create_analysis_view -name v_tt_1p2_25c -analysis_mode CONSTRAINTS -analysis_corner ac_tt_1p2_25c
create_analysis_view -name v_rcbest_1p32_m40c -analysis_mode CONSTRAINTS -analysis_corner ac_rcbest_1p32_m40c
create_analysis_view -name v_cworst_1p08_m40c -analysis_mode CONSTRAINTS -analysis_corner ac_cworst_1p08_m40c

set_analysis_view_status -view v_tt_1p2_25c       -active true -setup true -hold true
set_analysis_view_status -view v_rcbest_1p32_m40c -active true -setup false -hold true
set_analysis_view_status -view v_cworst_1p08_m40c -active true -setup true -hold false
