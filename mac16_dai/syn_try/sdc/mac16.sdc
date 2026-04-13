###################################################################
# SDC for 顶层模块 mac16 (所有子模块无需约束)
# 目标频率：1GHz (周期1ns)
###################################################################
set_units -time ns -resistance kOhm -capacitance pF -voltage V -current mA

# 1. 工艺条件 (沿用你的55nm库)
set_operating_conditions \
    -max ETSCA_N55_H9BR_ss_mos_RCworst_1.08_125 \
    -max_library ics55_LLSC_H9CR_ss_rcworst_1p08_125_nldm \
    -min ETSCA_N55_H9BR_ff_mos_RCbest_1.32_-40 \
    -min_library ics55_LLSC_H9CR_ff_rcbest_1p32_m40_nldm

# 2. 时钟约束：1GHz (顶层唯一时钟)
create_clock -name clk -period 1 [get_ports clk]
set_clock_uncertainty 0.05 [get_clocks clk]

# 3. 异步复位：伪路径 (顶层复位)
set_false_path -from [get_ports rst_n]

# 4. 顶层输入端口约束 (所有对外输入)
set_input_delay -max 0.3 -min 0.05 -clock clk [get_ports in_ready]
set_input_delay -max 0.3 -min 0.05 -clock clk [get_ports mode]
set_input_delay -max 0.3 -min 0.05 -clock clk [get_ports inA]
set_input_delay -max 0.3 -min 0.05 -clock clk [get_ports inB]

# 5. 顶层输出端口负载 + 延迟约束 (所有对外输出)
set_load -pin_load 0.025 [get_ports sum_out]
set_load -pin_load 0.025 [get_ports out_ready]
set_load -pin_load 0.025 [get_ports carry]

set_output_delay -max 0.3 -min 0.05 -clock clk [get_ports sum_out]
set_output_delay -max 0.3 -min 0.05 -clock clk [get_ports out_ready]
set_output_delay -max 0.3 -min 0.05 -clock clk [get_ports carry]