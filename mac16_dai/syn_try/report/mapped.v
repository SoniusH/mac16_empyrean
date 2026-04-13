module mac16(clk, rst_n, in_ready, mode, inA, inB, sum_out, out_ready, carry);
input clk, rst_n, in_ready, mode, inA, inB;
output sum_out, out_ready, carry;
wire mode_d1, mode_d2, sys_rst_n, \rx_data_A[15] , \rx_data_A[14] ,
     \rx_data_A[13] , \rx_data_A[12] , \rx_data_A[11] , \rx_data_A[10] ,
     \rx_data_A[9] , \rx_data_A[8] , \rx_data_A[7] , \rx_data_A[6] ,
     \rx_data_A[5] , \rx_data_A[4] , \rx_data_A[3] , \rx_data_A[2] ,
     \rx_data_A[1] , \rx_data_A[0] , \rx_data_B[15] , \rx_data_B[14] ,
     \rx_data_B[13] , \rx_data_B[12] , \rx_data_B[11] , \rx_data_B[10] ,
     \rx_data_B[9] , \rx_data_B[8] , \rx_data_B[7] , \rx_data_B[6] ,
     \rx_data_B[5] , \rx_data_B[4] , \rx_data_B[3] , \rx_data_B[2] ,
     \rx_data_B[1] , \rx_data_B[0] , rx_valid, calc_carry, calc_valid,
     \u_compute_engine/mul_result[15] , \u_compute_engine/mul_result[14] ,
     \u_compute_engine/mul_result[13] , \u_compute_engine/mul_result[12] ,
     \u_compute_engine/mul_result[11] , \u_compute_engine/mul_result[10] ,
     \u_compute_engine/mul_result[9] , \u_compute_engine/mul_result[8] ,
     \u_compute_engine/mul_result[7] , \u_compute_engine/mul_result[6] ,
     \u_compute_engine/mul_result[5] , \u_compute_engine/mul_result[4] ,
     \u_compute_engine/mul_result[3] , \u_compute_engine/mul_result[2] ,
     \u_compute_engine/mul_result[1] , \u_compute_engine/mul_result[0] ,
     \u_compute_engine/u_mul8x8/pp[0][0] ,
     \u_compute_engine/u_mul8x8/pp_stage1[15] ,
     \u_compute_engine/u_mul8x8/pp_stage1[14] ,
     \u_compute_engine/u_mul8x8/pp_stage1[13] ,
     \u_compute_engine/u_mul8x8/pp_stage1[12] ,
     \u_compute_engine/u_mul8x8/pp_stage1[11] ,
     \u_compute_engine/u_mul8x8/pp_stage1[10] ,
     \u_compute_engine/u_mul8x8/pp_stage1[9] ,
     \u_compute_engine/u_mul8x8/pp_stage1[8] ,
     \u_compute_engine/u_mul8x8/pp_stage1[7] ,
     \u_compute_engine/u_mul8x8/pp_stage1[6] ,
     \u_compute_engine/u_mul8x8/pp_stage1[5] ,
     \u_compute_engine/u_mul8x8/pp_stage1[4] ,
     \u_compute_engine/u_mul8x8/pp_stage1[3] ,
     \u_compute_engine/u_mul8x8/pp_stage1[2] ,
     \u_compute_engine/u_mul8x8/pp_stage1[1] ,
     \u_compute_engine/u_mul8x8/pp_stage1[0] ,
     \u_compute_engine/u_mul8x8/ks_result[15] ,
     \u_compute_engine/u_mul8x8/ks_result[14] ,
     \u_compute_engine/u_mul8x8/ks_result[13] ,
     \u_compute_engine/u_mul8x8/ks_result[12] ,
     \u_compute_engine/u_mul8x8/ks_result[11] ,
     \u_compute_engine/u_mul8x8/ks_result[10] ,
     \u_compute_engine/u_mul8x8/ks_result[9] ,
     \u_compute_engine/u_mul8x8/ks_result[8] ,
     \u_compute_engine/u_mul8x8/ks_result[7] ,
     \u_compute_engine/u_mul8x8/ks_result[6] ,
     \u_compute_engine/u_mul8x8/ks_result[5] ,
     \u_compute_engine/u_mul8x8/ks_result[4] ,
     \u_compute_engine/u_mul8x8/ks_result[3] ,
     \u_compute_engine/u_mul8x8/ks_result[2] ,
     \u_compute_engine/u_mul8x8/ks_result[1] ,
     \u_compute_engine/u_mul8x8/ks_result[0] , \u_compute_engine/u_mul8x8/n86 ,
     \u_compute_engine/u_mul8x8/n102 , \u_compute_engine/u_mul8x8/n118 ,
     \u_compute_engine/u_mul8x8/n134 , \u_compute_engine/u_mul8x8/n150 ,
     \u_compute_engine/u_mul8x8/n166 , \u_compute_engine/u_mul8x8/n174 ,
     \u_compute_engine/u_mul8x8/n175 , \u_compute_engine/u_mul8x8/n176 ,
     \u_compute_engine/u_mul8x8/n177 , \u_compute_engine/u_mul8x8/n178 ,
     \u_compute_engine/u_mul8x8/n179 , \u_compute_engine/u_mul8x8/n180 ,
     \u_compute_engine/u_mul8x8/n181 , \u_compute_engine/u_mul8x8/n182 ,
     \u_spi_tx/shift_reg[22] , \u_spi_tx/shift_reg[21] ,
     \u_spi_tx/shift_reg[20] , \u_spi_tx/shift_reg[19] ,
     \u_spi_tx/shift_reg[18] , \u_spi_tx/shift_reg[17] ,
     \u_spi_tx/shift_reg[16] , \u_spi_tx/shift_reg[15] ,
     \u_spi_tx/shift_reg[14] , \u_spi_tx/shift_reg[13] ,
     \u_spi_tx/shift_reg[12] , \u_spi_tx/shift_reg[11] ,
     \u_spi_tx/shift_reg[10] , \u_spi_tx/shift_reg[9] , \u_spi_tx/shift_reg[8] ,
     \u_spi_tx/shift_reg[7] , \u_spi_tx/shift_reg[6] , \u_spi_tx/shift_reg[5] ,
     \u_spi_tx/shift_reg[4] , \u_spi_tx/shift_reg[3] , \u_spi_tx/shift_reg[2] ,
     \u_spi_tx/shift_reg[1] , \u_spi_tx/shift_reg[0] , \u_spi_tx/out_cnt[4] ,
     \u_spi_tx/out_cnt[3] , \u_spi_tx/out_cnt[2] , \u_spi_tx/out_cnt[1] ,
     \u_spi_tx/out_cnt[0] , \u_spi_tx/n100 , \u_spi_tx/n101 , \u_spi_tx/n102 ,
     \u_spi_tx/n103 , \u_spi_tx/n104 , \u_spi_tx/n105 , \u_spi_tx/n106 ,
     \u_spi_tx/n108 , \u_sync_fifo/wr_ptr[2] , \u_sync_fifo/wr_ptr[1] ,
     \u_sync_fifo/wr_ptr[0] , \u_sync_fifo/rd_ptr[2] , \u_sync_fifo/rd_ptr[1] ,
     \u_sync_fifo/rd_ptr[0] , \u_sync_fifo/n43 , \u_sync_fifo/n44 ,
     \u_sync_fifo/n45 , \u_sync_fifo/n52 , \u_sync_fifo/n53 , \u_sync_fifo/n54 ,
     \u_sync_fifo/mem[3][0] , \u_sync_fifo/mem[3][1] , \u_sync_fifo/mem[3][2] ,
     \u_sync_fifo/mem[3][3] , \u_sync_fifo/mem[3][4] , \u_sync_fifo/mem[3][5] ,
     \u_sync_fifo/mem[3][6] , \u_sync_fifo/mem[3][7] , \u_sync_fifo/mem[3][8] ,
     \u_sync_fifo/mem[3][9] , \u_sync_fifo/mem[3][10] ,
     \u_sync_fifo/mem[3][11] , \u_sync_fifo/mem[3][12] ,
     \u_sync_fifo/mem[3][13] , \u_sync_fifo/mem[3][14] ,
     \u_sync_fifo/mem[3][15] , \u_sync_fifo/mem[3][16] ,
     \u_sync_fifo/mem[3][17] , \u_sync_fifo/mem[3][18] ,
     \u_sync_fifo/mem[3][19] , \u_sync_fifo/mem[3][20] ,
     \u_sync_fifo/mem[3][21] , \u_sync_fifo/mem[3][22] ,
     \u_sync_fifo/mem[3][23] , \u_sync_fifo/mem[3][24] ,
     \u_sync_fifo/mem[2][0] , \u_sync_fifo/mem[2][1] , \u_sync_fifo/mem[2][2] ,
     \u_sync_fifo/mem[2][3] , \u_sync_fifo/mem[2][4] , \u_sync_fifo/mem[2][5] ,
     \u_sync_fifo/mem[2][6] , \u_sync_fifo/mem[2][7] , \u_sync_fifo/mem[2][8] ,
     \u_sync_fifo/mem[2][9] , \u_sync_fifo/mem[2][10] ,
     \u_sync_fifo/mem[2][11] , \u_sync_fifo/mem[2][12] ,
     \u_sync_fifo/mem[2][13] , \u_sync_fifo/mem[2][14] ,
     \u_sync_fifo/mem[2][15] , \u_sync_fifo/mem[2][16] ,
     \u_sync_fifo/mem[2][17] , \u_sync_fifo/mem[2][18] ,
     \u_sync_fifo/mem[2][19] , \u_sync_fifo/mem[2][20] ,
     \u_sync_fifo/mem[2][21] , \u_sync_fifo/mem[2][22] ,
     \u_sync_fifo/mem[2][23] , \u_sync_fifo/mem[2][24] ,
     \u_sync_fifo/mem[1][0] , \u_sync_fifo/mem[1][1] , \u_sync_fifo/mem[1][2] ,
     \u_sync_fifo/mem[1][3] , \u_sync_fifo/mem[1][4] , \u_sync_fifo/mem[1][5] ,
     \u_sync_fifo/mem[1][6] , \u_sync_fifo/mem[1][7] , \u_sync_fifo/mem[1][8] ,
     \u_sync_fifo/mem[1][9] , \u_sync_fifo/mem[1][10] ,
     \u_sync_fifo/mem[1][11] , \u_sync_fifo/mem[1][12] ,
     \u_sync_fifo/mem[1][13] , \u_sync_fifo/mem[1][14] ,
     \u_sync_fifo/mem[1][15] , \u_sync_fifo/mem[1][16] ,
     \u_sync_fifo/mem[1][17] , \u_sync_fifo/mem[1][18] ,
     \u_sync_fifo/mem[1][19] , \u_sync_fifo/mem[1][20] ,
     \u_sync_fifo/mem[1][21] , \u_sync_fifo/mem[1][22] ,
     \u_sync_fifo/mem[1][23] , \u_sync_fifo/mem[1][24] ,
     \u_sync_fifo/mem[0][0] , \u_sync_fifo/mem[0][1] , \u_sync_fifo/mem[0][2] ,
     \u_sync_fifo/mem[0][3] , \u_sync_fifo/mem[0][4] , \u_sync_fifo/mem[0][5] ,
     \u_sync_fifo/mem[0][6] , \u_sync_fifo/mem[0][7] , \u_sync_fifo/mem[0][8] ,
     \u_sync_fifo/mem[0][9] , \u_sync_fifo/mem[0][10] ,
     \u_sync_fifo/mem[0][11] , \u_sync_fifo/mem[0][12] ,
     \u_sync_fifo/mem[0][13] , \u_sync_fifo/mem[0][14] ,
     \u_sync_fifo/mem[0][15] , \u_sync_fifo/mem[0][16] ,
     \u_sync_fifo/mem[0][17] , \u_sync_fifo/mem[0][18] ,
     \u_sync_fifo/mem[0][19] , \u_sync_fifo/mem[0][20] ,
     \u_sync_fifo/mem[0][21] , \u_sync_fifo/mem[0][22] ,
     \u_sync_fifo/mem[0][23] , \u_sync_fifo/mem[0][24] ,
     \u_compute_engine/cnt[2] , \u_compute_engine/cnt[1] ,
     \u_compute_engine/cnt[0] , \u_compute_engine/calc_en ,
     \u_compute_engine/temp_product[31] , \u_compute_engine/temp_product[30] ,
     \u_compute_engine/temp_product[29] , \u_compute_engine/temp_product[28] ,
     \u_compute_engine/temp_product[27] , \u_compute_engine/temp_product[26] ,
     \u_compute_engine/temp_product[25] , \u_compute_engine/temp_product[24] ,
     \u_compute_engine/temp_product[23] , \u_compute_engine/temp_product[22] ,
     \u_compute_engine/temp_product[21] , \u_compute_engine/temp_product[20] ,
     \u_compute_engine/temp_product[19] , \u_compute_engine/temp_product[18] ,
     \u_compute_engine/temp_product[17] , \u_compute_engine/temp_product[16] ,
     \u_compute_engine/temp_product[15] , \u_compute_engine/temp_product[14] ,
     \u_compute_engine/temp_product[13] , \u_compute_engine/temp_product[12] ,
     \u_compute_engine/temp_product[11] , \u_compute_engine/temp_product[10] ,
     \u_compute_engine/temp_product[9] , \u_compute_engine/temp_product[8] ,
     \u_compute_engine/temp_product[7] , \u_compute_engine/temp_product[6] ,
     \u_compute_engine/temp_product[5] , \u_compute_engine/temp_product[4] ,
     \u_compute_engine/temp_product[3] , \u_compute_engine/temp_product[2] ,
     \u_compute_engine/temp_product[1] , \u_compute_engine/temp_product[0] ,
     \u_compute_engine/global_acc[23] , \u_compute_engine/global_acc[22] ,
     \u_compute_engine/global_acc[21] , \u_compute_engine/global_acc[20] ,
     \u_compute_engine/global_acc[19] , \u_compute_engine/global_acc[18] ,
     \u_compute_engine/global_acc[17] , \u_compute_engine/global_acc[16] ,
     \u_compute_engine/global_acc[15] , \u_compute_engine/global_acc[14] ,
     \u_compute_engine/global_acc[13] , \u_compute_engine/global_acc[12] ,
     \u_compute_engine/global_acc[11] , \u_compute_engine/global_acc[10] ,
     \u_compute_engine/global_acc[9] , \u_compute_engine/global_acc[8] ,
     \u_compute_engine/global_acc[7] , \u_compute_engine/global_acc[6] ,
     \u_compute_engine/global_acc[5] , \u_compute_engine/global_acc[4] ,
     \u_compute_engine/global_acc[3] , \u_compute_engine/global_acc[2] ,
     \u_compute_engine/global_acc[1] , \u_compute_engine/global_acc[0] ,
     \u_compute_engine/n21 , \u_compute_engine/n22 , \u_compute_engine/n23 ,
     \u_compute_engine/n24 , \u_compute_engine/n195 , \u_compute_engine/n196 ,
     \u_compute_engine/n197 , \u_compute_engine/n198 , \u_compute_engine/n199 ,
     \u_compute_engine/n200 , \u_compute_engine/n201 , \u_compute_engine/n202 ,
     \u_compute_engine/n203 , \u_compute_engine/n204 , \u_compute_engine/n205 ,
     \u_compute_engine/n206 , \u_compute_engine/n207 , \u_compute_engine/n208 ,
     \u_compute_engine/n209 , \u_compute_engine/n210 , \u_compute_engine/n211 ,
     \u_compute_engine/n212 , \u_compute_engine/n213 , \u_compute_engine/n214 ,
     \u_compute_engine/n215 , \u_compute_engine/n216 , \u_compute_engine/n217 ,
     \u_compute_engine/n218 , \u_compute_engine/n220 , \u_compute_engine/n222 ,
     \u_compute_engine/n224 , \u_compute_engine/n226 , \u_compute_engine/n228 ,
     \u_compute_engine/n230 , \u_compute_engine/n232 , \u_compute_engine/n234 ,
     \u_compute_engine/n328 , \u_compute_engine/n331 , \u_compute_engine/n332 ,
     \u_compute_engine/n333 , \u_compute_engine/n334 , \u_compute_engine/n335 ,
     \u_compute_engine/n336 , \u_compute_engine/n337 , \u_compute_engine/n338 ,
     \u_compute_engine/n339 , \u_compute_engine/n340 , \u_compute_engine/n341 ,
     \u_compute_engine/n342 , \u_compute_engine/n343 , \u_compute_engine/n344 ,
     \u_compute_engine/n345 , \u_compute_engine/n346 , \u_compute_engine/n347 ,
     \u_compute_engine/n348 , \u_compute_engine/n349 , \u_compute_engine/n350 ,
     \u_compute_engine/n351 , \u_compute_engine/n352 , \u_compute_engine/n353 ,
     \u_compute_engine/n354 , \u_compute_engine/n379 , \u_spi_rx/shift_A[14] ,
     \u_spi_rx/shift_A[13] , \u_spi_rx/shift_A[12] , \u_spi_rx/shift_A[11] ,
     \u_spi_rx/shift_A[10] , \u_spi_rx/shift_A[9] , \u_spi_rx/shift_A[8] ,
     \u_spi_rx/shift_A[7] , \u_spi_rx/shift_A[6] , \u_spi_rx/shift_A[5] ,
     \u_spi_rx/shift_A[4] , \u_spi_rx/shift_A[3] , \u_spi_rx/shift_A[2] ,
     \u_spi_rx/shift_A[1] , \u_spi_rx/shift_A[0] , \u_spi_rx/shift_B[14] ,
     \u_spi_rx/shift_B[13] , \u_spi_rx/shift_B[12] , \u_spi_rx/shift_B[11] ,
     \u_spi_rx/shift_B[10] , \u_spi_rx/shift_B[9] , \u_spi_rx/shift_B[8] ,
     \u_spi_rx/shift_B[7] , \u_spi_rx/shift_B[6] , \u_spi_rx/shift_B[5] ,
     \u_spi_rx/shift_B[4] , \u_spi_rx/shift_B[3] , \u_spi_rx/shift_B[2] ,
     \u_spi_rx/shift_B[1] , \u_spi_rx/shift_B[0] , \u_spi_rx/bit_cnt[3] ,
     \u_spi_rx/bit_cnt[2] , \u_spi_rx/bit_cnt[1] , \u_spi_rx/bit_cnt[0] ,
     \u_spi_rx/n46 , \u_spi_rx/n47 , \u_spi_rx/n48 , \u_spi_rx/n49 ,
     \u_spi_rx/n50 , \u_spi_rx/n51 , \u_spi_rx/n52 , \u_spi_rx/n53 ,
     \u_spi_rx/n54 , \u_spi_rx/n55 , \u_spi_rx/n56 , \u_spi_rx/n57 ,
     \u_spi_rx/n58 , \u_spi_rx/n59 , \u_spi_rx/n60 , \u_spi_rx/n62 ,
     \u_spi_rx/n63 , \u_spi_rx/n64 , \u_spi_rx/n65 , \u_spi_rx/n66 ,
     \u_spi_rx/n67 , \u_spi_rx/n68 , \u_spi_rx/n69 , \u_spi_rx/n70 ,
     \u_spi_rx/n71 , \u_spi_rx/n72 , \u_spi_rx/n73 , \u_spi_rx/n74 ,
     \u_spi_rx/n75 , \u_spi_rx/n76 , \u_spi_rx/n77 , \u_spi_rx/n78 ,
     \u_spi_rx/n79 , \u_spi_rx/n80 , \u_spi_rx/n81 , \u_spi_rx/n82 ,
     \u_spi_rx/n83 , \u_spi_rx/n84 , \u_spi_rx/n85 , \u_spi_rx/n86 ,
     \u_spi_rx/n87 , \u_spi_rx/n88 , \u_spi_rx/n89 , \u_spi_rx/n90 ,
     \u_spi_rx/n91 , \u_spi_rx/n92 , \u_spi_rx/n93 , \u_spi_rx/n94 ,
     \u_spi_rx/n95 , \u_spi_rx/n96 , \u_spi_rx/n97 , \u_spi_rx/n98 ,
     \u_spi_rx/n99 , \u_spi_rx/n100 , \u_spi_rx/n101 , \u_spi_rx/n102 ,
     \u_spi_rx/n103 , \u_spi_rx/n104 , \u_spi_rx/n105 , \u_spi_rx/n106 ,
     \u_spi_rx/n107 , \u_spi_rx/n108 , \u_spi_rx/n109 , \u_spi_rx/n110 ,
     \u_spi_rx/n111 , \u_spi_rx/n112 , n363, n364, n365, n371, n372, n374, n376,
     n377, n380, n381, n382, n383, n384, n385, n386, n387, n388, n389, n390,
     n391, n392, n393, n394, n395, n396, n397, n398, n399, n400, n401, n403,
     n408, n409, n411, n519, n527, n528, n530, n533, n536, n537, n538, n539,
     n540, n542, n544, n546, n548, n550, n560, n576, n647, n649, n650, n651,
     n652, n653, n654, n656, n657, n658, n659, n661, n662, n663, n665, n666,
     n667, n668, n670, n671, n672, n673, n675, n677, n680, n681, n682, n683,
     n684, n685, n687, n688, n689, n690, n691, n692, n693, n694, n695, n696,
     n697, n698, n699, n700, n701, n702, n704, n705, n706, n707, n708, n709,
     n711, n712, n713, n714, n715, n716, n717, n718, n719, n720, n721, n722,
     n723, n724, n725, n726, n727, n728, n729, n730, n731, n732, n733, n734,
     n735, n736, n737, n738, n739, n740, n741, n742, n743, n744, n745, n746,
     n747, n748, n749, n750, n751, n752, n753, n754, n755, n756, n757, n758,
     n759, n760, n762, n764, n765, n766, n767, n768, n769, n770, n771, n772,
     n773, n774, n776, n777, n778, n779, n780, n781, n782, n783, n784, n785,
     n786, n787, n788, n789, n790, n791, n792, n793, n794, n795, n796, n799,
     n800, n801, n802, n803, n804, n805, n806, n807, n808, n809, n810, n811,
     n812, n813, n814, n815, n816, n817, n818, n819, n820, n821, n822, n823,
     n824, n825, n826, n827, n828, n829, n830, n831, n832, n833, n834, n835,
     n836, n837, n838, n839, n840, n841, n842, n843, n844, n845, n846, n847,
     n848, n849, n850, n851, n852, n853, n854, n855, n856, n857, n858, n859,
     n860, n861, n862, n863, n864, n865, n866, n867, n868, n869, n871, n872,
     n874, n876, n878, n883, n885, n886, n887, n888, n890, n892, n893, n894,
     n903, n904, n907, n909, n910, n911, n912, n913, n914, n915, n916, n917,
     n918, n920, n921, n922, n923, n924, n925, n926, n927, n928, n929, n930,
     n931, n933, n934, n935, n936, n937, n938, n939, n940, n941, n942, n943,
     n944, n945, n948, n949, n950, n951, n952, n953, n955, n956, n957, n958,
     n959, n960, n961, n962, n963, n964, n965, n966, n967, n968, n969, n970,
     n972, n973, n974, n975, n976, n977, n978, n979, n980, n981, n982, n983,
     n984, n985, n986, n987, n988, n989, n990, n991, n992, n993, n994, n995,
     n996, n997, n998, n999, n1000, n1001, n1002, n1003, n1004, n1005, n1006,
     n1007, n1008, n1009, n1010, n1011, n1012, n1013, n1014, n1015, n1016,
     n1017, n1018, n1019, n1020, n1021, n1022, n1025, n1026, n1027, n1028,
     n1029, n1030, n1031, n1034, n1035, n1036, n1039, n1040, n1041, n1042,
     n1043, n1044, n1045, n1046, n1047, n1048, n1049, n1050, n1051, n1052,
     n1053, n1054, n1055, n1056, n1057, n1058, n1059, n1060, n1061, n1062,
     n1063, n1064, n1065, n1066, n1067, n1068, n1069, n1070, n1071, n1072,
     n1073, n1074, n1075, n1076, n1077, n1078, n1079, n1080, n1081, n1082,
     n1083, n1084, n1085, n1086, n1087, n1088, n1089, n1090, n1091, n1092,
     n1093, n1094, n1095, n1096, n1097, n1098, n1099, n1100, n1101, n1102,
     n1103, n1104, n1105, n1106, n1107, n1108, n1109, n1110, n1111, n1112,
     n1113, n1114, n1115, n1116, n1117, n1118, n1119, n1120, n1121, n1122,
     n1123, n1124, n1125, n1126, n1127, n1128, n1129, n1130, n1131, n1132,
     n1133, n1135, n1139, n1146, n1149, n1152, n1153, n1154, n1155, n1156,
     n1157, n1158, n1159, n1162, n1163, n1164, n1165, n1166, n1168, n1171,
     n1173, n1176, n1179, n1181, n1182, n1184, n1189, n1190, n1191, n1194,
     n1195, n1196, n1197, n1198, n1199, n1200, n1201, n1202, n1203, n1204,
     n1205, n1206, n1207, n1209, n1210, n1211, n1212, n1213, n1214, n1215,
     n1216, n1217, n1219, n1220, n1221, n1222, n1223, n1224, n1225, n1227,
     n1228, n1229, n1230, n1231, n1232, n1233, n1234, n1237, n1239, n1240,
     n1241, n1243, n1244, n1245, n1246, n1248, n1249, n1250, n1251, n1253,
     n1254, n1255, n1256, n1257, n1258, n1259, n1260, n1261, n1262, n1263,
     n1264, n1265, n1267, n1268, n1269, n1270, n1271, n1272, n1273, n1274,
     n1275, n1276, n1277, n1278, n1279, n1280, n1281, n1282, n1283, n1284,
     n1285, n1286, n1287, n1288, n1289, n1290, n1291, n1292, n1293, n1294,
     n1295, n1296, n1297, n1298, n1299, n1300, n1301, n1302, n1303, n1304,
     n1305, n1307, n1308, n1309, n1310, n1311, n1312, n1313, n1314, n1315,
     n1317, n1318, n1319, n1320, n1321, n1323, n1324, n1325, n1326, n1329,
     n1330, n1331, n1332, n1333, n1334, n1335, n1336, n1337, n1340, n1341,
     n1342, n1343, n1344, n1345, n1346, n1347, n1348, n1349, n1350, n1351,
     n1355, n1356, n1357, n1358, n1363, n1364, n1365, n1366, n1368, n1369,
     n1370, n1373, n1375, n1376, n1379, n1382, n1383, n1390, n1395, n1400,
     n1401, n1407, n1410, n1411, n1421, n1422, n1426, n1437, n1438, n1447,
     n1448, n1449, n1451, n1453, n1455, n1457, n1459, n1460, n1461, n1462,
     n1467, n1488, n1491, n1492, n1496, n1500, n1502, n1504, n1508, n1509,
     n1510, n1511, n1514, n1515, n1517, n1518, n1520, n1521, n1523, n1525,
     n1526, n1529, n1535, n1536, n1540, n1546, n1547, n2055, n2056, n2124,
     n2126, n2127, n2128, n2130, n2186, n659_n1, n749_n0, n749_n1, n960_n0,
     n1006_n1, n909_n0, n909_n1, n2301, n2307, n2309, n2322, n2331, n2332,
     n2336, n651_n0, n651_n1, n650_n0, n650_n1, n666_n0, n650_n2, n2381,
     n2309_n1, n929_n0, n929_n1, n1002_n0, n1002_n1, n1006_n2, n659_n2,
     n2186_n0, n651_n8, n814_n0, n814_n1, n2466, n667_n1, n2477, n2307_n0,
     n2307_n1, n982_n0, n982_n1, n2499, n933_n0, n933_n1, n738_n0, n738_n1,
     n2524, n739_n0, n739_n1, n824_n0, n824_n1, n667_n2, n2556, n2640, n2642,
     n2649, n2670, n519_n0, n2762, n3300, n3301, n3302, n3303, n3304, n3336,
     n3337, n3410, n3432, n2389_n1, n932, n882, n881, n877, n879, n880, n5680,
     n5684, n5690, n5700, n5711, n5714, n5715, n5717, n5723, n5728, n5735,
     n5748, n5754, n5767, n5768, n5785, n5803, n5805, n5811, n5814, n5815,
     n6021, n1005_n0, n1005_n1, n700_n1, n2752, n901, n900, n902, n889, n897,
     n898, n899, n895, n896, n891, n761, n2738, n9585, n9586, n9588, n9726,
     n9727, n763, n2529, n2461, n3101, n3103, n3102, n911_n1, n911_n0, n12645,
     n12647, n906, n908, n905, n884, n875, n3043, n3042, n16956, n16957, n16958,
     n16959, n16962, n1024, n1023, n946, n954, n947, n2123, n775, n2469, n5790,
     n2491, n2726, n2402, n12042, n2434, n2949, n2951, n2950, n2948, n19508,
     n19513, n19520, n19525, n19527, n19547, n19548, n19551, n19562, n19563,
     n19569, n19579, n19589, n19590, n19591, n19621, n19622, n19642, n19643,
     n19644, n695_n0, n695_n1, n697_n0, n697_n1, n5720, n658_n1, n5729, n675_n0,
     n675_n1, n799_n0, n799_n1, n781_n0, n781_n1, n652_n0, n652_n1, n680_n0,
     n680_n1, n754_n0, n754_n1, n5731, n657_n2, n657_n3, n19682, n19683, n19687,
     n19694, n19705, n19707, n19723, n19744, n19745, n1550, n1549, n1544, n1543,
     n1167, n1174, n1169, n1172, n1463, n1137, n1136, n1160, n1415, n19806,
     n1145, n1144, n1143, n1148, n1454, n1417, n678, n669, n679, n676, n674,
     n19798, n19807, n19895, n1476, n1475, n1474, n1473, n19937, n1038, n1037,
     n2399, n2398, n1490, n1489, n19947, n2134, n19948, n2135, n1161, n1150,
     n19970, n1495, n19957, n1151, n1469, n1468, n1465, n1138, n1134, n1471,
     n1498, n1497, n1466, n1464, n1142, n1141, n1140, n1483, n1477, n1472,
     n1499, n1487, n1394, n20101, n20103, n1545, n20110, n1501, n1435, n1377,
     n1361, n20126, n1541, n1503, n1537, n1372, n1371, n20140, n1362, n2125,
     n1427, n1378, n1428, n1424, n1423, n1539, n1538, n1505, n1506, n1419,
     n1507, n710, n1354, n1420, n1418, n1416, n1414, n1409, n1408, n1405, n1404,
     n1403, n1402, n1406, n1399, n1516, n1513, n1512, n1339, n1338, n1391,
     n1389, n1388, n1387, n1384, n1327, n1381, n1380, n1534, n1522, n1519,
     n1328, n1524, n20243, n1528, n1527, n1485, n1033, n1532, n1530, n1484,
     n1531, n1032, n1440, n1441, n1445, n1429, n20144, n20142, n20141, n20128,
     n20127, n20170, n20171, n20200, n1396, n20199, n20506, n20594, n20597,
     n1433, n20143, n20797, n20798, n666_n1, n968_n0, n968_n1, n21036, n724_n0,
     n724_n1, n766_n0, n766_n1, n21068, n791_n0, n791_n1, n683_n0, n683_n1,
     n1250_n0, n1250_n1, n1248_n0, n1248_n1, n1258_n0, n1258_n1, n1246_n0,
     n1246_n1, n1251_n0, n1251_n1, n814_n1_n0, n814_n1_n1, n1249_n0, n1249_n1,
     sys_rst_n_n0, sys_rst_n_n1, n1243_n0, n1243_n1, mode_d2_n0, mode_d2_n1,
     n1267_n0, n1267_n1, n1504_n0, n1504_n1;
    DFFRX1H9R \u_compute_engine/u_mul8x8/prod_reg[15]  (.Q(\u_compute_engine/mul_result[15] ),
        .QN(n363), .CK(clk), .D(\u_compute_engine/u_mul8x8/ks_result[15] ),
        .RDN(sys_rst_n));
    DFFRX1H9R \u_compute_engine/u_mul8x8/prod_reg[14]  (.Q(\u_compute_engine/mul_result[14] ),
        .QN(n364), .CK(clk), .D(\u_compute_engine/u_mul8x8/ks_result[14] ),
        .RDN(sys_rst_n));
    DFFRX1H9R \u_compute_engine/u_mul8x8/prod_reg[13]  (.Q(\u_compute_engine/mul_result[13] ),
        .QN(n365), .CK(clk), .D(\u_compute_engine/u_mul8x8/ks_result[13] ),
        .RDN(sys_rst_n));
    DFFRX1H9R \u_compute_engine/u_mul8x8/prod_reg[7]  (.Q(\u_compute_engine/mul_result[7] ),
        .QN(n371), .CK(clk), .D(\u_compute_engine/u_mul8x8/ks_result[7] ),
        .RDN(sys_rst_n));
    DFFRX2H9R \u_compute_engine/u_mul8x8/prod_reg[6]  (.Q(\u_compute_engine/mul_result[6] ),
        .QN(n372), .CK(clk), .D(\u_compute_engine/u_mul8x8/ks_result[6] ),
        .RDN(sys_rst_n));
    DFFRX2H9R \u_compute_engine/u_mul8x8/prod_reg[4]  (.Q(\u_compute_engine/mul_result[4] ),
        .QN(n374), .CK(clk), .D(\u_compute_engine/u_mul8x8/ks_result[4] ),
        .RDN(sys_rst_n));
    DFFRX2H9R \u_compute_engine/u_mul8x8/prod_reg[2]  (.Q(\u_compute_engine/mul_result[2] ),
        .QN(n376), .CK(clk), .D(\u_compute_engine/u_mul8x8/ks_result[2] ),
        .RDN(sys_rst_n));
    DFFRX2H9R \u_compute_engine/u_mul8x8/prod_reg[1]  (.Q(\u_compute_engine/mul_result[1] ),
        .QN(n377), .CK(clk), .D(\u_compute_engine/u_mul8x8/ks_result[1] ),
        .RDN(sys_rst_n));
    DFFRX1H9R \u_spi_tx/out_cnt_reg[4]  (.Q(\u_spi_tx/out_cnt[4] ), .QN(n403),
        .CK(clk), .D(\u_spi_tx/n102 ), .RDN(sys_rst_n));
    DFFRX4H9R \u_compute_engine/cnt_reg[0]  (.Q(\u_compute_engine/cnt[0] ),
        .QN(n519), .CK(clk), .D(\u_compute_engine/n24 ), .RDN(sys_rst_n));
    DFFRX1H9R \u_compute_engine/temp_product_reg[25]  (.Q(\u_compute_engine/temp_product[25] ),
        .QN(n527), .CK(clk), .D(\u_compute_engine/n201 ), .RDN(sys_rst_n));
    DFFRX1H9R \u_compute_engine/temp_product_reg[24]  (.Q(\u_compute_engine/temp_product[24] ),
        .QN(n528), .CK(clk), .D(\u_compute_engine/n202 ), .RDN(sys_rst_n));
    DFFRX1H9R \u_compute_engine/temp_product_reg[22]  (.Q(\u_compute_engine/temp_product[22] ),
        .QN(n530), .CK(clk), .D(\u_compute_engine/n204 ), .RDN(sys_rst_n));
    DFFRX1H9R \u_compute_engine/temp_product_reg[19]  (.Q(\u_compute_engine/temp_product[19] ),
        .QN(n533), .CK(clk), .D(\u_compute_engine/n207 ), .RDN(sys_rst_n));
    DFFRX1H9R \u_compute_engine/temp_product_reg[16]  (.Q(\u_compute_engine/temp_product[16] ),
        .QN(n536), .CK(clk), .D(\u_compute_engine/n210 ), .RDN(sys_rst_n));
    DFFRX1H9R \u_compute_engine/temp_product_reg[15]  (.Q(\u_compute_engine/temp_product[15] ),
        .QN(n537), .CK(clk), .D(\u_compute_engine/n211 ), .RDN(sys_rst_n));
    DFFRX1H9R \u_compute_engine/temp_product_reg[14]  (.Q(\u_compute_engine/temp_product[14] ),
        .QN(n538), .CK(clk), .D(\u_compute_engine/n212 ), .RDN(sys_rst_n));
    DFFRX2H9R \u_compute_engine/temp_product_reg[13]  (.Q(\u_compute_engine/temp_product[13] ),
        .QN(n539), .CK(clk), .D(\u_compute_engine/n213 ), .RDN(sys_rst_n));
    DFFRX2H9R \u_compute_engine/temp_product_reg[12]  (.Q(\u_compute_engine/temp_product[12] ),
        .QN(n540), .CK(clk), .D(\u_compute_engine/n214 ), .RDN(sys_rst_n));
    DFFRX2H9R \u_compute_engine/temp_product_reg[10]  (.Q(\u_compute_engine/temp_product[10] ),
        .QN(n542), .CK(clk), .D(\u_compute_engine/n216 ), .RDN(sys_rst_n));
    DFFRX2H9R \u_compute_engine/temp_product_reg[8]  (.Q(\u_compute_engine/temp_product[8] ),
        .QN(n544), .CK(clk), .D(\u_compute_engine/n218 ), .RDN(sys_rst_n));
    DFFRX2H9R \u_compute_engine/temp_product_reg[6]  (.Q(\u_compute_engine/temp_product[6] ),
        .QN(n546), .CK(clk), .D(\u_compute_engine/n222 ), .RDN(sys_rst_n));
    DFFRX2H9R \u_compute_engine/temp_product_reg[4]  (.Q(\u_compute_engine/temp_product[4] ),
        .QN(n548), .CK(clk), .D(\u_compute_engine/n226 ), .RDN(sys_rst_n));
    DFFRX2H9R \u_compute_engine/temp_product_reg[2]  (.Q(\u_compute_engine/temp_product[2] ),
        .QN(n550), .CK(clk), .D(\u_compute_engine/n230 ), .RDN(sys_rst_n));
    DFFRX1H9R \u_compute_engine/global_acc_reg[17]  (.Q(\u_compute_engine/global_acc[17] ),
        .QN(n560), .CK(clk), .D(\u_compute_engine/n337 ), .RDN(sys_rst_n_n1));
    DFFRX2H9R \u_compute_engine/global_acc_reg[1]  (.Q(\u_compute_engine/global_acc[1] ),
        .QN(n576), .CK(clk), .D(\u_compute_engine/n353 ), .RDN(sys_rst_n_n1));
    OAI2XB1X0P5H9R u908 (.Y(n649), .A0(mode_d1), .A1N(mode_d2), .B0(rst_n));
    AOI2XB1X8H9R u909 (.Y(sys_rst_n), .A0(mode_d1), .A1N(mode_d2_n1), .B0(n649));
    NAND2X4H9R u913 (.Y(n653), .A(\rx_data_B[8] ), .B(n2186));
    NAND2BX6H9R u914 (.Y(n654), .AN(n2389_n1), .B(\rx_data_B[0] ));
    OA22X3H9R u916 (.Y(n656), .A0(n19621), .A1(n653), .B0(n654), .B1(n2309));
    NOR2X1H9R u917 (.Y(\u_compute_engine/u_mul8x8/pp[0][0] ), .A(n656), .B(n652));
    NAND3BX3H9R u922 (.Y(n661), .AN(n5680), .B(\rx_data_B[9] ), .C(n2186));
    XOR2X3H9R u926 (.Y(n665), .A(\u_compute_engine/cnt[1] ), .B(\u_compute_engine/cnt[2] ));
    NOR2BX3H9R u927 (.Y(n666), .AN(n519_n0), .B(n5680));
    NOR2X1P4H9R u929 (.Y(n668), .A(n19513), .B(n19527));
    NAND2X4H9R u932 (.Y(n670), .A(n659_n1), .B(n5715));
    AOI32X2H9R u933 (.Y(n671), .A0(n5690), .A1(n19622), .A2(\rx_data_B[2] ),
        .B0(n666_n1), .B1(\rx_data_B[10] ));
    NAND2X0P7H9R u935 (.Y(n673), .A(n19687), .B(n658_n1));
    NOR2X0P5H9R u939 (.Y(n677), .A(n2322), .B(n658_n1));
    NOR2X0P5H9R u943 (.Y(n680), .A(n2309_n1), .B(n19643));
    AO22X2H9R u944 (.Y(n681), .A0(\rx_data_B[11] ), .A1(n19644), .B0(n680),
        .B1(\rx_data_B[3] ));
    NAND2X1P4H9R u945 (.Y(n682), .A(n681), .B(n19694));
    AOI22X3H9R u946 (.Y(n683), .A0(n2307), .A1(\rx_data_A[1] ), .B0(n19508),
        .B1(\rx_data_A[9] ));
    NOR2X1H9R u947 (.Y(n684), .A(n683), .B(n5717));
    AOAI211X4H9R u948 (.ZN(n685), .A1(n657_n3), .A2(n5711), .B(n659_n1),
        .C(n658_n1));
    NAND3BX1H9R u950 (.Y(n687), .AN(n19621), .B(n19643), .C(\rx_data_B[10] ));
    OAI31X3H9R u951 (.Y(n688), .A0(n19642), .A1(n19643), .A2(n2055), .B0(n687));
    NAND2X0P7H9R u952 (.Y(n689), .A(n688), .B(n659_n1));
    OAI33X2H9R u953 (.ZN(n690), .A1(n685), .A2(n684), .A3(n2322), .B1(n668),
        .B2(\u_compute_engine/u_mul8x8/pp[0][0] ), .B3(n689));
    NOR2X4H9R u954 (.Y(n691), .A(n675), .B(n667));
    OR2X1H9R u955 (.Y(n692), .A(n5723), .B(n658_n1));
    NAND2X2H9R u956 (.Y(n693), .A(n654), .B(n653));
    NAND3X3H9R u957 (.Y(n694), .A(n19520), .B(n5711), .C(n693));
    OAO211X4H9R u959 (.Z(n696), .A1(n5723), .A2(n663), .B(n5754), .C(n695));
    AOI22X3H9R u960 (.Y(n697), .A0(\rx_data_A[3] ), .A1(n650), .B0(n651_n8),
        .B1(\rx_data_A[11] ));
    NOR2X6H9R u961 (.Y(n698), .A(n697), .B(n656));
    OAI211X2H9R u962 (.Y(n699), .A0(n5735), .A1(n5723), .B0(n698), .C0(n5754));
    AND4X2H9R u963 (.Y(n700), .A(n696), .B(n690), .C(n699), .D(n692));
    NOR3X2H9R u965 (.Y(n702), .A(n701), .B(n700), .C(n682));
    AO31X2H9R u967 (.Z(n704), .A1(n692), .A2(n696), .A3(n699), .B(n690));
    AOI22X4H9R u968 (.Y(n705), .A0(\rx_data_B[11] ), .A1(n19644), .B0(n680_n1),
        .B1(\rx_data_B[3] ));
    NOR2X1H9R u969 (.Y(n706), .A(n705), .B(n652_n1));
    AOI21X0P5H9R u970 (.Y(n707), .A0(n704), .A1(n700_n1), .B0(n706));
    NOR2X0P5H9R u971 (.Y(\u_compute_engine/u_mul8x8/n118 ), .A(n707), .B(n702));
    NAND2X0P7H9R u972 (.Y(n708), .A(n5748), .B(n681));
    AO22X2H9R u973 (.Y(n709), .A0(\rx_data_B[12] ), .A1(n19644), .B0(n680_n1),
        .B1(\rx_data_B[4] ));
    NAND3X2H9R u975 (.Y(n711), .A(n700_n1), .B(n704), .C(n706));
    OAOI211X4H9R u976 (.ZN(n712), .A1(n663), .A2(n691), .B(n694), .C(n695));
    OA211X1P4H9R u977 (.Y(n713), .A0(n663), .A1(n691), .B0(n698), .C0(n694));
    NOR2X1H9R u978 (.Y(n714), .A(n671), .B(n675));
    OAOI211X4H9R u979 (.ZN(n715), .A1(n652), .A2(n5717), .B(n683), .C(n656));
    AOI32X1P4H9R u980 (.Y(n716), .A0(n659_n1), .A1(n5715), .A2(n714), .B0(n688),
        .B1(n715));
    AOI211X0P7H9R u981 (.Y(n717), .A0(n656), .A1(n19527), .B0(n652), .C0(n683));
    AOI21X1H9R u982 (.Y(n718), .A0(n717), .A1(n677), .B0(n714));
    OAI31X4H9R u983 (.Y(n719), .A0(n712), .A1(n716), .A2(n713), .B0(n718));
    OAI2XB1X1H9R u984 (.Y(n720), .A0(n715), .A1N(n670), .B0(n714));
    NAND2X0P5H9R u985 (.Y(n721), .A(n714), .B(n717));
    OA31X4H9R u986 (.Z(n722), .A1(n713), .A2(n720), .A3(n712), .B(n721));
    NAND2X0P5H9R u987 (.Y(n723), .A(n722), .B(n2331));
    OAI22X1P4H9R u989 (.Y(n725), .A0(n663), .A1(n691), .B0(n698), .B1(n724));
    NAND2X0P7H9R u990 (.Y(n726), .A(n5715), .B(n695));
    NOR2X1P4H9R u991 (.Y(n727), .A(n697), .B(n667));
    OA221X4H9R u992 (.Z(n728), .A1(n663), .A2(n691), .B1(n724), .B2(n698),
        .C(n727));
    AO22X2H9R u993 (.Y(n729), .A0(n650_n1), .A1(\rx_data_A[4] ), .B0(n5700),
        .B1(\rx_data_A[12] ));
    NAND2X2H9R u994 (.Y(n730), .A(n729), .B(n658_n1));
    AOAI211X2H9R u995 (.ZN(n731), .A1(n725), .A2(n726), .B(n728), .C(n730));
    OA21X0P5H9R u996 (.Y(n732), .A0(n691), .A1(n663), .B0(n727));
    AO211X4H9R u997 (.Z(n733), .A1(n726), .A2(n725), .B(n730), .C(n732));
    NAND2X0P7H9R u998 (.Y(n734), .A(n2466), .B(n733));
    XNOR3X1H9R u999 (.Y(n735), .A(n711), .B(n734), .C(n723));
    AO22X3H9R u1001 (.Y(n736), .A0(\rx_data_B[13] ), .A1(n19644), .B0(n680_n1),
        .B1(\rx_data_B[5] ));
    NAND2X0P5H9R u1002 (.Y(n737), .A(n736), .B(n19694));
    AO22X2H9R u1003 (.Y(n738), .A0(n722), .A1(n2331), .B0(n731), .B1(n733));
    NAND4X3H9R u1004 (.Y(n739), .A(n722), .B(n2331), .C(n731), .D(n733));
    AOI21X0P5H9R u1005 (.Y(n740), .A0(n704), .A1(n700_n1), .B0(n705));
    AOI21X1H9R u1006 (.Y(n741), .A0(n739_n1), .A1(n738_n1), .B0(n740));
    AND2X0P5H9R u1007 (.Y(n742), .A(n5748), .B(n709));
    NAND3X1H9R u1008 (.Y(n743), .A(n739_n1), .B(n738_n1), .C(n740));
    NAND4BX4H9R u1009 (.Y(n744), .AN(n741), .B(n743), .C(n742), .D(n19694));
    AOI31X2H9R u1010 (.Y(n745), .A0(n735), .A1(n709), .A2(n19694), .B0(n742));
    NAND2XBX2H9R u1011 (.Y(n746), .A(n744), .BN(n745));
    NAND2X2H9R u1012 (.Y(n747), .A(n19687), .B(n681));
    OAI31X1P4H9R u1013 (.Y(n748), .A0(n712), .A1(n720), .A2(n713), .B0(n721));
    AOI31X3H9R u1014 (.Y(n749), .A0(n3410), .A1(n2466), .A2(n719), .B0(n748));
    NOR2X1P4H9R u1015 (.Y(n750), .A(n2322), .B(n697_n1));
    OAI221X3H9R u1016 (.Y(n751), .A0(n5723), .A1(n663), .B0(n724_n1), .B1(n698),
        .C0(n5731));
    NAND2X1H9R u1017 (.Y(n752), .A(n19525), .B(n5715));
    AOI21X2H9R u1018 (.Y(n753), .A0(n659), .A1(n672), .B0(n695));
    AO22X2H9R u1019 (.Y(n754), .A0(n2307), .A1(\rx_data_A[5] ), .B0(n19508),
        .B1(\rx_data_A[13] ));
    NAND2X4H9R u1020 (.Y(n755), .A(n754), .B(n658_n1));
    OAI31X4H9R u1021 (.Y(n756), .A0(n730), .A1(n667_n1), .A2(n753), .B0(n755));
    AOI21X2H9R u1022 (.Y(n757), .A0(n751), .A1(n2556), .B0(n756));
    AOI22X1P4H9R u1023 (.Y(n758), .A0(n2307), .A1(\rx_data_A[4] ), .B0(n651_n1),
        .B1(\rx_data_A[12] ));
    NOR2X3H9R u1024 (.Y(n759), .A(n667_n1), .B(n758));
    XOR3X2H9R u1030 (.Y(n765), .A(n19569), .B(n747), .C(n764));
    XOR2X1H9R u1031 (.Y(n766), .A(n746), .B(n765));
    NOR2X0P5H9R u1034 (.Y(n768), .A(n767), .B(n652_n1));
    NAND2BX1H9R u1035 (.Y(n769), .AN(n737), .B(n766));
    NAND2X1H9R u1036 (.Y(n770), .A(n5748), .B(n736));
    OA21X3H9R u1037 (.Y(n771), .A0(n745), .A1(n765), .B0(n744));
    NAND2X1H9R u1038 (.Y(n772), .A(n19687), .B(n709));
    INVX5H9R u1039 (.Y(n773), .A(n772));
    CGENX1H9R u1040 (.CO(n774), .A(n747), .B(n762), .CI(n764));
    NOR2X1H9R u1044 (.Y(n778), .A(n758), .B(n2322));
    OA31X4H9R u1045 (.Z(n779), .A1(n753), .A2(n2649), .A3(n667_n1), .B(n755));
    AOI21X2H9R u1046 (.Y(n780), .A0(n19551), .A1(n752), .B0(n779));
    AOI22X1P4H9R u1047 (.Y(n781), .A0(n2307), .A1(\rx_data_A[5] ), .B0(n651_n1),
        .B1(\rx_data_A[13] ));
    AOI22X1P4H9R u1048 (.Y(n782), .A0(n2307), .A1(\rx_data_A[6] ), .B0(n651_n1),
        .B1(\rx_data_A[14] ));
    OAI22X1P4H9R u1049 (.Y(n783), .A0(n781), .A1(n667_n1), .B0(n782), .B1(n656));
    AO22X4H9R u1050 (.Y(n784), .A0(n2307), .A1(\rx_data_A[6] ), .B0(n651_n1),
        .B1(\rx_data_A[14] ));
    NAND4X1H9R u1051 (.Y(n785), .A(n784), .B(n5715), .C(n754), .D(n658_n1));
    AND2X1H9R u1052 (.Y(n786), .A(n785), .B(n783));
    XNOR3X3H9R u1053 (.Y(n787), .A(n780), .B(n778), .C(n786));
    AOAI211X4H9R u1054 (.ZN(n788), .A1(n749), .A2(n776), .B(n777), .C(n787));
    NOR2X0P5H9R u1059 (.Y(n793), .A(n683_n1), .B(n652_n1));
    AND2X2H9R u1060 (.Y(n794), .A(n793), .B(n766));
    AO211X4H9R u1061 (.Z(n795), .A1(n769), .A2(n770), .B(n792), .C(n794));
    AOAI211X4H9R u1062 (.ZN(n796), .A1(n769), .A2(n770), .B(n794), .C(n19723));
    AO22X1H9R u1066 (.Y(n799), .A0(n2307_n1), .A1(\rx_data_A[7] ), .B0(n651_n1),
        .B1(\rx_data_A[15] ));
    NAND2X0P5H9R u1067 (.Y(n800), .A(n709), .B(n799_n1));
    NAND2X0P5H9R u1068 (.Y(n801), .A(n19683), .B(n799_n1));
    NOR2X1H9R u1069 (.Y(n802), .A(n781), .B(n2322));
    NAND2X3H9R u1070 (.Y(n803), .A(n784), .B(n5715));
    OA211X3H9R u1071 (.Y(n804), .A0(n759), .A1(n728), .B0(n19548), .C0(n803));
    NOR2X1H9R u1072 (.Y(n805), .A(n803), .B(n756));
    NAND2X3H9R u1073 (.Y(n806), .A(n658_n1), .B(n799));
    AOA211X4H9R u1074 (.Z(n807), .A1(n804), .A2(n756), .B(n805), .C(n806));
    AOI211X1P4H9R u1075 (.Y(n808), .A0(n804), .A1(n756), .B0(n805), .C0(n806));
    NOR3X2H9R u1076 (.Y(n809), .A(n807), .B(n808), .C(n802));
    AOI211X2H9R u1077 (.Y(n810), .A0(n19551), .A1(n752), .B0(n786), .C0(n779));
    AOA211X4H9R u1078 (.Z(n811), .A1(n751), .A2(n2556), .B(n779), .C(n2640));
    OAI33X2H9R u1079 (.ZN(n812), .A1(n2336), .A2(n2332), .A3(n750), .B1(n811),
        .B2(n810), .B3(n778));
    OAI21X0P7H9R u1080 (.Y(n813), .A0(n810), .A1(n811), .B0(n778));
    AOA211X4H9R u1081 (.Z(n814), .A1(n749), .A2(n776), .B(n812), .C(n813));
    OAI21X1P4H9R u1082 (.Y(n815), .A0(n808), .A1(n807), .B0(n802));
    OAI21X1H9R u1083 (.Y(n816), .A0(n814_n1), .A1(n809), .B0(n815));
    OAI211X1H9R u1084 (.Y(n817), .A0(n759), .A1(n728), .B0(n19548), .C0(n756));
    NAND2X0P5H9R u1085 (.Y(n818), .A(n19683), .B(n784));
    AOI211X1P4H9R u1086 (.Y(n819), .A0(n5767), .A1(n803), .B0(n818), .C0(n806));
    NAND2X0P5H9R u1087 (.Y(n820), .A(n5715), .B(n799));
    OA211X0P5H9R u1088 (.Y(n821), .A0(n803), .A1(n19547), .B0(n818), .C0(n820));
    OAOI211X4H9R u1089 (.ZN(n822), .A1(n814_n1), .A2(n809), .B(n815), .C(n821));
    OAO211X4H9R u1090 (.Z(n823), .A1(n19547), .A2(n803), .B(n820), .C(n818));
    AOAI211X4H9R u1091 (.ZN(n824), .A1(n803), .A2(n5767), .B(n806), .C(n823));
    OAI2BB2X4H9R u1092 (.ZN(n825), .A1(n816), .A2(n819), .B1(n822), .B2(n824_n1));
    XNOR2X1H9R u1093 (.Y(n826), .A(n825), .B(n801));
    AO21X1H9R u1094 (.Y(n827), .A0(n2670), .A1(n19707), .B0(n19563));
    OR2X1P4H9R u1095 (.Y(n828), .A(n5768), .B(n19705));
    NAND2X1P4H9R u1096 (.Y(n829), .A(n828), .B(n19683));
    AND2X1H9R u1097 (.Y(n830), .A(n804), .B(n756));
    AOI22X1P4H9R u1098 (.Y(n831), .A0(n2307_n1), .A1(\rx_data_A[7] ), .B0(n651_n1),
        .B1(\rx_data_A[15] ));
    NOR2X0P7H9R u1099 (.Y(n832), .A(n831), .B(n656));
    NAND2X1P4H9R u1100 (.Y(n833), .A(n21036), .B(n19683));
    NOR2X2H9R u1101 (.Y(n834), .A(n833), .B(n832));
    NOR2X1H9R u1102 (.Y(n835), .A(n5728), .B(n667_n1));
    XNOR2X2H9R u1103 (.Y(n836), .A(n835), .B(n802));
    NAND3X1H9R u1104 (.Y(n837), .A(n19547), .B(n836), .C(n806));
    OAI21X1P4H9R u1105 (.Y(n838), .A0(n804), .A1(n834), .B0(n837));
    OAI21X1H9R u1106 (.Y(n839), .A0(n805), .A1(n832), .B0(n833));
    AOI21X2H9R u1107 (.Y(n840), .A0(n803), .A1(n833), .B0(n19547));
    AOI211X1P4H9R u1108 (.Y(n841), .A0(n836), .A1(n817), .B0(n806), .C0(n840));
    AO221X4H9R u1109 (.Z(n842), .A1(n830), .A2(n834), .B1(n838), .B2(n839),
        .C(n841));
    AND3X1H9R u1110 (.Y(n843), .A(n2477), .B(n827), .C(n829));
    AOAI211X4H9R u1111 (.ZN(n844), .A1(n827), .A2(n829), .B(n2381), .C(n19525));
    AOI21X2H9R u1114 (.Y(n847), .A0(n749_n1), .A1(n19707), .B0(n19563));
    NAND3X4H9R u1116 (.Y(n849), .A(n842), .B(n828), .C(n847));
    AOI31X1H9R u1117 (.Y(n850), .A0(n848), .A1(n5729), .A2(n849), .B0(n705));
    OAI21BX2H9R u1118 (.Y(n851), .A0(n824), .A1(n821), .B0N(n819));
    OAOI211X4H9R u1119 (.ZN(n852), .A1(n814), .A2(n809), .B(n815), .C(n851));
    OAI211X2H9R u1120 (.Y(n853), .A0(n809), .A1(n814), .B0(n851), .C0(n815));
    NAND3BX3H9R u1121 (.Y(n854), .AN(n852), .B(n781_n1), .C(n853));
    NOR2X0P5H9R u1122 (.Y(n855), .A(n781_n1), .B(n705));
    NAND2XBX3H9R u1123 (.Y(n856), .A(n19579), .BN(n852));
    AOI32X1H9R u1124 (.Y(n857), .A0(n846), .A1(n2642), .A2(n854), .B0(n855),
        .B1(n856));
    CGENX2H9R u1125 (.CO(n858), .A(n5728), .B(n826), .CI(n857));
    OAI211X1H9R u1126 (.Y(n859), .A0(n824_n1), .A1(n822), .B0(n19683), .C0(n799_n1));
    NAND2X0P5H9R u1127 (.Y(n860), .A(n859), .B(n858));
    NAND3X1H9R u1128 (.Y(n861), .A(n860), .B(n799_n1), .C(n681));
    OAI21X2H9R u1129 (.Y(n862), .A0(n705), .A1(n859), .B0(n799_n1));
    OAI21X2H9R u1130 (.Y(n863), .A0(n858), .A1(n862), .B0(n681));
    AO22X2H9R u1131 (.Y(n864), .A0(n858), .A1(n862), .B0(n863), .B1(n859));
    AND2X0P5H9R u1132 (.Y(n865), .A(n784), .B(n709));
    INVX1H9R u1133 (.Y(n866), .A(n865));
    NAND2X2H9R u1135 (.Y(n868), .A(n856), .B(n754_n1));
    NAND2X0P5H9R u1143 (.Y(n876), .A(n681), .B(n5729));
    NOR2X0P5H9R u1145 (.Y(n878), .A(n705), .B(n5729));
    NAND2X0P5H9R u1152 (.Y(n885), .A(n709), .B(n695_n1));
    AOI211X2H9R u1153 (.Y(n886), .A0(n772), .A1(n791), .B0(n885), .C0(n771));
    NOR2X1H9R u1159 (.Y(n892), .A(n5785), .B(n697_n1));
    NOR2BX2H9R u1160 (.Y(n893), .AN(n853), .B(n852));
    AOI21X1P4H9R u1161 (.Y(n894), .A0(n892), .A1(n850), .B0(n893));
    NAND2X0P5H9R u1179 (.Y(n912), .A(n736), .B(n784));
    AND2X0P5H9R u1180 (.Y(n913), .A(n736), .B(n754_n1));
    CGENCONAX1H9R u1181 (.CON(n914), .A(n907), .B(n19589), .CI(n904));
    XNOR3X3H9R u1182 (.Y(n915), .A(n2762), .B(n865), .C(n864));
    AND2X1H9R u1183 (.Y(n916), .A(n19525), .B(n736));
    AOI211X2H9R u1188 (.Y(n921), .A0(n874), .A1(n872), .B0(n3432), .C0(n886));
    XNOR2X1H9R u1189 (.Y(n922), .A(n921), .B(n883));
    NAND2X1H9R u1190 (.Y(n923), .A(n19687), .B(n736));
    NAND2X0P5H9R u1192 (.Y(n925), .A(n736), .B(n695_n1));
    INVX1H9R u1193 (.Y(n926), .A(n925));
    NAND3X4H9R u1197 (.Y(n930), .A(n915), .B(n754_n1), .C(n736));
    OR2X4H9R u1203 (.Y(n936), .A(n915), .B(n913));
    NAND3X2H9R u1204 (.Y(n937), .A(n19591), .B(n936), .C(n930));
    NOR2X0P5H9R u1206 (.Y(n939), .A(n767), .B(n5729));
    AO21X3H9R u1207 (.Y(n940), .A0(n938), .A1(n937), .B0(n939));
    NOR2X0P5H9R u1208 (.Y(n941), .A(n675_n1), .B(n767));
    NAND2X0P5H9R u1212 (.Y(n945), .A(n944), .B(n19687));
    OR3X0P5H9R u1215 (.Y(n948), .A(n19723), .B(n766_n1), .C(n770));
    OAI21X0P5H9R u1216 (.Y(n949), .A0(n766_n1), .A1(n770), .B0(n19723));
    AND3X1H9R u1217 (.Y(n950), .A(n948), .B(n793), .C(n949));
    XNOR3X1H9R u1218 (.Y(n951), .A(n922), .B(n920), .C(n923));
    AOI32X2H9R u1219 (.Y(n952), .A0(n795), .A1(n796), .A2(n768), .B0(n944),
        .B1(n5748));
    OAI21BX2H9R u1220 (.Y(n953), .A0(n950), .A1(n951), .B0N(n952));
    XOR3X0P7H9R u1223 (.Y(n956), .A(n927), .B(n917), .C(n916));
    NAND2X0P5H9R u1224 (.Y(n957), .A(n944), .B(n695_n1));
    AO31X2H9R u1226 (.Z(n959), .A1(n938), .A2(n939), .A3(n937), .B(n958));
    OAI21X0P7H9R u1229 (.Y(n962), .A0(n754_n1), .A1(n960_n0), .B0(n961));
    NAND2X0P5H9R u1230 (.Y(n963), .A(n736), .B(n799_n1));
    AND2X2H9R u1231 (.Y(n964), .A(n929_n1), .B(n5803));
    NAND2BX2H9R u1232 (.Y(n965), .AN(n909_n1), .B(n861));
    NAND2BX3H9R u1233 (.Y(n966), .AN(n800), .B(n965));
    AND2X0P5H9R u1234 (.Y(n967), .A(n910), .B(n800));
    AOI32X3H9R u1235 (.Y(n968), .A0(n964), .A1(n966), .A2(n912), .B0(n933_n1),
        .B1(n967));
    NAND2BX0P5H9R u1236 (.Y(n969), .AN(n963), .B(n968_n1));
    OAI31X0P7H9R u1237 (.Y(n970), .A0(n767), .A1(n962), .A2(n5728), .B0(n969));
    NAND2BX0P5H9R u1241 (.Y(n974), .AN(n861), .B(n909_n1));
    AND2X2H9R u1242 (.Y(n975), .A(n964), .B(n974));
    NOR2XBX2H9R u1243 (.Y(n976), .A(n964), .BN(n966));
    OAI31X0P5H9R u1244 (.Y(n977), .A0(n976), .A1(n975), .A2(n912), .B0(n968_n1));
    XOR2X1H9R u1245 (.Y(n978), .A(n2524), .B(n963));
    OAI21X1H9R u1246 (.Y(n979), .A0(n784), .A1(n5814), .B0(n5815));
    OAI2XB1X1H9R u1247 (.Y(n980), .A0(n970), .A1N(n979), .B0(n944));
    NAND2X0P7H9R u1248 (.Y(n981), .A(n5803), .B(n936));
    XOR3X0P7H9R u1249 (.Y(n982), .A(n958), .B(n981), .C(n19591));
    NOR2X1H9R u1250 (.Y(n983), .A(n982), .B(n939));
    NOR2X0P5H9R u1252 (.Y(n985), .A(n675_n1), .B(n984));
    XOR2X0P5H9R u1253 (.Y(n986), .A(n956), .B(n955));
    XNOR2X0P7H9R u1254 (.Y(n987), .A(n957), .B(n986));
    NOR2X0P5H9R u1255 (.Y(n988), .A(n950), .B(n952));
    XNOR2X0P5H9R u1256 (.Y(n989), .A(n988), .B(n951));
    OAO211X0P5H9R u1257 (.Z(n990), .A1(n652_n1), .A2(n989), .B(n683_n1),
        .C(n984));
    NOR2BX0P5H9R u1258 (.Y(n991), .AN(n793), .B(n989));
    XNOR3X0P5H9R u1259 (.Y(n992), .A(n943), .B(n941), .C(n953));
    NOR2X1H9R u1260 (.Y(n993), .A(n992), .B(n991));
    NOR2X1H9R u1261 (.Y(n994), .A(n993), .B(n990));
    CGENX2H9R u1262 (.CO(n995), .A(n985), .B(n994), .CI(n987));
    AO22X0P5H9R u1263 (.Y(n996), .A0(\rx_data_B[15] ), .A1(n19644), .B0(\rx_data_B[7] ),
        .B1(n680_n1));
    OAI211X3H9R u1264 (.Y(n997), .A0(n995), .A1(n983), .B0(n695_n1), .C0(n996));
    XNOR2X2H9R u1265 (.Y(n998), .A(n939), .B(n982));
    AOI32X2H9R u1266 (.Y(n999), .A0(n982_n1), .A1(n944), .A2(n695_n1), .B0(n998),
        .B1(n995));
    NOR2X0P5H9R u1267 (.Y(n1000), .A(n984), .B(n5729));
    INVX0P5H9R u1268 (.Y(n1001), .A(n1000));
    AOI21X2H9R u1269 (.Y(n1002), .A0(n997), .A1(n999), .B0(n1001));
    AOI21X2H9R u1270 (.Y(n1003), .A0(n998), .A1(n995), .B0(n1000));
    OAI211X2H9R u1271 (.Y(n1004), .A0(n972), .A1(n960_n0), .B0(n754_n1),
        .C0(n944));
    NOR2X0P5H9R u1274 (.Y(n1007), .A(n767), .B(n5728));
    OAI211X1H9R u1275 (.Y(n1008), .A0(n754_n1), .A1(n960_n0), .B0(n784),
        .C0(n961));
    OAI211X2H9R u1276 (.Y(n1009), .A0(n5814), .A1(n1007), .B0(n1008), .C0(n5815));
    NAND2X0P5H9R u1279 (.Y(n1012), .A(n996), .B(n784));
    NOR2X0P5H9R u1282 (.Y(n1015), .A(n799_n1), .B(n5728));
    AOI211X0P7H9R u1283 (.Y(n1016), .A0(n977), .A1(n962), .B0(n5728), .C0(n799_n1));
    AOI2XB1X2H9R u1284 (.Y(n1017), .A0(n1007), .A1N(n962), .B0(n831));
    OAI221X2H9R u1285 (.Y(n1018), .A0(n979), .A1(n1015), .B0(n1016), .B1(n1017),
        .C0(n944));
    XOR2X2H9R u1286 (.Y(n1019), .A(n1018), .B(n969));
    NAND2X0P5H9R u1287 (.Y(n1020), .A(n754_n1), .B(n996));
    NAND2BX2H9R u1294 (.Y(n1025), .AN(n1014), .B(n1021));
    NOR2BX0P5H9R u1296 (.Y(n1026), .AN(n1011), .B(n1013));
    AO21X0P5H9R u1298 (.Y(n1027), .A0(n19744), .A1(n999), .B0(n1001));
    NOR2X1H9R u1299 (.Y(n1028), .A(n1006_n1), .B(n1002_n1));
    NAND4X0P5H9R u1300 (.Y(n1029), .A(n19744), .B(n1005_n1), .C(n19745),
        .D(n1003));
    NAND2X1H9R u1301 (.Y(n1030), .A(n1028), .B(n1029));
    AOAI211X2H9R u1302 (.ZN(\u_compute_engine/u_mul8x8/n178 ), .A1(n19745),
        .A2(n1005_n1), .B(n1027), .C(n1030));
    NAND2X0P5H9R u1303 (.Y(n1031), .A(n996), .B(n695_n1));
    XNOR3X0P5H9R u1304 (.Y(\u_compute_engine/u_mul8x8/n179 ), .A(n998), .B(n995),
        .C(n1031));
    XOR3X0P5H9R u1305 (.Y(\u_compute_engine/u_mul8x8/n180 ), .A(n994), .B(n985),
        .C(n987));
    NOR3X0P5H9R u1310 (.Y(n1034), .A(\u_spi_tx/out_cnt[2] ), .B(\u_spi_tx/out_cnt[1] ),
        .C(\u_spi_tx/out_cnt[0] ));
    NOR2X0P5H9R u1311 (.Y(n1035), .A(\u_spi_tx/out_cnt[4] ), .B(\u_spi_tx/out_cnt[3] ));
    XNOR2X0P5H9R u1316 (.Y(n1040), .A(\u_sync_fifo/wr_ptr[2] ), .B(\u_sync_fifo/rd_ptr[2] ));
    NOR2XBX0P5H9R u1317 (.Y(n1041), .A(n1039), .BN(n1040));
    INVX0P5H9R u1319 (.Y(\u_spi_tx/n108 ), .A(n1042));
    NOR2X0P5H9R u1320 (.Y(n1043), .A(n1036), .B(\u_spi_tx/n108 ));
    NAND2X0P5H9R u1321 (.Y(n1044), .A(\u_sync_fifo/rd_ptr[1] ), .B(\u_sync_fifo/rd_ptr[0] ));
    NAND2BX0P5H9R u1322 (.Y(n1045), .AN(\u_sync_fifo/rd_ptr[0] ), .B(\u_sync_fifo/rd_ptr[1] ));
    OAI22X0P5H9R u1323 (.Y(n1046), .A0(\u_sync_fifo/mem[3][23] ), .A1(n1044),
        .B0(n1045), .B1(\u_sync_fifo/mem[2][23] ));
    NAND2BX0P5H9R u1324 (.Y(n1047), .AN(\u_sync_fifo/rd_ptr[1] ), .B(\u_sync_fifo/rd_ptr[0] ));
    OR2X0P5H9R u1325 (.Y(n1048), .A(\u_sync_fifo/rd_ptr[1] ), .B(\u_sync_fifo/rd_ptr[0] ));
    OAI22X0P5H9R u1326 (.Y(n1049), .A0(\u_sync_fifo/mem[1][23] ), .A1(n1047),
        .B0(n1048), .B1(\u_sync_fifo/mem[0][23] ));
    NOR3X0P5H9R u1327 (.Y(n1050), .A(n1042), .B(n1046), .C(n1049));
    AOI221X0P5H9R u1328 (.Y(n1051), .A0(\u_spi_tx/shift_reg[22] ), .A1(n1036),
        .B0(n1043), .B1(sum_out), .C0(n1050));
    OAI22X0P5H9R u1330 (.Y(n1052), .A0(\u_sync_fifo/mem[3][22] ), .A1(n1044),
        .B0(n1045), .B1(\u_sync_fifo/mem[2][22] ));
    OAI22X0P5H9R u1331 (.Y(n1053), .A0(\u_sync_fifo/mem[1][22] ), .A1(n1047),
        .B0(n1048), .B1(\u_sync_fifo/mem[0][22] ));
    NOR3X0P5H9R u1332 (.Y(n1054), .A(n1042), .B(n1052), .C(n1053));
    AOI221X0P5H9R u1333 (.Y(n1055), .A0(\u_spi_tx/shift_reg[21] ), .A1(n1036),
        .B0(n1043), .B1(\u_spi_tx/shift_reg[22] ), .C0(n1054));
    OAI22X0P5H9R u1335 (.Y(n1056), .A0(\u_sync_fifo/mem[3][21] ), .A1(n1044),
        .B0(n1048), .B1(\u_sync_fifo/mem[0][21] ));
    OAI22X0P5H9R u1336 (.Y(n1057), .A0(\u_sync_fifo/mem[2][21] ), .A1(n1045),
        .B0(n1047), .B1(\u_sync_fifo/mem[1][21] ));
    NOR3X0P5H9R u1337 (.Y(n1058), .A(n1042), .B(n1056), .C(n1057));
    AOI221X0P5H9R u1338 (.Y(n1059), .A0(\u_spi_tx/shift_reg[20] ), .A1(n1036),
        .B0(n1043), .B1(\u_spi_tx/shift_reg[21] ), .C0(n1058));
    OAI22X0P5H9R u1340 (.Y(n1060), .A0(\u_sync_fifo/mem[2][20] ), .A1(n1045),
        .B0(n1047), .B1(\u_sync_fifo/mem[1][20] ));
    OAI22X0P5H9R u1341 (.Y(n1061), .A0(\u_sync_fifo/mem[3][20] ), .A1(n1044),
        .B0(n1048), .B1(\u_sync_fifo/mem[0][20] ));
    NOR3X0P5H9R u1342 (.Y(n1062), .A(n1042), .B(n1060), .C(n1061));
    AOI221X0P5H9R u1343 (.Y(n1063), .A0(\u_spi_tx/shift_reg[19] ), .A1(n1036),
        .B0(n1043), .B1(\u_spi_tx/shift_reg[20] ), .C0(n1062));
    OAI22X0P5H9R u1345 (.Y(n1064), .A0(\u_sync_fifo/mem[2][19] ), .A1(n1045),
        .B0(n1048), .B1(\u_sync_fifo/mem[0][19] ));
    OAI22X0P5H9R u1346 (.Y(n1065), .A0(\u_sync_fifo/mem[3][19] ), .A1(n1044),
        .B0(n1047), .B1(\u_sync_fifo/mem[1][19] ));
    NOR3X0P5H9R u1347 (.Y(n1066), .A(n1042), .B(n1064), .C(n1065));
    AOI221X0P5H9R u1348 (.Y(n1067), .A0(\u_spi_tx/shift_reg[18] ), .A1(n1036),
        .B0(n1043), .B1(\u_spi_tx/shift_reg[19] ), .C0(n1066));
    OAI22X0P5H9R u1350 (.Y(n1068), .A0(\u_sync_fifo/mem[3][18] ), .A1(n1044),
        .B0(n1047), .B1(\u_sync_fifo/mem[1][18] ));
    OAI22X0P5H9R u1351 (.Y(n1069), .A0(\u_sync_fifo/mem[2][18] ), .A1(n1045),
        .B0(n1048), .B1(\u_sync_fifo/mem[0][18] ));
    NOR3X0P5H9R u1352 (.Y(n1070), .A(n1042), .B(n1068), .C(n1069));
    AOI221X0P5H9R u1353 (.Y(n1071), .A0(\u_spi_tx/shift_reg[17] ), .A1(n1036),
        .B0(n1043), .B1(\u_spi_tx/shift_reg[18] ), .C0(n1070));
    OAI22X0P5H9R u1355 (.Y(n1072), .A0(\u_sync_fifo/mem[3][17] ), .A1(n1044),
        .B0(n1045), .B1(\u_sync_fifo/mem[2][17] ));
    OAI22X0P5H9R u1356 (.Y(n1073), .A0(\u_sync_fifo/mem[1][17] ), .A1(n1047),
        .B0(n1048), .B1(\u_sync_fifo/mem[0][17] ));
    NOR3X0P5H9R u1357 (.Y(n1074), .A(n1042), .B(n1072), .C(n1073));
    AOI221X0P5H9R u1358 (.Y(n1075), .A0(\u_spi_tx/shift_reg[16] ), .A1(n1036),
        .B0(n1043), .B1(\u_spi_tx/shift_reg[17] ), .C0(n1074));
    OAI22X0P5H9R u1360 (.Y(n1076), .A0(\u_sync_fifo/mem[3][16] ), .A1(n1044),
        .B0(n1048), .B1(\u_sync_fifo/mem[0][16] ));
    OAI22X0P5H9R u1361 (.Y(n1077), .A0(\u_sync_fifo/mem[2][16] ), .A1(n1045),
        .B0(n1047), .B1(\u_sync_fifo/mem[1][16] ));
    NOR3X0P5H9R u1362 (.Y(n1078), .A(n1042), .B(n1076), .C(n1077));
    AOI221X0P5H9R u1363 (.Y(n1079), .A0(\u_spi_tx/shift_reg[15] ), .A1(n1036),
        .B0(n1043), .B1(\u_spi_tx/shift_reg[16] ), .C0(n1078));
    OAI22X0P5H9R u1365 (.Y(n1080), .A0(\u_sync_fifo/mem[3][15] ), .A1(n1044),
        .B0(n1048), .B1(\u_sync_fifo/mem[0][15] ));
    OAI22X0P5H9R u1366 (.Y(n1081), .A0(\u_sync_fifo/mem[2][15] ), .A1(n1045),
        .B0(n1047), .B1(\u_sync_fifo/mem[1][15] ));
    NOR3X0P5H9R u1367 (.Y(n1082), .A(n1042), .B(n1080), .C(n1081));
    AOI221X0P5H9R u1368 (.Y(n1083), .A0(\u_spi_tx/shift_reg[14] ), .A1(n1036),
        .B0(n1043), .B1(\u_spi_tx/shift_reg[15] ), .C0(n1082));
    OAI22X0P5H9R u1370 (.Y(n1084), .A0(\u_sync_fifo/mem[3][14] ), .A1(n1044),
        .B0(n1048), .B1(\u_sync_fifo/mem[0][14] ));
    OAI22X0P5H9R u1371 (.Y(n1085), .A0(\u_sync_fifo/mem[2][14] ), .A1(n1045),
        .B0(n1047), .B1(\u_sync_fifo/mem[1][14] ));
    NOR3X0P5H9R u1372 (.Y(n1086), .A(n1042), .B(n1084), .C(n1085));
    AOI221X0P5H9R u1373 (.Y(n1087), .A0(\u_spi_tx/shift_reg[13] ), .A1(n1036),
        .B0(n1043), .B1(\u_spi_tx/shift_reg[14] ), .C0(n1086));
    OAI22X0P5H9R u1375 (.Y(n1088), .A0(\u_sync_fifo/mem[1][13] ), .A1(n1047),
        .B0(n1048), .B1(\u_sync_fifo/mem[0][13] ));
    OAI22X0P5H9R u1376 (.Y(n1089), .A0(\u_sync_fifo/mem[3][13] ), .A1(n1044),
        .B0(n1045), .B1(\u_sync_fifo/mem[2][13] ));
    NOR3X0P5H9R u1377 (.Y(n1090), .A(n1042), .B(n1088), .C(n1089));
    AOI221X0P5H9R u1378 (.Y(n1091), .A0(\u_spi_tx/shift_reg[12] ), .A1(n1036),
        .B0(n1043), .B1(\u_spi_tx/shift_reg[13] ), .C0(n1090));
    OAI22X0P5H9R u1380 (.Y(n1092), .A0(\u_sync_fifo/mem[2][12] ), .A1(n1045),
        .B0(n1047), .B1(\u_sync_fifo/mem[1][12] ));
    OAI22X0P5H9R u1381 (.Y(n1093), .A0(\u_sync_fifo/mem[3][12] ), .A1(n1044),
        .B0(n1048), .B1(\u_sync_fifo/mem[0][12] ));
    NOR3X0P5H9R u1382 (.Y(n1094), .A(n1042), .B(n1092), .C(n1093));
    AOI221X0P5H9R u1383 (.Y(n1095), .A0(\u_spi_tx/shift_reg[11] ), .A1(n1036),
        .B0(n1043), .B1(\u_spi_tx/shift_reg[12] ), .C0(n1094));
    OAI22X0P5H9R u1385 (.Y(n1096), .A0(\u_sync_fifo/mem[1][11] ), .A1(n1047),
        .B0(n1048), .B1(\u_sync_fifo/mem[0][11] ));
    OAI22X0P5H9R u1386 (.Y(n1097), .A0(\u_sync_fifo/mem[3][11] ), .A1(n1044),
        .B0(n1045), .B1(\u_sync_fifo/mem[2][11] ));
    NOR3X0P5H9R u1387 (.Y(n1098), .A(n1042), .B(n1096), .C(n1097));
    AOI221X0P5H9R u1388 (.Y(n1099), .A0(\u_spi_tx/shift_reg[10] ), .A1(n1036),
        .B0(n1043), .B1(\u_spi_tx/shift_reg[11] ), .C0(n1098));
    OAI22X0P5H9R u1390 (.Y(n1100), .A0(\u_sync_fifo/mem[3][10] ), .A1(n1044),
        .B0(n1048), .B1(\u_sync_fifo/mem[0][10] ));
    OAI22X0P5H9R u1391 (.Y(n1101), .A0(\u_sync_fifo/mem[2][10] ), .A1(n1045),
        .B0(n1047), .B1(\u_sync_fifo/mem[1][10] ));
    NOR3X0P5H9R u1392 (.Y(n1102), .A(n1042), .B(n1100), .C(n1101));
    AOI221X0P5H9R u1393 (.Y(n1103), .A0(\u_spi_tx/shift_reg[9] ), .A1(n1036),
        .B0(n1043), .B1(\u_spi_tx/shift_reg[10] ), .C0(n1102));
    OAI22X0P5H9R u1395 (.Y(n1104), .A0(\u_sync_fifo/mem[1][9] ), .A1(n1047),
        .B0(n1048), .B1(\u_sync_fifo/mem[0][9] ));
    OAI22X0P5H9R u1396 (.Y(n1105), .A0(\u_sync_fifo/mem[3][9] ), .A1(n1044),
        .B0(n1045), .B1(\u_sync_fifo/mem[2][9] ));
    NOR3X0P5H9R u1397 (.Y(n1106), .A(n1042), .B(n1104), .C(n1105));
    AOI221X0P5H9R u1398 (.Y(n1107), .A0(\u_spi_tx/shift_reg[8] ), .A1(n1036),
        .B0(n1043), .B1(\u_spi_tx/shift_reg[9] ), .C0(n1106));
    OAI22X0P5H9R u1400 (.Y(n1108), .A0(\u_sync_fifo/mem[2][8] ), .A1(n1045),
        .B0(n1047), .B1(\u_sync_fifo/mem[1][8] ));
    OAI22X0P5H9R u1401 (.Y(n1109), .A0(\u_sync_fifo/mem[3][8] ), .A1(n1044),
        .B0(n1048), .B1(\u_sync_fifo/mem[0][8] ));
    NOR3X0P5H9R u1402 (.Y(n1110), .A(n1042), .B(n1108), .C(n1109));
    AOI221X0P5H9R u1403 (.Y(n1111), .A0(\u_spi_tx/shift_reg[7] ), .A1(n1036),
        .B0(n1043), .B1(\u_spi_tx/shift_reg[8] ), .C0(n1110));
    OAI22X0P5H9R u1405 (.Y(n1112), .A0(\u_sync_fifo/mem[3][7] ), .A1(n1044),
        .B0(n1048), .B1(\u_sync_fifo/mem[0][7] ));
    OAI22X0P5H9R u1406 (.Y(n1113), .A0(\u_sync_fifo/mem[2][7] ), .A1(n1045),
        .B0(n1047), .B1(\u_sync_fifo/mem[1][7] ));
    NOR3X0P5H9R u1407 (.Y(n1114), .A(n1042), .B(n1112), .C(n1113));
    AOI221X0P5H9R u1408 (.Y(n1115), .A0(\u_spi_tx/shift_reg[6] ), .A1(n1036),
        .B0(n1043), .B1(\u_spi_tx/shift_reg[7] ), .C0(n1114));
    OAI22X0P5H9R u1410 (.Y(n1116), .A0(\u_sync_fifo/mem[3][6] ), .A1(n1044),
        .B0(n1045), .B1(\u_sync_fifo/mem[2][6] ));
    OAI22X0P5H9R u1411 (.Y(n1117), .A0(\u_sync_fifo/mem[1][6] ), .A1(n1047),
        .B0(n1048), .B1(\u_sync_fifo/mem[0][6] ));
    NOR3X0P5H9R u1412 (.Y(n1118), .A(n1042), .B(n1116), .C(n1117));
    AOI221X0P5H9R u1413 (.Y(n1119), .A0(\u_spi_tx/shift_reg[5] ), .A1(n1036),
        .B0(n1043), .B1(\u_spi_tx/shift_reg[6] ), .C0(n1118));
    OAI22X0P5H9R u1415 (.Y(n1120), .A0(\u_sync_fifo/mem[3][5] ), .A1(n1044),
        .B0(n1045), .B1(\u_sync_fifo/mem[2][5] ));
    OAI22X0P5H9R u1416 (.Y(n1121), .A0(\u_sync_fifo/mem[1][5] ), .A1(n1047),
        .B0(n1048), .B1(\u_sync_fifo/mem[0][5] ));
    NOR3X0P5H9R u1417 (.Y(n1122), .A(n1042), .B(n1120), .C(n1121));
    AOI221X0P5H9R u1418 (.Y(n1123), .A0(\u_spi_tx/shift_reg[4] ), .A1(n1036),
        .B0(n1043), .B1(\u_spi_tx/shift_reg[5] ), .C0(n1122));
    OAI22X0P5H9R u1420 (.Y(n1124), .A0(\u_sync_fifo/mem[3][4] ), .A1(n1044),
        .B0(n1048), .B1(\u_sync_fifo/mem[0][4] ));
    OAI22X0P5H9R u1421 (.Y(n1125), .A0(\u_sync_fifo/mem[2][4] ), .A1(n1045),
        .B0(n1047), .B1(\u_sync_fifo/mem[1][4] ));
    NOR3X0P5H9R u1422 (.Y(n1126), .A(n1042), .B(n1124), .C(n1125));
    AOI221X0P5H9R u1423 (.Y(n1127), .A0(\u_spi_tx/shift_reg[3] ), .A1(n1036),
        .B0(n1043), .B1(\u_spi_tx/shift_reg[4] ), .C0(n1126));
    OAI22X0P5H9R u1425 (.Y(n1128), .A0(\u_sync_fifo/mem[3][3] ), .A1(n1044),
        .B0(n1047), .B1(\u_sync_fifo/mem[1][3] ));
    OAI22X0P5H9R u1426 (.Y(n1129), .A0(\u_sync_fifo/mem[2][3] ), .A1(n1045),
        .B0(n1048), .B1(\u_sync_fifo/mem[0][3] ));
    NOR3X0P5H9R u1427 (.Y(n1130), .A(n1042), .B(n1128), .C(n1129));
    AOI221X0P5H9R u1428 (.Y(n1131), .A0(\u_spi_tx/shift_reg[2] ), .A1(n1036),
        .B0(n1043), .B1(\u_spi_tx/shift_reg[3] ), .C0(n1130));
    OAI22X0P5H9R u1430 (.Y(n1132), .A0(\u_sync_fifo/mem[1][2] ), .A1(n1047),
        .B0(n1048), .B1(\u_sync_fifo/mem[0][2] ));
    OAI22X0P5H9R u1431 (.Y(n1133), .A0(\u_sync_fifo/mem[3][2] ), .A1(n1044),
        .B0(n1045), .B1(\u_sync_fifo/mem[2][2] ));
    NOR2BX0P5H9R u1453 (.Y(n1149), .AN(n1036), .B(\u_spi_tx/out_cnt[0] ));
    NOR2X0P5H9R u1457 (.Y(n1152), .A(\u_spi_tx/n108 ), .B(n1149));
    OAI2XB1X0P5H9R u1459 (.Y(\u_spi_tx/n106 ), .A0(out_ready), .A1N(\u_spi_tx/out_cnt[0] ),
        .B0(n1152));
    OAI21X0P5H9R u1461 (.Y(n1153), .A0(n1039), .A1(n1040), .B0(calc_valid));
    NOR2BX0P5H9R u1462 (.Y(n1154), .AN(\u_sync_fifo/wr_ptr[0] ), .B(n1153));
    NAND2X0P5H9R u1463 (.Y(n1155), .A(\u_sync_fifo/wr_ptr[1] ), .B(n1154));
    OR2X0P5H9R u1466 (.Y(n1156), .A(\u_sync_fifo/wr_ptr[0] ), .B(n1153));
    NAND2X0P5H9R u1467 (.Y(n1157), .A(\u_sync_fifo/wr_ptr[0] ), .B(n1153));
    NAND2X0P5H9R u1468 (.Y(\u_sync_fifo/n45 ), .A(n1156), .B(n1157));
    NOR2X0P5H9R u1470 (.Y(n1159), .A(n1044), .B(n1158));
    NAND3BX1H9R u1502 (.Y(n1163), .AN(\u_sync_fifo/wr_ptr[1] ), .B(n1154),
        .C(sys_rst_n));
    NAND2X1H9R u1528 (.Y(n1164), .A(\u_sync_fifo/wr_ptr[1] ), .B(sys_rst_n));
    NOR2X1H9R u1529 (.Y(n1165), .A(n1156), .B(n1164));
    NAND2XBX1H9R u1555 (.Y(n1166), .A(n1154), .BN(n1164));
    OR2X0P5H9R u1589 (.Y(n1173), .A(n19621), .B(n19643));
    OR2X0P5H9R u1594 (.Y(n1176), .A(n19643), .B(n2399));
    NAND2X0P5H9R u1597 (.Y(n1179), .A(n1176), .B(n2126));
    NAND2X0P5H9R u1599 (.Y(n1181), .A(\u_compute_engine/temp_product[30] ),
        .B(\u_compute_engine/temp_product[29] ));
    AND2X0P5H9R u1600 (.Y(n1182), .A(\u_compute_engine/mul_result[15] ),
        .B(\u_compute_engine/temp_product[23] ));
    OR2X0P5H9R u1602 (.Y(n1184), .A(\u_compute_engine/mul_result[10] ), .B(\u_compute_engine/temp_product[18] ));
    NAND2X1H9R u1607 (.Y(n1189), .A(\u_compute_engine/temp_product[12] ),
        .B(\u_compute_engine/mul_result[4] ));
    NAND3X0P5H9R u1608 (.Y(n1190), .A(\u_compute_engine/temp_product[8] ),
        .B(\u_compute_engine/mul_result[0] ), .C(\u_compute_engine/mul_result[1] ));
    AOAI211X0P5H9R u1609 (.ZN(n1191), .A1(\u_compute_engine/mul_result[0] ),
        .A2(\u_compute_engine/temp_product[8] ), .B(\u_compute_engine/mul_result[1] ),
        .C(\u_compute_engine/temp_product[9] ));
    AOAI211X2H9R u1612 (.ZN(n1194), .A1(n1190), .A2(n1191), .B(n376), .C(n542));
    NAND3X0P7H9R u1613 (.Y(n1195), .A(n376), .B(n1190), .C(n1191));
    NAND3X1H9R u1614 (.Y(n1196), .A(\u_compute_engine/mul_result[3] ), .B(n1195),
        .C(n1194));
    AOAI211X2H9R u1615 (.ZN(n1197), .A1(n1194), .A2(n1195), .B(\u_compute_engine/mul_result[3] ),
        .C(\u_compute_engine/temp_product[11] ));
    NOR2X1H9R u1616 (.Y(n1198), .A(\u_compute_engine/mul_result[4] ), .B(\u_compute_engine/temp_product[12] ));
    AOI31X1H9R u1617 (.Y(n1199), .A0(n1196), .A1(n1189), .A2(n1197), .B0(n1198));
    CGENCONAX1H9R u1618 (.CON(n1200), .A(\u_compute_engine/mul_result[5] ),
        .B(\u_compute_engine/temp_product[13] ), .CI(n1199));
    CGENX1H9R u1619 (.CO(n1201), .A(n372), .B(n538), .CI(n1200));
    CGENCONAX1H9R u1620 (.CON(n1202), .A(n371), .B(n537), .CI(n1201));
    CGENX1H9R u1621 (.CO(n1203), .A(\u_compute_engine/mul_result[8] ), .B(\u_compute_engine/temp_product[16] ),
        .CI(n1202));
    CGENX1H9R u1622 (.CO(n1204), .A(\u_compute_engine/mul_result[9] ), .B(\u_compute_engine/temp_product[17] ),
        .CI(n1203));
    AND2X0P5H9R u1623 (.Y(n1205), .A(\u_compute_engine/mul_result[10] ),
        .B(\u_compute_engine/temp_product[18] ));
    AOAI211X2H9R u1624 (.ZN(n1206), .A1(n1204), .A2(n1184), .B(n1205), .C(\u_compute_engine/temp_product[19] ));
    INVX1H9R u1625 (.Y(n1207), .A(n1206));
    AOI21X1H9R u1627 (.Y(n1209), .A0(n1204), .A1(n1184), .B0(n1205));
    NAND2X1H9R u1628 (.Y(n1210), .A(n1209), .B(n533));
    OAI211X0P5H9R u1629 (.Y(n1211), .A0(\u_compute_engine/mul_result[11] ),
        .A1(n1207), .B0(n1210), .C0(\u_compute_engine/temp_product[20] ));
    OAO211X0P5H9R u1630 (.Z(n1212), .A1(n1207), .A2(\u_compute_engine/mul_result[11] ),
        .B(n1210), .C(\u_compute_engine/temp_product[20] ));
    NAND2X1H9R u1631 (.Y(n1213), .A(n1212), .B(\u_compute_engine/mul_result[12] ));
    NAND2X0P7H9R u1632 (.Y(n1214), .A(n1213), .B(n1211));
    NAND2X1H9R u1633 (.Y(n1215), .A(n1214), .B(\u_compute_engine/temp_product[21] ));
    NAND3BX1H9R u1634 (.Y(n1216), .AN(\u_compute_engine/temp_product[21] ),
        .B(n1211), .C(n1213));
    NAND2X1H9R u1635 (.Y(n1217), .A(n1216), .B(\u_compute_engine/mul_result[13] ));
    AO21X1H9R u1637 (.Y(n1219), .A0(n1215), .A1(n1217), .B0(n530));
    NAND3X1H9R u1638 (.Y(n1220), .A(n1215), .B(n1217), .C(n530));
    AOI21BX1H9R u1639 (.Y(n1221), .A0(n1219), .A1(n364), .B0N(n1220));
    OR2X0P5H9R u1640 (.Y(n1222), .A(\u_compute_engine/mul_result[15] ), .B(\u_compute_engine/temp_product[23] ));
    OA211X0P7H9R u1641 (.Y(n1223), .A0(n1221), .A1(n1182), .B0(\u_compute_engine/temp_product[24] ),
        .C0(n1222));
    AND2X1H9R u1642 (.Y(n1224), .A(n1223), .B(\u_compute_engine/temp_product[25] ));
    AND2X1H9R u1643 (.Y(n1225), .A(n1224), .B(\u_compute_engine/temp_product[26] ));
    NOR2X1H9R u1645 (.Y(n1227), .A(n2127), .B(n1181));
    AND2X1H9R u1646 (.Y(n1228), .A(n1227), .B(\u_compute_engine/temp_product[31] ));
    NOR2X1H9R u1647 (.Y(n1229), .A(\u_compute_engine/temp_product[31] ),
        .B(n1227));
    AND2X0P5H9R u1648 (.Y(n1230), .A(n19621), .B(n2128));
    NOR2X0P5H9R u1650 (.Y(n1232), .A(n2128), .B(n1231));
    AOI21X0P5H9R u1651 (.Y(n1233), .A0(\u_compute_engine/mul_result[15] ),
        .A1(n1230), .B0(n1232));
    OAI31X1H9R u1652 (.Y(n1234), .A0(n1228), .A1(n2128), .A2(n1229), .B0(n1233));
    NOR2X0P5H9R u1655 (.Y(n1237), .A(\u_compute_engine/mul_result[10] ),
        .B(\u_compute_engine/temp_product[10] ));
    NAND3X1H9R u1657 (.Y(n1239), .A(\u_compute_engine/mul_result[1] ), .B(\u_compute_engine/mul_result[0] ),
        .C(\u_compute_engine/temp_product[0] ));
    AOAI211X2H9R u1658 (.ZN(n1240), .A1(\u_compute_engine/mul_result[0] ),
        .A2(\u_compute_engine/temp_product[0] ), .B(\u_compute_engine/mul_result[1] ),
        .C(\u_compute_engine/temp_product[1] ));
    AOI21X1H9R u1659 (.Y(n1241), .A0(n1239), .A1(n1240), .B0(n376));
    AOI31X1H9R u1661 (.Y(n1243), .A0(n1240), .A1(n1239), .A2(n376), .B0(n550));
    OAOI211X2H9R u1662 (.ZN(n1244), .A1(n1241), .A2(n1243), .B(\u_compute_engine/mul_result[3] ),
        .C(\u_compute_engine/temp_product[3] ));
    NOR3X1P4H9R u1663 (.Y(n1245), .A(n1243), .B(n1241), .C(\u_compute_engine/mul_result[3] ));
    NOR3X1H9R u1664 (.Y(n1246), .A(n1244), .B(n374), .C(n1245));
    OAOI211X2H9R u1666 (.ZN(n1248), .A1(n1244), .A2(n1245), .B(n374), .C(n548));
    NOR3X1P4H9R u1667 (.Y(n1249), .A(n1248), .B(n1246_n1), .C(\u_compute_engine/mul_result[5] ));
    OAOI211X2H9R u1668 (.ZN(n1250), .A1(n1248), .A2(n1246), .B(\u_compute_engine/mul_result[5] ),
        .C(\u_compute_engine/temp_product[5] ));
    NOR3X1H9R u1669 (.Y(n1251), .A(n1250), .B(n1249), .C(n372));
    OAOI211X2H9R u1671 (.ZN(n1253), .A1(n1250), .A2(n1249), .B(n372), .C(n546));
    NOR3X1H9R u1672 (.Y(n1254), .A(n21068), .B(n1251), .C(\u_compute_engine/mul_result[7] ));
    OAOI211X2H9R u1673 (.ZN(n1255), .A1(n1251), .A2(n1253), .B(\u_compute_engine/mul_result[7] ),
        .C(\u_compute_engine/temp_product[7] ));
    NAND2X0P5H9R u1674 (.Y(n1256), .A(\u_compute_engine/mul_result[8] ),
        .B(\u_compute_engine/temp_product[8] ));
    NOR2X0P5H9R u1675 (.Y(n1257), .A(\u_compute_engine/mul_result[8] ), .B(\u_compute_engine/temp_product[8] ));
    OAOI211X2H9R u1676 (.ZN(n1258), .A1(n1255), .A2(n1254), .B(n1256), .C(n1257));
    CGENX1H9R u1677 (.CO(n1259), .A(\u_compute_engine/mul_result[9] ), .B(\u_compute_engine/temp_product[9] ),
        .CI(n1258));
    NAND2X0P5H9R u1678 (.Y(n1260), .A(\u_compute_engine/mul_result[10] ),
        .B(\u_compute_engine/temp_product[10] ));
    OAI2XB1X0P5H9R u1679 (.Y(n1261), .A0(n1237), .A1N(n1259), .B0(n1260));
    AND2X1H9R u1680 (.Y(n1262), .A(n1261), .B(\u_compute_engine/temp_product[11] ));
    OR2X0P5H9R u1681 (.Y(n1263), .A(n1261), .B(\u_compute_engine/temp_product[11] ));
    OAOI211X4H9R u1682 (.ZN(n1264), .A1(n1262), .A2(\u_compute_engine/mul_result[11] ),
        .B(n1263), .C(\u_compute_engine/mul_result[12] ));
    OAI211X1H9R u1683 (.Y(n1265), .A0(\u_compute_engine/mul_result[11] ),
        .A1(n1262), .B0(n1263), .C0(\u_compute_engine/mul_result[12] ));
    OAOI211X2H9R u1685 (.ZN(n1267), .A1(n540), .A2(n1264), .B(n1265), .C(n365));
    OAI211X1H9R u1686 (.Y(n1268), .A0(n540), .A1(n1264), .B0(n365), .C0(n1265));
    OAI21X1H9R u1687 (.Y(n1269), .A0(\u_compute_engine/temp_product[13] ),
        .A1(n1267), .B0(n1268));
    CGENX1H9R u1688 (.CO(n1270), .A(n364), .B(n538), .CI(n1269));
    CGENCONAX2H9R u1689 (.CON(n1271), .A(n363), .B(n537), .CI(n1270));
    AND4X1P4H9R u1690 (.Y(n1272), .A(n1271), .B(\u_compute_engine/temp_product[17] ),
        .C(\u_compute_engine/temp_product[16] ), .D(\u_compute_engine/temp_product[18] ));
    NAND3X3H9R u1691 (.Y(n1273), .A(n1272), .B(\u_compute_engine/temp_product[19] ),
        .C(\u_compute_engine/temp_product[20] ));
    NOR2BX3H9R u1692 (.Y(n1274), .AN(\u_compute_engine/temp_product[21] ),
        .B(n1273));
    AND4X2H9R u1693 (.Y(n1275), .A(n1274), .B(\u_compute_engine/temp_product[23] ),
        .C(\u_compute_engine/temp_product[22] ), .D(\u_compute_engine/temp_product[24] ));
    AND2X3H9R u1694 (.Y(n1276), .A(n1275), .B(\u_compute_engine/temp_product[25] ));
    NAND3X0P5H9R u1695 (.Y(n1277), .A(\u_compute_engine/temp_product[28] ),
        .B(\u_compute_engine/temp_product[27] ), .C(\u_compute_engine/temp_product[26] ));
    NOR2X0P5H9R u1696 (.Y(n1278), .A(n1277), .B(n1181));
    AOI21X0P5H9R u1697 (.Y(n1279), .A0(n1278), .A1(n1276), .B0(\u_compute_engine/temp_product[31] ));
    OR2X1H9R u1698 (.Y(n1280), .A(n1279), .B(n2301));
    AOI31X1H9R u1699 (.Y(n1281), .A0(\u_compute_engine/temp_product[31] ),
        .A1(n1276), .A2(n1278), .B0(n1280));
    OA22X1H9R u1700 (.Y(\u_compute_engine/n195 ), .A0(\u_compute_engine/temp_product[31] ),
        .A1(n1179), .B0(n1281), .B1(n1234));
    NOR2BX4H9R u1701 (.Y(n1282), .AN(n1276), .B(n1277));
    NAND2X1P4H9R u1702 (.Y(n1283), .A(n1282), .B(\u_compute_engine/temp_product[29] ));
    OAI211X1H9R u1703 (.Y(n1284), .A0(n1283), .A1(n1176), .B0(n2126), .C0(\u_compute_engine/temp_product[30] ));
    OR2X0P5H9R u1704 (.Y(n1285), .A(n2399), .B(n1173));
    OR3X0P5H9R u1705 (.Y(n1286), .A(\u_compute_engine/temp_product[30] ),
        .B(n1283), .C(n1285));
    AND3X1H9R u1706 (.Y(n1287), .A(n1225), .B(\u_compute_engine/temp_product[27] ),
        .C(\u_compute_engine/temp_product[28] ));
    AND2X1H9R u1707 (.Y(n1288), .A(n1287), .B(\u_compute_engine/temp_product[29] ));
    OR2X0P5H9R u1708 (.Y(n1289), .A(n1288), .B(\u_compute_engine/temp_product[30] ));
    NAND4BX0P5H9R u1709 (.Y(n1290), .AN(n1227), .B(n1289), .C(n2301), .D(n651_n1));
    NAND2X0P5H9R u1710 (.Y(n1291), .A(\u_compute_engine/mul_result[14] ),
        .B(n1230));
    NAND4X1H9R u1711 (.Y(\u_compute_engine/n196 ), .A(n1286), .B(n1284),
        .C(n1290), .D(n1291));
    NOR2X0P5H9R u1712 (.Y(n1292), .A(\u_compute_engine/temp_product[29] ),
        .B(n1179));
    NOR2X1H9R u1713 (.Y(n1293), .A(\u_compute_engine/temp_product[29] ),
        .B(n1287));
    NOR3X1H9R u1714 (.Y(n1294), .A(n2128), .B(n1288), .C(n1293));
    AOI211X0P5H9R u1715 (.Y(n1295), .A0(\u_compute_engine/mul_result[13] ),
        .A1(n1230), .B0(n1232), .C0(n1294));
    AOI211X0P7H9R u1716 (.Y(n1296), .A0(\u_compute_engine/temp_product[29] ),
        .A1(n1282), .B0(n1292), .C0(n2301));
    OAI21X1H9R u1717 (.Y(n1297), .A0(\u_compute_engine/temp_product[29] ),
        .A1(n1282), .B0(n1296));
    OAI21X1H9R u1718 (.Y(\u_compute_engine/n197 ), .A0(n1292), .A1(n1295),
        .B0(n1297));
    NAND2X0P5H9R u1719 (.Y(n1298), .A(\u_compute_engine/temp_product[27] ),
        .B(n1225));
    NAND2BX1H9R u1720 (.Y(n1299), .AN(\u_compute_engine/temp_product[28] ),
        .B(n1298));
    AOI32X1H9R u1721 (.Y(n1300), .A0(n1176), .A1(n1299), .A2(n2127), .B0(n1230),
        .B1(\u_compute_engine/mul_result[12] ));
    AND2X1H9R u1722 (.Y(n1301), .A(n1276), .B(\u_compute_engine/temp_product[26] ));
    NAND2X1H9R u1723 (.Y(n1302), .A(n1301), .B(\u_compute_engine/temp_product[27] ));
    AOI21X1H9R u1724 (.Y(n1303), .A0(n1302), .A1(n1300), .B0(n1232));
    OAI211X0P5H9R u1725 (.Y(n1304), .A0(n2301), .A1(n1282), .B0(n1300), .C0(n1179));
    OA21X0P7H9R u1726 (.Y(\u_compute_engine/n198 ), .A0(n1303), .A1(\u_compute_engine/temp_product[28] ),
        .B0(n1304));
    NOR2X0P5H9R u1727 (.Y(n1305), .A(\u_compute_engine/temp_product[27] ),
        .B(n1301));
    NAND2X0P7H9R u1729 (.Y(n1307), .A(n2130), .B(n1302));
    OR2X0P5H9R u1730 (.Y(n1308), .A(n1225), .B(\u_compute_engine/temp_product[27] ));
    AOI32X1H9R u1731 (.Y(n1309), .A0(n1176), .A1(n1308), .A2(n1298), .B0(n1230),
        .B1(\u_compute_engine/mul_result[11] ));
    NAND2X0P5H9R u1732 (.Y(n1310), .A(\u_compute_engine/temp_product[27] ),
        .B(n1232));
    OAI221X1H9R u1733 (.Y(\u_compute_engine/n199 ), .A0(n1307), .A1(n1305),
        .B0(n1309), .B1(n1232), .C0(n1310));
    NOR2X0P5H9R u1734 (.Y(n1311), .A(\u_compute_engine/temp_product[26] ),
        .B(n1276));
    NOR2X0P5H9R u1735 (.Y(n1312), .A(\u_compute_engine/temp_product[26] ),
        .B(n1224));
    NOR3X0P5H9R u1736 (.Y(n1313), .A(n2128), .B(n1312), .C(n1225));
    AOI211X1H9R u1737 (.Y(n1314), .A0(\u_compute_engine/mul_result[10] ),
        .A1(n1230), .B0(n1232), .C0(n1313));
    OAI31X0P7H9R u1738 (.Y(n1315), .A0(n2301), .A1(n1311), .A2(n1301), .B0(n1314));
    OA21X0P7H9R u1739 (.Y(\u_compute_engine/n200 ), .A0(\u_compute_engine/temp_product[26] ),
        .A1(n1179), .B0(n1315));
    NOR2X0P5H9R u1741 (.Y(n1317), .A(n2301), .B(n1276));
    OAI21X0P5H9R u1742 (.Y(n1318), .A0(\u_compute_engine/temp_product[25] ),
        .A1(n1275), .B0(n1317));
    NOR2X0P5H9R u1743 (.Y(n1319), .A(\u_compute_engine/temp_product[25] ),
        .B(n1223));
    NOR3X0P5H9R u1744 (.Y(n1320), .A(n2128), .B(n1319), .C(n1224));
    AOI211X0P5H9R u1745 (.Y(n1321), .A0(\u_compute_engine/mul_result[9] ),
        .A1(n1230), .B0(n1320), .C0(n1232));
    AOI22X1H9R u1746 (.Y(\u_compute_engine/n201 ), .A0(n527), .A1(n1232),
        .B0(n1318), .B1(n1321));
    NAND2X0P5H9R u1748 (.Y(n1323), .A(\u_compute_engine/temp_product[22] ),
        .B(n1274));
    NOR2BX1H9R u1749 (.Y(n1324), .AN(\u_compute_engine/temp_product[23] ),
        .B(n1323));
    NOR2X0P5H9R u1750 (.Y(n1325), .A(n2301), .B(n1275));
    OAI21X1H9R u1751 (.Y(n1326), .A0(\u_compute_engine/temp_product[24] ),
        .A1(n1324), .B0(n1325));
    AOI22X1H9R u1755 (.Y(\u_compute_engine/n202 ), .A0(n528), .A1(n1232),
        .B0(n1326), .B1(n1329));
    AOI21X0P5H9R u1756 (.Y(n1330), .A0(\u_compute_engine/temp_product[22] ),
        .A1(n1274), .B0(\u_compute_engine/temp_product[23] ));
    NOR2BX0P5H9R u1757 (.Y(n1331), .AN(n1222), .B(n1182));
    OAI21X0P5H9R u1758 (.Y(n1332), .A0(n1331), .A1(n1221), .B0(n1176));
    AOI21X0P5H9R u1759 (.Y(n1333), .A0(n1221), .A1(n1331), .B0(n1332));
    AOI211X0P5H9R u1760 (.Y(n1334), .A0(\u_compute_engine/mul_result[7] ),
        .A1(n1230), .B0(n1333), .C0(n1232));
    OAI31X1H9R u1761 (.Y(n1335), .A0(n1324), .A1(n2301), .A2(n1330), .B0(n1334));
    OA21X1H9R u1762 (.Y(\u_compute_engine/n203 ), .A0(\u_compute_engine/temp_product[23] ),
        .A1(n1179), .B0(n1335));
    OR2X0P5H9R u1763 (.Y(n1336), .A(n1274), .B(\u_compute_engine/temp_product[22] ));
    NAND3BX1H9R u1764 (.Y(n1337), .AN(n2301), .B(n1323), .C(n1336));
    AOI22X1H9R u1768 (.Y(\u_compute_engine/n204 ), .A0(n530), .A1(n1232),
        .B0(n1337), .B1(n1340));
    AOAI211X0P5H9R u1769 (.ZN(n1341), .A1(n1216), .A2(n1215), .B(\u_compute_engine/mul_result[13] ),
        .C(n1176));
    AOI31X0P5H9R u1770 (.Y(n1342), .A0(\u_compute_engine/mul_result[13] ),
        .A1(n1215), .A2(n1216), .B0(n1341));
    AOI211X0P5H9R u1771 (.Y(n1343), .A0(\u_compute_engine/mul_result[5] ),
        .A1(n1230), .B0(n1232), .C0(n1342));
    AOI21X0P5H9R u1772 (.Y(n1344), .A0(n1343), .A1(n1273), .B0(n1232));
    OAI21X0P5H9R u1773 (.Y(n1345), .A0(n1231), .A1(n1274), .B0(n1343));
    OA21X1H9R u1774 (.Y(\u_compute_engine/n205 ), .A0(\u_compute_engine/temp_product[21] ),
        .A1(n1344), .B0(n1345));
    NAND2X0P5H9R u1775 (.Y(n1346), .A(\u_compute_engine/temp_product[19] ),
        .B(n1272));
    AOAI211X0P5H9R u1776 (.ZN(n1347), .A1(n1212), .A2(n1211), .B(\u_compute_engine/mul_result[12] ),
        .C(n1176));
    AOI31X0P5H9R u1777 (.Y(n1348), .A0(\u_compute_engine/mul_result[12] ),
        .A1(n1211), .A2(n1212), .B0(n1347));
    AOI211X0P5H9R u1778 (.Y(n1349), .A0(\u_compute_engine/mul_result[4] ),
        .A1(n1230), .B0(n1348), .C0(n1232));
    AOI21X1H9R u1779 (.Y(n1350), .A0(n1346), .A1(n1349), .B0(n1232));
    OAI2XB1X0P5H9R u1780 (.Y(n1351), .A0(n2301), .A1N(n1273), .B0(n1349));
    OA21X1H9R u1781 (.Y(\u_compute_engine/n206 ), .A0(\u_compute_engine/temp_product[20] ),
        .A1(n1350), .B0(n1351));
    NAND2X1H9R u1786 (.Y(n1356), .A(n2126), .B(n1346));
    OAI2XB1X0P5H9R u1787 (.Y(n1357), .A0(n1272), .A1N(n1355), .B0(n1179));
    AOI22X1H9R u1788 (.Y(\u_compute_engine/n207 ), .A0(n1356), .A1(n1355),
        .B0(n1357), .B1(n533));
    NAND3X0P5H9R u1789 (.Y(n1358), .A(\u_compute_engine/temp_product[17] ),
        .B(\u_compute_engine/temp_product[16] ), .C(n1271));
    AOI211X0P5H9R u1795 (.Y(n1364), .A0(\u_compute_engine/mul_result[2] ),
        .A1(n1230), .B0(n1363), .C0(n1232));
    AOI21X1H9R u1796 (.Y(n1365), .A0(n1358), .A1(n1364), .B0(n1232));
    OAI21X0P5H9R u1797 (.Y(n1366), .A0(n1231), .A1(n1272), .B0(n1364));
    OA21X1H9R u1798 (.Y(\u_compute_engine/n208 ), .A0(\u_compute_engine/temp_product[18] ),
        .A1(n1365), .B0(n1366));
    NAND2X0P5H9R u1800 (.Y(n1368), .A(\u_compute_engine/temp_product[16] ),
        .B(n1271));
    XOR2X0P7H9R u1801 (.Y(n1369), .A(\u_compute_engine/temp_product[17] ),
        .B(n1368));
    OAI21X0P5H9R u1802 (.Y(n1370), .A0(\u_compute_engine/mul_result[9] ),
        .A1(n1203), .B0(n1231));
    AOI221X1H9R u1806 (.Y(\u_compute_engine/n209 ), .A0(n377), .A1(n1230),
        .B0(n1369), .B1(n2130), .C0(n1373));
    NAND2X0P5H9R u1808 (.Y(n1375), .A(\u_compute_engine/temp_product[16] ),
        .B(n1202));
    OR2X0P5H9R u1809 (.Y(n1376), .A(\u_compute_engine/temp_product[16] ),
        .B(n1202));
    OR2X0P5H9R u1816 (.Y(n1382), .A(n371), .B(n1201));
    NAND2X0P5H9R u1817 (.Y(n1383), .A(n371), .B(n1201));
    XNOR2X0P5H9R u1824 (.Y(n1390), .A(n363), .B(n1270));
    NOR2X0P5H9R u1836 (.Y(n1400), .A(\u_compute_engine/mul_result[5] ), .B(n1199));
    NOR2BX0P5H9R u1844 (.Y(n1407), .AN(n1265), .B(n1264));
    NAND2X0P5H9R u1847 (.Y(n1410), .A(n540), .B(n374));
    NAND2X0P5H9R u1848 (.Y(n1411), .A(n1196), .B(n1197));
    NAND2X0P5H9R u1860 (.Y(n1421), .A(n1190), .B(n1191));
    XNOR2X0P5H9R u1861 (.Y(n1422), .A(n1421), .B(n376));
    NOR2X0P5H9R u1878 (.Y(n1437), .A(n1254), .B(n1255));
    NAND2BX0P5H9R u1879 (.Y(n1438), .AN(n1257), .B(n1256));
    NOR2X0P5H9R u1890 (.Y(n1447), .A(n1176), .B(n1251_n1));
    OAI21X0P5H9R u1891 (.Y(n1448), .A0(n1249_n1), .A1(n1250_n1), .B0(n372));
    AOI21X0P5H9R u1892 (.Y(n1449), .A0(n1448), .A1(n1447), .B0(\u_compute_engine/temp_product[6] ));
    AOI211X0P5H9R u1893 (.Y(\u_compute_engine/n222 ), .A0(n1253), .A1(n1447),
        .B0(n1449), .C0(n1230));
    NOR2X0P5H9R u1898 (.Y(n1453), .A(n1176), .B(n1246_n1));
    AOI211X0P5H9R u1901 (.Y(\u_compute_engine/n226 ), .A0(n1248_n1), .A1(n1453),
        .B0(n1455), .C0(n1230));
    AND2X0P5H9R u1906 (.Y(n1459), .A(\u_compute_engine/mul_result[0] ), .B(\u_compute_engine/temp_product[0] ));
    AND2X0P5H9R u1907 (.Y(n1460), .A(\u_compute_engine/mul_result[1] ), .B(n1459));
    OR2X0P5H9R u1908 (.Y(n1461), .A(\u_compute_engine/mul_result[1] ), .B(n1459));
    AND2X0P5H9R u1909 (.Y(n1462), .A(\u_compute_engine/temp_product[1] ),
        .B(n1461));
    NOR2X0P5H9R u1915 (.Y(n1467), .A(n1176), .B(n1460));
    AO21X0P5H9R u1936 (.Y(\u_compute_engine/n331 ), .A0(\u_compute_engine/temp_product[23] ),
        .A1(\u_compute_engine/n328 ), .B0(\u_compute_engine/global_acc[23] ));
    AO21X0P5H9R u1937 (.Y(\u_compute_engine/n332 ), .A0(\u_compute_engine/temp_product[22] ),
        .A1(\u_compute_engine/n328 ), .B0(\u_compute_engine/global_acc[22] ));
    AO21X0P5H9R u1938 (.Y(\u_compute_engine/n333 ), .A0(\u_compute_engine/temp_product[21] ),
        .A1(\u_compute_engine/n328 ), .B0(\u_compute_engine/global_acc[21] ));
    NAND3X0P5H9R u1943 (.Y(n1488), .A(mode_d2), .B(\u_compute_engine/temp_product[0] ),
        .C(\u_compute_engine/global_acc[0] ));
    OR2X0P5H9R u1947 (.Y(n1492), .A(n1491), .B(\u_compute_engine/temp_product[2] ));
    NAND2X0P5H9R u1964 (.Y(n1509), .A(\u_compute_engine/global_acc[10] ),
        .B(mode_d2_n1));
    CGENCONAX1H9R u1965 (.CON(n1510), .A(n542), .B(n1509), .CI(n1508));
    AOI21X1H9R u1966 (.Y(n1511), .A0(\u_compute_engine/temp_product[11] ),
        .A1(n1510), .B0(\u_compute_engine/temp_product[12] ));
    OR2X0P5H9R u1969 (.Y(n1514), .A(n1510), .B(\u_compute_engine/temp_product[11] ));
    NAND3X1H9R u1970 (.Y(n1515), .A(n1514), .B(\u_compute_engine/global_acc[11] ),
        .C(mode_d2_n1));
    OAI211X1H9R u1973 (.Y(n1518), .A0(\u_compute_engine/temp_product[13] ),
        .A1(n1517), .B0(\u_compute_engine/global_acc[13] ), .C0(mode_d2_n1));
    AND2X1H9R u1975 (.Y(n1520), .A(n1517), .B(\u_compute_engine/temp_product[13] ));
    AND2X0P5H9R u1976 (.Y(n1521), .A(mode_d2_n1), .B(\u_compute_engine/global_acc[14] ));
    CGENCONAX1H9R u1981 (.CON(n1526), .A(\u_compute_engine/temp_product[16] ),
        .B(\u_compute_engine/global_acc[16] ), .CI(n1525));
    OAO211X0P5H9R u1988 (.Z(\u_compute_engine/n335 ), .A1(n1529), .A2(\u_compute_engine/temp_product[19] ),
        .B(\u_compute_engine/n328 ), .C(\u_compute_engine/global_acc[19] ));
    AO21X0P5H9R u1989 (.Y(\u_compute_engine/n336 ), .A0(\u_compute_engine/temp_product[18] ),
        .A1(\u_compute_engine/n328 ), .B0(\u_compute_engine/global_acc[18] ));
    OAO211X0P5H9R u1993 (.Z(\u_compute_engine/n338 ), .A1(n1525), .A2(\u_compute_engine/temp_product[16] ),
        .B(\u_compute_engine/n328 ), .C(\u_compute_engine/global_acc[16] ));
    OAO211X0P5H9R u1994 (.Z(\u_compute_engine/n339 ), .A1(n1523), .A2(\u_compute_engine/temp_product[15] ),
        .B(\u_compute_engine/n328 ), .C(\u_compute_engine/global_acc[15] ));
    OAO211X0P5H9R u1997 (.Z(\u_compute_engine/n341 ), .A1(\u_compute_engine/temp_product[13] ),
        .A2(n1517), .B(\u_compute_engine/n328 ), .C(\u_compute_engine/global_acc[13] ));
    NAND2X0P5H9R u1998 (.Y(n1535), .A(n1515), .B(n1511));
    AO21X0P5H9R u1999 (.Y(\u_compute_engine/n342 ), .A0(\u_compute_engine/n328 ),
        .A1(n1535), .B0(\u_compute_engine/global_acc[12] ));
    AO21X0P5H9R u2000 (.Y(\u_compute_engine/n343 ), .A0(\u_compute_engine/n328 ),
        .A1(n1514), .B0(\u_compute_engine/global_acc[11] ));
    OAI2XB1X0P5H9R u2001 (.Y(n1536), .A0(\u_compute_engine/temp_product[10] ),
        .A1N(n1508), .B0(\u_compute_engine/n328 ));
    NAND2BX0P5H9R u2002 (.Y(\u_compute_engine/n344 ), .AN(\u_compute_engine/global_acc[10] ),
        .B(n1536));
    OAO211X0P5H9R u2008 (.Z(\u_compute_engine/n347 ), .A1(\u_compute_engine/temp_product[7] ),
        .A2(n1502), .B(\u_compute_engine/n328 ), .C(\u_compute_engine/global_acc[7] ));
    OAI2XB1X0P5H9R u2009 (.Y(n1540), .A0(\u_compute_engine/temp_product[6] ),
        .A1N(n1500), .B0(\u_compute_engine/n328 ));
    NAND2BX0P5H9R u2010 (.Y(\u_compute_engine/n348 ), .AN(\u_compute_engine/global_acc[6] ),
        .B(n1540));
    AO21X0P5H9R u2011 (.Y(\u_compute_engine/n349 ), .A0(\u_compute_engine/n328 ),
        .A1(\u_compute_engine/temp_product[5] ), .B0(\u_compute_engine/global_acc[5] ));
    AO21X0P5H9R u2014 (.Y(\u_compute_engine/n351 ), .A0(\u_compute_engine/n328 ),
        .A1(\u_compute_engine/temp_product[3] ), .B0(\u_compute_engine/global_acc[3] ));
    AO21X0P5H9R u2015 (.Y(\u_compute_engine/n352 ), .A0(\u_compute_engine/n328 ),
        .A1(n1492), .B0(\u_compute_engine/global_acc[2] ));
    AO21X0P5H9R u2018 (.Y(\u_compute_engine/n354 ), .A0(\u_compute_engine/n328 ),
        .A1(\u_compute_engine/temp_product[0] ), .B0(\u_compute_engine/global_acc[0] ));
    AND4X0P5H9R u2053 (.Y(n1546), .A(in_ready), .B(\u_spi_rx/bit_cnt[2] ),
        .C(\u_spi_rx/bit_cnt[1] ), .D(\u_spi_rx/bit_cnt[0] ));
    NAND2X1H9R u2054 (.Y(n1547), .A(\u_spi_rx/bit_cnt[3] ), .B(n1546));
    DFFRX2H9R \u_spi_rx/data_B_reg[2]  (.Q(\rx_data_B[2] ), .QN(n2055), .CK(clk),
        .D(\u_spi_rx/n110 ), .RDN(sys_rst_n_n1));
    DFFRX2H9R \u_spi_rx/data_B_reg[1]  (.Q(\rx_data_B[1] ), .QN(n2056), .CK(clk),
        .D(\u_spi_rx/n111 ), .RDN(sys_rst_n_n1));
    XNOR2X0P5H9R u2401 (.Y(\u_compute_engine/u_mul8x8/n150 ), .A(n737), .B(n766_n1));
    XNOR2X0P7H9R u2404 (.Y(\u_compute_engine/u_mul8x8/n177 ), .A(n1020),
        .B(n1026));
    MUXIT2X0P5H9R u2407 (.Y(\u_spi_tx/n105 ), .A(n1152), .B(n1149), .S0(\u_spi_tx/out_cnt[1] ));
    XNOR2X0P5H9R u2408 (.Y(\u_sync_fifo/n43 ), .A(\u_sync_fifo/wr_ptr[2] ),
        .B(n1155));
    XOR2X0P5H9R u2409 (.Y(\u_sync_fifo/n44 ), .A(\u_sync_fifo/wr_ptr[1] ),
        .B(n1154));
    XOR2X0P5H9R u2410 (.Y(\u_sync_fifo/n52 ), .A(\u_sync_fifo/rd_ptr[2] ),
        .B(n1159));
    XNOR2X0P5H9R u2411 (.Y(\u_sync_fifo/n54 ), .A(\u_sync_fifo/rd_ptr[0] ),
        .B(n1158));
    XOR2X0P5H9R u2473 (.Y(\u_spi_rx/n80 ), .A(in_ready), .B(\u_spi_rx/bit_cnt[0] ));
    INVX1H9R u2638 (.Y(n2126), .A(n1231));
    INVX1H9R u2639 (.Y(n2127), .A(n1287));
    INVX1H9R u2640 (.Y(n2128), .A(n1176));
    INVX1H9R u2642 (.Y(n2130), .A(n1285));
    DFFRQX2H9R mode_d2_reg (.Q(mode_d2), .CK(clk), .D(mode_d1), .RDN(rst_n));
    DFFRQX2H9R mode_d1_reg (.Q(mode_d1), .CK(clk), .D(mode), .RDN(rst_n));
    DFFRQX2H9R \u_compute_engine/u_mul8x8/pp_stage1_reg[11]  (.Q(\u_compute_engine/u_mul8x8/pp_stage1[11] ),
        .CK(clk), .D(\u_compute_engine/u_mul8x8/n178 ), .RDN(sys_rst_n_n1));
    DFFRQX2H9R \u_compute_engine/u_mul8x8/pp_stage1_reg[10]  (.Q(\u_compute_engine/u_mul8x8/pp_stage1[10] ),
        .CK(clk), .D(\u_compute_engine/u_mul8x8/n179 ), .RDN(sys_rst_n_n1));
    DFFRQX2H9R \u_compute_engine/u_mul8x8/pp_stage1_reg[9]  (.Q(\u_compute_engine/u_mul8x8/pp_stage1[9] ),
        .CK(clk), .D(\u_compute_engine/u_mul8x8/n180 ), .RDN(sys_rst_n_n1));
    DFFRQX2H9R \u_compute_engine/u_mul8x8/pp_stage1_reg[6]  (.Q(\u_compute_engine/u_mul8x8/pp_stage1[6] ),
        .CK(clk), .D(\u_compute_engine/u_mul8x8/n166 ), .RDN(sys_rst_n_n1));
    DFFRQX2H9R \u_compute_engine/u_mul8x8/pp_stage1_reg[4]  (.Q(\u_compute_engine/u_mul8x8/pp_stage1[4] ),
        .CK(clk), .D(\u_compute_engine/u_mul8x8/n134 ), .RDN(sys_rst_n_n1));
    DFFRQX2H9R \u_compute_engine/u_mul8x8/pp_stage1_reg[3]  (.Q(\u_compute_engine/u_mul8x8/pp_stage1[3] ),
        .CK(clk), .D(\u_compute_engine/u_mul8x8/n118 ), .RDN(sys_rst_n_n1));
    DFFRQX2H9R \u_compute_engine/u_mul8x8/pp_stage1_reg[2]  (.Q(\u_compute_engine/u_mul8x8/pp_stage1[2] ),
        .CK(clk), .D(\u_compute_engine/u_mul8x8/n102 ), .RDN(sys_rst_n_n1));
    DFFRQX2H9R \u_compute_engine/u_mul8x8/pp_stage1_reg[1]  (.Q(\u_compute_engine/u_mul8x8/pp_stage1[1] ),
        .CK(clk), .D(\u_compute_engine/u_mul8x8/n86 ), .RDN(sys_rst_n_n1));
    DFFRQX1H9R \u_compute_engine/u_mul8x8/pp_stage1_reg[0]  (.Q(\u_compute_engine/u_mul8x8/pp_stage1[0] ),
        .CK(clk), .D(\u_compute_engine/u_mul8x8/pp[0][0] ), .RDN(sys_rst_n_n1));
    DFFRQX2H9R \u_compute_engine/u_mul8x8/wallace_stage2_reg[15]  (.Q(\u_compute_engine/u_mul8x8/ks_result[15] ),
        .CK(clk), .D(\u_compute_engine/u_mul8x8/pp_stage1[15] ), .RDN(sys_rst_n_n1));
    DFFRQX2H9R \u_compute_engine/u_mul8x8/wallace_stage2_reg[14]  (.Q(\u_compute_engine/u_mul8x8/ks_result[14] ),
        .CK(clk), .D(\u_compute_engine/u_mul8x8/pp_stage1[14] ), .RDN(sys_rst_n_n1));
    DFFRQX2H9R \u_compute_engine/u_mul8x8/wallace_stage2_reg[13]  (.Q(\u_compute_engine/u_mul8x8/ks_result[13] ),
        .CK(clk), .D(\u_compute_engine/u_mul8x8/pp_stage1[13] ), .RDN(sys_rst_n_n1));
    DFFRQX2H9R \u_compute_engine/u_mul8x8/wallace_stage2_reg[12]  (.Q(\u_compute_engine/u_mul8x8/ks_result[12] ),
        .CK(clk), .D(\u_compute_engine/u_mul8x8/pp_stage1[12] ), .RDN(sys_rst_n_n1));
    DFFRQX2H9R \u_compute_engine/u_mul8x8/wallace_stage2_reg[11]  (.Q(\u_compute_engine/u_mul8x8/ks_result[11] ),
        .CK(clk), .D(\u_compute_engine/u_mul8x8/pp_stage1[11] ), .RDN(sys_rst_n_n1));
    DFFRQX2H9R \u_compute_engine/u_mul8x8/wallace_stage2_reg[10]  (.Q(\u_compute_engine/u_mul8x8/ks_result[10] ),
        .CK(clk), .D(\u_compute_engine/u_mul8x8/pp_stage1[10] ), .RDN(sys_rst_n_n1));
    DFFRQX2H9R \u_compute_engine/u_mul8x8/wallace_stage2_reg[9]  (.Q(\u_compute_engine/u_mul8x8/ks_result[9] ),
        .CK(clk), .D(\u_compute_engine/u_mul8x8/pp_stage1[9] ), .RDN(sys_rst_n_n1));
    DFFRQX2H9R \u_compute_engine/u_mul8x8/wallace_stage2_reg[8]  (.Q(\u_compute_engine/u_mul8x8/ks_result[8] ),
        .CK(clk), .D(\u_compute_engine/u_mul8x8/pp_stage1[8] ), .RDN(sys_rst_n_n1));
    DFFRQX2H9R \u_compute_engine/u_mul8x8/wallace_stage2_reg[7]  (.Q(\u_compute_engine/u_mul8x8/ks_result[7] ),
        .CK(clk), .D(\u_compute_engine/u_mul8x8/pp_stage1[7] ), .RDN(sys_rst_n_n1));
    DFFRQX2H9R \u_compute_engine/u_mul8x8/wallace_stage2_reg[6]  (.Q(\u_compute_engine/u_mul8x8/ks_result[6] ),
        .CK(clk), .D(\u_compute_engine/u_mul8x8/pp_stage1[6] ), .RDN(sys_rst_n));
    DFFRQX2H9R \u_compute_engine/u_mul8x8/wallace_stage2_reg[5]  (.Q(\u_compute_engine/u_mul8x8/ks_result[5] ),
        .CK(clk), .D(\u_compute_engine/u_mul8x8/pp_stage1[5] ), .RDN(sys_rst_n));
    DFFRQX2H9R \u_compute_engine/u_mul8x8/wallace_stage2_reg[4]  (.Q(\u_compute_engine/u_mul8x8/ks_result[4] ),
        .CK(clk), .D(\u_compute_engine/u_mul8x8/pp_stage1[4] ), .RDN(sys_rst_n));
    DFFRQX2H9R \u_compute_engine/u_mul8x8/wallace_stage2_reg[3]  (.Q(\u_compute_engine/u_mul8x8/ks_result[3] ),
        .CK(clk), .D(\u_compute_engine/u_mul8x8/pp_stage1[3] ), .RDN(sys_rst_n));
    DFFRQX2H9R \u_compute_engine/u_mul8x8/wallace_stage2_reg[2]  (.Q(\u_compute_engine/u_mul8x8/ks_result[2] ),
        .CK(clk), .D(\u_compute_engine/u_mul8x8/pp_stage1[2] ), .RDN(sys_rst_n));
    DFFRQX2H9R \u_compute_engine/u_mul8x8/wallace_stage2_reg[1]  (.Q(\u_compute_engine/u_mul8x8/ks_result[1] ),
        .CK(clk), .D(\u_compute_engine/u_mul8x8/pp_stage1[1] ), .RDN(sys_rst_n));
    DFFRQX2H9R \u_compute_engine/u_mul8x8/wallace_stage2_reg[0]  (.Q(\u_compute_engine/u_mul8x8/ks_result[0] ),
        .CK(clk), .D(\u_compute_engine/u_mul8x8/pp_stage1[0] ), .RDN(sys_rst_n_n1));
    DFFRQX2H9R \u_compute_engine/u_mul8x8/prod_reg[12]  (.Q(\u_compute_engine/mul_result[12] ),
        .CK(clk), .D(\u_compute_engine/u_mul8x8/ks_result[12] ), .RDN(sys_rst_n_n1));
    DFFRQX2H9R \u_compute_engine/u_mul8x8/prod_reg[11]  (.Q(\u_compute_engine/mul_result[11] ),
        .CK(clk), .D(\u_compute_engine/u_mul8x8/ks_result[11] ), .RDN(sys_rst_n_n1));
    DFFRQX2H9R \u_compute_engine/u_mul8x8/prod_reg[10]  (.Q(\u_compute_engine/mul_result[10] ),
        .CK(clk), .D(\u_compute_engine/u_mul8x8/ks_result[10] ), .RDN(sys_rst_n_n1));
    DFFRQX2H9R \u_compute_engine/u_mul8x8/prod_reg[9]  (.Q(\u_compute_engine/mul_result[9] ),
        .CK(clk), .D(\u_compute_engine/u_mul8x8/ks_result[9] ), .RDN(sys_rst_n_n1));
    DFFRQX2H9R \u_compute_engine/u_mul8x8/prod_reg[8]  (.Q(\u_compute_engine/mul_result[8] ),
        .CK(clk), .D(\u_compute_engine/u_mul8x8/ks_result[8] ), .RDN(sys_rst_n_n1));
    DFFRQX2H9R \u_compute_engine/u_mul8x8/prod_reg[5]  (.Q(\u_compute_engine/mul_result[5] ),
        .CK(clk), .D(\u_compute_engine/u_mul8x8/ks_result[5] ), .RDN(sys_rst_n_n1));
    DFFRQX2H9R \u_compute_engine/u_mul8x8/prod_reg[3]  (.Q(\u_compute_engine/mul_result[3] ),
        .CK(clk), .D(\u_compute_engine/u_mul8x8/ks_result[3] ), .RDN(sys_rst_n_n1));
    DFFRQX4H9R \u_compute_engine/u_mul8x8/prod_reg[0]  (.Q(\u_compute_engine/mul_result[0] ),
        .CK(clk), .D(\u_compute_engine/u_mul8x8/ks_result[0] ), .RDN(sys_rst_n_n1));
    DFFRQX2H9R \u_compute_engine/u_mul8x8/pp_stage1_reg[15]  (.Q(\u_compute_engine/u_mul8x8/pp_stage1[15] ),
        .CK(clk), .D(\u_compute_engine/u_mul8x8/n174 ), .RDN(sys_rst_n_n1));
    DFFRQX2H9R \u_spi_tx/shift_reg_reg[0]  (.Q(\u_spi_tx/shift_reg[0] ),
        .CK(clk), .D(\u_spi_tx/n100 ), .RDN(sys_rst_n_n1));
    DFFRQX2H9R \u_spi_tx/out_cnt_reg[3]  (.Q(\u_spi_tx/out_cnt[3] ), .CK(clk),
        .D(\u_spi_tx/n103 ), .RDN(sys_rst_n_n1));
    DFFRQX2H9R \u_spi_tx/out_cnt_reg[2]  (.Q(\u_spi_tx/out_cnt[2] ), .CK(clk),
        .D(\u_spi_tx/n104 ), .RDN(sys_rst_n_n1));
    DFFRQX2H9R \u_spi_tx/out_cnt_reg[0]  (.Q(\u_spi_tx/out_cnt[0] ), .CK(clk),
        .D(\u_spi_tx/n106 ), .RDN(sys_rst_n_n1));
    DFFRQX2H9R \u_spi_tx/carry_out_reg  (.Q(carry), .CK(clk), .D(\u_spi_tx/n101 ),
        .RDN(sys_rst_n_n1));
    DFFRQX2H9R \u_sync_fifo/wr_ptr_reg[0]  (.Q(\u_sync_fifo/wr_ptr[0] ),
        .CK(clk), .D(\u_sync_fifo/n45 ), .RDN(sys_rst_n_n1));
    DFFRQX2H9R \u_sync_fifo/rd_ptr_reg[1]  (.Q(\u_sync_fifo/rd_ptr[1] ),
        .CK(clk), .D(\u_sync_fifo/n53 ), .RDN(sys_rst_n_n1));
    DFFRQX4H9R \u_compute_engine/cnt_reg[1]  (.Q(\u_compute_engine/cnt[1] ),
        .CK(clk), .D(\u_compute_engine/n23 ), .RDN(sys_rst_n_n1));
    DFFRQX2H9R \u_compute_engine/calc_en_reg  (.Q(\u_compute_engine/calc_en ),
        .CK(clk), .D(\u_compute_engine/n21 ), .RDN(sys_rst_n_n1));
    DFFRQX2H9R \u_compute_engine/temp_product_reg[31]  (.Q(\u_compute_engine/temp_product[31] ),
        .CK(clk), .D(\u_compute_engine/n195 ), .RDN(sys_rst_n_n1));
    DFFRQX2H9R \u_compute_engine/temp_product_reg[30]  (.Q(\u_compute_engine/temp_product[30] ),
        .CK(clk), .D(\u_compute_engine/n196 ), .RDN(sys_rst_n_n1));
    DFFRQX2H9R \u_compute_engine/temp_product_reg[29]  (.Q(\u_compute_engine/temp_product[29] ),
        .CK(clk), .D(\u_compute_engine/n197 ), .RDN(sys_rst_n_n1));
    DFFRQX2H9R \u_compute_engine/temp_product_reg[28]  (.Q(\u_compute_engine/temp_product[28] ),
        .CK(clk), .D(\u_compute_engine/n198 ), .RDN(sys_rst_n_n1));
    DFFRQX2H9R \u_compute_engine/temp_product_reg[27]  (.Q(\u_compute_engine/temp_product[27] ),
        .CK(clk), .D(\u_compute_engine/n199 ), .RDN(sys_rst_n_n1));
    DFFRQX2H9R \u_compute_engine/temp_product_reg[26]  (.Q(\u_compute_engine/temp_product[26] ),
        .CK(clk), .D(\u_compute_engine/n200 ), .RDN(sys_rst_n_n1));
    DFFRQX2H9R \u_compute_engine/temp_product_reg[23]  (.Q(\u_compute_engine/temp_product[23] ),
        .CK(clk), .D(\u_compute_engine/n203 ), .RDN(sys_rst_n_n1));
    DFFRQX2H9R \u_compute_engine/temp_product_reg[21]  (.Q(\u_compute_engine/temp_product[21] ),
        .CK(clk), .D(\u_compute_engine/n205 ), .RDN(sys_rst_n));
    DFFRQX2H9R \u_compute_engine/temp_product_reg[20]  (.Q(\u_compute_engine/temp_product[20] ),
        .CK(clk), .D(\u_compute_engine/n206 ), .RDN(sys_rst_n));
    DFFRQX2H9R \u_compute_engine/temp_product_reg[18]  (.Q(\u_compute_engine/temp_product[18] ),
        .CK(clk), .D(\u_compute_engine/n208 ), .RDN(sys_rst_n));
    DFFRQX2H9R \u_compute_engine/temp_product_reg[17]  (.Q(\u_compute_engine/temp_product[17] ),
        .CK(clk), .D(\u_compute_engine/n209 ), .RDN(sys_rst_n));
    DFFRQX2H9R \u_compute_engine/temp_product_reg[11]  (.Q(\u_compute_engine/temp_product[11] ),
        .CK(clk), .D(\u_compute_engine/n215 ), .RDN(sys_rst_n));
    DFFRQX2H9R \u_compute_engine/temp_product_reg[9]  (.Q(\u_compute_engine/temp_product[9] ),
        .CK(clk), .D(\u_compute_engine/n217 ), .RDN(sys_rst_n));
    DFFRQX2H9R \u_compute_engine/temp_product_reg[7]  (.Q(\u_compute_engine/temp_product[7] ),
        .CK(clk), .D(\u_compute_engine/n220 ), .RDN(sys_rst_n));
    DFFRQX2H9R \u_compute_engine/temp_product_reg[5]  (.Q(\u_compute_engine/temp_product[5] ),
        .CK(clk), .D(\u_compute_engine/n224 ), .RDN(sys_rst_n));
    DFFRQX2H9R \u_compute_engine/temp_product_reg[3]  (.Q(\u_compute_engine/temp_product[3] ),
        .CK(clk), .D(\u_compute_engine/n228 ), .RDN(sys_rst_n));
    DFFRQX2H9R \u_compute_engine/temp_product_reg[1]  (.Q(\u_compute_engine/temp_product[1] ),
        .CK(clk), .D(\u_compute_engine/n232 ), .RDN(sys_rst_n));
    DFFRQX2H9R \u_compute_engine/temp_product_reg[0]  (.Q(\u_compute_engine/temp_product[0] ),
        .CK(clk), .D(\u_compute_engine/n234 ), .RDN(sys_rst_n));
    DFFRQX2H9R \u_compute_engine/global_acc_reg[23]  (.Q(\u_compute_engine/global_acc[23] ),
        .CK(clk), .D(\u_compute_engine/n331 ), .RDN(sys_rst_n));
    DFFRQX2H9R \u_compute_engine/global_acc_reg[22]  (.Q(\u_compute_engine/global_acc[22] ),
        .CK(clk), .D(\u_compute_engine/n332 ), .RDN(sys_rst_n));
    DFFRQX2H9R \u_compute_engine/global_acc_reg[21]  (.Q(\u_compute_engine/global_acc[21] ),
        .CK(clk), .D(\u_compute_engine/n333 ), .RDN(sys_rst_n));
    DFFRQX2H9R \u_compute_engine/global_acc_reg[20]  (.Q(\u_compute_engine/global_acc[20] ),
        .CK(clk), .D(\u_compute_engine/n334 ), .RDN(sys_rst_n));
    DFFRQX2H9R \u_compute_engine/global_acc_reg[19]  (.Q(\u_compute_engine/global_acc[19] ),
        .CK(clk), .D(\u_compute_engine/n335 ), .RDN(sys_rst_n));
    DFFRQX2H9R \u_compute_engine/global_acc_reg[18]  (.Q(\u_compute_engine/global_acc[18] ),
        .CK(clk), .D(\u_compute_engine/n336 ), .RDN(sys_rst_n));
    DFFRQX2H9R \u_compute_engine/global_acc_reg[16]  (.Q(\u_compute_engine/global_acc[16] ),
        .CK(clk), .D(\u_compute_engine/n338 ), .RDN(sys_rst_n));
    DFFRQX2H9R \u_compute_engine/global_acc_reg[15]  (.Q(\u_compute_engine/global_acc[15] ),
        .CK(clk), .D(\u_compute_engine/n339 ), .RDN(sys_rst_n));
    DFFRQX2H9R \u_compute_engine/global_acc_reg[14]  (.Q(\u_compute_engine/global_acc[14] ),
        .CK(clk), .D(\u_compute_engine/n340 ), .RDN(sys_rst_n));
    DFFRQX2H9R \u_compute_engine/global_acc_reg[13]  (.Q(\u_compute_engine/global_acc[13] ),
        .CK(clk), .D(\u_compute_engine/n341 ), .RDN(sys_rst_n));
    DFFRQX2H9R \u_compute_engine/global_acc_reg[12]  (.Q(\u_compute_engine/global_acc[12] ),
        .CK(clk), .D(\u_compute_engine/n342 ), .RDN(sys_rst_n));
    DFFRQX2H9R \u_compute_engine/global_acc_reg[11]  (.Q(\u_compute_engine/global_acc[11] ),
        .CK(clk), .D(\u_compute_engine/n343 ), .RDN(sys_rst_n));
    DFFRQX2H9R \u_compute_engine/global_acc_reg[10]  (.Q(\u_compute_engine/global_acc[10] ),
        .CK(clk), .D(\u_compute_engine/n344 ), .RDN(sys_rst_n));
    DFFRQX2H9R \u_compute_engine/global_acc_reg[9]  (.Q(\u_compute_engine/global_acc[9] ),
        .CK(clk), .D(\u_compute_engine/n345 ), .RDN(sys_rst_n));
    DFFRQX2H9R \u_compute_engine/global_acc_reg[8]  (.Q(\u_compute_engine/global_acc[8] ),
        .CK(clk), .D(\u_compute_engine/n346 ), .RDN(sys_rst_n));
    DFFRQX2H9R \u_compute_engine/global_acc_reg[7]  (.Q(\u_compute_engine/global_acc[7] ),
        .CK(clk), .D(\u_compute_engine/n347 ), .RDN(sys_rst_n));
    DFFRQX2H9R \u_compute_engine/global_acc_reg[6]  (.Q(\u_compute_engine/global_acc[6] ),
        .CK(clk), .D(\u_compute_engine/n348 ), .RDN(sys_rst_n));
    DFFRQX2H9R \u_compute_engine/global_acc_reg[5]  (.Q(\u_compute_engine/global_acc[5] ),
        .CK(clk), .D(\u_compute_engine/n349 ), .RDN(sys_rst_n_n1));
    DFFRQX2H9R \u_compute_engine/global_acc_reg[4]  (.Q(\u_compute_engine/global_acc[4] ),
        .CK(clk), .D(\u_compute_engine/n350 ), .RDN(sys_rst_n_n1));
    DFFRQX2H9R \u_compute_engine/global_acc_reg[3]  (.Q(\u_compute_engine/global_acc[3] ),
        .CK(clk), .D(\u_compute_engine/n351 ), .RDN(sys_rst_n_n1));
    DFFRQX2H9R \u_compute_engine/global_acc_reg[2]  (.Q(\u_compute_engine/global_acc[2] ),
        .CK(clk), .D(\u_compute_engine/n352 ), .RDN(sys_rst_n_n1));
    DFFRQX2H9R \u_compute_engine/global_acc_reg[0]  (.Q(\u_compute_engine/global_acc[0] ),
        .CK(clk), .D(\u_compute_engine/n354 ), .RDN(sys_rst_n_n1));
    DFFRQX2H9R \u_compute_engine/mac_carry_reg  (.Q(calc_carry), .CK(clk),
        .D(\u_compute_engine/n379 ), .RDN(sys_rst_n_n1));
    DFFRQX2H9R \u_compute_engine/calc_done_reg  (.Q(calc_valid), .CK(clk),
        .D(\u_compute_engine/n328 ), .RDN(sys_rst_n_n1));
    DFFRQX4H9R \u_compute_engine/cnt_reg[2]  (.Q(\u_compute_engine/cnt[2] ),
        .CK(clk), .D(\u_compute_engine/n22 ), .RDN(sys_rst_n_n1));
    DFFRQX2H9R \u_spi_rx/bit_cnt_reg[3]  (.Q(\u_spi_rx/bit_cnt[3] ), .CK(clk),
        .D(\u_spi_rx/n77 ), .RDN(sys_rst_n_n1));
    DFFRQX2H9R \u_spi_rx/bit_cnt_reg[2]  (.Q(\u_spi_rx/bit_cnt[2] ), .CK(clk),
        .D(\u_spi_rx/n78 ), .RDN(sys_rst_n_n1));
    DFFSQX1H9R \u_spi_tx/shift_reg_reg[22]  (.Q(n380), .CK(clk), .D(n1055),
        .SN(sys_rst_n_n1));
    INVX1H9R u2661 (.Y(\u_spi_tx/shift_reg[22] ), .A(n380));
    DFFSQX1H9R \u_spi_tx/shift_reg_reg[21]  (.Q(n381), .CK(clk), .D(n1059),
        .SN(sys_rst_n_n1));
    INVX1H9R u2662 (.Y(\u_spi_tx/shift_reg[21] ), .A(n381));
    DFFSQX1H9R \u_spi_tx/shift_reg_reg[20]  (.Q(n382), .CK(clk), .D(n1063),
        .SN(sys_rst_n_n1));
    INVX1H9R u2663 (.Y(\u_spi_tx/shift_reg[20] ), .A(n382));
    DFFSQX1H9R \u_spi_tx/shift_reg_reg[19]  (.Q(n383), .CK(clk), .D(n1067),
        .SN(sys_rst_n_n1));
    INVX1H9R u2664 (.Y(\u_spi_tx/shift_reg[19] ), .A(n383));
    DFFSQX1H9R \u_spi_tx/shift_reg_reg[18]  (.Q(n384), .CK(clk), .D(n1071),
        .SN(sys_rst_n_n1));
    INVX1H9R u2665 (.Y(\u_spi_tx/shift_reg[18] ), .A(n384));
    DFFSQX1H9R \u_spi_tx/shift_reg_reg[17]  (.Q(n385), .CK(clk), .D(n1075),
        .SN(sys_rst_n_n1));
    INVX1H9R u2666 (.Y(\u_spi_tx/shift_reg[17] ), .A(n385));
    DFFSQX1H9R \u_spi_tx/shift_reg_reg[16]  (.Q(n386), .CK(clk), .D(n1079),
        .SN(sys_rst_n_n1));
    INVX1H9R u2667 (.Y(\u_spi_tx/shift_reg[16] ), .A(n386));
    DFFSQX1H9R \u_spi_tx/shift_reg_reg[15]  (.Q(n387), .CK(clk), .D(n1083),
        .SN(sys_rst_n_n1));
    INVX1H9R u2668 (.Y(\u_spi_tx/shift_reg[15] ), .A(n387));
    DFFSQX1H9R \u_spi_tx/shift_reg_reg[14]  (.Q(n388), .CK(clk), .D(n1087),
        .SN(sys_rst_n_n1));
    INVX1H9R u2669 (.Y(\u_spi_tx/shift_reg[14] ), .A(n388));
    DFFSQX1H9R \u_spi_tx/shift_reg_reg[13]  (.Q(n389), .CK(clk), .D(n1091),
        .SN(sys_rst_n_n1));
    INVX1H9R u2670 (.Y(\u_spi_tx/shift_reg[13] ), .A(n389));
    DFFSQX1H9R \u_spi_tx/shift_reg_reg[12]  (.Q(n390), .CK(clk), .D(n1095),
        .SN(sys_rst_n_n1));
    INVX1H9R u2671 (.Y(\u_spi_tx/shift_reg[12] ), .A(n390));
    DFFSQX1H9R \u_spi_tx/shift_reg_reg[11]  (.Q(n391), .CK(clk), .D(n1099),
        .SN(sys_rst_n));
    INVX1H9R u2672 (.Y(\u_spi_tx/shift_reg[11] ), .A(n391));
    DFFSQX1H9R \u_spi_tx/shift_reg_reg[10]  (.Q(n392), .CK(clk), .D(n1103),
        .SN(sys_rst_n));
    INVX1H9R u2673 (.Y(\u_spi_tx/shift_reg[10] ), .A(n392));
    DFFSQX1H9R \u_spi_tx/shift_reg_reg[9]  (.Q(n393), .CK(clk), .D(n1107),
        .SN(sys_rst_n));
    INVX1H9R u2674 (.Y(\u_spi_tx/shift_reg[9] ), .A(n393));
    DFFSQX1H9R \u_spi_tx/shift_reg_reg[8]  (.Q(n394), .CK(clk), .D(n1111),
        .SN(sys_rst_n));
    INVX1H9R u2675 (.Y(\u_spi_tx/shift_reg[8] ), .A(n394));
    DFFSQX1H9R \u_spi_tx/shift_reg_reg[7]  (.Q(n395), .CK(clk), .D(n1115),
        .SN(sys_rst_n));
    INVX1H9R u2676 (.Y(\u_spi_tx/shift_reg[7] ), .A(n395));
    DFFSQX1H9R \u_spi_tx/shift_reg_reg[6]  (.Q(n396), .CK(clk), .D(n1119),
        .SN(sys_rst_n));
    INVX1H9R u2677 (.Y(\u_spi_tx/shift_reg[6] ), .A(n396));
    DFFSQX1H9R \u_spi_tx/shift_reg_reg[5]  (.Q(n397), .CK(clk), .D(n1123),
        .SN(sys_rst_n));
    INVX1H9R u2678 (.Y(\u_spi_tx/shift_reg[5] ), .A(n397));
    DFFSQX1H9R \u_spi_tx/shift_reg_reg[4]  (.Q(n398), .CK(clk), .D(n1127),
        .SN(sys_rst_n));
    INVX1H9R u2679 (.Y(\u_spi_tx/shift_reg[4] ), .A(n398));
    DFFSQX1H9R \u_spi_tx/shift_reg_reg[3]  (.Q(n399), .CK(clk), .D(n1131),
        .SN(sys_rst_n));
    INVX1H9R u2680 (.Y(\u_spi_tx/shift_reg[3] ), .A(n399));
    DFFSQX1H9R \u_spi_tx/shift_reg_reg[2]  (.Q(n400), .CK(clk), .D(n1135),
        .SN(sys_rst_n));
    INVX1H9R u2681 (.Y(\u_spi_tx/shift_reg[2] ), .A(n400));
    DFFSQX1H9R \u_spi_tx/shift_reg_reg[1]  (.Q(n401), .CK(clk), .D(n1139),
        .SN(sys_rst_n));
    INVX1H9R u2682 (.Y(\u_spi_tx/shift_reg[1] ), .A(n401));
    DFFSQX1H9R \u_spi_tx/out_ready_reg  (.Q(n408), .CK(clk), .D(n1043), .SN(sys_rst_n));
    INVX1H9R u2683 (.Y(out_ready), .A(n408));
    DFFSQX1H9R \u_spi_tx/fifo_pop_reg  (.Q(n409), .CK(clk), .D(n1042), .SN(sys_rst_n));
    DFFSQX1H9R \u_spi_tx/shift_reg_reg[23]  (.Q(n411), .CK(clk), .D(n1051),
        .SN(sys_rst_n));
    INVX1H9R u2685 (.Y(sum_out), .A(n411));
    DFFSQX1H9R \u_spi_rx/valid_out_reg  (.Q(n647), .CK(clk), .D(n1547), .SN(sys_rst_n));
    INVX1H9R u2686 (.Y(rx_valid), .A(n647));
    DFFRQX2H9R \u_compute_engine/u_mul8x8/pp_stage1_reg[5]  (.Q(\u_compute_engine/u_mul8x8/pp_stage1[5] ),
        .CK(clk), .D(\u_compute_engine/u_mul8x8/n150 ), .RDN(sys_rst_n));
    DFFRQX2H9R \u_compute_engine/u_mul8x8/pp_stage1_reg[14]  (.Q(\u_compute_engine/u_mul8x8/pp_stage1[14] ),
        .CK(clk), .D(\u_compute_engine/u_mul8x8/n175 ), .RDN(sys_rst_n));
    DFFRQX2H9R \u_compute_engine/u_mul8x8/pp_stage1_reg[13]  (.Q(\u_compute_engine/u_mul8x8/pp_stage1[13] ),
        .CK(clk), .D(\u_compute_engine/u_mul8x8/n176 ), .RDN(sys_rst_n));
    DFFRQX2H9R \u_compute_engine/u_mul8x8/pp_stage1_reg[12]  (.Q(\u_compute_engine/u_mul8x8/pp_stage1[12] ),
        .CK(clk), .D(\u_compute_engine/u_mul8x8/n177 ), .RDN(sys_rst_n));
    DFFRQX2H9R \u_compute_engine/u_mul8x8/pp_stage1_reg[8]  (.Q(\u_compute_engine/u_mul8x8/pp_stage1[8] ),
        .CK(clk), .D(\u_compute_engine/u_mul8x8/n181 ), .RDN(sys_rst_n));
    DFFRQX2H9R \u_compute_engine/u_mul8x8/pp_stage1_reg[7]  (.Q(\u_compute_engine/u_mul8x8/pp_stage1[7] ),
        .CK(clk), .D(\u_compute_engine/u_mul8x8/n182 ), .RDN(sys_rst_n));
    DFFRQX2H9R \u_spi_tx/out_cnt_reg[1]  (.Q(\u_spi_tx/out_cnt[1] ), .CK(clk),
        .D(\u_spi_tx/n105 ), .RDN(sys_rst_n));
    DFFRQX2H9R \u_sync_fifo/wr_ptr_reg[2]  (.Q(\u_sync_fifo/wr_ptr[2] ),
        .CK(clk), .D(\u_sync_fifo/n43 ), .RDN(sys_rst_n));
    DFFRQX2H9R \u_sync_fifo/wr_ptr_reg[1]  (.Q(\u_sync_fifo/wr_ptr[1] ),
        .CK(clk), .D(\u_sync_fifo/n44 ), .RDN(sys_rst_n));
    DFFRQX2H9R \u_sync_fifo/rd_ptr_reg[2]  (.Q(\u_sync_fifo/rd_ptr[2] ),
        .CK(clk), .D(\u_sync_fifo/n52 ), .RDN(sys_rst_n));
    DFFRQX2H9R \u_sync_fifo/rd_ptr_reg[0]  (.Q(\u_sync_fifo/rd_ptr[0] ),
        .CK(clk), .D(\u_sync_fifo/n54 ), .RDN(sys_rst_n));
    MDFFQX1H9R \u_sync_fifo/mem_reg[0][0]  (.Q(\u_sync_fifo/mem[0][0] ),
        .CK(clk), .D0(\u_sync_fifo/mem[0][0] ), .D1(\u_compute_engine/global_acc[0] ),
        .S0(n1162));
    MDFFQX1H9R \u_sync_fifo/mem_reg[0][1]  (.Q(\u_sync_fifo/mem[0][1] ),
        .CK(clk), .D0(\u_sync_fifo/mem[0][1] ), .D1(\u_compute_engine/global_acc[1] ),
        .S0(n1162));
    MDFFQX1H9R \u_sync_fifo/mem_reg[0][2]  (.Q(\u_sync_fifo/mem[0][2] ),
        .CK(clk), .D0(\u_sync_fifo/mem[0][2] ), .D1(\u_compute_engine/global_acc[2] ),
        .S0(n1162));
    MDFFQX1H9R \u_sync_fifo/mem_reg[0][3]  (.Q(\u_sync_fifo/mem[0][3] ),
        .CK(clk), .D0(\u_sync_fifo/mem[0][3] ), .D1(\u_compute_engine/global_acc[3] ),
        .S0(n1162));
    MDFFQX1H9R \u_sync_fifo/mem_reg[0][4]  (.Q(\u_sync_fifo/mem[0][4] ),
        .CK(clk), .D0(\u_sync_fifo/mem[0][4] ), .D1(\u_compute_engine/global_acc[4] ),
        .S0(n1162));
    MDFFQX1H9R \u_sync_fifo/mem_reg[0][5]  (.Q(\u_sync_fifo/mem[0][5] ),
        .CK(clk), .D0(\u_sync_fifo/mem[0][5] ), .D1(\u_compute_engine/global_acc[5] ),
        .S0(n1162));
    MDFFQX1H9R \u_sync_fifo/mem_reg[0][6]  (.Q(\u_sync_fifo/mem[0][6] ),
        .CK(clk), .D0(\u_sync_fifo/mem[0][6] ), .D1(\u_compute_engine/global_acc[6] ),
        .S0(n1162));
    MDFFQX1H9R \u_sync_fifo/mem_reg[0][7]  (.Q(\u_sync_fifo/mem[0][7] ),
        .CK(clk), .D0(\u_sync_fifo/mem[0][7] ), .D1(\u_compute_engine/global_acc[7] ),
        .S0(n1162));
    MDFFQX1H9R \u_sync_fifo/mem_reg[0][8]  (.Q(\u_sync_fifo/mem[0][8] ),
        .CK(clk), .D0(\u_sync_fifo/mem[0][8] ), .D1(\u_compute_engine/global_acc[8] ),
        .S0(n1162));
    MDFFQX1H9R \u_sync_fifo/mem_reg[0][9]  (.Q(\u_sync_fifo/mem[0][9] ),
        .CK(clk), .D0(\u_sync_fifo/mem[0][9] ), .D1(\u_compute_engine/global_acc[9] ),
        .S0(n1162));
    MDFFQX1H9R \u_sync_fifo/mem_reg[0][10]  (.Q(\u_sync_fifo/mem[0][10] ),
        .CK(clk), .D0(\u_sync_fifo/mem[0][10] ), .D1(\u_compute_engine/global_acc[10] ),
        .S0(n1162));
    MDFFQX1H9R \u_sync_fifo/mem_reg[0][11]  (.Q(\u_sync_fifo/mem[0][11] ),
        .CK(clk), .D0(\u_sync_fifo/mem[0][11] ), .D1(\u_compute_engine/global_acc[11] ),
        .S0(n1162));
    MDFFQX1H9R \u_sync_fifo/mem_reg[0][12]  (.Q(\u_sync_fifo/mem[0][12] ),
        .CK(clk), .D0(\u_sync_fifo/mem[0][12] ), .D1(\u_compute_engine/global_acc[12] ),
        .S0(n1162));
    MDFFQX1H9R \u_sync_fifo/mem_reg[0][13]  (.Q(\u_sync_fifo/mem[0][13] ),
        .CK(clk), .D0(\u_sync_fifo/mem[0][13] ), .D1(\u_compute_engine/global_acc[13] ),
        .S0(n1162));
    MDFFQX1H9R \u_sync_fifo/mem_reg[0][14]  (.Q(\u_sync_fifo/mem[0][14] ),
        .CK(clk), .D0(\u_sync_fifo/mem[0][14] ), .D1(\u_compute_engine/global_acc[14] ),
        .S0(n1162));
    MDFFQX1H9R \u_sync_fifo/mem_reg[0][15]  (.Q(\u_sync_fifo/mem[0][15] ),
        .CK(clk), .D0(\u_sync_fifo/mem[0][15] ), .D1(\u_compute_engine/global_acc[15] ),
        .S0(n1162));
    MDFFQX1H9R \u_sync_fifo/mem_reg[0][16]  (.Q(\u_sync_fifo/mem[0][16] ),
        .CK(clk), .D0(\u_sync_fifo/mem[0][16] ), .D1(\u_compute_engine/global_acc[16] ),
        .S0(n1162));
    MDFFQX1H9R \u_sync_fifo/mem_reg[0][17]  (.Q(\u_sync_fifo/mem[0][17] ),
        .CK(clk), .D0(\u_sync_fifo/mem[0][17] ), .D1(\u_compute_engine/global_acc[17] ),
        .S0(n1162));
    MDFFQX1H9R \u_sync_fifo/mem_reg[0][18]  (.Q(\u_sync_fifo/mem[0][18] ),
        .CK(clk), .D0(\u_sync_fifo/mem[0][18] ), .D1(\u_compute_engine/global_acc[18] ),
        .S0(n1162));
    MDFFQX1H9R \u_sync_fifo/mem_reg[0][19]  (.Q(\u_sync_fifo/mem[0][19] ),
        .CK(clk), .D0(\u_sync_fifo/mem[0][19] ), .D1(\u_compute_engine/global_acc[19] ),
        .S0(n1162));
    MDFFQX1H9R \u_sync_fifo/mem_reg[0][20]  (.Q(\u_sync_fifo/mem[0][20] ),
        .CK(clk), .D0(\u_sync_fifo/mem[0][20] ), .D1(\u_compute_engine/global_acc[20] ),
        .S0(n1162));
    MDFFQX1H9R \u_sync_fifo/mem_reg[0][21]  (.Q(\u_sync_fifo/mem[0][21] ),
        .CK(clk), .D0(\u_sync_fifo/mem[0][21] ), .D1(\u_compute_engine/global_acc[21] ),
        .S0(n1162));
    MDFFQX1H9R \u_sync_fifo/mem_reg[0][22]  (.Q(\u_sync_fifo/mem[0][22] ),
        .CK(clk), .D0(\u_sync_fifo/mem[0][22] ), .D1(\u_compute_engine/global_acc[22] ),
        .S0(n1162));
    MDFFQX1H9R \u_sync_fifo/mem_reg[0][23]  (.Q(\u_sync_fifo/mem[0][23] ),
        .CK(clk), .D0(\u_sync_fifo/mem[0][23] ), .D1(\u_compute_engine/global_acc[23] ),
        .S0(n1162));
    MDFFQX1H9R \u_sync_fifo/mem_reg[0][24]  (.Q(\u_sync_fifo/mem[0][24] ),
        .CK(clk), .D0(\u_sync_fifo/mem[0][24] ), .D1(calc_carry), .S0(n1162));
    MDFFQX1H9R \u_sync_fifo/mem_reg[1][0]  (.Q(\u_sync_fifo/mem[1][0] ),
        .CK(clk), .D0(\u_compute_engine/global_acc[0] ), .D1(\u_sync_fifo/mem[1][0] ),
        .S0(n1163));
    MDFFQX1H9R \u_sync_fifo/mem_reg[1][1]  (.Q(\u_sync_fifo/mem[1][1] ),
        .CK(clk), .D0(\u_compute_engine/global_acc[1] ), .D1(\u_sync_fifo/mem[1][1] ),
        .S0(n1163));
    MDFFQX1H9R \u_sync_fifo/mem_reg[1][2]  (.Q(\u_sync_fifo/mem[1][2] ),
        .CK(clk), .D0(\u_compute_engine/global_acc[2] ), .D1(\u_sync_fifo/mem[1][2] ),
        .S0(n1163));
    MDFFQX1H9R \u_sync_fifo/mem_reg[1][3]  (.Q(\u_sync_fifo/mem[1][3] ),
        .CK(clk), .D0(\u_compute_engine/global_acc[3] ), .D1(\u_sync_fifo/mem[1][3] ),
        .S0(n1163));
    MDFFQX1H9R \u_sync_fifo/mem_reg[1][4]  (.Q(\u_sync_fifo/mem[1][4] ),
        .CK(clk), .D0(\u_compute_engine/global_acc[4] ), .D1(\u_sync_fifo/mem[1][4] ),
        .S0(n1163));
    MDFFQX1H9R \u_sync_fifo/mem_reg[1][5]  (.Q(\u_sync_fifo/mem[1][5] ),
        .CK(clk), .D0(\u_compute_engine/global_acc[5] ), .D1(\u_sync_fifo/mem[1][5] ),
        .S0(n1163));
    MDFFQX1H9R \u_sync_fifo/mem_reg[1][6]  (.Q(\u_sync_fifo/mem[1][6] ),
        .CK(clk), .D0(\u_compute_engine/global_acc[6] ), .D1(\u_sync_fifo/mem[1][6] ),
        .S0(n1163));
    MDFFQX1H9R \u_sync_fifo/mem_reg[1][7]  (.Q(\u_sync_fifo/mem[1][7] ),
        .CK(clk), .D0(\u_compute_engine/global_acc[7] ), .D1(\u_sync_fifo/mem[1][7] ),
        .S0(n1163));
    MDFFQX1H9R \u_sync_fifo/mem_reg[1][8]  (.Q(\u_sync_fifo/mem[1][8] ),
        .CK(clk), .D0(\u_compute_engine/global_acc[8] ), .D1(\u_sync_fifo/mem[1][8] ),
        .S0(n1163));
    MDFFQX1H9R \u_sync_fifo/mem_reg[1][9]  (.Q(\u_sync_fifo/mem[1][9] ),
        .CK(clk), .D0(\u_compute_engine/global_acc[9] ), .D1(\u_sync_fifo/mem[1][9] ),
        .S0(n1163));
    MDFFQX1H9R \u_sync_fifo/mem_reg[1][10]  (.Q(\u_sync_fifo/mem[1][10] ),
        .CK(clk), .D0(\u_compute_engine/global_acc[10] ), .D1(\u_sync_fifo/mem[1][10] ),
        .S0(n1163));
    MDFFQX1H9R \u_sync_fifo/mem_reg[1][11]  (.Q(\u_sync_fifo/mem[1][11] ),
        .CK(clk), .D0(\u_compute_engine/global_acc[11] ), .D1(\u_sync_fifo/mem[1][11] ),
        .S0(n1163));
    MDFFQX1H9R \u_sync_fifo/mem_reg[1][12]  (.Q(\u_sync_fifo/mem[1][12] ),
        .CK(clk), .D0(\u_compute_engine/global_acc[12] ), .D1(\u_sync_fifo/mem[1][12] ),
        .S0(n1163));
    MDFFQX1H9R \u_sync_fifo/mem_reg[1][13]  (.Q(\u_sync_fifo/mem[1][13] ),
        .CK(clk), .D0(\u_compute_engine/global_acc[13] ), .D1(\u_sync_fifo/mem[1][13] ),
        .S0(n1163));
    MDFFQX1H9R \u_sync_fifo/mem_reg[1][14]  (.Q(\u_sync_fifo/mem[1][14] ),
        .CK(clk), .D0(\u_compute_engine/global_acc[14] ), .D1(\u_sync_fifo/mem[1][14] ),
        .S0(n1163));
    MDFFQX1H9R \u_sync_fifo/mem_reg[1][15]  (.Q(\u_sync_fifo/mem[1][15] ),
        .CK(clk), .D0(\u_compute_engine/global_acc[15] ), .D1(\u_sync_fifo/mem[1][15] ),
        .S0(n1163));
    MDFFQX1H9R \u_sync_fifo/mem_reg[1][16]  (.Q(\u_sync_fifo/mem[1][16] ),
        .CK(clk), .D0(\u_compute_engine/global_acc[16] ), .D1(\u_sync_fifo/mem[1][16] ),
        .S0(n1163));
    MDFFQX1H9R \u_sync_fifo/mem_reg[1][17]  (.Q(\u_sync_fifo/mem[1][17] ),
        .CK(clk), .D0(\u_compute_engine/global_acc[17] ), .D1(\u_sync_fifo/mem[1][17] ),
        .S0(n1163));
    MDFFQX1H9R \u_sync_fifo/mem_reg[1][18]  (.Q(\u_sync_fifo/mem[1][18] ),
        .CK(clk), .D0(\u_compute_engine/global_acc[18] ), .D1(\u_sync_fifo/mem[1][18] ),
        .S0(n1163));
    MDFFQX1H9R \u_sync_fifo/mem_reg[1][19]  (.Q(\u_sync_fifo/mem[1][19] ),
        .CK(clk), .D0(\u_compute_engine/global_acc[19] ), .D1(\u_sync_fifo/mem[1][19] ),
        .S0(n1163));
    MDFFQX1H9R \u_sync_fifo/mem_reg[1][20]  (.Q(\u_sync_fifo/mem[1][20] ),
        .CK(clk), .D0(\u_compute_engine/global_acc[20] ), .D1(\u_sync_fifo/mem[1][20] ),
        .S0(n1163));
    MDFFQX1H9R \u_sync_fifo/mem_reg[1][21]  (.Q(\u_sync_fifo/mem[1][21] ),
        .CK(clk), .D0(\u_compute_engine/global_acc[21] ), .D1(\u_sync_fifo/mem[1][21] ),
        .S0(n1163));
    MDFFQX1H9R \u_sync_fifo/mem_reg[1][22]  (.Q(\u_sync_fifo/mem[1][22] ),
        .CK(clk), .D0(\u_compute_engine/global_acc[22] ), .D1(\u_sync_fifo/mem[1][22] ),
        .S0(n1163));
    MDFFQX1H9R \u_sync_fifo/mem_reg[1][23]  (.Q(\u_sync_fifo/mem[1][23] ),
        .CK(clk), .D0(\u_compute_engine/global_acc[23] ), .D1(\u_sync_fifo/mem[1][23] ),
        .S0(n1163));
    MDFFQX1H9R \u_sync_fifo/mem_reg[1][24]  (.Q(\u_sync_fifo/mem[1][24] ),
        .CK(clk), .D0(calc_carry), .D1(\u_sync_fifo/mem[1][24] ), .S0(n1163));
    MDFFQX1H9R \u_sync_fifo/mem_reg[2][0]  (.Q(\u_sync_fifo/mem[2][0] ),
        .CK(clk), .D0(\u_sync_fifo/mem[2][0] ), .D1(\u_compute_engine/global_acc[0] ),
        .S0(n1165));
    MDFFQX1H9R \u_sync_fifo/mem_reg[2][1]  (.Q(\u_sync_fifo/mem[2][1] ),
        .CK(clk), .D0(\u_sync_fifo/mem[2][1] ), .D1(\u_compute_engine/global_acc[1] ),
        .S0(n1165));
    MDFFQX1H9R \u_sync_fifo/mem_reg[2][2]  (.Q(\u_sync_fifo/mem[2][2] ),
        .CK(clk), .D0(\u_sync_fifo/mem[2][2] ), .D1(\u_compute_engine/global_acc[2] ),
        .S0(n1165));
    MDFFQX1H9R \u_sync_fifo/mem_reg[2][3]  (.Q(\u_sync_fifo/mem[2][3] ),
        .CK(clk), .D0(\u_sync_fifo/mem[2][3] ), .D1(\u_compute_engine/global_acc[3] ),
        .S0(n1165));
    MDFFQX1H9R \u_sync_fifo/mem_reg[2][4]  (.Q(\u_sync_fifo/mem[2][4] ),
        .CK(clk), .D0(\u_sync_fifo/mem[2][4] ), .D1(\u_compute_engine/global_acc[4] ),
        .S0(n1165));
    MDFFQX1H9R \u_sync_fifo/mem_reg[2][5]  (.Q(\u_sync_fifo/mem[2][5] ),
        .CK(clk), .D0(\u_sync_fifo/mem[2][5] ), .D1(\u_compute_engine/global_acc[5] ),
        .S0(n1165));
    MDFFQX1H9R \u_sync_fifo/mem_reg[2][6]  (.Q(\u_sync_fifo/mem[2][6] ),
        .CK(clk), .D0(\u_sync_fifo/mem[2][6] ), .D1(\u_compute_engine/global_acc[6] ),
        .S0(n1165));
    MDFFQX1H9R \u_sync_fifo/mem_reg[2][7]  (.Q(\u_sync_fifo/mem[2][7] ),
        .CK(clk), .D0(\u_sync_fifo/mem[2][7] ), .D1(\u_compute_engine/global_acc[7] ),
        .S0(n1165));
    MDFFQX1H9R \u_sync_fifo/mem_reg[2][8]  (.Q(\u_sync_fifo/mem[2][8] ),
        .CK(clk), .D0(\u_sync_fifo/mem[2][8] ), .D1(\u_compute_engine/global_acc[8] ),
        .S0(n1165));
    MDFFQX1H9R \u_sync_fifo/mem_reg[2][9]  (.Q(\u_sync_fifo/mem[2][9] ),
        .CK(clk), .D0(\u_sync_fifo/mem[2][9] ), .D1(\u_compute_engine/global_acc[9] ),
        .S0(n1165));
    MDFFQX1H9R \u_sync_fifo/mem_reg[2][10]  (.Q(\u_sync_fifo/mem[2][10] ),
        .CK(clk), .D0(\u_sync_fifo/mem[2][10] ), .D1(\u_compute_engine/global_acc[10] ),
        .S0(n1165));
    MDFFQX1H9R \u_sync_fifo/mem_reg[2][11]  (.Q(\u_sync_fifo/mem[2][11] ),
        .CK(clk), .D0(\u_sync_fifo/mem[2][11] ), .D1(\u_compute_engine/global_acc[11] ),
        .S0(n1165));
    MDFFQX1H9R \u_sync_fifo/mem_reg[2][12]  (.Q(\u_sync_fifo/mem[2][12] ),
        .CK(clk), .D0(\u_sync_fifo/mem[2][12] ), .D1(\u_compute_engine/global_acc[12] ),
        .S0(n1165));
    MDFFQX1H9R \u_sync_fifo/mem_reg[2][13]  (.Q(\u_sync_fifo/mem[2][13] ),
        .CK(clk), .D0(\u_sync_fifo/mem[2][13] ), .D1(\u_compute_engine/global_acc[13] ),
        .S0(n1165));
    MDFFQX1H9R \u_sync_fifo/mem_reg[2][14]  (.Q(\u_sync_fifo/mem[2][14] ),
        .CK(clk), .D0(\u_sync_fifo/mem[2][14] ), .D1(\u_compute_engine/global_acc[14] ),
        .S0(n1165));
    MDFFQX1H9R \u_sync_fifo/mem_reg[2][15]  (.Q(\u_sync_fifo/mem[2][15] ),
        .CK(clk), .D0(\u_sync_fifo/mem[2][15] ), .D1(\u_compute_engine/global_acc[15] ),
        .S0(n1165));
    MDFFQX1H9R \u_sync_fifo/mem_reg[2][16]  (.Q(\u_sync_fifo/mem[2][16] ),
        .CK(clk), .D0(\u_sync_fifo/mem[2][16] ), .D1(\u_compute_engine/global_acc[16] ),
        .S0(n1165));
    MDFFQX1H9R \u_sync_fifo/mem_reg[2][17]  (.Q(\u_sync_fifo/mem[2][17] ),
        .CK(clk), .D0(\u_sync_fifo/mem[2][17] ), .D1(\u_compute_engine/global_acc[17] ),
        .S0(n1165));
    MDFFQX1H9R \u_sync_fifo/mem_reg[2][18]  (.Q(\u_sync_fifo/mem[2][18] ),
        .CK(clk), .D0(\u_sync_fifo/mem[2][18] ), .D1(\u_compute_engine/global_acc[18] ),
        .S0(n1165));
    MDFFQX1H9R \u_sync_fifo/mem_reg[2][19]  (.Q(\u_sync_fifo/mem[2][19] ),
        .CK(clk), .D0(\u_sync_fifo/mem[2][19] ), .D1(\u_compute_engine/global_acc[19] ),
        .S0(n1165));
    MDFFQX1H9R \u_sync_fifo/mem_reg[2][20]  (.Q(\u_sync_fifo/mem[2][20] ),
        .CK(clk), .D0(\u_sync_fifo/mem[2][20] ), .D1(\u_compute_engine/global_acc[20] ),
        .S0(n1165));
    MDFFQX1H9R \u_sync_fifo/mem_reg[2][21]  (.Q(\u_sync_fifo/mem[2][21] ),
        .CK(clk), .D0(\u_sync_fifo/mem[2][21] ), .D1(\u_compute_engine/global_acc[21] ),
        .S0(n1165));
    MDFFQX1H9R \u_sync_fifo/mem_reg[2][22]  (.Q(\u_sync_fifo/mem[2][22] ),
        .CK(clk), .D0(\u_sync_fifo/mem[2][22] ), .D1(\u_compute_engine/global_acc[22] ),
        .S0(n1165));
    MDFFQX1H9R \u_sync_fifo/mem_reg[2][23]  (.Q(\u_sync_fifo/mem[2][23] ),
        .CK(clk), .D0(\u_sync_fifo/mem[2][23] ), .D1(\u_compute_engine/global_acc[23] ),
        .S0(n1165));
    MDFFQX1H9R \u_sync_fifo/mem_reg[2][24]  (.Q(\u_sync_fifo/mem[2][24] ),
        .CK(clk), .D0(\u_sync_fifo/mem[2][24] ), .D1(calc_carry), .S0(n1165));
    MDFFQX1H9R \u_sync_fifo/mem_reg[3][0]  (.Q(\u_sync_fifo/mem[3][0] ),
        .CK(clk), .D0(\u_compute_engine/global_acc[0] ), .D1(\u_sync_fifo/mem[3][0] ),
        .S0(n1166));
    MDFFQX1H9R \u_sync_fifo/mem_reg[3][1]  (.Q(\u_sync_fifo/mem[3][1] ),
        .CK(clk), .D0(\u_compute_engine/global_acc[1] ), .D1(\u_sync_fifo/mem[3][1] ),
        .S0(n1166));
    MDFFQX1H9R \u_sync_fifo/mem_reg[3][2]  (.Q(\u_sync_fifo/mem[3][2] ),
        .CK(clk), .D0(\u_compute_engine/global_acc[2] ), .D1(\u_sync_fifo/mem[3][2] ),
        .S0(n1166));
    MDFFQX1H9R \u_sync_fifo/mem_reg[3][3]  (.Q(\u_sync_fifo/mem[3][3] ),
        .CK(clk), .D0(\u_compute_engine/global_acc[3] ), .D1(\u_sync_fifo/mem[3][3] ),
        .S0(n1166));
    MDFFQX1H9R \u_sync_fifo/mem_reg[3][4]  (.Q(\u_sync_fifo/mem[3][4] ),
        .CK(clk), .D0(\u_compute_engine/global_acc[4] ), .D1(\u_sync_fifo/mem[3][4] ),
        .S0(n1166));
    MDFFQX1H9R \u_sync_fifo/mem_reg[3][5]  (.Q(\u_sync_fifo/mem[3][5] ),
        .CK(clk), .D0(\u_compute_engine/global_acc[5] ), .D1(\u_sync_fifo/mem[3][5] ),
        .S0(n1166));
    MDFFQX1H9R \u_sync_fifo/mem_reg[3][6]  (.Q(\u_sync_fifo/mem[3][6] ),
        .CK(clk), .D0(\u_compute_engine/global_acc[6] ), .D1(\u_sync_fifo/mem[3][6] ),
        .S0(n1166));
    MDFFQX1H9R \u_sync_fifo/mem_reg[3][7]  (.Q(\u_sync_fifo/mem[3][7] ),
        .CK(clk), .D0(\u_compute_engine/global_acc[7] ), .D1(\u_sync_fifo/mem[3][7] ),
        .S0(n1166));
    MDFFQX1H9R \u_sync_fifo/mem_reg[3][8]  (.Q(\u_sync_fifo/mem[3][8] ),
        .CK(clk), .D0(\u_compute_engine/global_acc[8] ), .D1(\u_sync_fifo/mem[3][8] ),
        .S0(n1166));
    MDFFQX1H9R \u_sync_fifo/mem_reg[3][9]  (.Q(\u_sync_fifo/mem[3][9] ),
        .CK(clk), .D0(\u_compute_engine/global_acc[9] ), .D1(\u_sync_fifo/mem[3][9] ),
        .S0(n1166));
    MDFFQX1H9R \u_sync_fifo/mem_reg[3][10]  (.Q(\u_sync_fifo/mem[3][10] ),
        .CK(clk), .D0(\u_compute_engine/global_acc[10] ), .D1(\u_sync_fifo/mem[3][10] ),
        .S0(n1166));
    MDFFQX1H9R \u_sync_fifo/mem_reg[3][11]  (.Q(\u_sync_fifo/mem[3][11] ),
        .CK(clk), .D0(\u_compute_engine/global_acc[11] ), .D1(\u_sync_fifo/mem[3][11] ),
        .S0(n1166));
    MDFFQX1H9R \u_sync_fifo/mem_reg[3][12]  (.Q(\u_sync_fifo/mem[3][12] ),
        .CK(clk), .D0(\u_compute_engine/global_acc[12] ), .D1(\u_sync_fifo/mem[3][12] ),
        .S0(n1166));
    MDFFQX1H9R \u_sync_fifo/mem_reg[3][13]  (.Q(\u_sync_fifo/mem[3][13] ),
        .CK(clk), .D0(\u_compute_engine/global_acc[13] ), .D1(\u_sync_fifo/mem[3][13] ),
        .S0(n1166));
    MDFFQX1H9R \u_sync_fifo/mem_reg[3][14]  (.Q(\u_sync_fifo/mem[3][14] ),
        .CK(clk), .D0(\u_compute_engine/global_acc[14] ), .D1(\u_sync_fifo/mem[3][14] ),
        .S0(n1166));
    MDFFQX1H9R \u_sync_fifo/mem_reg[3][15]  (.Q(\u_sync_fifo/mem[3][15] ),
        .CK(clk), .D0(\u_compute_engine/global_acc[15] ), .D1(\u_sync_fifo/mem[3][15] ),
        .S0(n1166));
    MDFFQX1H9R \u_sync_fifo/mem_reg[3][16]  (.Q(\u_sync_fifo/mem[3][16] ),
        .CK(clk), .D0(\u_compute_engine/global_acc[16] ), .D1(\u_sync_fifo/mem[3][16] ),
        .S0(n1166));
    MDFFQX1H9R \u_sync_fifo/mem_reg[3][17]  (.Q(\u_sync_fifo/mem[3][17] ),
        .CK(clk), .D0(\u_compute_engine/global_acc[17] ), .D1(\u_sync_fifo/mem[3][17] ),
        .S0(n1166));
    MDFFQX1H9R \u_sync_fifo/mem_reg[3][18]  (.Q(\u_sync_fifo/mem[3][18] ),
        .CK(clk), .D0(\u_compute_engine/global_acc[18] ), .D1(\u_sync_fifo/mem[3][18] ),
        .S0(n1166));
    MDFFQX1H9R \u_sync_fifo/mem_reg[3][19]  (.Q(\u_sync_fifo/mem[3][19] ),
        .CK(clk), .D0(\u_compute_engine/global_acc[19] ), .D1(\u_sync_fifo/mem[3][19] ),
        .S0(n1166));
    MDFFQX1H9R \u_sync_fifo/mem_reg[3][20]  (.Q(\u_sync_fifo/mem[3][20] ),
        .CK(clk), .D0(\u_compute_engine/global_acc[20] ), .D1(\u_sync_fifo/mem[3][20] ),
        .S0(n1166));
    MDFFQX1H9R \u_sync_fifo/mem_reg[3][21]  (.Q(\u_sync_fifo/mem[3][21] ),
        .CK(clk), .D0(\u_compute_engine/global_acc[21] ), .D1(\u_sync_fifo/mem[3][21] ),
        .S0(n1166));
    MDFFQX1H9R \u_sync_fifo/mem_reg[3][22]  (.Q(\u_sync_fifo/mem[3][22] ),
        .CK(clk), .D0(\u_compute_engine/global_acc[22] ), .D1(\u_sync_fifo/mem[3][22] ),
        .S0(n1166));
    MDFFQX1H9R \u_sync_fifo/mem_reg[3][23]  (.Q(\u_sync_fifo/mem[3][23] ),
        .CK(clk), .D0(\u_compute_engine/global_acc[23] ), .D1(\u_sync_fifo/mem[3][23] ),
        .S0(n1166));
    MDFFQX1H9R \u_sync_fifo/mem_reg[3][24]  (.Q(\u_sync_fifo/mem[3][24] ),
        .CK(clk), .D0(calc_carry), .D1(\u_sync_fifo/mem[3][24] ), .S0(n1166));
    DFFRQX2H9R \u_spi_rx/shift_A_reg[14]  (.Q(\u_spi_rx/shift_A[14] ), .CK(clk),
        .D(\u_spi_rx/n46 ), .RDN(sys_rst_n));
    DFFRQX2H9R \u_spi_rx/shift_A_reg[13]  (.Q(\u_spi_rx/shift_A[13] ), .CK(clk),
        .D(\u_spi_rx/n47 ), .RDN(sys_rst_n));
    DFFRQX2H9R \u_spi_rx/shift_A_reg[12]  (.Q(\u_spi_rx/shift_A[12] ), .CK(clk),
        .D(\u_spi_rx/n48 ), .RDN(sys_rst_n));
    DFFRQX2H9R \u_spi_rx/shift_A_reg[11]  (.Q(\u_spi_rx/shift_A[11] ), .CK(clk),
        .D(\u_spi_rx/n49 ), .RDN(sys_rst_n));
    DFFRQX2H9R \u_spi_rx/shift_A_reg[10]  (.Q(\u_spi_rx/shift_A[10] ), .CK(clk),
        .D(\u_spi_rx/n50 ), .RDN(sys_rst_n));
    DFFRQX2H9R \u_spi_rx/shift_A_reg[9]  (.Q(\u_spi_rx/shift_A[9] ), .CK(clk),
        .D(\u_spi_rx/n51 ), .RDN(sys_rst_n));
    DFFRQX2H9R \u_spi_rx/shift_A_reg[8]  (.Q(\u_spi_rx/shift_A[8] ), .CK(clk),
        .D(\u_spi_rx/n52 ), .RDN(sys_rst_n));
    DFFRQX2H9R \u_spi_rx/shift_A_reg[7]  (.Q(\u_spi_rx/shift_A[7] ), .CK(clk),
        .D(\u_spi_rx/n53 ), .RDN(sys_rst_n));
    DFFRQX2H9R \u_spi_rx/shift_A_reg[6]  (.Q(\u_spi_rx/shift_A[6] ), .CK(clk),
        .D(\u_spi_rx/n54 ), .RDN(sys_rst_n));
    DFFRQX2H9R \u_spi_rx/shift_A_reg[5]  (.Q(\u_spi_rx/shift_A[5] ), .CK(clk),
        .D(\u_spi_rx/n55 ), .RDN(sys_rst_n));
    DFFRQX2H9R \u_spi_rx/shift_A_reg[4]  (.Q(\u_spi_rx/shift_A[4] ), .CK(clk),
        .D(\u_spi_rx/n56 ), .RDN(sys_rst_n));
    DFFRQX2H9R \u_spi_rx/shift_A_reg[3]  (.Q(\u_spi_rx/shift_A[3] ), .CK(clk),
        .D(\u_spi_rx/n57 ), .RDN(sys_rst_n));
    DFFRQX2H9R \u_spi_rx/shift_A_reg[2]  (.Q(\u_spi_rx/shift_A[2] ), .CK(clk),
        .D(\u_spi_rx/n58 ), .RDN(sys_rst_n));
    DFFRQX2H9R \u_spi_rx/shift_A_reg[1]  (.Q(\u_spi_rx/shift_A[1] ), .CK(clk),
        .D(\u_spi_rx/n59 ), .RDN(sys_rst_n));
    DFFRQX2H9R \u_spi_rx/shift_A_reg[0]  (.Q(\u_spi_rx/shift_A[0] ), .CK(clk),
        .D(\u_spi_rx/n60 ), .RDN(sys_rst_n));
    DFFRQX2H9R \u_spi_rx/shift_B_reg[14]  (.Q(\u_spi_rx/shift_B[14] ), .CK(clk),
        .D(\u_spi_rx/n62 ), .RDN(sys_rst_n));
    DFFRQX2H9R \u_spi_rx/shift_B_reg[13]  (.Q(\u_spi_rx/shift_B[13] ), .CK(clk),
        .D(\u_spi_rx/n63 ), .RDN(sys_rst_n));
    DFFRQX2H9R \u_spi_rx/shift_B_reg[12]  (.Q(\u_spi_rx/shift_B[12] ), .CK(clk),
        .D(\u_spi_rx/n64 ), .RDN(sys_rst_n));
    DFFRQX2H9R \u_spi_rx/shift_B_reg[11]  (.Q(\u_spi_rx/shift_B[11] ), .CK(clk),
        .D(\u_spi_rx/n65 ), .RDN(sys_rst_n));
    DFFRQX2H9R \u_spi_rx/shift_B_reg[10]  (.Q(\u_spi_rx/shift_B[10] ), .CK(clk),
        .D(\u_spi_rx/n66 ), .RDN(sys_rst_n));
    DFFRQX2H9R \u_spi_rx/shift_B_reg[9]  (.Q(\u_spi_rx/shift_B[9] ), .CK(clk),
        .D(\u_spi_rx/n67 ), .RDN(sys_rst_n));
    DFFRQX2H9R \u_spi_rx/shift_B_reg[8]  (.Q(\u_spi_rx/shift_B[8] ), .CK(clk),
        .D(\u_spi_rx/n68 ), .RDN(sys_rst_n));
    DFFRQX2H9R \u_spi_rx/shift_B_reg[7]  (.Q(\u_spi_rx/shift_B[7] ), .CK(clk),
        .D(\u_spi_rx/n69 ), .RDN(sys_rst_n));
    DFFRQX2H9R \u_spi_rx/shift_B_reg[6]  (.Q(\u_spi_rx/shift_B[6] ), .CK(clk),
        .D(\u_spi_rx/n70 ), .RDN(sys_rst_n));
    DFFRQX2H9R \u_spi_rx/shift_B_reg[5]  (.Q(\u_spi_rx/shift_B[5] ), .CK(clk),
        .D(\u_spi_rx/n71 ), .RDN(sys_rst_n));
    DFFRQX2H9R \u_spi_rx/shift_B_reg[4]  (.Q(\u_spi_rx/shift_B[4] ), .CK(clk),
        .D(\u_spi_rx/n72 ), .RDN(sys_rst_n));
    DFFRQX2H9R \u_spi_rx/shift_B_reg[3]  (.Q(\u_spi_rx/shift_B[3] ), .CK(clk),
        .D(\u_spi_rx/n73 ), .RDN(sys_rst_n));
    DFFRQX2H9R \u_spi_rx/shift_B_reg[2]  (.Q(\u_spi_rx/shift_B[2] ), .CK(clk),
        .D(\u_spi_rx/n74 ), .RDN(sys_rst_n));
    DFFRQX2H9R \u_spi_rx/shift_B_reg[1]  (.Q(\u_spi_rx/shift_B[1] ), .CK(clk),
        .D(\u_spi_rx/n75 ), .RDN(sys_rst_n));
    DFFRQX2H9R \u_spi_rx/shift_B_reg[0]  (.Q(\u_spi_rx/shift_B[0] ), .CK(clk),
        .D(\u_spi_rx/n76 ), .RDN(sys_rst_n));
    DFFRQX2H9R \u_spi_rx/bit_cnt_reg[1]  (.Q(\u_spi_rx/bit_cnt[1] ), .CK(clk),
        .D(\u_spi_rx/n79 ), .RDN(sys_rst_n));
    DFFRQX2H9R \u_spi_rx/bit_cnt_reg[0]  (.Q(\u_spi_rx/bit_cnt[0] ), .CK(clk),
        .D(\u_spi_rx/n80 ), .RDN(sys_rst_n));
    DFFRQX2H9R \u_spi_rx/data_A_reg[15]  (.Q(\rx_data_A[15] ), .CK(clk),
        .D(\u_spi_rx/n81 ), .RDN(sys_rst_n));
    DFFRQX2H9R \u_spi_rx/data_A_reg[14]  (.Q(\rx_data_A[14] ), .CK(clk),
        .D(\u_spi_rx/n82 ), .RDN(sys_rst_n));
    DFFRQX2H9R \u_spi_rx/data_A_reg[13]  (.Q(\rx_data_A[13] ), .CK(clk),
        .D(\u_spi_rx/n83 ), .RDN(sys_rst_n));
    DFFRQX2H9R \u_spi_rx/data_A_reg[12]  (.Q(\rx_data_A[12] ), .CK(clk),
        .D(\u_spi_rx/n84 ), .RDN(sys_rst_n));
    DFFRQX2H9R \u_spi_rx/data_A_reg[11]  (.Q(\rx_data_A[11] ), .CK(clk),
        .D(\u_spi_rx/n85 ), .RDN(sys_rst_n));
    DFFRQX2H9R \u_spi_rx/data_A_reg[10]  (.Q(\rx_data_A[10] ), .CK(clk),
        .D(\u_spi_rx/n86 ), .RDN(sys_rst_n));
    DFFRQX4H9R \u_spi_rx/data_A_reg[9]  (.Q(\rx_data_A[9] ), .CK(clk), .D(\u_spi_rx/n87 ),
        .RDN(sys_rst_n));
    DFFRQX2H9R \u_spi_rx/data_A_reg[8]  (.Q(\rx_data_A[8] ), .CK(clk), .D(\u_spi_rx/n88 ),
        .RDN(sys_rst_n));
    DFFRQX2H9R \u_spi_rx/data_A_reg[7]  (.Q(\rx_data_A[7] ), .CK(clk), .D(\u_spi_rx/n89 ),
        .RDN(sys_rst_n));
    DFFRQX2H9R \u_spi_rx/data_A_reg[6]  (.Q(\rx_data_A[6] ), .CK(clk), .D(\u_spi_rx/n90 ),
        .RDN(sys_rst_n));
    DFFRQX2H9R \u_spi_rx/data_A_reg[5]  (.Q(\rx_data_A[5] ), .CK(clk), .D(\u_spi_rx/n91 ),
        .RDN(sys_rst_n));
    DFFRQX2H9R \u_spi_rx/data_A_reg[4]  (.Q(\rx_data_A[4] ), .CK(clk), .D(\u_spi_rx/n92 ),
        .RDN(sys_rst_n));
    DFFRQX2H9R \u_spi_rx/data_A_reg[3]  (.Q(\rx_data_A[3] ), .CK(clk), .D(\u_spi_rx/n93 ),
        .RDN(sys_rst_n));
    DFFRQX2H9R \u_spi_rx/data_A_reg[2]  (.Q(\rx_data_A[2] ), .CK(clk), .D(\u_spi_rx/n94 ),
        .RDN(sys_rst_n));
    DFFRQX4H9R \u_spi_rx/data_A_reg[1]  (.Q(\rx_data_A[1] ), .CK(clk), .D(\u_spi_rx/n95 ),
        .RDN(sys_rst_n));
    DFFRQX2H9R \u_spi_rx/data_A_reg[0]  (.Q(\rx_data_A[0] ), .CK(clk), .D(\u_spi_rx/n96 ),
        .RDN(sys_rst_n));
    DFFRQX2H9R \u_spi_rx/data_B_reg[15]  (.Q(\rx_data_B[15] ), .CK(clk),
        .D(\u_spi_rx/n97 ), .RDN(sys_rst_n));
    DFFRQX2H9R \u_spi_rx/data_B_reg[14]  (.Q(\rx_data_B[14] ), .CK(clk),
        .D(\u_spi_rx/n98 ), .RDN(sys_rst_n));
    DFFRQX2H9R \u_spi_rx/data_B_reg[13]  (.Q(\rx_data_B[13] ), .CK(clk),
        .D(\u_spi_rx/n99 ), .RDN(sys_rst_n));
    DFFRQX2H9R \u_spi_rx/data_B_reg[12]  (.Q(\rx_data_B[12] ), .CK(clk),
        .D(\u_spi_rx/n100 ), .RDN(sys_rst_n));
    DFFRQX2H9R \u_spi_rx/data_B_reg[11]  (.Q(\rx_data_B[11] ), .CK(clk),
        .D(\u_spi_rx/n101 ), .RDN(sys_rst_n));
    DFFRQX2H9R \u_spi_rx/data_B_reg[10]  (.Q(\rx_data_B[10] ), .CK(clk),
        .D(\u_spi_rx/n102 ), .RDN(sys_rst_n));
    DFFRQX2H9R \u_spi_rx/data_B_reg[9]  (.Q(\rx_data_B[9] ), .CK(clk), .D(\u_spi_rx/n103 ),
        .RDN(sys_rst_n));
    DFFRQX2H9R \u_spi_rx/data_B_reg[8]  (.Q(\rx_data_B[8] ), .CK(clk), .D(\u_spi_rx/n104 ),
        .RDN(sys_rst_n));
    DFFRQX2H9R \u_spi_rx/data_B_reg[7]  (.Q(\rx_data_B[7] ), .CK(clk), .D(\u_spi_rx/n105 ),
        .RDN(sys_rst_n));
    DFFRQX2H9R \u_spi_rx/data_B_reg[6]  (.Q(\rx_data_B[6] ), .CK(clk), .D(\u_spi_rx/n106 ),
        .RDN(sys_rst_n));
    DFFRQX2H9R \u_spi_rx/data_B_reg[5]  (.Q(\rx_data_B[5] ), .CK(clk), .D(\u_spi_rx/n107 ),
        .RDN(sys_rst_n));
    DFFRQX2H9R \u_spi_rx/data_B_reg[4]  (.Q(\rx_data_B[4] ), .CK(clk), .D(\u_spi_rx/n108 ),
        .RDN(sys_rst_n));
    DFFRQX2H9R \u_spi_rx/data_B_reg[3]  (.Q(\rx_data_B[3] ), .CK(clk), .D(\u_spi_rx/n109 ),
        .RDN(sys_rst_n));
    DFFRQX2H9R \u_spi_rx/data_B_reg[0]  (.Q(\rx_data_B[0] ), .CK(clk), .D(\u_spi_rx/n112 ),
        .RDN(sys_rst_n));
    INVX4H9R u2762 (.Y(n2186), .A(n5684));
    INVX3H9R u2768 (.Y(n659_n1), .A(n659_n2));
    INVX1H9R u2937 (.Y(n749_n0), .A(n749));
    INVX1H9R u2938 (.Y(n749_n1), .A(n749_n0));
    BUFX1P7H9R u3043 (.Y(n960_n0), .A(n960));
    INVX1H9R u3214 (.Y(n1006_n1), .A(n1006_n2));
    INVX0P5H9R u3310 (.Y(n909_n0), .A(n909));
    INVX1H9R u3311 (.Y(n909_n1), .A(n909_n0));
    BUFX0P7H9R u3545 (.Y(n2301), .A(n19621));
    BUFX3H9R u3551 (.Y(n2307), .A(n650));
    INVX5H9R u3553 (.Y(n2309), .A(n665));
    BUFX2H9R u3566 (.Y(n2322), .A(n671));
    BUFX3H9R u3575 (.Y(n2331), .A(n719));
    BUFX3H9R u3576 (.Y(n2332), .A(n757));
    BUFX5H9R u3580 (.Y(n2336), .A(n760));
    INVX0P5H9R u3609 (.Y(n651_n0), .A(n651));
    INVX2H9R u3610 (.Y(n651_n1), .A(n651_n0));
    INVX0P5H9R u3620 (.Y(n650_n0), .A(n650));
    INVX1H9R u3621 (.Y(n650_n1), .A(n650_n0));
    INVX2H9R u3626 (.Y(n666_n0), .A(n666));
    INVX0P5H9R u3632 (.Y(n650_n2), .A(n650));
    AO221X4H9R u3690 (.Z(n2381), .A1(n830), .A2(n834), .B1(n838), .B2(n839),
        .C(n841));
    INVX1H9R u3782 (.Y(n2309_n1), .A(n5690));
    INVX0P5H9R u3804 (.Y(n929_n0), .A(n929));
    INVX1H9R u3805 (.Y(n929_n1), .A(n929_n0));
    INVX0P5H9R u3818 (.Y(n1002_n0), .A(n1002));
    INVX1H9R u3819 (.Y(n1002_n1), .A(n1002_n0));
    INVX0P5H9R u3824 (.Y(n1006_n2), .A(n1006));
    INVX1H9R u3833 (.Y(n659_n2), .A(n659));
    INVX2H9R u3851 (.Y(n2186_n0), .A(n2186));
    BUFX9H9R u3882 (.Y(n651_n8), .A(n651));
    INVX0P7H9R u3971 (.Y(n814_n0), .A(n814));
    INVX2H9R u3972 (.Y(n814_n1), .A(n814_n0));
    AOAI211X4H9R u3977 (.ZN(n2466), .A1(n725), .A2(n726), .B(n728), .C(n730));
    INVX3H9R u4000 (.Y(n667_n1), .A(n667_n2));
    AO221X0P5H9R u4024 (.Z(n2477), .A1(n830), .A2(n834), .B1(n838), .B2(n839),
        .C(n841));
    INVX0P5H9R u4043 (.Y(n2307_n0), .A(n2307));
    INVX1H9R u4044 (.Y(n2307_n1), .A(n2307_n0));
    INVX0P5H9R u4068 (.Y(n982_n0), .A(n982));
    INVX1H9R u4069 (.Y(n982_n1), .A(n982_n0));
    XNOR3X1P4H9R u4099 (.Y(n2499), .A(n914), .B(n865), .C(n864));
    INVX0P7H9R u4151 (.Y(n933_n0), .A(n933));
    INVX1H9R u4152 (.Y(n933_n1), .A(n933_n0));
    INVX0P5H9R u4159 (.Y(n738_n0), .A(n738));
    INVX1H9R u4160 (.Y(n738_n1), .A(n738_n0));
    OAI31X4H9R u4163 (.Y(n2524), .A0(n976), .A1(n975), .A2(n912), .B0(n968));
    INVX0P5H9R u4189 (.Y(n739_n0), .A(n739));
    INVX1H9R u4190 (.Y(n739_n1), .A(n739_n0));
    INVX0P5H9R u4224 (.Y(n824_n0), .A(n824));
    INVX1H9R u4225 (.Y(n824_n1), .A(n824_n0));
    INVX1H9R u4267 (.Y(n667_n2), .A(n667));
    NAND2X1H9R u4273 (.Y(n2556), .A(n19525), .B(n5715));
    AND2X1H9R u4554 (.Y(n2640), .A(n785), .B(n783));
    NAND2X1P4H9R u4575 (.Y(n2649), .A(n729), .B(n658_n1));
    INVX1H9R u4644 (.Y(n2670), .A(n749_n0));
    INVX2H9R u4827 (.Y(n519_n0), .A(n519));
    CGENCONAX2H9R u4942 (.CON(n2762), .A(n907), .B(n19589), .CI(n904));
    AOAI211X4H9R u5362 (.ZN(n869), .A1(n868), .A2(n867), .B(n5728), .C(n681));
    NAND3X2H9R u1134 (.Y(n867), .A(n854), .B(n846), .C(n2642));
    OAI222X2H9R u1113 (.Y(n846), .A0(n5785), .A1(n697_n1), .B0(n843), .B1(n844),
        .C0(n2738), .C1(n845));
    NAND3X1H9R u5891 (.Y(n3300), .A(n867), .B(n868), .C(n5728));
    INVX2H9R u5892 (.Y(n3301), .A(n869));
    NAND2X3H9R u5893 (.Y(n3302), .A(n3301), .B(n3300));
    INVX0P7H9R u5894 (.Y(n3303), .A(n825));
    XNOR2X1H9R u5895 (.Y(n3304), .A(n3303), .B(n801));
    XOR2X3H9R u5896 (.Y(n871), .A(n3302), .B(n3304));
    XNOR2X1H9R u2403 (.Y(\u_compute_engine/u_mul8x8/n176 ), .A(n1025), .B(n1019));
    OAI211X2H9R u1278 (.Y(n1011), .A0(n1006), .A1(n1002), .B0(n1009), .C0(n1010));
    AOI22X3H9R u1273 (.Y(n1006), .A0(n1003), .A1(n997), .B0(n1005), .B1(n1004));
    OAI211X1P4H9R u1272 (.Y(n1005), .A0(n781_n1), .A1(n767), .B0(n2124),
        .C0(n961));
    AO22X1P4H9R u1228 (.Y(n961), .A0(n5811), .A1(n935), .B0(n5805), .B1(n959));
    AOI31X3H9R u5528 (.Y(n2642), .A0(n848), .A1(n849), .A2(n5729), .B0(n705));
    NAND2X2H9R u5942 (.Y(n3336), .A(n847), .B(n828));
    INVX2H9R u5943 (.Y(n3337), .A(n2381));
    NAND2X2H9R u5944 (.Y(n848), .A(n3337), .B(n3336));
    AO211X4H9R u6105 (.Z(n3410), .A1(n725), .A2(n726), .B(n730), .C(n732));
    NOR3X1H9R u6167 (.Y(n3432), .A(n791), .B(n772), .C(n697_n1));
    INVX2H9R u6468 (.Y(n2389_n1), .A(n5684));
    AOI211X0P7H9R u1290 (.Y(\u_compute_engine/u_mul8x8/n174 ), .A0(n1022),
        .A1(n980), .B0(n984), .C0(n831));
    OAI211X2H9R u1288 (.Y(n1021), .A0(n1020), .A1(n1013), .B0(n1011), .C0(n1012));
    AO21X4H9R u1200 (.Y(n933), .A0(n929), .A1(n932), .B0(n912));
    NAND2X1H9R u1199 (.Y(n932), .A(n2499), .B(n754_n1));
    CGENCONAX1H9R u1194 (.CON(n927), .A(n926), .B(n924), .CI(n918));
    XNOR3X1P4H9R u1185 (.Y(n918), .A(n903), .B(n887), .C(n888));
    XOR3X1P4H9R u1150 (.Y(n883), .A(n882), .B(n842), .C(n814_n1_n1));
    OR4X1P4H9R u1149 (.Y(n882), .A(n879), .B(n877), .C(n880), .D(n881));
    OA211X0P5H9R u1146 (.Y(n879), .A0(n697_n1), .A1(n790), .B0(n878), .C0(n774));
    NOR3X1H9R u1144 (.Y(n877), .A(n845), .B(n774), .C(n876));
    NOR3X0P5H9R u1148 (.Y(n881), .A(n697_n1), .B(n876), .C(n790));
    AND2X1H9R u1147 (.Y(n880), .A(n878), .B(n845));
    AOI21X2H9R u1112 (.Y(n845), .A0(n789), .A1(n788), .B0(n695_n1));
    AO211X1H9R u1055 (.Z(n789), .A1(n749), .A2(n776), .B(n777), .C(n787));
    OAI21X4H9R u1042 (.Y(n776), .A0(n2336), .A1(n2332), .B0(n750));
    BUFX1P7H9R u8791 (.Y(n5680), .A(\u_compute_engine/cnt[2] ));
    BUFX2H9R u8795 (.Y(n5684), .A(n519));
    BUFX2H9R u8801 (.Y(n5690), .A(n665));
    BUFX2H9R u8811 (.Y(n5700), .A(n651));
    BUFX2H9R u8822 (.Y(n5711), .A(n672));
    INVX1H9R u8825 (.Y(n5714), .A(n662));
    INVX4H9R u8826 (.Y(n5715), .A(n5714));
    BUFX3H9R u8828 (.Y(n5717), .A(n675));
    BUFX4H9R u8834 (.Y(n5723), .A(n691));
    BUFX3H9R u8839 (.Y(n5728), .A(n782));
    BUFX1P7H9R u8846 (.Y(n5735), .A(n663));
    BUFX1H9R u8859 (.Y(n5748), .A(n659_n1));
    BUFX1P4H9R u8865 (.Y(n5754), .A(n694));
    BUFX1H9R u8878 (.Y(n5767), .A(n817));
    BUFX0P7H9R u8879 (.Y(n5768), .A(n811));
    BUFX1P7H9R u8896 (.Y(n5785), .A(n790));
    BUFX4H9R u8914 (.Y(n5803), .A(n930));
    BUFX1P7H9R u8916 (.Y(n5805), .A(n940));
    BUFX4H9R u8922 (.Y(n5811), .A(n934));
    BUFX1P7H9R u8925 (.Y(n5814), .A(n973));
    BUFX1H9R u8926 (.Y(n5815), .A(n978));
    INVX1H9R u9235 (.Y(n6021), .A(\rx_data_A[0] ));
    INVX0P5H9R u9753 (.Y(n1005_n0), .A(n1005));
    INVX1H9R u9754 (.Y(n1005_n1), .A(n1005_n0));
    INVX0P5H9R u9891 (.Y(n700_n1), .A(n700));
    OAI21X0P7H9R u1168 (.Y(n901), .A0(n856), .A1(n900), .B0(n855));
    AND3X0P5H9R u1167 (.Y(n900), .A(n5729), .B(n848), .C(n849));
    NOR2BX1P4H9R u1166 (.Y(n899), .AN(n2642), .B(n890));
    NAND2X1H9R u1165 (.Y(n898), .A(n868), .B(n854));
    NAND2X1H9R u1156 (.Y(n889), .A(n856), .B(n855));
    NOR2X1H9R u1169 (.Y(n902), .A(n894), .B(n901));
    NOR2XBX2H9R u1163 (.Y(n896), .A(n846), .BN(n855));
    AND4X1H9R u1162 (.Y(n895), .A(n893), .B(n892), .C(n2642), .D(n781_n1));
    XNOR3X1H9R u1027 (.Y(n762), .A(n749), .B(n750), .C(n761));
    NAND2BX2H9R u1158 (.Y(n891), .AN(n890), .B(n850));
    OA22X1H9R u1157 (.Y(n890), .A0(n2738), .A1(n845), .B0(n843), .B1(n844));
    CGENX1H9R u4876 (.CO(n2738), .A(n747), .B(n764), .CI(n762));
    NOR2X0P5H9R u1026 (.Y(n761), .A(n757), .B(n760));
    INVX1H9R u13693 (.Y(n9585), .A(\rx_data_B[1] ));
    NAND2XBX1H9R u13694 (.Y(n9586), .A(n19622), .BN(n9585));
    NOR2XBX4H9R u13696 (.Y(n9588), .A(n666_n0), .BN(\rx_data_B[9] ));
    AOI2XB1X4H9R u13697 (.Y(n667), .A0(n5690), .A1N(n9586), .B0(n9588));
    AO21X1H9R u1205 (.Y(n938), .A0(n936), .A1(n930), .B0(n928));
    NOR2X1P4H9R u14140 (.Y(n9726), .A(n896), .B(n895));
    NAND2X2H9R u14141 (.Y(n9727), .A(n891), .B(n894));
    NAND2X2H9R u14142 (.Y(n897), .A(n9726), .B(n9727));
    XOR2X3H9R u911 (.Y(n651), .A(\u_compute_engine/cnt[1] ), .B(n519_n0));
    AOI32X4H9R u1029 (.Y(n764), .A0(n738), .A1(n763), .A2(n739), .B0(n702),
        .B1(n5748));
    OAI31X3H9R u1028 (.Y(n763), .A0(n700), .A1(n701), .A2(n682), .B0(n708));
    AOI31X3H9R u964 (.Y(n701), .A0(n2461), .A1(n692), .A2(n699), .B0(n2529));
    OAI33X2H9R u4174 (.ZN(n2529), .A1(n685), .A2(n2322), .A3(n684), .B1(n668),
        .B2(\u_compute_engine/u_mul8x8/pp[0][0] ), .B3(n689));
    OAO211X4H9R u3954 (.Z(n2461), .A1(n5735), .A2(n5723), .B(n5754), .C(n695));
    NAND2X4H9R u5656 (.Y(n657), .A(n3103), .B(n3101));
    NAND2XBX3H9R u5655 (.Y(n3103), .A(n651_n8), .BN(n3102));
    INVX1H9R u5654 (.Y(n3102), .A(\rx_data_A[8] ));
    NAND2XBX2H9R u5653 (.Y(n3101), .A(n650), .BN(n6021));
    AOI22X3H9R u1141 (.Y(n874), .A0(n695_n1), .A1(n709), .B0(n3042), .B1(n773));
    OAI2BB1X4H9R u1202 (.ZN(n935), .A1(n931), .A2(n933), .B(n911_n1));
    INVX1H9R u14058 (.Y(n911_n1), .A(n911_n0));
    XNOR2X0P5H9R u17572 (.Y(n12645), .A(n861), .B(n909));
    XOR2X0P5H9R u17575 (.Y(n911_n0), .A(n12645), .B(n12647));
    NAND3X3H9R u1198 (.Y(n931), .A(n929), .B(n5803), .C(n912));
    OAI21X4H9R u1196 (.Y(n929), .A0(n2499), .A1(n913), .B0(n928));
    CGENCINX2H9R u1195 (.CO(n928), .A(n916), .B(n917), .CIN(n927));
    XNOR3X3H9R u1184 (.Y(n917), .A(n2752), .B(n871), .C(n907));
    CGENX1P4H9R u4914 (.CO(n2752), .A(n888), .B(n903), .CI(n887));
    AOI221X4H9R u17621 (.Y(n903), .A0(n899), .A1(n898), .B0(n897), .B1(n889),
        .C0(n902));
    AOI22X3H9R u1239 (.Y(n972), .A0(n5811), .A1(n935), .B0(n5805), .B1(n959));
    NAND3BX4H9R u1201 (.Y(n934), .AN(n911), .B(n933), .C(n931));
    XNOR2X3H9R u1178 (.Y(n911), .A(n910), .B(n800));
    XOR2X3H9R u1177 (.Y(n910), .A(n909), .B(n861));
    NAND3BX4H9R u1176 (.Y(n909), .AN(n905), .B(n908), .C(n906));
    AOI211X0P5H9R u1172 (.Y(n905), .A0(n864), .A1(n866), .B0(n904), .C0(n19589));
    OR2X0P7H9R u1173 (.Y(n906), .A(n864), .B(n866));
    AO221X4H9R u1175 (.Z(n908), .A1(n904), .A2(n871), .B1(n864), .B2(n5728),
        .C(n907));
    CGENX1P4H9R u1171 (.CO(n904), .A(n888), .B(n903), .CI(n887));
    AOI211X4H9R u1154 (.Y(n887), .A0(n875), .A1(n883), .B0(n884), .C0(n886));
    NOR3X2H9R u1151 (.Y(n884), .A(n791_n1), .B(n772), .C(n697_n1));
    NAND2X3H9R u1142 (.Y(n875), .A(n872), .B(n874));
    OAI21X4H9R u5988 (.Y(n872), .A0(n3042), .A1(n773), .B0(n3043));
    INVX3H9R u5572 (.Y(n3043), .A(n771));
    INVX3H9R u5571 (.Y(n3042), .A(n791));
    AND4X4H9R u988 (.Y(n724), .A(n659), .B(n672), .C(n693), .D(n662));
    AO22X2H9R u958 (.Y(n695), .A0(\rx_data_A[3] ), .A1(n650), .B0(n5700),
        .B1(\rx_data_A[11] ));
    INVX1H9R u22252 (.Y(n16956), .A(\rx_data_A[2] ));
    NAND2XBX3H9R u22253 (.Y(n16957), .A(n650), .BN(n16956));
    INVX1H9R u22254 (.Y(n16958), .A(\rx_data_A[10] ));
    NAND2XBX4H9R u22255 (.Y(n16959), .A(n651_n8), .BN(n16958));
    NAND2X6H9R u22256 (.Y(n672), .A(n16959), .B(n16957));
    NAND2XBX2H9R u22259 (.Y(n16962), .A(n2186_n0), .BN(n2056));
    OAI21X6H9R u22260 (.Y(n662), .A0(n16962), .A1(n2309), .B0(n661));
    AOI22X3H9R u937 (.Y(n675), .A0(n650), .A1(\rx_data_A[2] ), .B0(n651_n8),
        .B1(\rx_data_A[10] ));
    OAI22X6H9R u919 (.Y(n658), .A0(n653), .A1(n19621), .B0(n654), .B1(n2309));
    AOI2BB2X4H9R u9236 (.ZN(n652), .A1(n650_n2), .A2(n6021), .B1(n5700),
        .B2(\rx_data_A[8] ));
    AO21X4H9R u910 (.Y(n650), .A0(\u_compute_engine/cnt[1] ), .A1(\u_compute_engine/cnt[0] ),
        .B0(\u_compute_engine/cnt[2] ));
    XNOR2X0P7H9R u2402 (.Y(\u_compute_engine/u_mul8x8/n175 ), .A(n1022),
        .B(n1024));
    AOI21X1H9R u1292 (.Y(n1024), .A0(n984), .A1(n980), .B0(n1023));
    OAI21X1H9R u1291 (.Y(n1023), .A0(n980), .A1(n984), .B0(n799_n1));
    OAI21X2H9R u1289 (.Y(n1022), .A0(n1019), .A1(n1014), .B0(n1021));
    CGENCONAX2H9R u1225 (.CON(n958), .A(n957), .B(n955), .CI(n956));
    OAI2BB1X4H9R u1221 (.ZN(n954), .A1(n942), .A2(n947), .B(n953));
    NOR2X1H9R u1214 (.Y(n947), .A(n945), .B(n926));
    NOR3X2H9R u1213 (.Y(n946), .A(n942), .B(n945), .C(n925));
    CGENCONAX2H9R u1191 (.CON(n924), .A(n923), .B(n920), .CI(n922));
    AO22X2H9R u1187 (.Y(n920), .A0(n769), .A1(n770), .B0(n792), .B1(n2123));
    INVX1H9R u2635 (.Y(n2123), .A(n794));
    XOR3X3H9R u1057 (.Y(n791), .A(n2469), .B(n790), .C(n775));
    CGENX1H9R u3990 (.CO(n2469), .A(n747), .B(n764), .CI(n762));
    NAND2X0P5H9R u1041 (.Y(n775), .A(n695_n1), .B(n681));
    AND4X4H9R u924 (.Y(n663), .A(n659), .B(n657), .C(n662), .D(n658));
    OAI22X4H9R u1222 (.Y(n955), .A0(n943), .A1(n941), .B0(n954), .B1(n946));
    XNOR2X2H9R u1210 (.Y(n943), .A(n942), .B(n925));
    AOI211X2H9R u1281 (.Y(n1014), .A0(n781_n1), .A1(n1011), .B0(n1012), .C0(n1013));
    AOI211X4H9R u1240 (.Y(n973), .A0(n2124), .A1(n781_n1), .B0(n767), .C0(n972));
    XNOR3X1P4H9R u1058 (.Y(n792), .A(n5790), .B(n773), .C(n791));
    BUFX1P4H9R u8901 (.Y(n5790), .A(n771));
    OAO211X4H9R u1277 (.Z(n1010), .A1(n1007), .A2(n973), .B(n2491), .C(n978));
    OAI211X1H9R u4082 (.Y(n2491), .A0(n960_n0), .A1(n754_n1), .B0(n784),
        .C0(n961));
    AND4X4H9R u1227 (.Y(n960), .A(n2402), .B(n2726), .C(n934), .D(n940));
    AO31X4H9R u3743 (.Z(n2402), .A1(n938), .A2(n939), .A3(n937), .B(n958));
    OAI2BB1X4H9R u4846 (.ZN(n2726), .A1(n933), .A2(n931), .B(n911));
    XOR2X2H9R u1209 (.Y(n942), .A(n918), .B(n924));
    NAND2X4H9R u1056 (.Y(n790), .A(n12042), .B(n788));
    AO211X4H9R u16602 (.Z(n12042), .A1(n749), .A2(n776), .B(n777), .C(n787));
    AOI221X4H9R u1025 (.Y(n760), .A0(n2434), .A1(n5729), .B0(n19682), .B1(n759),
        .C0(n755));
    OA221X4H9R u3870 (.Z(n2434), .A1(n663), .A2(n691), .B1(n724), .B2(n698),
        .C(n727));
    NAND2X8H9R u5440 (.Y(n659), .A(n2951), .B(n2949));
    NAND2XBX6H9R u5439 (.Y(n2951), .A(n651_n8), .BN(n2950));
    INVX1H9R u5438 (.Y(n2950), .A(\rx_data_A[9] ));
    NAND2XBX3H9R u5437 (.Y(n2949), .A(n650), .BN(n2948));
    INVX1H9R u5436 (.Y(n2948), .A(\rx_data_A[1] ));
    AOI211X3H9R u1280 (.Y(n1013), .A0(n1010), .A1(n1009), .B0(n1002), .C0(n1006));
    INVX4H9R u2636 (.Y(n2124), .A(n960));
    NOR3X3H9R u1043 (.Y(n777), .A(n2336), .B(n2332), .C(n750));
    BUFX1P4H9R u25038 (.Y(n19508), .A(n5700));
    BUFX1H9R u25043 (.Y(n19513), .A(n652));
    BUFX1H9R u25050 (.Y(n19520), .A(n659));
    BUFX1H9R u25055 (.Y(n19525), .A(n729));
    BUFX1H9R u25057 (.Y(n19527), .A(n667));
    BUFX2H9R u25077 (.Y(n19547), .A(n779));
    BUFX1H9R u25078 (.Y(n19548), .A(n783));
    BUFX2H9R u25081 (.Y(n19551), .A(n751));
    INVX1H9R u25092 (.Y(n19562), .A(n777));
    INVX1H9R u25093 (.Y(n19563), .A(n19562));
    BUFX1H9R u25099 (.Y(n19569), .A(n762));
    BUFX1H9R u25109 (.Y(n19579), .A(n853));
    BUFX3H9R u25119 (.Y(n19589), .A(n871));
    INVX1H9R u25120 (.Y(n19590), .A(n928));
    INVX1H9R u25121 (.Y(n19591), .A(n19590));
    BUFX1P4H9R u25151 (.Y(n19621), .A(\u_compute_engine/cnt[2] ));
    BUFX1H9R u25152 (.Y(n19622), .A(n519));
    BUFX1H9R u25172 (.Y(n19642), .A(n2309));
    BUFX1H9R u25173 (.Y(n19643), .A(n2186));
    BUFX1H9R u25174 (.Y(n19644), .A(n666));
    INVX0P5H9R u3844 (.Y(n695_n0), .A(n695));
    INVX2H9R u3845 (.Y(n695_n1), .A(n695_n0));
    INVX0P5H9R u4454 (.Y(n697_n0), .A(n697));
    INVX2H9R u4455 (.Y(n697_n1), .A(n697_n0));
    INVX1P4H9R u8831 (.Y(n5720), .A(n658));
    INVX3H9R u3702 (.Y(n658_n1), .A(n5720));
    BUFX2P5H9R u8840 (.Y(n5729), .A(n758));
    INVX0P5H9R u3904 (.Y(n675_n0), .A(n5717));
    INVX1H9R u3905 (.Y(n675_n1), .A(n675_n0));
    INVX0P5H9R u13819 (.Y(n799_n0), .A(n799));
    INVX1H9R u13820 (.Y(n799_n1), .A(n799_n0));
    INVX0P5H9R u3695 (.Y(n652_n0), .A(n19513));
    INVX1H9R u3696 (.Y(n652_n1), .A(n652_n0));
    INVX1H9R u9843 (.Y(n680_n0), .A(n680));
    INVX1H9R u9844 (.Y(n680_n1), .A(n680_n0));
    INVX0P5H9R u4211 (.Y(n754_n0), .A(n754));
    INVX3H9R u4212 (.Y(n754_n1), .A(n754_n0));
    BUFX1H9R u8842 (.Y(n5731), .A(n727));
    INVX0P5H9R u3935 (.Y(n657_n2), .A(n657));
    INVX1H9R u3936 (.Y(n657_n3), .A(n657_n2));
    BUFX1H9R u25212 (.Y(n19682), .A(n753));
    BUFX1H9R u25213 (.Y(n19683), .A(n688));
    BUFX1H9R u25217 (.Y(n19687), .A(n5711));
    BUFX1H9R u25224 (.Y(n19694), .A(n657_n3));
    BUFX1H9R u25235 (.Y(n19705), .A(n810));
    BUFX1P4H9R u25237 (.Y(n19707), .A(n776));
    BUFX1P4H9R u25253 (.Y(n19723), .A(n792));
    BUFX1H9R u25274 (.Y(n19744), .A(n997));
    BUFX1H9R u25275 (.Y(n19745), .A(n1004));
    XNOR2X0P5H9R u2472 (.Y(\u_spi_rx/n79 ), .A(\u_spi_rx/bit_cnt[1] ), .B(n1550));
    NAND2X0P5H9R u2060 (.Y(n1550), .A(in_ready), .B(\u_spi_rx/bit_cnt[0] ));
    NOR2X0P5H9R u2059 (.Y(\u_spi_rx/n78 ), .A(n1546), .B(n1549));
    AOI31X0P5H9R u2058 (.Y(n1549), .A0(in_ready), .A1(\u_spi_rx/bit_cnt[1] ),
        .A2(\u_spi_rx/bit_cnt[0] ), .B0(\u_spi_rx/bit_cnt[2] ));
    NOR4X0P5H9R u2020 (.ZN(n1544), .A1(\u_compute_engine/temp_product[31] ),
        .A2(\u_compute_engine/temp_product[30] ), .A3(\u_compute_engine/temp_product[29] ),
        .A4(\u_compute_engine/temp_product[28] ));
    NOR2X0P5H9R u2019 (.Y(n1543), .A(\u_compute_engine/temp_product[27] ),
        .B(\u_compute_engine/temp_product[26] ));
    NAND2X0P5H9R u1448 (.Y(n1146), .A(out_ready), .B(n1034));
    AND2X0P5H9R u1586 (.Y(n1171), .A(n2399), .B(\u_compute_engine/calc_en ));
    NAND2BX0P5H9R u25331 (.Y(n1426), .AN(n1237), .B(n1260));
    OR2X0P5H9R u25338 (.Y(n1158), .A(n1041), .B(n409));
    NAND2X0P5H9R u1582 (.Y(n1168), .A(\u_compute_engine/calc_en ), .B(n1167));
    NAND2X0P5H9R u1581 (.Y(n1167), .A(n2301), .B(n2399));
    AOI211X0P5H9R u1591 (.Y(\u_compute_engine/n23 ), .A0(n1173), .A1(n1171),
        .B0(n1174), .C0(rx_valid));
    AOI21X0P5H9R u1590 (.Y(n1174), .A0(\u_compute_engine/calc_en ), .A1(n19643),
        .B0(n2399));
    NAND2X0P5H9R u1584 (.Y(\u_compute_engine/n21 ), .A(n1168), .B(n1169));
    AOI21X0P5H9R u1583 (.Y(n1169), .A0(\u_compute_engine/calc_en ), .A1(n2389_n1),
        .B0(rx_valid));
    AOI211X0P5H9R u1588 (.Y(\u_compute_engine/n22 ), .A0(n666_n0), .A1(n1171),
        .B0(n1172), .C0(rx_valid));
    NOR2X0P5H9R u1587 (.Y(n1172), .A(n2301), .B(n1171));
    NOR3X0P5H9R u1910 (.Y(n1463), .A(\u_compute_engine/mul_result[2] ), .B(n1460),
        .C(n1462));
    OAI22X0P5H9R u1436 (.Y(n1137), .A0(\u_sync_fifo/mem[3][1] ), .A1(n1044),
        .B0(n1045), .B1(\u_sync_fifo/mem[2][1] ));
    OAI22X0P5H9R u1435 (.Y(n1136), .A0(\u_sync_fifo/mem[1][1] ), .A1(n1047),
        .B0(n1048), .B1(\u_sync_fifo/mem[0][1] ));
    NOR2X0P5H9R u1473 (.Y(\u_sync_fifo/n53 ), .A(n1159), .B(n1160));
    AOI2XB1X0P5H9R u1472 (.Y(n1160), .A0(\u_sync_fifo/rd_ptr[0] ), .A1N(n1158),
        .B0(\u_sync_fifo/rd_ptr[1] ));
    AO21X0P5H9R u1853 (.Y(n1415), .A0(n1195), .A1(n1194), .B0(\u_compute_engine/mul_result[3] ));
    AOI21X0P5H9R u25388 (.Y(n19806), .A0(n1189), .A1(n1410), .B0(n1411));
    OAI31X0P5H9R u1447 (.Y(\u_spi_tx/n101 ), .A0(n1042), .A1(n1143), .A2(n1144),
        .B0(n1145));
    NAND2X0P5H9R u1446 (.Y(n1145), .A(carry), .B(n1042));
    OAI22X0P5H9R u1445 (.Y(n1144), .A0(\u_sync_fifo/mem[3][24] ), .A1(n1044),
        .B0(n1047), .B1(\u_sync_fifo/mem[1][24] ));
    OAI22X0P5H9R u1444 (.Y(n1143), .A0(\u_sync_fifo/mem[2][24] ), .A1(n1045),
        .B0(n1048), .B1(\u_sync_fifo/mem[0][24] ));
    OAI31X0P5H9R u1452 (.Y(\u_spi_tx/n103 ), .A0(n403), .A1(\u_spi_tx/out_cnt[3] ),
        .A2(n1146), .B0(n1148));
    NAND3X0P5H9R u1451 (.Y(n1148), .A(\u_spi_tx/out_cnt[3] ), .B(n1042),
        .C(n1146));
    AOI21X0P5H9R u1900 (.Y(n1455), .A0(n1454), .A1(n1453), .B0(\u_compute_engine/temp_product[4] ));
    OAI21X0P5H9R u1899 (.Y(n1454), .A0(n1244), .A1(n1245), .B0(n374));
    NAND2X0P5H9R u1855 (.Y(n1417), .A(n1196), .B(n1231));
    NOR2X0P5H9R u940 (.Y(n678), .A(n652_n1), .B(n677));
    NOR2X0P5H9R u931 (.Y(\u_compute_engine/u_mul8x8/n86 ), .A(n669), .B(n5735));
    AOI21X0P5H9R u930 (.Y(n669), .A0(n5748), .A1(n658_n1), .B0(n668));
    AOI221X0P5H9R u942 (.Y(\u_compute_engine/u_mul8x8/n102 ), .A0(n674),
        .A1(n670), .B0(n676), .B1(\u_compute_engine/u_mul8x8/pp[0][0] ),
        .C0(n679));
    AOI211X0P5H9R u941 (.Y(n679), .A0(n652_n1), .A1(n673), .B0(n678), .C0(n670));
    AO22X0P5H9R u936 (.Y(n674), .A0(n656), .A1(n2322), .B0(n673), .B1(n652_n1));
    OAI221X0P5H9R u25378 (.Y(\u_compute_engine/n24 ), .A0(n1168), .A1(n19798),
        .B0(\u_compute_engine/calc_en ), .B1(n19622), .C0(n647));
    INVX0P5H9R u25377 (.Y(n19798), .A(n19622));
    XOR2X0P5H9R u25407 (.Y(n676), .A(n675_n0), .B(n2322));
    AOI31X0P5H9R u25389 (.Y(n19807), .A0(n1189), .A1(n1410), .A2(n1411),
        .B0(n19806));
    AO22X0P5H9R u25471 (.Y(\u_spi_rx/n46 ), .A0(n19895), .A1(\u_spi_rx/shift_A[14] ),
        .B0(in_ready), .B1(\u_spi_rx/shift_A[13] ));
    AO22X0P5H9R u25474 (.Y(\u_spi_rx/n47 ), .A0(n19895), .A1(\u_spi_rx/shift_A[13] ),
        .B0(in_ready), .B1(\u_spi_rx/shift_A[12] ));
    AO22X0P5H9R u25477 (.Y(\u_spi_rx/n48 ), .A0(n19895), .A1(\u_spi_rx/shift_A[12] ),
        .B0(in_ready), .B1(\u_spi_rx/shift_A[11] ));
    AO22X0P5H9R u25480 (.Y(\u_spi_rx/n49 ), .A0(n19895), .A1(\u_spi_rx/shift_A[11] ),
        .B0(in_ready), .B1(\u_spi_rx/shift_A[10] ));
    AO22X0P5H9R u25483 (.Y(\u_spi_rx/n50 ), .A0(n19895), .A1(\u_spi_rx/shift_A[10] ),
        .B0(in_ready), .B1(\u_spi_rx/shift_A[9] ));
    AO22X0P5H9R u25486 (.Y(\u_spi_rx/n51 ), .A0(n19895), .A1(\u_spi_rx/shift_A[9] ),
        .B0(in_ready), .B1(\u_spi_rx/shift_A[8] ));
    AO22X0P5H9R u25489 (.Y(\u_spi_rx/n52 ), .A0(n19895), .A1(\u_spi_rx/shift_A[8] ),
        .B0(in_ready), .B1(\u_spi_rx/shift_A[7] ));
    AO22X0P5H9R u25492 (.Y(\u_spi_rx/n53 ), .A0(n19895), .A1(\u_spi_rx/shift_A[7] ),
        .B0(in_ready), .B1(\u_spi_rx/shift_A[6] ));
    AO22X0P5H9R u25495 (.Y(\u_spi_rx/n54 ), .A0(n19895), .A1(\u_spi_rx/shift_A[6] ),
        .B0(in_ready), .B1(\u_spi_rx/shift_A[5] ));
    AO22X0P5H9R u25498 (.Y(\u_spi_rx/n55 ), .A0(n19895), .A1(\u_spi_rx/shift_A[5] ),
        .B0(in_ready), .B1(\u_spi_rx/shift_A[4] ));
    AO22X0P5H9R u25501 (.Y(\u_spi_rx/n56 ), .A0(n19895), .A1(\u_spi_rx/shift_A[4] ),
        .B0(in_ready), .B1(\u_spi_rx/shift_A[3] ));
    AO22X0P5H9R u25504 (.Y(\u_spi_rx/n57 ), .A0(n19895), .A1(\u_spi_rx/shift_A[3] ),
        .B0(in_ready), .B1(\u_spi_rx/shift_A[2] ));
    AO22X0P5H9R u25507 (.Y(\u_spi_rx/n58 ), .A0(n19895), .A1(\u_spi_rx/shift_A[2] ),
        .B0(in_ready), .B1(\u_spi_rx/shift_A[1] ));
    AO22X0P5H9R u25510 (.Y(\u_spi_rx/n59 ), .A0(n19895), .A1(\u_spi_rx/shift_A[1] ),
        .B0(in_ready), .B1(\u_spi_rx/shift_A[0] ));
    AO22X0P5H9R u25516 (.Y(\u_spi_rx/n63 ), .A0(n19895), .A1(\u_spi_rx/shift_B[13] ),
        .B0(in_ready), .B1(\u_spi_rx/shift_B[12] ));
    AO22X0P5H9R u25519 (.Y(\u_spi_rx/n64 ), .A0(n19895), .A1(\u_spi_rx/shift_B[12] ),
        .B0(in_ready), .B1(\u_spi_rx/shift_B[11] ));
    AO22X0P5H9R u25522 (.Y(\u_spi_rx/n65 ), .A0(n19895), .A1(\u_spi_rx/shift_B[11] ),
        .B0(in_ready), .B1(\u_spi_rx/shift_B[10] ));
    AO22X0P5H9R u25525 (.Y(\u_spi_rx/n66 ), .A0(n19895), .A1(\u_spi_rx/shift_B[10] ),
        .B0(in_ready), .B1(\u_spi_rx/shift_B[9] ));
    AO22X0P5H9R u25528 (.Y(\u_spi_rx/n67 ), .A0(n19895), .A1(\u_spi_rx/shift_B[9] ),
        .B0(in_ready), .B1(\u_spi_rx/shift_B[8] ));
    AO22X0P5H9R u25531 (.Y(\u_spi_rx/n68 ), .A0(n19895), .A1(\u_spi_rx/shift_B[8] ),
        .B0(in_ready), .B1(\u_spi_rx/shift_B[7] ));
    AO22X0P5H9R u25534 (.Y(\u_spi_rx/n69 ), .A0(n19895), .A1(\u_spi_rx/shift_B[7] ),
        .B0(in_ready), .B1(\u_spi_rx/shift_B[6] ));
    AO22X0P5H9R u25537 (.Y(\u_spi_rx/n70 ), .A0(n19895), .A1(\u_spi_rx/shift_B[6] ),
        .B0(in_ready), .B1(\u_spi_rx/shift_B[5] ));
    AO22X0P5H9R u25540 (.Y(\u_spi_rx/n71 ), .A0(n19895), .A1(\u_spi_rx/shift_B[5] ),
        .B0(in_ready), .B1(\u_spi_rx/shift_B[4] ));
    AO22X0P5H9R u25543 (.Y(\u_spi_rx/n72 ), .A0(n19895), .A1(\u_spi_rx/shift_B[4] ),
        .B0(in_ready), .B1(\u_spi_rx/shift_B[3] ));
    AO22X0P5H9R u25546 (.Y(\u_spi_rx/n73 ), .A0(n19895), .A1(\u_spi_rx/shift_B[3] ),
        .B0(in_ready), .B1(\u_spi_rx/shift_B[2] ));
    AO22X0P5H9R u25549 (.Y(\u_spi_rx/n74 ), .A0(n19895), .A1(\u_spi_rx/shift_B[2] ),
        .B0(in_ready), .B1(\u_spi_rx/shift_B[1] ));
    AO22X0P5H9R u25552 (.Y(\u_spi_rx/n75 ), .A0(n19895), .A1(\u_spi_rx/shift_B[1] ),
        .B0(in_ready), .B1(\u_spi_rx/shift_B[0] ));
    AO22X0P5H9R u25555 (.Y(\u_spi_rx/n60 ), .A0(n19895), .A1(\u_spi_rx/shift_A[0] ),
        .B0(in_ready), .B1(inA));
    AO22X0P5H9R u25558 (.Y(\u_spi_rx/n76 ), .A0(n19895), .A1(\u_spi_rx/shift_B[0] ),
        .B0(in_ready), .B1(inB));
    INVX1H9R u25559 (.Y(n19895), .A(in_ready));
    NOR2X0P5H9R u1926 (.Y(n1476), .A(\u_compute_engine/global_acc[9] ), .B(\u_compute_engine/global_acc[8] ));
    NOR2X0P5H9R u1925 (.Y(n1475), .A(\u_compute_engine/global_acc[11] ),
        .B(\u_compute_engine/global_acc[10] ));
    NOR2X0P5H9R u1924 (.Y(n1474), .A(\u_compute_engine/global_acc[5] ), .B(\u_compute_engine/global_acc[4] ));
    NOR2X0P5H9R u1923 (.Y(n1473), .A(\u_compute_engine/global_acc[7] ), .B(\u_compute_engine/global_acc[6] ));
    OR3X0P5H9R u25844 (.Y(n19937), .A(\u_compute_engine/global_acc[22] ),
        .B(\u_compute_engine/global_acc[23] ), .C(\u_compute_engine/global_acc[21] ));
    AOI21X0P5H9R u25849 (.Y(n1036), .A0(n1035), .A1(n1034), .B0(n408));
    NAND2X0P5H9R u1315 (.Y(n1039), .A(n1037), .B(n1038));
    XNOR2X0P5H9R u1314 (.Y(n1038), .A(\u_sync_fifo/wr_ptr[1] ), .B(\u_sync_fifo/rd_ptr[1] ));
    XNOR2X0P5H9R u1313 (.Y(n1037), .A(\u_sync_fifo/wr_ptr[0] ), .B(\u_sync_fifo/rd_ptr[0] ));
    OAI22X1H9R u1946 (.Y(n1491), .A0(n1489), .A1(n1488), .B0(n1490), .B1(n576));
    NAND2X0P5H9R u1945 (.Y(n1490), .A(mode_d2), .B(\u_compute_engine/temp_product[1] ));
    NOR2X0P5H9R u1944 (.Y(n1489), .A(\u_compute_engine/global_acc[1] ), .B(\u_compute_engine/temp_product[1] ));
    OR4X0P5H9R u25860 (.Y(n19947), .A(\u_compute_engine/global_acc[14] ),
        .B(\u_compute_engine/global_acc[15] ), .C(\u_compute_engine/global_acc[18] ),
        .D(\u_compute_engine/global_acc[19] ));
    NOR2X0P5H9R u25861 (.Y(n2134), .A(\u_compute_engine/global_acc[16] ),
        .B(\u_compute_engine/global_acc[17] ));
    NOR2X0P5H9R u25862 (.Y(n19948), .A(\u_compute_engine/global_acc[13] ),
        .B(\u_compute_engine/global_acc[12] ));
    NOR3X0P5H9R u25863 (.Y(n2135), .A(\u_compute_engine/calc_en ), .B(n19937),
        .C(\u_compute_engine/global_acc[20] ));
    OA21X0P5H9R u25866 (.Y(\u_spi_rx/n77 ), .A0(n1546), .A1(\u_spi_rx/bit_cnt[3] ),
        .B0(n1547));
    OR2X0P5H9R u1318 (.Y(n1042), .A(out_ready), .B(n1041));
    OA22X0P5H9R u1449 (.Y(\u_spi_tx/n102 ), .A0(\u_spi_tx/out_cnt[4] ), .A1(\u_spi_tx/n108 ),
        .B0(n1146), .B1(\u_spi_tx/out_cnt[3] ));
    INVX0P5H9R u2541 (.Y(n1150), .A(n1149));
    OR2X0P5H9R u25925 (.Y(n19970), .A(n1248_n1), .B(n1246_n1));
    AOI211X0P5H9R u25926 (.Y(n1451), .A0(\u_compute_engine/mul_result[5] ),
        .A1(n19970), .B0(n1249_n1), .C0(n1176));
    OAI211X1H9R u1951 (.Y(n1496), .A0(\u_compute_engine/temp_product[3] ),
        .A1(\u_compute_engine/global_acc[3] ), .B0(mode_d2_n1), .C0(n1495));
    INVX0P5H9R u25909 (.Y(n1495), .A(n19957));
    AOI222X0P5H9R u25908 (.Y(n19957), .A0(\u_compute_engine/global_acc[3] ),
        .A1(\u_compute_engine/temp_product[3] ), .B0(n1492), .B1(\u_compute_engine/global_acc[2] ),
        .C0(\u_compute_engine/temp_product[2] ), .C1(n1491));
    OAI21X0P5H9R u1456 (.Y(\u_spi_tx/n104 ), .A0(n1035), .A1(n1146), .B0(n1151));
    OAI22X0P5H9R u1455 (.Y(n1151), .A0(\u_spi_tx/out_cnt[2] ), .A1(\u_spi_tx/n108 ),
        .B0(n1150), .B1(\u_spi_tx/out_cnt[1] ));
    OAOI211X0P5H9R u1919 (.ZN(\u_compute_engine/n234 ), .A1(n2301), .A2(n1459),
        .B(n2128), .C(n1469));
    AOI21X0P5H9R u1918 (.Y(n1469), .A0(n2128), .A1(\u_compute_engine/mul_result[0] ),
        .B0(\u_compute_engine/temp_product[0] ));
    AOI211X0P5H9R u1917 (.Y(\u_compute_engine/n232 ), .A0(n1462), .A1(n1467),
        .B0(n1468), .C0(n1230));
    AOI21X0P5H9R u1916 (.Y(n1468), .A0(n1461), .A1(n1467), .B0(\u_compute_engine/temp_product[1] ));
    OAI21X0P5H9R u1912 (.Y(n1465), .A0(n1460), .A1(n1462), .B0(\u_compute_engine/mul_result[2] ));
    AOI221X0P5H9R u1438 (.Y(n1139), .A0(\u_spi_tx/shift_reg[0] ), .A1(n1036),
        .B0(n1043), .B1(\u_spi_tx/shift_reg[1] ), .C0(n1138));
    NOR3X0P5H9R u1437 (.Y(n1138), .A(n1042), .B(n1136), .C(n1137));
    AOI221X0P5H9R u1433 (.Y(n1135), .A0(\u_spi_tx/shift_reg[1] ), .A1(n1036),
        .B0(n1043), .B1(\u_spi_tx/shift_reg[2] ), .C0(n1134));
    NOR3X0P5H9R u1432 (.Y(n1134), .A(n1042), .B(n1132), .C(n1133));
    NOR2X0P5H9R u1921 (.Y(n1471), .A(\u_compute_engine/global_acc[3] ), .B(\u_compute_engine/global_acc[2] ));
    NAND3X0P5H9R u1953 (.Y(n1498), .A(\u_compute_engine/temp_product[4] ),
        .B(\u_compute_engine/global_acc[4] ), .C(mode_d2_n1));
    NOR2X0P5H9R u1952 (.Y(n1497), .A(\u_compute_engine/temp_product[4] ),
        .B(\u_compute_engine/global_acc[4] ));
    AO21X0P5H9R u1837 (.Y(n1401), .A0(\u_compute_engine/mul_result[5] ),
        .A1(n1199), .B0(n2126));
    AND2X0P5H9R u1914 (.Y(\u_compute_engine/n230 ), .A(n1464), .B(n1466));
    AOI31X0P5H9R u1913 (.Y(n1466), .A0(n2128), .A1(n1465), .A2(n1243_n1),
        .B0(n1230));
    OAI31X0P5H9R u1911 (.Y(n1464), .A0(n1176), .A1(n1241), .A2(n1463), .B0(n550));
    OAI31X0P5H9R u1443 (.Y(\u_spi_tx/n100 ), .A0(n1042), .A1(n1140), .A2(n1141),
        .B0(n1142));
    NAND2X0P5H9R u1442 (.Y(n1142), .A(\u_spi_tx/shift_reg[0] ), .B(n1043));
    OAI22X0P5H9R u1441 (.Y(n1141), .A0(\u_sync_fifo/mem[3][0] ), .A1(n1044),
        .B0(n1048), .B1(\u_sync_fifo/mem[0][0] ));
    OAI22X0P5H9R u1440 (.Y(n1140), .A0(\u_sync_fifo/mem[2][0] ), .A1(n1045),
        .B0(n1047), .B1(\u_sync_fifo/mem[1][0] ));
    NOR3X0P5H9R u1934 (.Y(\u_compute_engine/n328 ), .A(n1472), .B(n1477),
        .C(n1483));
    NAND4BX0P5H9R u25864 (.Y(n1483), .AN(n19947), .B(n2134), .C(n19948),
        .D(n2135));
    NAND4X0P5H9R u1927 (.Y(n1477), .A(n1473), .B(n1474), .C(n1475), .D(n1476));
    NAND4XXXBX0P5H9R u1922 (.Y(n1472), .A(n576), .B(n2130), .C(n1471), .DN(\u_compute_engine/global_acc[0] ));
    CGENCONAX1H9R u1955 (.CON(n1500), .A(\u_compute_engine/temp_product[5] ),
        .B(n1487), .CI(n1499));
    OAI21X1H9R u1954 (.Y(n1499), .A0(n1497), .A1(n1496), .B0(n1498));
    AND2X0P5H9R u1942 (.Y(n1487), .A(mode_d2_n1), .B(\u_compute_engine/global_acc[5] ));
    NAND4X0P5H9R u26082 (.Y(n20101), .A(n1231), .B(n1382), .C(n1383), .D(\u_compute_engine/temp_product[15] ));
    OR2X0P5H9R u26085 (.Y(n20103), .A(n1253), .B(n1251_n1));
    AO21X0P5H9R u2022 (.Y(\u_compute_engine/n379 ), .A0(\u_compute_engine/n328 ),
        .A1(n1545), .B0(calc_carry));
    NAND4X0P5H9R u2021 (.Y(n1545), .A(n527), .B(n528), .C(n1543), .D(n1544));
    OAI2XB1X0P5H9R u26096 (.Y(n20110), .A0(\u_compute_engine/temp_product[1] ),
        .A1N(n1488), .B0(\u_compute_engine/n328 ));
    NAND2X0P5H9R u26097 (.Y(\u_compute_engine/n353 ), .A(n576), .B(n20110));
    CGENCONAX1H9R u1957 (.CON(n1502), .A(n546), .B(n1501), .CI(n1500));
    NAND2X0P5H9R u1956 (.Y(n1501), .A(\u_compute_engine/global_acc[6] ),
        .B(mode_d2_n1));
    XNOR2X0P5H9R u1875 (.Y(n1435), .A(\u_compute_engine/mul_result[9] ),
        .B(n1258_n1));
    AOAI211X0P5H9R u1810 (.ZN(n1377), .A1(n1375), .A2(n1376), .B(\u_compute_engine/mul_result[8] ),
        .C(n1176));
    NOR2BX0P5H9R u25333 (.Y(n1361), .AN(n1184), .B(n1205));
    NOR2X0P5H9R u26118 (.Y(n20126), .A(n1437), .B(n1438));
    NAND2BX0P5H9R u2013 (.Y(\u_compute_engine/n350 ), .AN(\u_compute_engine/global_acc[4] ),
        .B(n1541));
    OAI2XB1X0P5H9R u2012 (.Y(n1541), .A0(\u_compute_engine/temp_product[4] ),
        .A1N(n1496), .B0(\u_compute_engine/n328 ));
    CGENCONAX1H9R u1959 (.CON(n1504), .A(\u_compute_engine/temp_product[7] ),
        .B(n1503), .CI(n1502));
    AND2X0P5H9R u1958 (.Y(n1503), .A(mode_d2_n1), .B(\u_compute_engine/global_acc[7] ));
    AOI21X0P5H9R u2003 (.Y(n1537), .A0(mode_d2_n1), .A1(\u_compute_engine/global_acc[8] ),
        .B0(\u_compute_engine/temp_product[9] ));
    AOI211X0P5H9R u1805 (.Y(n1373), .A0(\u_compute_engine/temp_product[17] ),
        .A1(n1371), .B0(n1372), .C0(n2128));
    AOI211X0P5H9R u1804 (.Y(n1372), .A0(\u_compute_engine/mul_result[9] ),
        .A1(n1203), .B0(n1370), .C0(\u_compute_engine/temp_product[17] ));
    AO21X0P5H9R u1803 (.Y(n1371), .A0(\u_compute_engine/mul_result[9] ),
        .A1(n1203), .B0(n1370));
    NOR2X0P5H9R u26140 (.Y(\u_compute_engine/n220 ), .A(n1230), .B(n20140));
    AOI31X0P5H9R u1794 (.Y(n1363), .A0(n2125), .A1(n1184), .A2(n1204), .B0(n1362));
    OAI21X0P5H9R u1793 (.Y(n1362), .A0(n1361), .A1(n1204), .B0(n1176));
    INVX0P5H9R u2637 (.Y(n2125), .A(n1205));
    AOI21X0P5H9R u1866 (.Y(n1427), .A0(n1426), .A1(n1259), .B0(n1176));
    AOI211X0P5H9R u1812 (.Y(n1379), .A0(\u_compute_engine/mul_result[0] ),
        .A1(n1230), .B0(n1378), .C0(n1232));
    AOI31X0P5H9R u1811 (.Y(n1378), .A0(\u_compute_engine/mul_result[8] ),
        .A1(n1375), .A2(n1376), .B0(n1377));
    OA211X0P5H9R u1868 (.Y(\u_compute_engine/n216 ), .A0(\u_compute_engine/temp_product[10] ),
        .A1(n1423), .B0(n1424), .C0(n1428));
    OAI21X0P5H9R u1867 (.Y(n1428), .A0(n1259), .A1(n1426), .B0(n1427));
    AOI31X0P5H9R u1863 (.Y(n1424), .A0(\u_compute_engine/temp_product[10] ),
        .A1(n1231), .A2(n1422), .B0(n1230));
    AOI2XB1X0P5H9R u1862 (.Y(n1423), .A0(n2301), .A1N(n1422), .B0(n1232));
    AO21X0P5H9R u2007 (.Y(\u_compute_engine/n346 ), .A0(\u_compute_engine/n328 ),
        .A1(n1539), .B0(\u_compute_engine/global_acc[8] ));
    NAND2X0P5H9R u2006 (.Y(n1539), .A(n544), .B(n1504_n1));
    AO21X0P5H9R u2005 (.Y(\u_compute_engine/n345 ), .A0(\u_compute_engine/n328 ),
        .A1(n1538), .B0(\u_compute_engine/global_acc[9] ));
    OAI21X0P5H9R u2004 (.Y(n1538), .A0(n544), .A1(n1504_n1), .B0(n1537));
    OAI2XB1X0P5H9R u1960 (.Y(n1505), .A0(\u_compute_engine/temp_product[8] ),
        .A1N(n1504), .B0(\u_compute_engine/global_acc[8] ));
    NAND2X0P5H9R u1961 (.Y(n1506), .A(\u_compute_engine/global_acc[9] ),
        .B(\u_compute_engine/temp_product[9] ));
    NOR2BX0P5H9R u1857 (.Y(n1419), .AN(n1263), .B(n1262));
    OAI211X1H9R u1963 (.Y(n1508), .A0(\u_compute_engine/temp_product[9] ),
        .A1(\u_compute_engine/global_acc[9] ), .B0(n1507), .C0(mode_d2_n1));
    OAI211X1H9R u1962 (.Y(n1507), .A0(n544), .A1(n1504_n1), .B0(n1506), .C0(n1505));
    XOR3X0P5H9R u1000 (.Y(\u_compute_engine/u_mul8x8/n134 ), .A(n708), .B(n710),
        .C(n735));
    NAND2X0P5H9R u974 (.Y(n710), .A(n19694), .B(n709));
    AOI211X0P5H9R u1785 (.Y(n1355), .A0(\u_compute_engine/mul_result[3] ),
        .A1(n1230), .B0(n1354), .C0(n1232));
    OAI22X0P5H9R u1859 (.Y(\u_compute_engine/n215 ), .A0(n1416), .A1(n1418),
        .B0(n1420), .B1(n1285));
    XNOR2X0P5H9R u1858 (.Y(n1420), .A(\u_compute_engine/mul_result[11] ),
        .B(n1419));
    OAI21X0P5H9R u1856 (.Y(n1418), .A0(n1417), .A1(n1197), .B0(n1176));
    AOI31X0P5H9R u1854 (.Y(n1416), .A0(n1196), .A1(n1415), .A2(n1231), .B0(\u_compute_engine/temp_product[11] ));
    OAI2XB1X0P5H9R u1852 (.Y(\u_compute_engine/n214 ), .A0(n1408), .A1N(n1409),
        .B0(n1414));
    NAND3X0P5H9R u25390 (.Y(n1414), .A(n651_n1), .B(n2301), .C(n19807));
    OAI211X0P5H9R u1846 (.Y(n1409), .A0(n2301), .A1(n1407), .B0(n1179), .C0(\u_compute_engine/temp_product[12] ));
    AOI21X0P5H9R u1845 (.Y(n1408), .A0(n2130), .A1(n1407), .B0(\u_compute_engine/temp_product[12] ));
    NOR2X0P5H9R u1841 (.Y(n1405), .A(\u_compute_engine/temp_product[13] ),
        .B(n1267_n1));
    AND2X0P5H9R u1840 (.Y(n1404), .A(n1268), .B(n2130));
    OR3X0P5H9R u1839 (.Y(n1403), .A(n539), .B(n1400), .C(n1401));
    OAI21X0P5H9R u1838 (.Y(n1402), .A0(n1400), .A1(n1401), .B0(n539));
    OAI31X0P5H9R u1843 (.Y(\u_compute_engine/n213 ), .A0(n2301), .A1(n539),
        .A2(n1399), .B0(n1406));
    AOI32X0P5H9R u1842 (.Y(n1406), .A0(n1176), .A1(n1402), .A2(n1403), .B0(n1404),
        .B1(n1405));
    NOR2BX0P5H9R u1835 (.Y(n1399), .AN(n1268), .B(n1267_n1));
    AOI31X1H9R u1972 (.Y(n1517), .A0(n1515), .A1(n1512), .A2(n1513), .B0(n1516));
    NOR2X0P5H9R u1971 (.Y(n1516), .A(\u_compute_engine/global_acc[12] ),
        .B(\u_compute_engine/temp_product[12] ));
    NAND3X1H9R u1968 (.Y(n1513), .A(\u_compute_engine/temp_product[12] ),
        .B(\u_compute_engine/temp_product[11] ), .C(n1510));
    NAND3BX1H9R u1967 (.Y(n1512), .AN(n1511), .B(\u_compute_engine/global_acc[12] ),
        .C(mode_d2_n1));
    AOI221X0P5H9R u1767 (.Y(n1340), .A0(\u_compute_engine/mul_result[6] ),
        .A1(n1230), .B0(n1338), .B1(n1339), .C0(n1232));
    AOI31X0P5H9R u1766 (.Y(n1339), .A0(\u_compute_engine/mul_result[14] ),
        .A1(n1220), .A2(n1219), .B0(n2128));
    AO21X0P5H9R u1765 (.Y(n1338), .A0(n1220), .A1(n1219), .B0(\u_compute_engine/mul_result[14] ));
    OAI221X0P5H9R u1826 (.Y(\u_compute_engine/n211 ), .A0(n1384), .A1(n1387),
        .B0(n1388), .B1(n1389), .C0(n1391));
    NAND3BX0P5H9R u1825 (.Y(n1391), .AN(n2301), .B(\u_compute_engine/temp_product[15] ),
        .C(n1390));
    OAI21X0P5H9R u1823 (.Y(n1389), .A0(n363), .A1(n1270), .B0(n537));
    OAI2XB1X0P5H9R u1822 (.Y(n1388), .A0(\u_compute_engine/mul_result[15] ),
        .A1N(n1270), .B0(n2130));
    NAND2X0P5H9R u26083 (.Y(n1387), .A(n1176), .B(n20101));
    AOI31X0P5H9R u1818 (.Y(n1384), .A0(n1382), .A1(n1383), .A2(n1231), .B0(\u_compute_engine/temp_product[15] ));
    OAOI211X0P5H9R u1752 (.ZN(n1327), .A1(n1221), .A2(n1182), .B(n1222),
        .C(\u_compute_engine/temp_product[24] ));
    AOI22X0P5H9R u1815 (.Y(\u_compute_engine/n210 ), .A0(n536), .A1(n1380),
        .B0(n1381), .B1(n1379));
    NAND2X0P5H9R u1814 (.Y(n1381), .A(n2126), .B(n1368));
    OAI2XB1X0P5H9R u1813 (.Y(n1380), .A0(n1271), .A1N(n1379), .B0(n1179));
    AO21X0P5H9R u1996 (.Y(\u_compute_engine/n340 ), .A0(\u_compute_engine/n328 ),
        .A1(n1534), .B0(\u_compute_engine/global_acc[14] ));
    NAND3XXBX0P5H9R u1995 (.Y(n1534), .A(n538), .B(n1518), .CN(n1520));
    OAI21X1H9R u1978 (.Y(n1523), .A0(n1518), .A1(n1519), .B0(n1522));
    CGENCONAX1H9R u1977 (.CON(n1522), .A(\u_compute_engine/temp_product[14] ),
        .B(n1521), .CI(n1520));
    NOR2X0P5H9R u1974 (.Y(n1519), .A(\u_compute_engine/temp_product[14] ),
        .B(\u_compute_engine/global_acc[14] ));
    AOI211X0P5H9R u1754 (.Y(n1329), .A0(\u_compute_engine/mul_result[8] ),
        .A1(n1230), .B0(n1328), .C0(n1232));
    NOR3X0P5H9R u1753 (.Y(n1328), .A(n2128), .B(n1327), .C(n1223));
    CGENX1H9R u1980 (.CO(n1525), .A(\u_compute_engine/temp_product[15] ),
        .B(n1524), .CI(n1523));
    AND2X0P5H9R u1979 (.Y(n1524), .A(mode_d2_n1), .B(\u_compute_engine/global_acc[15] ));
    AOI21X0P5H9R u26276 (.Y(n20243), .A0(n796), .A1(n795), .B0(n768));
    AOI31X0P5H9R u26277 (.Y(\u_compute_engine/u_mul8x8/n166 ), .A0(n796),
        .A1(n768), .A2(n795), .B0(n20243));
    OAOI211X2H9R u1984 (.ZN(n1529), .A1(n1485), .A2(n1526), .B(n1527), .C(n1528));
    OAI21X0P5H9R u1983 (.Y(n1528), .A0(\u_compute_engine/temp_product[18] ),
        .A1(\u_compute_engine/global_acc[18] ), .B0(mode_d2_n1));
    AOI22X0P5H9R u1982 (.Y(n1527), .A0(\u_compute_engine/temp_product[18] ),
        .A1(\u_compute_engine/global_acc[18] ), .B0(\u_compute_engine/global_acc[17] ),
        .B1(\u_compute_engine/temp_product[17] ));
    NOR2X0P5H9R u1940 (.Y(n1485), .A(\u_compute_engine/temp_product[17] ),
        .B(\u_compute_engine/global_acc[17] ));
    XNOR2X0P5H9R u2406 (.Y(\u_compute_engine/u_mul8x8/n182 ), .A(n1033),
        .B(n989));
    NOR2X0P5H9R u1308 (.Y(n1033), .A(n984), .B(n652_n1));
    OAI2XB1X0P5H9R u1992 (.Y(\u_compute_engine/n337 ), .A0(n1532), .A1N(\u_compute_engine/n328 ),
        .B0(n560));
    AOI2XB1X0P5H9R u1990 (.Y(n1532), .A0(mode_d2_n1), .A1N(n1526), .B0(\u_compute_engine/temp_product[17] ));
    AOI31X0P5H9R u1985 (.Y(n1530), .A0(\u_compute_engine/temp_product[19] ),
        .A1(mode_d2_n1), .A2(\u_compute_engine/global_acc[19] ), .B0(\u_compute_engine/temp_product[20] ));
    NOR2X0P5H9R u1939 (.Y(n1484), .A(\u_compute_engine/temp_product[19] ),
        .B(\u_compute_engine/global_acc[19] ));
    AO21X0P5H9R u1987 (.Y(\u_compute_engine/n334 ), .A0(\u_compute_engine/n328 ),
        .A1(n1531), .B0(\u_compute_engine/global_acc[20] ));
    OAI2XB1X0P5H9R u1986 (.Y(n1531), .A0(n1484), .A1N(n1529), .B0(n1530));
    XOR2X0P5H9R u2405 (.Y(\u_compute_engine/u_mul8x8/n181 ), .A(n1032), .B(n992));
    NOR2X0P5H9R u1306 (.Y(n1032), .A(n991), .B(n990));
    AOI21BX0P5H9R u25905 (.Y(n1231), .A0(n19643), .A1(n2399), .B0N(n19621));
    AOI21X0P5H9R u1881 (.Y(n1440), .A0(\u_compute_engine/mul_result[0] ),
        .A1(\u_compute_engine/temp_product[8] ), .B0(n2128));
    AOI2XB1X0P5H9R u1882 (.Y(n1441), .A0(n2301), .A1N(\u_compute_engine/mul_result[0] ),
        .B0(n1232));
    AND2X0P5H9R u26385 (.Y(n12647), .A(n799), .B(n709));
    XNOR2X0P5H9R u26139 (.Y(n20140), .A(\u_compute_engine/temp_product[7] ),
        .B(n1445));
    AOI211X0P5H9R u26086 (.Y(n1445), .A0(\u_compute_engine/mul_result[7] ),
        .A1(n20103), .B0(n1176), .C0(n1254));
    AOI21X0P5H9R u26142 (.Y(n1429), .A0(n1258_n1), .A1(\u_compute_engine/mul_result[9] ),
        .B0(\u_compute_engine/temp_product[9] ));
    NAND3X0P5H9R u26146 (.Y(\u_compute_engine/n217 ), .A(n20141), .B(n20142),
        .C(n20144));
    OAI211X0P5H9R u26143 (.Y(n20142), .A0(\u_compute_engine/mul_result[9] ),
        .A1(n1258_n1), .B0(n2130), .C0(n1429));
    NAND3BX0P5H9R u26141 (.Y(n20141), .AN(n2301), .B(\u_compute_engine/temp_product[9] ),
        .C(n1435));
    NOR2X0P5H9R u26121 (.Y(\u_compute_engine/n218 ), .A(n20127), .B(n20128));
    OAI22X0P5H9R u26120 (.Y(n20128), .A0(n1441), .A1(\u_compute_engine/temp_product[8] ),
        .B0(n2126), .B1(n1440));
    AOI211X0P5H9R u26119 (.Y(n20127), .A0(n1438), .A1(n1437), .B0(n20126),
        .C0(n1176));
    NAND2X0P5H9R u26181 (.Y(n20170), .A(n1206), .B(n1210));
    NOR2X0P5H9R u26183 (.Y(n1354), .A(n2128), .B(n20171));
    XOR2X0P5H9R u26182 (.Y(n20171), .A(n20170), .B(\u_compute_engine/mul_result[11] ));
    OAI22X0P5H9R u26221 (.Y(\u_compute_engine/n212 ), .A0(n1285), .A1(n20199),
        .B0(n1396), .B1(n20200));
    AND2X0P5H9R u26220 (.Y(n20200), .A(\u_compute_engine/temp_product[14] ),
        .B(n1395));
    OAI21X0P5H9R u1831 (.Y(n1396), .A0(\u_compute_engine/temp_product[14] ),
        .A1(n1395), .B0(n1176));
    XOR3X0P5H9R u26424 (.Y(n20199), .A(n1269), .B(\u_compute_engine/mul_result[14] ),
        .C(\u_compute_engine/temp_product[14] ));
    AO22X0P5H9R u26585 (.Y(\u_spi_rx/n87 ), .A0(n20506), .A1(\u_spi_rx/shift_A[8] ),
        .B0(n1547), .B1(\rx_data_A[9] ));
    AO22X0P5H9R u26588 (.Y(\u_spi_rx/n95 ), .A0(n20506), .A1(\u_spi_rx/shift_A[0] ),
        .B0(n1547), .B1(\rx_data_A[1] ));
    AO22X0P5H9R u26591 (.Y(\u_spi_rx/n110 ), .A0(n20506), .A1(\u_spi_rx/shift_B[1] ),
        .B0(n1547), .B1(\rx_data_B[2] ));
    AO22X0P5H9R u26594 (.Y(\u_spi_rx/n111 ), .A0(n20506), .A1(\u_spi_rx/shift_B[0] ),
        .B0(n1547), .B1(\rx_data_B[1] ));
    AO22X0P5H9R u26597 (.Y(\u_spi_rx/n81 ), .A0(n20506), .A1(\u_spi_rx/shift_A[14] ),
        .B0(n1547), .B1(\rx_data_A[15] ));
    AO22X0P5H9R u26600 (.Y(\u_spi_rx/n82 ), .A0(n20506), .A1(\u_spi_rx/shift_A[13] ),
        .B0(n1547), .B1(\rx_data_A[14] ));
    AO22X0P5H9R u26603 (.Y(\u_spi_rx/n83 ), .A0(n20506), .A1(\u_spi_rx/shift_A[12] ),
        .B0(n1547), .B1(\rx_data_A[13] ));
    AO22X0P5H9R u26606 (.Y(\u_spi_rx/n84 ), .A0(n20506), .A1(\u_spi_rx/shift_A[11] ),
        .B0(n1547), .B1(\rx_data_A[12] ));
    AO22X0P5H9R u26609 (.Y(\u_spi_rx/n85 ), .A0(n20506), .A1(\u_spi_rx/shift_A[10] ),
        .B0(n1547), .B1(\rx_data_A[11] ));
    AO22X0P5H9R u26612 (.Y(\u_spi_rx/n86 ), .A0(n20506), .A1(\u_spi_rx/shift_A[9] ),
        .B0(n1547), .B1(\rx_data_A[10] ));
    AO22X0P5H9R u26615 (.Y(\u_spi_rx/n88 ), .A0(n20506), .A1(\u_spi_rx/shift_A[7] ),
        .B0(n1547), .B1(\rx_data_A[8] ));
    AO22X0P5H9R u26618 (.Y(\u_spi_rx/n89 ), .A0(n20506), .A1(\u_spi_rx/shift_A[6] ),
        .B0(n1547), .B1(\rx_data_A[7] ));
    AO22X0P5H9R u26621 (.Y(\u_spi_rx/n90 ), .A0(n20506), .A1(\u_spi_rx/shift_A[5] ),
        .B0(n1547), .B1(\rx_data_A[6] ));
    AO22X0P5H9R u26624 (.Y(\u_spi_rx/n91 ), .A0(n20506), .A1(\u_spi_rx/shift_A[4] ),
        .B0(n1547), .B1(\rx_data_A[5] ));
    AO22X0P5H9R u26627 (.Y(\u_spi_rx/n92 ), .A0(n20506), .A1(\u_spi_rx/shift_A[3] ),
        .B0(n1547), .B1(\rx_data_A[4] ));
    AO22X0P5H9R u26630 (.Y(\u_spi_rx/n93 ), .A0(n20506), .A1(\u_spi_rx/shift_A[2] ),
        .B0(n1547), .B1(\rx_data_A[3] ));
    AO22X0P5H9R u26633 (.Y(\u_spi_rx/n94 ), .A0(n20506), .A1(\u_spi_rx/shift_A[1] ),
        .B0(n1547), .B1(\rx_data_A[2] ));
    AO22X0P5H9R u26636 (.Y(\u_spi_rx/n96 ), .A0(n20506), .A1(inA), .B0(n1547),
        .B1(\rx_data_A[0] ));
    AO22X0P5H9R u26639 (.Y(\u_spi_rx/n97 ), .A0(n20506), .A1(\u_spi_rx/shift_B[14] ),
        .B0(n1547), .B1(\rx_data_B[15] ));
    AO22X0P5H9R u26642 (.Y(\u_spi_rx/n98 ), .A0(n20506), .A1(\u_spi_rx/shift_B[13] ),
        .B0(n1547), .B1(\rx_data_B[14] ));
    AO22X0P5H9R u26645 (.Y(\u_spi_rx/n99 ), .A0(n20506), .A1(\u_spi_rx/shift_B[12] ),
        .B0(n1547), .B1(\rx_data_B[13] ));
    AO22X0P5H9R u26648 (.Y(\u_spi_rx/n100 ), .A0(n20506), .A1(\u_spi_rx/shift_B[11] ),
        .B0(n1547), .B1(\rx_data_B[12] ));
    AO22X0P5H9R u26651 (.Y(\u_spi_rx/n101 ), .A0(n20506), .A1(\u_spi_rx/shift_B[10] ),
        .B0(n1547), .B1(\rx_data_B[11] ));
    AO22X0P5H9R u26654 (.Y(\u_spi_rx/n102 ), .A0(n20506), .A1(\u_spi_rx/shift_B[9] ),
        .B0(n1547), .B1(\rx_data_B[10] ));
    AO22X0P5H9R u26657 (.Y(\u_spi_rx/n103 ), .A0(n20506), .A1(\u_spi_rx/shift_B[8] ),
        .B0(n1547), .B1(\rx_data_B[9] ));
    AO22X0P5H9R u26660 (.Y(\u_spi_rx/n104 ), .A0(n20506), .A1(\u_spi_rx/shift_B[7] ),
        .B0(n1547), .B1(\rx_data_B[8] ));
    AO22X0P5H9R u26663 (.Y(\u_spi_rx/n105 ), .A0(n20506), .A1(\u_spi_rx/shift_B[6] ),
        .B0(n1547), .B1(\rx_data_B[7] ));
    AO22X0P5H9R u26666 (.Y(\u_spi_rx/n106 ), .A0(n20506), .A1(\u_spi_rx/shift_B[5] ),
        .B0(n1547), .B1(\rx_data_B[6] ));
    AO22X0P5H9R u26669 (.Y(\u_spi_rx/n107 ), .A0(n20506), .A1(\u_spi_rx/shift_B[4] ),
        .B0(n1547), .B1(\rx_data_B[5] ));
    AO22X0P5H9R u26672 (.Y(\u_spi_rx/n108 ), .A0(n20506), .A1(\u_spi_rx/shift_B[3] ),
        .B0(n1547), .B1(\rx_data_B[4] ));
    AO22X0P5H9R u26675 (.Y(\u_spi_rx/n109 ), .A0(n20506), .A1(\u_spi_rx/shift_B[2] ),
        .B0(n1547), .B1(\rx_data_B[3] ));
    AO22X0P5H9R u26678 (.Y(\u_spi_rx/n112 ), .A0(n20506), .A1(inB), .B0(n1547),
        .B1(\rx_data_B[0] ));
    INVX1H9R u26679 (.Y(n20506), .A(n1547));
    NAND2X0P5H9R u26823 (.Y(n888), .A(n709), .B(n19525));
    AO22X0P5H9R u25513 (.Y(\u_spi_rx/n62 ), .A0(n19895), .A1(\u_spi_rx/shift_B[14] ),
        .B0(in_ready), .B1(\u_spi_rx/shift_B[13] ));
    AOI21X0P5H9R u27087 (.Y(n20594), .A0(\u_compute_engine/temp_product[8] ),
        .A1(\u_compute_engine/mul_result[0] ), .B0(\u_compute_engine/mul_result[1] ));
    OR2X0P5H9R u27091 (.Y(n20597), .A(n1241), .B(n1243_n1));
    AOI211X0P5H9R u27092 (.Y(n1457), .A0(\u_compute_engine/mul_result[3] ),
        .A1(n20597), .B0(n1245), .C0(n1176));
    OAI221X0P5H9R u26145 (.Y(n20144), .A0(\u_compute_engine/temp_product[9] ),
        .A1(n20143), .B0(n1433), .B1(n1191), .C0(n1176));
    NAND2X1H9R u1873 (.Y(n1433), .A(n1231), .B(n1190));
    NOR2X0P5H9R u27089 (.Y(n20143), .A(n20594), .B(n1433));
    AOI22X4H9R u1033 (.Y(n767), .A0(\rx_data_B[14] ), .A1(n19644), .B0(n680_n1),
        .B1(\rx_data_B[6] ));
    AO22X1P4H9R u1211 (.Y(n944), .A0(\rx_data_B[14] ), .A1(n19644), .B0(n680_n1),
        .B1(\rx_data_B[6] ));
    AOI22X1P4H9R u1251 (.Y(n984), .A0(\rx_data_B[15] ), .A1(n19644), .B0(n680_n1),
        .B1(\rx_data_B[7] ));
    OA21X0P5H9R u1830 (.Y(n1395), .A0(n372), .A1(n1200), .B0(n1394));
    AOI21X0P5H9R u1829 (.Y(n1394), .A0(n372), .A1(n1200), .B0(n2126));
    XNOR2X0P5H9R u27541 (.Y(n20797), .A(\u_compute_engine/temp_product[3] ),
        .B(n1457));
    NOR2X0P5H9R u27542 (.Y(\u_compute_engine/n228 ), .A(n1230), .B(n20797));
    XNOR2X0P5H9R u27543 (.Y(n20798), .A(\u_compute_engine/temp_product[5] ),
        .B(n1451));
    NOR2X0P5H9R u27544 (.Y(\u_compute_engine/n224 ), .A(n1230), .B(n20798));
    INVX1H9R u3732 (.Y(n2399), .A(n2398));
    INVX0P5H9R u3731 (.Y(n2398), .A(\u_compute_engine/cnt[1] ));
    NOR3X2H9R u1476 (.Y(n1162), .A(n1161), .B(\u_sync_fifo/wr_ptr[1] ), .C(n1156));
    INVX0P5H9R u1475 (.Y(n1161), .A(sys_rst_n));
    INVX3H9R u4252 (.Y(n781_n1), .A(n781_n0));
    INVX0P5H9R u4251 (.Y(n781_n0), .A(n781));
    NAND2X2H9R u1174 (.Y(n907), .A(n709), .B(n754_n1));
    BUFX1H9R u28172 (.Y(n666_n1), .A(n666));
    INVX1H9R u28203 (.Y(n968_n0), .A(n968));
    INVX1H9R u28204 (.Y(n968_n1), .A(n968_n0));
    INVX3H9R u28228 (.Y(n21036), .A(n754_n0));
    INVX1H9R u28238 (.Y(n724_n0), .A(n724));
    INVX2H9R u28239 (.Y(n724_n1), .A(n724_n0));
    INVX1H9R u28293 (.Y(n766_n0), .A(n766));
    INVX1H9R u28294 (.Y(n766_n1), .A(n766_n0));
    OAOI211X2H9R u28320 (.ZN(n21068), .A1(n1250_n1), .A2(n1249), .B(n372),
        .C(n546));
    INVX1H9R u28325 (.Y(n791_n0), .A(n791));
    INVX1H9R u28326 (.Y(n791_n1), .A(n791_n0));
    INVX1H9R u28365 (.Y(n683_n0), .A(n683));
    INVX1H9R u28366 (.Y(n683_n1), .A(n683_n0));
    INVX1H9R u28483 (.Y(n1250_n0), .A(n1250));
    INVX1H9R u28484 (.Y(n1250_n1), .A(n1250_n0));
    INVX1H9R u28488 (.Y(n1248_n0), .A(n1248));
    INVX1H9R u28489 (.Y(n1248_n1), .A(n1248_n0));
    INVX1H9R u28496 (.Y(n1258_n0), .A(n1258));
    INVX1H9R u28497 (.Y(n1258_n1), .A(n1258_n0));
    INVX1H9R u28504 (.Y(n1246_n0), .A(n1246));
    INVX1H9R u28505 (.Y(n1246_n1), .A(n1246_n0));
    INVX1H9R u28509 (.Y(n1251_n0), .A(n1251));
    INVX1H9R u28510 (.Y(n1251_n1), .A(n1251_n0));
    INVX1H9R u28528 (.Y(n814_n1_n0), .A(n814_n1));
    INVX1H9R u28529 (.Y(n814_n1_n1), .A(n814_n1_n0));
    INVX1H9R u28536 (.Y(n1249_n0), .A(n1249));
    INVX1H9R u28537 (.Y(n1249_n1), .A(n1249_n0));
    INVX1H9R u28547 (.Y(sys_rst_n_n0), .A(sys_rst_n));
    INVX16H9R u28548 (.Y(sys_rst_n_n1), .A(sys_rst_n_n0));
    INVX1H9R u28572 (.Y(n1243_n0), .A(n1243));
    INVX1H9R u28573 (.Y(n1243_n1), .A(n1243_n0));
    INVX1H9R u28589 (.Y(mode_d2_n0), .A(mode_d2));
    INVX1H9R u28590 (.Y(mode_d2_n1), .A(mode_d2_n0));
    INVX1H9R u28603 (.Y(n1267_n0), .A(n1267));
    INVX1H9R u28604 (.Y(n1267_n1), .A(n1267_n0));
    INVX1H9R u28608 (.Y(n1504_n0), .A(n1504));
    INVX1H9R u28609 (.Y(n1504_n1), .A(n1504_n0));

endmodule

