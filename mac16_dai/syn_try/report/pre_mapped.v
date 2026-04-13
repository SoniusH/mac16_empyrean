module spi_rx(clk, rst_n, in_ready, inA, inB, data_A, data_B, valid_out);
input clk, rst_n, in_ready, inA, inB;
output valid_out;
output [15:0] data_A;
output [15:0] data_B;
reg [15:0] data_A;
reg [15:0] data_B;
reg valid_out, \shift_A[14] , \shift_A[13] , \shift_A[12] , \shift_A[11] ,
     \shift_A[10] , \shift_A[9] , \shift_A[8] , \shift_A[7] , \shift_A[6] ,
     \shift_A[5] , \shift_A[4] , \shift_A[3] , \shift_A[2] , \shift_A[1] ,
     \shift_A[0] , \shift_B[14] , \shift_B[13] , \shift_B[12] , \shift_B[11] ,
     \shift_B[10] , \shift_B[9] , \shift_B[8] , \shift_B[7] , \shift_B[6] ,
     \shift_B[5] , \shift_B[4] , \shift_B[3] , \shift_B[2] , \shift_B[1] ,
     \shift_B[0] , \bit_cnt[3] , \bit_cnt[2] , \bit_cnt[1] , \bit_cnt[0] ;
wire n6, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21,
     n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36,
     n37, n38, n39, n40, n41, n42, n43, n44, n46, n47, n48, n49, n50, n51, n52,
     n53, n54, n55, n56, n57, n58, n59, n60, n62, n63, n64, n65, n66, n67, n68,
     n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83,
     n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98,
     n99, n100, n101, n102, n103, n104, n105, n106, n107, n108, n109, n110,
     n111, n112, n113, n145, n146, n147, n148, n149, n150, n151, n152, n153,
     n154, n155, n156, n157, n158, n159, n160, n161, n162, n163, n164, n165,
     n166, n167, n168, n169, n170, n171, n172, n173, n174, n175, n176, n177,
     n178, n179, n180, n181, n182, n183, n184, n185, n186, n187, n188, n189,
     n190, n191, n192, n193, n194, n195, n196, n197, n198, n199, n200, n201,
     n202, n203, n204, n205, n206, n207, n208, n209, n210, n211, n212;
    assign #1 n6 = ~rst_n ;
    assign #1 {n145, n8, n9, n10, n11} = {\bit_cnt[3] , \bit_cnt[2] , \bit_cnt[1] ,
        \bit_cnt[0] } + {1'b0, 1'b0, 1'b0, 1'b1};
    assign #1 n12 = ({\bit_cnt[3] , \bit_cnt[2] , \bit_cnt[1] , \bit_cnt[0] } == {1'b1, 1'b1, 1'b1, 1'b1} ? 1 : 0);
    assign #1 n13 = (n12 ? \shift_A[14]  : data_A[15]);
    assign #1 n14 = (n12 ? \shift_A[13]  : data_A[14]);
    assign #1 n15 = (n12 ? \shift_A[12]  : data_A[13]);
    assign #1 n16 = (n12 ? \shift_A[11]  : data_A[12]);
    assign #1 n17 = (n12 ? \shift_A[10]  : data_A[11]);
    assign #1 n18 = (n12 ? \shift_A[9]  : data_A[10]);
    assign #1 n19 = (n12 ? \shift_A[8]  : data_A[9]);
    assign #1 n20 = (n12 ? \shift_A[7]  : data_A[8]);
    assign #1 n21 = (n12 ? \shift_A[6]  : data_A[7]);
    assign #1 n22 = (n12 ? \shift_A[5]  : data_A[6]);
    assign #1 n23 = (n12 ? \shift_A[4]  : data_A[5]);
    assign #1 n24 = (n12 ? \shift_A[3]  : data_A[4]);
    assign #1 n25 = (n12 ? \shift_A[2]  : data_A[3]);
    assign #1 n26 = (n12 ? \shift_A[1]  : data_A[2]);
    assign #1 n27 = (n12 ? \shift_A[0]  : data_A[1]);
    assign #1 n28 = (n12 ? inA : data_A[0]);
    assign #1 n29 = (n12 ? \shift_B[14]  : data_B[15]);
    assign #1 n30 = (n12 ? \shift_B[13]  : data_B[14]);
    assign #1 n31 = (n12 ? \shift_B[12]  : data_B[13]);
    assign #1 n32 = (n12 ? \shift_B[11]  : data_B[12]);
    assign #1 n33 = (n12 ? \shift_B[10]  : data_B[11]);
    assign #1 n34 = (n12 ? \shift_B[9]  : data_B[10]);
    assign #1 n35 = (n12 ? \shift_B[8]  : data_B[9]);
    assign #1 n36 = (n12 ? \shift_B[7]  : data_B[8]);
    assign #1 n37 = (n12 ? \shift_B[6]  : data_B[7]);
    assign #1 n38 = (n12 ? \shift_B[5]  : data_B[6]);
    assign #1 n39 = (n12 ? \shift_B[4]  : data_B[5]);
    assign #1 n40 = (n12 ? \shift_B[3]  : data_B[4]);
    assign #1 n41 = (n12 ? \shift_B[2]  : data_B[3]);
    assign #1 n42 = (n12 ? \shift_B[1]  : data_B[2]);
    assign #1 n43 = (n12 ? \shift_B[0]  : data_B[1]);
    assign #1 n44 = (n12 ? inB : data_B[0]);
    assign #1 n46 = (in_ready ? \shift_A[13]  : \shift_A[14] );
    assign #1 n47 = (in_ready ? \shift_A[12]  : \shift_A[13] );
    assign #1 n48 = (in_ready ? \shift_A[11]  : \shift_A[12] );
    assign #1 n49 = (in_ready ? \shift_A[10]  : \shift_A[11] );
    assign #1 n50 = (in_ready ? \shift_A[9]  : \shift_A[10] );
    assign #1 n51 = (in_ready ? \shift_A[8]  : \shift_A[9] );
    assign #1 n52 = (in_ready ? \shift_A[7]  : \shift_A[8] );
    assign #1 n53 = (in_ready ? \shift_A[6]  : \shift_A[7] );
    assign #1 n54 = (in_ready ? \shift_A[5]  : \shift_A[6] );
    assign #1 n55 = (in_ready ? \shift_A[4]  : \shift_A[5] );
    assign #1 n56 = (in_ready ? \shift_A[3]  : \shift_A[4] );
    assign #1 n57 = (in_ready ? \shift_A[2]  : \shift_A[3] );
    assign #1 n58 = (in_ready ? \shift_A[1]  : \shift_A[2] );
    assign #1 n59 = (in_ready ? \shift_A[0]  : \shift_A[1] );
    assign #1 n60 = (in_ready ? inA : \shift_A[0] );
    assign #1 n62 = (in_ready ? \shift_B[13]  : \shift_B[14] );
    assign #1 n63 = (in_ready ? \shift_B[12]  : \shift_B[13] );
    assign #1 n64 = (in_ready ? \shift_B[11]  : \shift_B[12] );
    assign #1 n65 = (in_ready ? \shift_B[10]  : \shift_B[11] );
    assign #1 n66 = (in_ready ? \shift_B[9]  : \shift_B[10] );
    assign #1 n67 = (in_ready ? \shift_B[8]  : \shift_B[9] );
    assign #1 n68 = (in_ready ? \shift_B[7]  : \shift_B[8] );
    assign #1 n69 = (in_ready ? \shift_B[6]  : \shift_B[7] );
    assign #1 n70 = (in_ready ? \shift_B[5]  : \shift_B[6] );
    assign #1 n71 = (in_ready ? \shift_B[4]  : \shift_B[5] );
    assign #1 n72 = (in_ready ? \shift_B[3]  : \shift_B[4] );
    assign #1 n73 = (in_ready ? \shift_B[2]  : \shift_B[3] );
    assign #1 n74 = (in_ready ? \shift_B[1]  : \shift_B[2] );
    assign #1 n75 = (in_ready ? \shift_B[0]  : \shift_B[1] );
    assign #1 n76 = (in_ready ? inB : \shift_B[0] );
    assign #1 n77 = (in_ready ? n8 : \bit_cnt[3] );
    assign #1 n78 = (in_ready ? n9 : \bit_cnt[2] );
    assign #1 n79 = (in_ready ? n10 : \bit_cnt[1] );
    assign #1 n80 = (in_ready ? n11 : \bit_cnt[0] );
    assign #1 n81 = (in_ready ? n13 : data_A[15]);
    assign #1 n82 = (in_ready ? n14 : data_A[14]);
    assign #1 n83 = (in_ready ? n15 : data_A[13]);
    assign #1 n84 = (in_ready ? n16 : data_A[12]);
    assign #1 n85 = (in_ready ? n17 : data_A[11]);
    assign #1 n86 = (in_ready ? n18 : data_A[10]);
    assign #1 n87 = (in_ready ? n19 : data_A[9]);
    assign #1 n88 = (in_ready ? n20 : data_A[8]);
    assign #1 n89 = (in_ready ? n21 : data_A[7]);
    assign #1 n90 = (in_ready ? n22 : data_A[6]);
    assign #1 n91 = (in_ready ? n23 : data_A[5]);
    assign #1 n92 = (in_ready ? n24 : data_A[4]);
    assign #1 n93 = (in_ready ? n25 : data_A[3]);
    assign #1 n94 = (in_ready ? n26 : data_A[2]);
    assign #1 n95 = (in_ready ? n27 : data_A[1]);
    assign #1 n96 = (in_ready ? n28 : data_A[0]);
    assign #1 n97 = (in_ready ? n29 : data_B[15]);
    assign #1 n98 = (in_ready ? n30 : data_B[14]);
    assign #1 n99 = (in_ready ? n31 : data_B[13]);
    assign #1 n100 = (in_ready ? n32 : data_B[12]);
    assign #1 n101 = (in_ready ? n33 : data_B[11]);
    assign #1 n102 = (in_ready ? n34 : data_B[10]);
    assign #1 n103 = (in_ready ? n35 : data_B[9]);
    assign #1 n104 = (in_ready ? n36 : data_B[8]);
    assign #1 n105 = (in_ready ? n37 : data_B[7]);
    assign #1 n106 = (in_ready ? n38 : data_B[6]);
    assign #1 n107 = (in_ready ? n39 : data_B[5]);
    assign #1 n108 = (in_ready ? n40 : data_B[4]);
    assign #1 n109 = (in_ready ? n41 : data_B[3]);
    assign #1 n110 = (in_ready ? n42 : data_B[2]);
    assign #1 n111 = (in_ready ? n43 : data_B[1]);
    assign #1 n112 = (in_ready ? n44 : data_B[0]);
    assign #1 n113 = (in_ready ? n12 : 1'b0);
    always @( posedge clk or posedge n6 )
    begin
             if (n6) \shift_A[14]  <= 1'b0;
        else \shift_A[14]  <= n46;
    end
    assign n146 = ~\shift_A[14]  ;
    always @( posedge clk or posedge n6 )
    begin
             if (n6) \shift_A[13]  <= 1'b0;
        else \shift_A[13]  <= n47;
    end
    assign n147 = ~\shift_A[13]  ;
    always @( posedge clk or posedge n6 )
    begin
             if (n6) \shift_A[12]  <= 1'b0;
        else \shift_A[12]  <= n48;
    end
    assign n148 = ~\shift_A[12]  ;
    always @( posedge clk or posedge n6 )
    begin
             if (n6) \shift_A[11]  <= 1'b0;
        else \shift_A[11]  <= n49;
    end
    assign n149 = ~\shift_A[11]  ;
    always @( posedge clk or posedge n6 )
    begin
             if (n6) \shift_A[10]  <= 1'b0;
        else \shift_A[10]  <= n50;
    end
    assign n150 = ~\shift_A[10]  ;
    always @( posedge clk or posedge n6 )
    begin
             if (n6) \shift_A[9]  <= 1'b0;
        else \shift_A[9]  <= n51;
    end
    assign n151 = ~\shift_A[9]  ;
    always @( posedge clk or posedge n6 )
    begin
             if (n6) \shift_A[8]  <= 1'b0;
        else \shift_A[8]  <= n52;
    end
    assign n152 = ~\shift_A[8]  ;
    always @( posedge clk or posedge n6 )
    begin
             if (n6) \shift_A[7]  <= 1'b0;
        else \shift_A[7]  <= n53;
    end
    assign n153 = ~\shift_A[7]  ;
    always @( posedge clk or posedge n6 )
    begin
             if (n6) \shift_A[6]  <= 1'b0;
        else \shift_A[6]  <= n54;
    end
    assign n154 = ~\shift_A[6]  ;
    always @( posedge clk or posedge n6 )
    begin
             if (n6) \shift_A[5]  <= 1'b0;
        else \shift_A[5]  <= n55;
    end
    assign n155 = ~\shift_A[5]  ;
    always @( posedge clk or posedge n6 )
    begin
             if (n6) \shift_A[4]  <= 1'b0;
        else \shift_A[4]  <= n56;
    end
    assign n156 = ~\shift_A[4]  ;
    always @( posedge clk or posedge n6 )
    begin
             if (n6) \shift_A[3]  <= 1'b0;
        else \shift_A[3]  <= n57;
    end
    assign n157 = ~\shift_A[3]  ;
    always @( posedge clk or posedge n6 )
    begin
             if (n6) \shift_A[2]  <= 1'b0;
        else \shift_A[2]  <= n58;
    end
    assign n158 = ~\shift_A[2]  ;
    always @( posedge clk or posedge n6 )
    begin
             if (n6) \shift_A[1]  <= 1'b0;
        else \shift_A[1]  <= n59;
    end
    assign n159 = ~\shift_A[1]  ;
    always @( posedge clk or posedge n6 )
    begin
             if (n6) \shift_A[0]  <= 1'b0;
        else \shift_A[0]  <= n60;
    end
    assign n160 = ~\shift_A[0]  ;
    always @( posedge clk or posedge n6 )
    begin
             if (n6) \shift_B[14]  <= 1'b0;
        else \shift_B[14]  <= n62;
    end
    assign n161 = ~\shift_B[14]  ;
    always @( posedge clk or posedge n6 )
    begin
             if (n6) \shift_B[13]  <= 1'b0;
        else \shift_B[13]  <= n63;
    end
    assign n162 = ~\shift_B[13]  ;
    always @( posedge clk or posedge n6 )
    begin
             if (n6) \shift_B[12]  <= 1'b0;
        else \shift_B[12]  <= n64;
    end
    assign n163 = ~\shift_B[12]  ;
    always @( posedge clk or posedge n6 )
    begin
             if (n6) \shift_B[11]  <= 1'b0;
        else \shift_B[11]  <= n65;
    end
    assign n164 = ~\shift_B[11]  ;
    always @( posedge clk or posedge n6 )
    begin
             if (n6) \shift_B[10]  <= 1'b0;
        else \shift_B[10]  <= n66;
    end
    assign n165 = ~\shift_B[10]  ;
    always @( posedge clk or posedge n6 )
    begin
             if (n6) \shift_B[9]  <= 1'b0;
        else \shift_B[9]  <= n67;
    end
    assign n166 = ~\shift_B[9]  ;
    always @( posedge clk or posedge n6 )
    begin
             if (n6) \shift_B[8]  <= 1'b0;
        else \shift_B[8]  <= n68;
    end
    assign n167 = ~\shift_B[8]  ;
    always @( posedge clk or posedge n6 )
    begin
             if (n6) \shift_B[7]  <= 1'b0;
        else \shift_B[7]  <= n69;
    end
    assign n168 = ~\shift_B[7]  ;
    always @( posedge clk or posedge n6 )
    begin
             if (n6) \shift_B[6]  <= 1'b0;
        else \shift_B[6]  <= n70;
    end
    assign n169 = ~\shift_B[6]  ;
    always @( posedge clk or posedge n6 )
    begin
             if (n6) \shift_B[5]  <= 1'b0;
        else \shift_B[5]  <= n71;
    end
    assign n170 = ~\shift_B[5]  ;
    always @( posedge clk or posedge n6 )
    begin
             if (n6) \shift_B[4]  <= 1'b0;
        else \shift_B[4]  <= n72;
    end
    assign n171 = ~\shift_B[4]  ;
    always @( posedge clk or posedge n6 )
    begin
             if (n6) \shift_B[3]  <= 1'b0;
        else \shift_B[3]  <= n73;
    end
    assign n172 = ~\shift_B[3]  ;
    always @( posedge clk or posedge n6 )
    begin
             if (n6) \shift_B[2]  <= 1'b0;
        else \shift_B[2]  <= n74;
    end
    assign n173 = ~\shift_B[2]  ;
    always @( posedge clk or posedge n6 )
    begin
             if (n6) \shift_B[1]  <= 1'b0;
        else \shift_B[1]  <= n75;
    end
    assign n174 = ~\shift_B[1]  ;
    always @( posedge clk or posedge n6 )
    begin
             if (n6) \shift_B[0]  <= 1'b0;
        else \shift_B[0]  <= n76;
    end
    assign n175 = ~\shift_B[0]  ;
    always @( posedge clk or posedge n6 )
    begin
             if (n6) data_A[15] <= 1'b0;
        else data_A[15] <= n81;
    end
    assign n176 = ~data_A[15] ;
    always @( posedge clk or posedge n6 )
    begin
             if (n6) data_A[14] <= 1'b0;
        else data_A[14] <= n82;
    end
    assign n177 = ~data_A[14] ;
    always @( posedge clk or posedge n6 )
    begin
             if (n6) data_A[13] <= 1'b0;
        else data_A[13] <= n83;
    end
    assign n178 = ~data_A[13] ;
    always @( posedge clk or posedge n6 )
    begin
             if (n6) data_A[12] <= 1'b0;
        else data_A[12] <= n84;
    end
    assign n179 = ~data_A[12] ;
    always @( posedge clk or posedge n6 )
    begin
             if (n6) data_A[11] <= 1'b0;
        else data_A[11] <= n85;
    end
    assign n180 = ~data_A[11] ;
    always @( posedge clk or posedge n6 )
    begin
             if (n6) data_A[10] <= 1'b0;
        else data_A[10] <= n86;
    end
    assign n181 = ~data_A[10] ;
    always @( posedge clk or posedge n6 )
    begin
             if (n6) data_A[9] <= 1'b0;
        else data_A[9] <= n87;
    end
    assign n182 = ~data_A[9] ;
    always @( posedge clk or posedge n6 )
    begin
             if (n6) data_A[8] <= 1'b0;
        else data_A[8] <= n88;
    end
    assign n183 = ~data_A[8] ;
    always @( posedge clk or posedge n6 )
    begin
             if (n6) data_A[7] <= 1'b0;
        else data_A[7] <= n89;
    end
    assign n184 = ~data_A[7] ;
    always @( posedge clk or posedge n6 )
    begin
             if (n6) data_A[6] <= 1'b0;
        else data_A[6] <= n90;
    end
    assign n185 = ~data_A[6] ;
    always @( posedge clk or posedge n6 )
    begin
             if (n6) data_A[5] <= 1'b0;
        else data_A[5] <= n91;
    end
    assign n186 = ~data_A[5] ;
    always @( posedge clk or posedge n6 )
    begin
             if (n6) data_A[4] <= 1'b0;
        else data_A[4] <= n92;
    end
    assign n187 = ~data_A[4] ;
    always @( posedge clk or posedge n6 )
    begin
             if (n6) data_A[3] <= 1'b0;
        else data_A[3] <= n93;
    end
    assign n188 = ~data_A[3] ;
    always @( posedge clk or posedge n6 )
    begin
             if (n6) data_A[2] <= 1'b0;
        else data_A[2] <= n94;
    end
    assign n189 = ~data_A[2] ;
    always @( posedge clk or posedge n6 )
    begin
             if (n6) data_A[1] <= 1'b0;
        else data_A[1] <= n95;
    end
    assign n190 = ~data_A[1] ;
    always @( posedge clk or posedge n6 )
    begin
             if (n6) data_A[0] <= 1'b0;
        else data_A[0] <= n96;
    end
    assign n191 = ~data_A[0] ;
    always @( posedge clk or posedge n6 )
    begin
             if (n6) data_B[15] <= 1'b0;
        else data_B[15] <= n97;
    end
    assign n192 = ~data_B[15] ;
    always @( posedge clk or posedge n6 )
    begin
             if (n6) data_B[14] <= 1'b0;
        else data_B[14] <= n98;
    end
    assign n193 = ~data_B[14] ;
    always @( posedge clk or posedge n6 )
    begin
             if (n6) data_B[13] <= 1'b0;
        else data_B[13] <= n99;
    end
    assign n194 = ~data_B[13] ;
    always @( posedge clk or posedge n6 )
    begin
             if (n6) data_B[12] <= 1'b0;
        else data_B[12] <= n100;
    end
    assign n195 = ~data_B[12] ;
    always @( posedge clk or posedge n6 )
    begin
             if (n6) data_B[11] <= 1'b0;
        else data_B[11] <= n101;
    end
    assign n196 = ~data_B[11] ;
    always @( posedge clk or posedge n6 )
    begin
             if (n6) data_B[10] <= 1'b0;
        else data_B[10] <= n102;
    end
    assign n197 = ~data_B[10] ;
    always @( posedge clk or posedge n6 )
    begin
             if (n6) data_B[9] <= 1'b0;
        else data_B[9] <= n103;
    end
    assign n198 = ~data_B[9] ;
    always @( posedge clk or posedge n6 )
    begin
             if (n6) data_B[8] <= 1'b0;
        else data_B[8] <= n104;
    end
    assign n199 = ~data_B[8] ;
    always @( posedge clk or posedge n6 )
    begin
             if (n6) data_B[7] <= 1'b0;
        else data_B[7] <= n105;
    end
    assign n200 = ~data_B[7] ;
    always @( posedge clk or posedge n6 )
    begin
             if (n6) data_B[6] <= 1'b0;
        else data_B[6] <= n106;
    end
    assign n201 = ~data_B[6] ;
    always @( posedge clk or posedge n6 )
    begin
             if (n6) data_B[5] <= 1'b0;
        else data_B[5] <= n107;
    end
    assign n202 = ~data_B[5] ;
    always @( posedge clk or posedge n6 )
    begin
             if (n6) data_B[4] <= 1'b0;
        else data_B[4] <= n108;
    end
    assign n203 = ~data_B[4] ;
    always @( posedge clk or posedge n6 )
    begin
             if (n6) data_B[3] <= 1'b0;
        else data_B[3] <= n109;
    end
    assign n204 = ~data_B[3] ;
    always @( posedge clk or posedge n6 )
    begin
             if (n6) data_B[2] <= 1'b0;
        else data_B[2] <= n110;
    end
    assign n205 = ~data_B[2] ;
    always @( posedge clk or posedge n6 )
    begin
             if (n6) data_B[1] <= 1'b0;
        else data_B[1] <= n111;
    end
    assign n206 = ~data_B[1] ;
    always @( posedge clk or posedge n6 )
    begin
             if (n6) data_B[0] <= 1'b0;
        else data_B[0] <= n112;
    end
    assign n207 = ~data_B[0] ;
    always @( posedge clk or posedge n6 )
    begin
             if (n6) \bit_cnt[3]  <= 1'b0;
        else \bit_cnt[3]  <= n77;
    end
    assign n208 = ~\bit_cnt[3]  ;
    always @( posedge clk or posedge n6 )
    begin
             if (n6) \bit_cnt[2]  <= 1'b0;
        else \bit_cnt[2]  <= n78;
    end
    assign n209 = ~\bit_cnt[2]  ;
    always @( posedge clk or posedge n6 )
    begin
             if (n6) \bit_cnt[1]  <= 1'b0;
        else \bit_cnt[1]  <= n79;
    end
    assign n210 = ~\bit_cnt[1]  ;
    always @( posedge clk or posedge n6 )
    begin
             if (n6) \bit_cnt[0]  <= 1'b0;
        else \bit_cnt[0]  <= n80;
    end
    assign n211 = ~\bit_cnt[0]  ;
    always @( posedge clk or posedge n6 )
    begin
             if (n6) valid_out <= 1'b0;
        else valid_out <= n113;
    end
    assign n212 = ~valid_out ;

endmodule

module mul8x8_booth_wallace_ks(clk, rst_n, a, b, prod);
input clk, rst_n;
input  [7:0] a;
input  [7:0] b;
output [15:0] prod;
reg [15:0] prod;
reg \pp_stage1[15] , \pp_stage1[14] , \pp_stage1[13] , \pp_stage1[12] ,
     \pp_stage1[11] , \pp_stage1[10] , \pp_stage1[9] , \pp_stage1[8] ,
     \pp_stage1[7] , \pp_stage1[6] , \pp_stage1[5] , \pp_stage1[4] ,
     \pp_stage1[3] , \pp_stage1[2] , \pp_stage1[1] , \pp_stage1[0] ,
     \ks_result[15] , \ks_result[14] , \ks_result[13] , \ks_result[12] ,
     \ks_result[11] , \ks_result[10] , \ks_result[9] , \ks_result[8] ,
     \ks_result[7] , \ks_result[6] , \ks_result[5] , \ks_result[4] ,
     \ks_result[3] , \ks_result[2] , \ks_result[1] , \ks_result[0] ;
wire \pp[0][7] , \pp[0][6] , \pp[0][5] , \pp[0][4] , \pp[0][3] , \pp[0][2] ,
     \pp[0][1] , \pp[0][0] , \pp[1][8] , \pp[1][7] , \pp[1][6] , \pp[1][5] ,
     \pp[1][4] , \pp[1][3] , \pp[1][2] , \pp[1][1] , \pp[2][9] , \pp[2][8] ,
     \pp[2][7] , \pp[2][6] , \pp[2][5] , \pp[2][4] , \pp[2][3] , \pp[2][2] ,
     \pp[3][10] , \pp[3][9] , \pp[3][8] , \pp[3][7] , \pp[3][6] , \pp[3][5] ,
     \pp[3][4] , \pp[3][3] , \pp[4][11] , \pp[4][10] , \pp[4][9] , \pp[4][8] ,
     \pp[4][7] , \pp[4][6] , \pp[4][5] , \pp[4][4] , \pp[5][12] , \pp[5][11] ,
     \pp[5][10] , \pp[5][9] , \pp[5][8] , \pp[5][7] , \pp[5][6] , \pp[5][5] ,
     \pp[6][13] , \pp[6][12] , \pp[6][11] , \pp[6][10] , \pp[6][9] , \pp[6][8] ,
     \pp[6][7] , \pp[6][6] , \pp[7][14] , \pp[7][13] , \pp[7][12] , \pp[7][11] ,
     \pp[7][10] , \pp[7][9] , \pp[7][8] , \pp[7][7] , n70, n72, n73, n74, n75,
     n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n89, n90, n91,
     n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n106,
     n107, n108, n109, n110, n111, n112, n113, n114, n115, n116, n117, n118,
     n119, n120, n121, n123, n124, n125, n126, n127, n128, n129, n130, n131,
     n132, n133, n134, n135, n136, n137, n138, n140, n141, n142, n143, n144,
     n145, n146, n147, n148, n149, n150, n151, n152, n153, n154, n155, n157,
     n158, n159, n160, n161, n162, n163, n164, n165, n166, n167, n168, n169,
     n170, n171, n172, n174, n175, n176, n177, n178, n179, n180, n181, n182,
     n183, n184, n185, n186, n187, n188, n189, n34, n35, n36, n37, n38, n39,
     n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54,
     n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69,
     n71, n88, n105, n122, n139, n156, n173, n190, n191, n192, n193, n194, n195,
     n196, n197, n198, n199, n200, n201;
    assign #1 \pp[0][7]  = (b[0] ? a[7] : 1'b0);
    assign #1 \pp[0][6]  = (b[0] ? a[6] : 1'b0);
    assign #1 \pp[0][5]  = (b[0] ? a[5] : 1'b0);
    assign #1 \pp[0][4]  = (b[0] ? a[4] : 1'b0);
    assign #1 \pp[0][3]  = (b[0] ? a[3] : 1'b0);
    assign #1 \pp[0][2]  = (b[0] ? a[2] : 1'b0);
    assign #1 \pp[0][1]  = (b[0] ? a[1] : 1'b0);
    assign #1 \pp[0][0]  = (b[0] ? a[0] : 1'b0);
    assign #1 \pp[1][8]  = (b[1] ? a[7] : 1'b0);
    assign #1 \pp[1][7]  = (b[1] ? a[6] : 1'b0);
    assign #1 \pp[1][6]  = (b[1] ? a[5] : 1'b0);
    assign #1 \pp[1][5]  = (b[1] ? a[4] : 1'b0);
    assign #1 \pp[1][4]  = (b[1] ? a[3] : 1'b0);
    assign #1 \pp[1][3]  = (b[1] ? a[2] : 1'b0);
    assign #1 \pp[1][2]  = (b[1] ? a[1] : 1'b0);
    assign #1 \pp[1][1]  = (b[1] ? a[0] : 1'b0);
    assign #1 \pp[2][9]  = (b[2] ? a[7] : 1'b0);
    assign #1 \pp[2][8]  = (b[2] ? a[6] : 1'b0);
    assign #1 \pp[2][7]  = (b[2] ? a[5] : 1'b0);
    assign #1 \pp[2][6]  = (b[2] ? a[4] : 1'b0);
    assign #1 \pp[2][5]  = (b[2] ? a[3] : 1'b0);
    assign #1 \pp[2][4]  = (b[2] ? a[2] : 1'b0);
    assign #1 \pp[2][3]  = (b[2] ? a[1] : 1'b0);
    assign #1 \pp[2][2]  = (b[2] ? a[0] : 1'b0);
    assign #1 \pp[3][10]  = (b[3] ? a[7] : 1'b0);
    assign #1 \pp[3][9]  = (b[3] ? a[6] : 1'b0);
    assign #1 \pp[3][8]  = (b[3] ? a[5] : 1'b0);
    assign #1 \pp[3][7]  = (b[3] ? a[4] : 1'b0);
    assign #1 \pp[3][6]  = (b[3] ? a[3] : 1'b0);
    assign #1 \pp[3][5]  = (b[3] ? a[2] : 1'b0);
    assign #1 \pp[3][4]  = (b[3] ? a[1] : 1'b0);
    assign #1 \pp[3][3]  = (b[3] ? a[0] : 1'b0);
    assign #1 \pp[4][11]  = (b[4] ? a[7] : 1'b0);
    assign #1 \pp[4][10]  = (b[4] ? a[6] : 1'b0);
    assign #1 \pp[4][9]  = (b[4] ? a[5] : 1'b0);
    assign #1 \pp[4][8]  = (b[4] ? a[4] : 1'b0);
    assign #1 \pp[4][7]  = (b[4] ? a[3] : 1'b0);
    assign #1 \pp[4][6]  = (b[4] ? a[2] : 1'b0);
    assign #1 \pp[4][5]  = (b[4] ? a[1] : 1'b0);
    assign #1 \pp[4][4]  = (b[4] ? a[0] : 1'b0);
    assign #1 \pp[5][12]  = (b[5] ? a[7] : 1'b0);
    assign #1 \pp[5][11]  = (b[5] ? a[6] : 1'b0);
    assign #1 \pp[5][10]  = (b[5] ? a[5] : 1'b0);
    assign #1 \pp[5][9]  = (b[5] ? a[4] : 1'b0);
    assign #1 \pp[5][8]  = (b[5] ? a[3] : 1'b0);
    assign #1 \pp[5][7]  = (b[5] ? a[2] : 1'b0);
    assign #1 \pp[5][6]  = (b[5] ? a[1] : 1'b0);
    assign #1 \pp[5][5]  = (b[5] ? a[0] : 1'b0);
    assign #1 \pp[6][13]  = (b[6] ? a[7] : 1'b0);
    assign #1 \pp[6][12]  = (b[6] ? a[6] : 1'b0);
    assign #1 \pp[6][11]  = (b[6] ? a[5] : 1'b0);
    assign #1 \pp[6][10]  = (b[6] ? a[4] : 1'b0);
    assign #1 \pp[6][9]  = (b[6] ? a[3] : 1'b0);
    assign #1 \pp[6][8]  = (b[6] ? a[2] : 1'b0);
    assign #1 \pp[6][7]  = (b[6] ? a[1] : 1'b0);
    assign #1 \pp[6][6]  = (b[6] ? a[0] : 1'b0);
    assign #1 \pp[7][14]  = (b[7] ? a[7] : 1'b0);
    assign #1 \pp[7][13]  = (b[7] ? a[6] : 1'b0);
    assign #1 \pp[7][12]  = (b[7] ? a[5] : 1'b0);
    assign #1 \pp[7][11]  = (b[7] ? a[4] : 1'b0);
    assign #1 \pp[7][10]  = (b[7] ? a[3] : 1'b0);
    assign #1 \pp[7][9]  = (b[7] ? a[2] : 1'b0);
    assign #1 \pp[7][8]  = (b[7] ? a[1] : 1'b0);
    assign #1 \pp[7][7]  = (b[7] ? a[0] : 1'b0);
    assign #1 n70 = ~rst_n ;
    assign #1 {n34, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82,
        n83, n84, n85, n86, n87} = {1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0,
        1'b0, \pp[0][7] , \pp[0][6] , \pp[0][5] , \pp[0][4] , \pp[0][3] ,
        \pp[0][2] , \pp[0][1] , \pp[0][0] } + {1'b0, 1'b0, 1'b0, 1'b0, 1'b0,
        1'b0, 1'b0, \pp[1][8] , \pp[1][7] , \pp[1][6] , \pp[1][5] , \pp[1][4] ,
        \pp[1][3] , \pp[1][2] , \pp[1][1] , 1'b0};
    assign #1 {n35, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99,
        n100, n101, n102, n103, n104} = {n72, n73, n74, n75, n76, n77, n78,
        n79, n80, n81, n82, n83, n84, n85, n86, n87} + {1'b0, 1'b0, 1'b0,
        1'b0, 1'b0, 1'b0, \pp[2][9] , \pp[2][8] , \pp[2][7] , \pp[2][6] ,
        \pp[2][5] , \pp[2][4] , \pp[2][3] , \pp[2][2] , 1'b0, 1'b0};
    assign #1 {n36, n106, n107, n108, n109, n110, n111, n112, n113, n114,
        n115, n116, n117, n118, n119, n120, n121} = {n89, n90, n91, n92,
        n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104} + {1'b0,
        1'b0, 1'b0, 1'b0, 1'b0, \pp[3][10] , \pp[3][9] , \pp[3][8] , \pp[3][7] ,
        \pp[3][6] , \pp[3][5] , \pp[3][4] , \pp[3][3] , 1'b0, 1'b0, 1'b0};
    assign #1 {n37, n123, n124, n125, n126, n127, n128, n129, n130, n131,
        n132, n133, n134, n135, n136, n137, n138} = {n106, n107, n108, n109,
        n110, n111, n112, n113, n114, n115, n116, n117, n118, n119, n120,
        n121} + {1'b0, 1'b0, 1'b0, 1'b0, \pp[4][11] , \pp[4][10] , \pp[4][9] ,
        \pp[4][8] , \pp[4][7] , \pp[4][6] , \pp[4][5] , \pp[4][4] , 1'b0,
        1'b0, 1'b0, 1'b0};
    assign #1 {n38, n140, n141, n142, n143, n144, n145, n146, n147, n148,
        n149, n150, n151, n152, n153, n154, n155} = {n123, n124, n125, n126,
        n127, n128, n129, n130, n131, n132, n133, n134, n135, n136, n137,
        n138} + {1'b0, 1'b0, 1'b0, \pp[5][12] , \pp[5][11] , \pp[5][10] ,
        \pp[5][9] , \pp[5][8] , \pp[5][7] , \pp[5][6] , \pp[5][5] , 1'b0,
        1'b0, 1'b0, 1'b0, 1'b0};
    assign #1 {n39, n157, n158, n159, n160, n161, n162, n163, n164, n165,
        n166, n167, n168, n169, n170, n171, n172} = {n140, n141, n142, n143,
        n144, n145, n146, n147, n148, n149, n150, n151, n152, n153, n154,
        n155} + {1'b0, 1'b0, \pp[6][13] , \pp[6][12] , \pp[6][11] , \pp[6][10] ,
        \pp[6][9] , \pp[6][8] , \pp[6][7] , \pp[6][6] , 1'b0, 1'b0, 1'b0,
        1'b0, 1'b0, 1'b0};
    assign #1 {n40, n174, n175, n176, n177, n178, n179, n180, n181, n182,
        n183, n184, n185, n186, n187, n188, n189} = {n157, n158, n159, n160,
        n161, n162, n163, n164, n165, n166, n167, n168, n169, n170, n171,
        n172} + {1'b0, \pp[7][14] , \pp[7][13] , \pp[7][12] , \pp[7][11] ,
        \pp[7][10] , \pp[7][9] , \pp[7][8] , \pp[7][7] , 1'b0, 1'b0, 1'b0,
        1'b0, 1'b0, 1'b0, 1'b0};
    always @( posedge clk or posedge n70 )
    begin
             if (n70) \pp_stage1[14]  <= 1'b0;
        else \pp_stage1[14]  <= n175;
    end
    assign n41 = ~\pp_stage1[14]  ;
    always @( posedge clk or posedge n70 )
    begin
             if (n70) \pp_stage1[13]  <= 1'b0;
        else \pp_stage1[13]  <= n176;
    end
    assign n42 = ~\pp_stage1[13]  ;
    always @( posedge clk or posedge n70 )
    begin
             if (n70) \pp_stage1[12]  <= 1'b0;
        else \pp_stage1[12]  <= n177;
    end
    assign n43 = ~\pp_stage1[12]  ;
    always @( posedge clk or posedge n70 )
    begin
             if (n70) \pp_stage1[11]  <= 1'b0;
        else \pp_stage1[11]  <= n178;
    end
    assign n44 = ~\pp_stage1[11]  ;
    always @( posedge clk or posedge n70 )
    begin
             if (n70) \pp_stage1[10]  <= 1'b0;
        else \pp_stage1[10]  <= n179;
    end
    assign n45 = ~\pp_stage1[10]  ;
    always @( posedge clk or posedge n70 )
    begin
             if (n70) \pp_stage1[9]  <= 1'b0;
        else \pp_stage1[9]  <= n180;
    end
    assign n46 = ~\pp_stage1[9]  ;
    always @( posedge clk or posedge n70 )
    begin
             if (n70) \pp_stage1[8]  <= 1'b0;
        else \pp_stage1[8]  <= n181;
    end
    assign n47 = ~\pp_stage1[8]  ;
    always @( posedge clk or posedge n70 )
    begin
             if (n70) \pp_stage1[7]  <= 1'b0;
        else \pp_stage1[7]  <= n182;
    end
    assign n48 = ~\pp_stage1[7]  ;
    always @( posedge clk or posedge n70 )
    begin
             if (n70) \pp_stage1[6]  <= 1'b0;
        else \pp_stage1[6]  <= n183;
    end
    assign n49 = ~\pp_stage1[6]  ;
    always @( posedge clk or posedge n70 )
    begin
             if (n70) \pp_stage1[5]  <= 1'b0;
        else \pp_stage1[5]  <= n184;
    end
    assign n50 = ~\pp_stage1[5]  ;
    always @( posedge clk or posedge n70 )
    begin
             if (n70) \pp_stage1[4]  <= 1'b0;
        else \pp_stage1[4]  <= n185;
    end
    assign n51 = ~\pp_stage1[4]  ;
    always @( posedge clk or posedge n70 )
    begin
             if (n70) \pp_stage1[3]  <= 1'b0;
        else \pp_stage1[3]  <= n186;
    end
    assign n52 = ~\pp_stage1[3]  ;
    always @( posedge clk or posedge n70 )
    begin
             if (n70) \pp_stage1[2]  <= 1'b0;
        else \pp_stage1[2]  <= n187;
    end
    assign n53 = ~\pp_stage1[2]  ;
    always @( posedge clk or posedge n70 )
    begin
             if (n70) \pp_stage1[1]  <= 1'b0;
        else \pp_stage1[1]  <= n188;
    end
    assign n54 = ~\pp_stage1[1]  ;
    always @( posedge clk or posedge n70 )
    begin
             if (n70) \pp_stage1[0]  <= 1'b0;
        else \pp_stage1[0]  <= n189;
    end
    assign n55 = ~\pp_stage1[0]  ;
    always @( posedge clk or posedge n70 )
    begin
             if (n70) \ks_result[15]  <= 1'b0;
        else \ks_result[15]  <= \pp_stage1[15] ;
    end
    assign n56 = ~\ks_result[15]  ;
    always @( posedge clk or posedge n70 )
    begin
             if (n70) \ks_result[14]  <= 1'b0;
        else \ks_result[14]  <= \pp_stage1[14] ;
    end
    assign n57 = ~\ks_result[14]  ;
    always @( posedge clk or posedge n70 )
    begin
             if (n70) \ks_result[13]  <= 1'b0;
        else \ks_result[13]  <= \pp_stage1[13] ;
    end
    assign n58 = ~\ks_result[13]  ;
    always @( posedge clk or posedge n70 )
    begin
             if (n70) \ks_result[12]  <= 1'b0;
        else \ks_result[12]  <= \pp_stage1[12] ;
    end
    assign n59 = ~\ks_result[12]  ;
    always @( posedge clk or posedge n70 )
    begin
             if (n70) \ks_result[11]  <= 1'b0;
        else \ks_result[11]  <= \pp_stage1[11] ;
    end
    assign n60 = ~\ks_result[11]  ;
    always @( posedge clk or posedge n70 )
    begin
             if (n70) \ks_result[10]  <= 1'b0;
        else \ks_result[10]  <= \pp_stage1[10] ;
    end
    assign n61 = ~\ks_result[10]  ;
    always @( posedge clk or posedge n70 )
    begin
             if (n70) \ks_result[9]  <= 1'b0;
        else \ks_result[9]  <= \pp_stage1[9] ;
    end
    assign n62 = ~\ks_result[9]  ;
    always @( posedge clk or posedge n70 )
    begin
             if (n70) \ks_result[8]  <= 1'b0;
        else \ks_result[8]  <= \pp_stage1[8] ;
    end
    assign n63 = ~\ks_result[8]  ;
    always @( posedge clk or posedge n70 )
    begin
             if (n70) \ks_result[7]  <= 1'b0;
        else \ks_result[7]  <= \pp_stage1[7] ;
    end
    assign n64 = ~\ks_result[7]  ;
    always @( posedge clk or posedge n70 )
    begin
             if (n70) \ks_result[6]  <= 1'b0;
        else \ks_result[6]  <= \pp_stage1[6] ;
    end
    assign n65 = ~\ks_result[6]  ;
    always @( posedge clk or posedge n70 )
    begin
             if (n70) \ks_result[5]  <= 1'b0;
        else \ks_result[5]  <= \pp_stage1[5] ;
    end
    assign n66 = ~\ks_result[5]  ;
    always @( posedge clk or posedge n70 )
    begin
             if (n70) \ks_result[4]  <= 1'b0;
        else \ks_result[4]  <= \pp_stage1[4] ;
    end
    assign n67 = ~\ks_result[4]  ;
    always @( posedge clk or posedge n70 )
    begin
             if (n70) \ks_result[3]  <= 1'b0;
        else \ks_result[3]  <= \pp_stage1[3] ;
    end
    assign n68 = ~\ks_result[3]  ;
    always @( posedge clk or posedge n70 )
    begin
             if (n70) \ks_result[2]  <= 1'b0;
        else \ks_result[2]  <= \pp_stage1[2] ;
    end
    assign n69 = ~\ks_result[2]  ;
    always @( posedge clk or posedge n70 )
    begin
             if (n70) \ks_result[1]  <= 1'b0;
        else \ks_result[1]  <= \pp_stage1[1] ;
    end
    assign n71 = ~\ks_result[1]  ;
    always @( posedge clk or posedge n70 )
    begin
             if (n70) \ks_result[0]  <= 1'b0;
        else \ks_result[0]  <= \pp_stage1[0] ;
    end
    assign n88 = ~\ks_result[0]  ;
    always @( posedge clk or posedge n70 )
    begin
             if (n70) prod[15] <= 1'b0;
        else prod[15] <= \ks_result[15] ;
    end
    assign n105 = ~prod[15] ;
    always @( posedge clk or posedge n70 )
    begin
             if (n70) prod[14] <= 1'b0;
        else prod[14] <= \ks_result[14] ;
    end
    assign n122 = ~prod[14] ;
    always @( posedge clk or posedge n70 )
    begin
             if (n70) prod[13] <= 1'b0;
        else prod[13] <= \ks_result[13] ;
    end
    assign n139 = ~prod[13] ;
    always @( posedge clk or posedge n70 )
    begin
             if (n70) prod[12] <= 1'b0;
        else prod[12] <= \ks_result[12] ;
    end
    assign n156 = ~prod[12] ;
    always @( posedge clk or posedge n70 )
    begin
             if (n70) prod[11] <= 1'b0;
        else prod[11] <= \ks_result[11] ;
    end
    assign n173 = ~prod[11] ;
    always @( posedge clk or posedge n70 )
    begin
             if (n70) prod[10] <= 1'b0;
        else prod[10] <= \ks_result[10] ;
    end
    assign n190 = ~prod[10] ;
    always @( posedge clk or posedge n70 )
    begin
             if (n70) prod[9] <= 1'b0;
        else prod[9] <= \ks_result[9] ;
    end
    assign n191 = ~prod[9] ;
    always @( posedge clk or posedge n70 )
    begin
             if (n70) prod[8] <= 1'b0;
        else prod[8] <= \ks_result[8] ;
    end
    assign n192 = ~prod[8] ;
    always @( posedge clk or posedge n70 )
    begin
             if (n70) prod[7] <= 1'b0;
        else prod[7] <= \ks_result[7] ;
    end
    assign n193 = ~prod[7] ;
    always @( posedge clk or posedge n70 )
    begin
             if (n70) prod[6] <= 1'b0;
        else prod[6] <= \ks_result[6] ;
    end
    assign n194 = ~prod[6] ;
    always @( posedge clk or posedge n70 )
    begin
             if (n70) prod[5] <= 1'b0;
        else prod[5] <= \ks_result[5] ;
    end
    assign n195 = ~prod[5] ;
    always @( posedge clk or posedge n70 )
    begin
             if (n70) prod[4] <= 1'b0;
        else prod[4] <= \ks_result[4] ;
    end
    assign n196 = ~prod[4] ;
    always @( posedge clk or posedge n70 )
    begin
             if (n70) prod[3] <= 1'b0;
        else prod[3] <= \ks_result[3] ;
    end
    assign n197 = ~prod[3] ;
    always @( posedge clk or posedge n70 )
    begin
             if (n70) prod[2] <= 1'b0;
        else prod[2] <= \ks_result[2] ;
    end
    assign n198 = ~prod[2] ;
    always @( posedge clk or posedge n70 )
    begin
             if (n70) prod[1] <= 1'b0;
        else prod[1] <= \ks_result[1] ;
    end
    assign n199 = ~prod[1] ;
    always @( posedge clk or posedge n70 )
    begin
             if (n70) prod[0] <= 1'b0;
        else prod[0] <= \ks_result[0] ;
    end
    assign n200 = ~prod[0] ;
    always @( posedge clk or posedge n70 )
    begin
             if (n70) \pp_stage1[15]  <= 1'b0;
        else \pp_stage1[15]  <= n174;
    end
    assign n201 = ~\pp_stage1[15]  ;

endmodule

module compute_engine(clk, rst_n, mode, rx_valid, data_A, data_B, mac_result,
     mac_carry, calc_done);
input clk, rst_n, mode, rx_valid;
output mac_carry, calc_done;
input  [15:0] data_A;
input  [15:0] data_B;
output [23:0] mac_result;
reg [23:0] mac_result;
reg mac_carry, calc_done, \cnt[2] , \cnt[1] , \cnt[0] , calc_en,
     \temp_product[31] , \temp_product[30] , \temp_product[29] ,
     \temp_product[28] , \temp_product[27] , \temp_product[26] ,
     \temp_product[25] , \temp_product[24] , \temp_product[23] ,
     \temp_product[22] , \temp_product[21] , \temp_product[20] ,
     \temp_product[19] , \temp_product[18] , \temp_product[17] ,
     \temp_product[16] , \temp_product[15] , \temp_product[14] ,
     \temp_product[13] , \temp_product[12] , \temp_product[11] ,
     \temp_product[10] , \temp_product[9] , \temp_product[8] ,
     \temp_product[7] , \temp_product[6] , \temp_product[5] , \temp_product[4] ,
     \temp_product[3] , \temp_product[2] , \temp_product[1] , \temp_product[0] ,
     \global_acc[24] , \global_acc[23] , \global_acc[22] , \global_acc[21] ,
     \global_acc[20] , \global_acc[19] , \global_acc[18] , \global_acc[17] ,
     \global_acc[16] , \global_acc[15] , \global_acc[14] , \global_acc[13] ,
     \global_acc[12] , \global_acc[11] , \global_acc[10] , \global_acc[9] ,
     \global_acc[8] , \global_acc[7] , \global_acc[6] , \global_acc[5] ,
     \global_acc[4] , \global_acc[3] , \global_acc[2] , \global_acc[1] ,
     \global_acc[0] ;
wire \mul_a[7] , \mul_a[6] , \mul_a[5] , \mul_a[4] , \mul_a[3] , \mul_a[2] ,
     \mul_a[1] , \mul_a[0] , \mul_b[7] , \mul_b[6] , \mul_b[5] , \mul_b[4] ,
     \mul_b[3] , \mul_b[2] , \mul_b[1] , \mul_b[0] , \mul_result[15] ,
     \mul_result[14] , \mul_result[13] , \mul_result[12] , \mul_result[11] ,
     \mul_result[10] , \mul_result[9] , \mul_result[8] , \mul_result[7] ,
     \mul_result[6] , \mul_result[5] , \mul_result[4] , \mul_result[3] ,
     \mul_result[2] , \mul_result[1] , \mul_result[0] , \add_in[24] ,
     \add_in[23] , \add_in[22] , \add_in[21] , \add_in[20] , \add_in[19] ,
     \add_in[18] , \add_in[17] , \add_in[16] , \add_in[15] , \add_in[14] ,
     \add_in[13] , \add_in[12] , \add_in[11] , \add_in[10] , \add_in[9] ,
     \add_in[8] , \add_in[7] , \add_in[6] , \add_in[5] , \add_in[4] ,
     \add_in[3] , \add_in[2] , \add_in[1] , \add_in[0] , \mac_add_res[24] ,
     \mac_add_res[23] , \mac_add_res[22] , \mac_add_res[21] , \mac_add_res[20] ,
     \mac_add_res[19] , \mac_add_res[18] , \mac_add_res[17] , \mac_add_res[16] ,
     \mac_add_res[15] , \mac_add_res[14] , \mac_add_res[13] , \mac_add_res[12] ,
     \mac_add_res[11] , \mac_add_res[10] , \mac_add_res[9] , \mac_add_res[8] ,
     \mac_add_res[7] , \mac_add_res[6] , \mac_add_res[5] , \mac_add_res[4] ,
     \mac_add_res[3] , \mac_add_res[2] , \mac_add_res[1] , \mac_add_res[0] ,
     overflow, n9, n10, n11, n12, n13, n14, n16, n17, n18, n19, n20, n21, n22,
     n23, n24, n29, n30, n31, n33, n34, n35, n36, n105, n106, n107, n108, n109,
     n110, n111, n112, n113, n114, n115, n116, n117, n118, n119, n120, n121,
     n122, n123, n124, n125, n126, n127, n128, n155, n156, n157, n158, n159,
     n160, n161, n162, n163, n164, n165, n166, n167, n168, n169, n170, n171,
     n172, n173, n174, n175, n176, n177, n178, n179, n180, n181, n182, n183,
     n184, n185, n186, n187, n188, n189, n190, n191, n192, n193, n194, n195,
     n196, n197, n198, n199, n200, n201, n202, n203, n204, n205, n206, n207,
     n208, n209, n210, n211, n212, n213, n214, n215, n216, n217, n218, n220,
     n222, n224, n226, n228, n230, n232, n234, n318, n322, n324, n325, n326,
     n327, n328, n329, n330, n331, n332, n333, n334, n335, n336, n337, n338,
     n339, n340, n341, n342, n343, n344, n345, n346, n347, n348, n349, n350,
     n351, n352, n353, n354, n355, n356, n357, n358, n359, n360, n361, n362,
     n363, n364, n365, n366, n367, n368, n369, n370, n371, n372, n373, n374,
     n375, n376, n377, n378, n379, n0, n3, n4, n5, n6, n7, n8, n15, n25, n26,
     n27, n28, n32, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48,
     n49, n50, n51, n52, n139, n140, n141, n142, n143, n144, n145, n146, n147,
     n148, n149, n150, n151, n152, n153, n154, n219, n221, n223, n225, n227,
     n229, n231, n233, n235, n236, n237, n238, n239, n240, n241, n242, n243,
     n244, n245, n246, n247, n248, n249, n250, n251, n252, n253, n254, n255,
     n256, n257, n258, n259, n260, n261, n262, n263, n264, n265, n266, n267,
     n268, n269, n270, n271, n272, n273, n274, n275, n276, n277, n278, n279,
     n280, n281, n282, n283, n284, n285, n286, n287, n288, n289, n290, n291,
     n292, n293, n294, n295, n296, n297, n298, n299, n300, n301;
    assign #1 n322 = ~rst_n ;
    assign #1 n189 = ({\cnt[2] , \cnt[1] , \cnt[0] } == {1'b1, 1'b1, 1'b0} ? 1 : 0);
    assign #1 {n139, n9, n10, n11} = {\cnt[2] , \cnt[1] , \cnt[0] } + {1'b0,
        1'b0, 1'b1};
    assign #1 n12 = (n189 ? 1'b0 : n9);
    assign #1 n13 = (n189 ? 1'b0 : n10);
    assign #1 n14 = (n189 ? 1'b0 : n11);
    assign #1 n16 = ~n189 ;
    assign #1 n17 = (calc_en ? n12 : \cnt[2] );
    assign #1 n18 = (calc_en ? n13 : \cnt[1] );
    assign #1 n19 = (calc_en ? n14 : \cnt[0] );
    assign #1 n20 = (calc_en ? n16 : calc_en);
    assign #1 n21 = (rx_valid ? 1'b1 : n20);
    assign #1 n22 = (rx_valid ? 1'b0 : n17);
    assign #1 n23 = (rx_valid ? 1'b0 : n18);
    assign #1 n24 = (rx_valid ? 1'b1 : n19);
    always @( posedge clk or posedge n322 )
    begin
             if (n322) \cnt[1]  <= 1'b0;
        else \cnt[1]  <= n23;
    end
    assign n140 = ~\cnt[1]  ;
    always @( posedge clk or posedge n322 )
    begin
             if (n322) \cnt[0]  <= 1'b0;
        else \cnt[0]  <= n24;
    end
    assign n141 = ~\cnt[0]  ;
    always @( posedge clk or posedge n322 )
    begin
             if (n322) calc_en <= 1'b0;
        else calc_en <= n21;
    end
    assign n142 = ~calc_en ;
    always @( posedge clk or posedge n322 )
    begin
             if (n322) \temp_product[31]  <= 1'b0;
        else \temp_product[31]  <= n195;
    end
    assign n143 = ~\temp_product[31]  ;
    assign #1 n29 = ({\cnt[2] , \cnt[1] , \cnt[0] } == {1'b0, 1'b0, 1'b1} ? 1 : 0);
    assign #1 n30 = ({\cnt[2] , \cnt[1] , \cnt[0] } == {1'b0, 1'b1, 1'b0} ? 1 : 0);
    assign #1 n31 = ({\cnt[2] , \cnt[1] , \cnt[0] } == {1'b0, 1'b1, 1'b1} ? 1 : 0);
    assign #1 n187 = ({\cnt[2] , \cnt[1] , \cnt[0] } == {1'b1, 1'b0, 1'b0} ? 1 : 0);
    assign #1 n33 = n29 | n30 ;
    assign #1 n34 = n31 | n187 ;
    assign #1 n35 = n33 | n34 ;
    assign #1 n36 = ~n35 ;
    assign #1 \mul_a[7]  = n29 & data_A[15]
         | n30 & data_A[15]
         | n31 & data_A[7]
         | n187 & data_A[7]
         | n36 & 1'b0;
    assign #1 \mul_a[6]  = n29 & data_A[14]
         | n30 & data_A[14]
         | n31 & data_A[6]
         | n187 & data_A[6]
         | n36 & 1'b0;
    assign #1 \mul_a[5]  = n29 & data_A[13]
         | n30 & data_A[13]
         | n31 & data_A[5]
         | n187 & data_A[5]
         | n36 & 1'b0;
    assign #1 \mul_a[4]  = n29 & data_A[12]
         | n30 & data_A[12]
         | n31 & data_A[4]
         | n187 & data_A[4]
         | n36 & 1'b0;
    assign #1 \mul_a[3]  = n29 & data_A[11]
         | n30 & data_A[11]
         | n31 & data_A[3]
         | n187 & data_A[3]
         | n36 & 1'b0;
    assign #1 \mul_a[2]  = n29 & data_A[10]
         | n30 & data_A[10]
         | n31 & data_A[2]
         | n187 & data_A[2]
         | n36 & 1'b0;
    assign #1 \mul_a[1]  = n29 & data_A[9]
         | n30 & data_A[9]
         | n31 & data_A[1]
         | n187 & data_A[1]
         | n36 & 1'b0;
    assign #1 \mul_a[0]  = n29 & data_A[8]
         | n30 & data_A[8]
         | n31 & data_A[0]
         | n187 & data_A[0]
         | n36 & 1'b0;
    assign #1 \mul_b[7]  = n29 & data_B[15]
         | n30 & data_B[7]
         | n31 & data_B[15]
         | n187 & data_B[7]
         | n36 & 1'b0;
    assign #1 \mul_b[6]  = n29 & data_B[14]
         | n30 & data_B[6]
         | n31 & data_B[14]
         | n187 & data_B[6]
         | n36 & 1'b0;
    assign #1 \mul_b[5]  = n29 & data_B[13]
         | n30 & data_B[5]
         | n31 & data_B[13]
         | n187 & data_B[5]
         | n36 & 1'b0;
    assign #1 \mul_b[4]  = n29 & data_B[12]
         | n30 & data_B[4]
         | n31 & data_B[12]
         | n187 & data_B[4]
         | n36 & 1'b0;
    assign #1 \mul_b[3]  = n29 & data_B[11]
         | n30 & data_B[3]
         | n31 & data_B[11]
         | n187 & data_B[3]
         | n36 & 1'b0;
    assign #1 \mul_b[2]  = n29 & data_B[10]
         | n30 & data_B[2]
         | n31 & data_B[10]
         | n187 & data_B[2]
         | n36 & 1'b0;
    assign #1 \mul_b[1]  = n29 & data_B[9]
         | n30 & data_B[1]
         | n31 & data_B[9]
         | n187 & data_B[1]
         | n36 & 1'b0;
    assign #1 \mul_b[0]  = n29 & data_B[8]
         | n30 & data_B[0]
         | n31 & data_B[8]
         | n187 & data_B[0]
         | n36 & 1'b0;
    mul8x8_booth_wallace_ks u_mul8x8 (.clk(clk), .rst_n(rst_n), .a({\mul_a[7] ,
        \mul_a[6] , \mul_a[5] , \mul_a[4] , \mul_a[3] , \mul_a[2] , \mul_a[1] ,
        \mul_a[0] }), .b({\mul_b[7] , \mul_b[6] , \mul_b[5] , \mul_b[4] ,
        \mul_b[3] , \mul_b[2] , \mul_b[1] , \mul_b[0] }), .prod({\mul_result[15] ,
        \mul_result[14] , \mul_result[13] , \mul_result[12] , \mul_result[11] ,
        \mul_result[10] , \mul_result[9] , \mul_result[8] , \mul_result[7] ,
        \mul_result[6] , \mul_result[5] , \mul_result[4] , \mul_result[3] ,
        \mul_result[2] , \mul_result[1] , \mul_result[0] }));
    assign #1 {n144, n105, n106, n107, n108, n109, n110, n111, n112, n113,
        n114, n115, n116, n117, n118, n119, n120, n121, n122, n123, n124,
        n125, n126, n127, n128} = {\temp_product[31] , \temp_product[30] ,
        \temp_product[29] , \temp_product[28] , \temp_product[27] , \temp_product[26] ,
        \temp_product[25] , \temp_product[24] , \temp_product[23] , \temp_product[22] ,
        \temp_product[21] , \temp_product[20] , \temp_product[19] , \temp_product[18] ,
        \temp_product[17] , \temp_product[16] , \temp_product[15] , \temp_product[14] ,
        \temp_product[13] , \temp_product[12] , \temp_product[11] , \temp_product[10] ,
        \temp_product[9] , \temp_product[8] } + {1'b0, 1'b0, 1'b0, 1'b0,
        1'b0, 1'b0, 1'b0, 1'b0, \mul_result[15] , \mul_result[14] , \mul_result[13] ,
        \mul_result[12] , \mul_result[11] , \mul_result[10] , \mul_result[9] ,
        \mul_result[8] , \mul_result[7] , \mul_result[6] , \mul_result[5] ,
        \mul_result[4] , \mul_result[3] , \mul_result[2] , \mul_result[1] ,
        \mul_result[0] };
    assign #1 {n145, n155, n156, n157, n158, n159, n160, n161, n162, n163,
        n164, n165, n166, n167, n168, n169, n170, n171, n172, n173, n174,
        n175, n176, n177, n178, n179, n180, n181, n182, n183, n184, n185,
        n186} = {\temp_product[31] , \temp_product[30] , \temp_product[29] ,
        \temp_product[28] , \temp_product[27] , \temp_product[26] , \temp_product[25] ,
        \temp_product[24] , \temp_product[23] , \temp_product[22] , \temp_product[21] ,
        \temp_product[20] , \temp_product[19] , \temp_product[18] , \temp_product[17] ,
        \temp_product[16] , \temp_product[15] , \temp_product[14] , \temp_product[13] ,
        \temp_product[12] , \temp_product[11] , \temp_product[10] , \temp_product[9] ,
        \temp_product[8] , \temp_product[7] , \temp_product[6] , \temp_product[5] ,
        \temp_product[4] , \temp_product[3] , \temp_product[2] , \temp_product[1] ,
        \temp_product[0] } + {1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0,
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, \mul_result[15] ,
        \mul_result[14] , \mul_result[13] , \mul_result[12] , \mul_result[11] ,
        \mul_result[10] , \mul_result[9] , \mul_result[8] , \mul_result[7] ,
        \mul_result[6] , \mul_result[5] , \mul_result[4] , \mul_result[3] ,
        \mul_result[2] , \mul_result[1] , \mul_result[0] };
    assign #1 n188 = ({\cnt[2] , \cnt[1] , \cnt[0] } == {1'b1, 1'b0, 1'b1} ? 1 : 0);
    assign #1 n190 = ({\cnt[2] , \cnt[1] , \cnt[0] } == {1'b0, 1'b0, 1'b0} ? 1 : 0);
    assign #1 n191 = n187 | n188 ;
    assign #1 n192 = n189 | n190 ;
    assign #1 n193 = n191 | n192 ;
    assign #1 n194 = ~n193 ;
    assign #1 n195 = n187 & \mul_result[15] 
         | n188 & n105
         | n189 & n105
         | n190 & n155
         | n194 & \temp_product[31] ;
    assign #1 n196 = n187 & \mul_result[14] 
         | n188 & n106
         | n189 & n106
         | n190 & n156
         | n194 & \temp_product[30] ;
    assign #1 n197 = n187 & \mul_result[13] 
         | n188 & n107
         | n189 & n107
         | n190 & n157
         | n194 & \temp_product[29] ;
    assign #1 n198 = n187 & \mul_result[12] 
         | n188 & n108
         | n189 & n108
         | n190 & n158
         | n194 & \temp_product[28] ;
    assign #1 n199 = n187 & \mul_result[11] 
         | n188 & n109
         | n189 & n109
         | n190 & n159
         | n194 & \temp_product[27] ;
    assign #1 n200 = n187 & \mul_result[10] 
         | n188 & n110
         | n189 & n110
         | n190 & n160
         | n194 & \temp_product[26] ;
    assign #1 n201 = n187 & \mul_result[9] 
         | n188 & n111
         | n189 & n111
         | n190 & n161
         | n194 & \temp_product[25] ;
    assign #1 n202 = n187 & \mul_result[8] 
         | n188 & n112
         | n189 & n112
         | n190 & n162
         | n194 & \temp_product[24] ;
    assign #1 n203 = n187 & \mul_result[7] 
         | n188 & n113
         | n189 & n113
         | n190 & n163
         | n194 & \temp_product[23] ;
    assign #1 n204 = n187 & \mul_result[6] 
         | n188 & n114
         | n189 & n114
         | n190 & n164
         | n194 & \temp_product[22] ;
    assign #1 n205 = n187 & \mul_result[5] 
         | n188 & n115
         | n189 & n115
         | n190 & n165
         | n194 & \temp_product[21] ;
    assign #1 n206 = n187 & \mul_result[4] 
         | n188 & n116
         | n189 & n116
         | n190 & n166
         | n194 & \temp_product[20] ;
    assign #1 n207 = n187 & \mul_result[3] 
         | n188 & n117
         | n189 & n117
         | n190 & n167
         | n194 & \temp_product[19] ;
    assign #1 n208 = n187 & \mul_result[2] 
         | n188 & n118
         | n189 & n118
         | n190 & n168
         | n194 & \temp_product[18] ;
    assign #1 n209 = n187 & \mul_result[1] 
         | n188 & n119
         | n189 & n119
         | n190 & n169
         | n194 & \temp_product[17] ;
    assign #1 n210 = n187 & \mul_result[0] 
         | n188 & n120
         | n189 & n120
         | n190 & n170
         | n194 & \temp_product[16] ;
    assign #1 n211 = n187 & 1'b0
         | n188 & n121
         | n189 & n121
         | n190 & n171
         | n194 & \temp_product[15] ;
    assign #1 n212 = n187 & 1'b0
         | n188 & n122
         | n189 & n122
         | n190 & n172
         | n194 & \temp_product[14] ;
    assign #1 n213 = n187 & 1'b0
         | n188 & n123
         | n189 & n123
         | n190 & n173
         | n194 & \temp_product[13] ;
    assign #1 n214 = n187 & 1'b0
         | n188 & n124
         | n189 & n124
         | n190 & n174
         | n194 & \temp_product[12] ;
    assign #1 n215 = n187 & 1'b0
         | n188 & n125
         | n189 & n125
         | n190 & n175
         | n194 & \temp_product[11] ;
    assign #1 n216 = n187 & 1'b0
         | n188 & n126
         | n189 & n126
         | n190 & n176
         | n194 & \temp_product[10] ;
    assign #1 n217 = n187 & 1'b0
         | n188 & n127
         | n189 & n127
         | n190 & n177
         | n194 & \temp_product[9] ;
    assign #1 n218 = n187 & 1'b0
         | n188 & n128
         | n189 & n128
         | n190 & n178
         | n194 & \temp_product[8] ;
    assign #1 n220 = n187 & 1'b0
         | n188 & \temp_product[7] 
         | n189 & \temp_product[7] 
         | n190 & n179
         | n194 & \temp_product[7] ;
    assign #1 n222 = n187 & 1'b0
         | n188 & \temp_product[6] 
         | n189 & \temp_product[6] 
         | n190 & n180
         | n194 & \temp_product[6] ;
    assign #1 n224 = n187 & 1'b0
         | n188 & \temp_product[5] 
         | n189 & \temp_product[5] 
         | n190 & n181
         | n194 & \temp_product[5] ;
    assign #1 n226 = n187 & 1'b0
         | n188 & \temp_product[4] 
         | n189 & \temp_product[4] 
         | n190 & n182
         | n194 & \temp_product[4] ;
    assign #1 n228 = n187 & 1'b0
         | n188 & \temp_product[3] 
         | n189 & \temp_product[3] 
         | n190 & n183
         | n194 & \temp_product[3] ;
    assign #1 n230 = n187 & 1'b0
         | n188 & \temp_product[2] 
         | n189 & \temp_product[2] 
         | n190 & n184
         | n194 & \temp_product[2] ;
    assign #1 n232 = n187 & 1'b0
         | n188 & \temp_product[1] 
         | n189 & \temp_product[1] 
         | n190 & n185
         | n194 & \temp_product[1] ;
    assign #1 n234 = n187 & 1'b0
         | n188 & \temp_product[0] 
         | n189 & \temp_product[0] 
         | n190 & n186
         | n194 & \temp_product[0] ;
    always @( posedge clk or posedge n322 )
    begin
             if (n322) \temp_product[30]  <= 1'b0;
        else \temp_product[30]  <= n196;
    end
    assign n146 = ~\temp_product[30]  ;
    always @( posedge clk or posedge n322 )
    begin
             if (n322) \temp_product[29]  <= 1'b0;
        else \temp_product[29]  <= n197;
    end
    assign n147 = ~\temp_product[29]  ;
    always @( posedge clk or posedge n322 )
    begin
             if (n322) \temp_product[28]  <= 1'b0;
        else \temp_product[28]  <= n198;
    end
    assign n148 = ~\temp_product[28]  ;
    always @( posedge clk or posedge n322 )
    begin
             if (n322) \temp_product[27]  <= 1'b0;
        else \temp_product[27]  <= n199;
    end
    assign n149 = ~\temp_product[27]  ;
    always @( posedge clk or posedge n322 )
    begin
             if (n322) \temp_product[26]  <= 1'b0;
        else \temp_product[26]  <= n200;
    end
    assign n150 = ~\temp_product[26]  ;
    always @( posedge clk or posedge n322 )
    begin
             if (n322) \temp_product[25]  <= 1'b0;
        else \temp_product[25]  <= n201;
    end
    assign n151 = ~\temp_product[25]  ;
    always @( posedge clk or posedge n322 )
    begin
             if (n322) \temp_product[24]  <= 1'b0;
        else \temp_product[24]  <= n202;
    end
    assign n152 = ~\temp_product[24]  ;
    always @( posedge clk or posedge n322 )
    begin
             if (n322) \temp_product[23]  <= 1'b0;
        else \temp_product[23]  <= n203;
    end
    assign n153 = ~\temp_product[23]  ;
    always @( posedge clk or posedge n322 )
    begin
             if (n322) \temp_product[22]  <= 1'b0;
        else \temp_product[22]  <= n204;
    end
    assign n154 = ~\temp_product[22]  ;
    always @( posedge clk or posedge n322 )
    begin
             if (n322) \temp_product[21]  <= 1'b0;
        else \temp_product[21]  <= n205;
    end
    assign n219 = ~\temp_product[21]  ;
    always @( posedge clk or posedge n322 )
    begin
             if (n322) \temp_product[20]  <= 1'b0;
        else \temp_product[20]  <= n206;
    end
    assign n221 = ~\temp_product[20]  ;
    always @( posedge clk or posedge n322 )
    begin
             if (n322) \temp_product[19]  <= 1'b0;
        else \temp_product[19]  <= n207;
    end
    assign n223 = ~\temp_product[19]  ;
    always @( posedge clk or posedge n322 )
    begin
             if (n322) \temp_product[18]  <= 1'b0;
        else \temp_product[18]  <= n208;
    end
    assign n225 = ~\temp_product[18]  ;
    always @( posedge clk or posedge n322 )
    begin
             if (n322) \temp_product[17]  <= 1'b0;
        else \temp_product[17]  <= n209;
    end
    assign n227 = ~\temp_product[17]  ;
    always @( posedge clk or posedge n322 )
    begin
             if (n322) \temp_product[16]  <= 1'b0;
        else \temp_product[16]  <= n210;
    end
    assign n229 = ~\temp_product[16]  ;
    always @( posedge clk or posedge n322 )
    begin
             if (n322) \temp_product[15]  <= 1'b0;
        else \temp_product[15]  <= n211;
    end
    assign n231 = ~\temp_product[15]  ;
    always @( posedge clk or posedge n322 )
    begin
             if (n322) \temp_product[14]  <= 1'b0;
        else \temp_product[14]  <= n212;
    end
    assign n233 = ~\temp_product[14]  ;
    always @( posedge clk or posedge n322 )
    begin
             if (n322) \temp_product[13]  <= 1'b0;
        else \temp_product[13]  <= n213;
    end
    assign n235 = ~\temp_product[13]  ;
    always @( posedge clk or posedge n322 )
    begin
             if (n322) \temp_product[12]  <= 1'b0;
        else \temp_product[12]  <= n214;
    end
    assign n236 = ~\temp_product[12]  ;
    always @( posedge clk or posedge n322 )
    begin
             if (n322) \temp_product[11]  <= 1'b0;
        else \temp_product[11]  <= n215;
    end
    assign n237 = ~\temp_product[11]  ;
    always @( posedge clk or posedge n322 )
    begin
             if (n322) \temp_product[10]  <= 1'b0;
        else \temp_product[10]  <= n216;
    end
    assign n238 = ~\temp_product[10]  ;
    always @( posedge clk or posedge n322 )
    begin
             if (n322) \temp_product[9]  <= 1'b0;
        else \temp_product[9]  <= n217;
    end
    assign n239 = ~\temp_product[9]  ;
    always @( posedge clk or posedge n322 )
    begin
             if (n322) \temp_product[8]  <= 1'b0;
        else \temp_product[8]  <= n218;
    end
    assign n240 = ~\temp_product[8]  ;
    always @( posedge clk or posedge n322 )
    begin
             if (n322) \temp_product[7]  <= 1'b0;
        else \temp_product[7]  <= n220;
    end
    assign n241 = ~\temp_product[7]  ;
    always @( posedge clk or posedge n322 )
    begin
             if (n322) \temp_product[6]  <= 1'b0;
        else \temp_product[6]  <= n222;
    end
    assign n242 = ~\temp_product[6]  ;
    always @( posedge clk or posedge n322 )
    begin
             if (n322) \temp_product[5]  <= 1'b0;
        else \temp_product[5]  <= n224;
    end
    assign n243 = ~\temp_product[5]  ;
    always @( posedge clk or posedge n322 )
    begin
             if (n322) \temp_product[4]  <= 1'b0;
        else \temp_product[4]  <= n226;
    end
    assign n244 = ~\temp_product[4]  ;
    always @( posedge clk or posedge n322 )
    begin
             if (n322) \temp_product[3]  <= 1'b0;
        else \temp_product[3]  <= n228;
    end
    assign n245 = ~\temp_product[3]  ;
    always @( posedge clk or posedge n322 )
    begin
             if (n322) \temp_product[2]  <= 1'b0;
        else \temp_product[2]  <= n230;
    end
    assign n246 = ~\temp_product[2]  ;
    always @( posedge clk or posedge n322 )
    begin
             if (n322) \temp_product[1]  <= 1'b0;
        else \temp_product[1]  <= n232;
    end
    assign n247 = ~\temp_product[1]  ;
    always @( posedge clk or posedge n322 )
    begin
             if (n322) \temp_product[0]  <= 1'b0;
        else \temp_product[0]  <= n234;
    end
    assign n248 = ~\temp_product[0]  ;
    always @( posedge clk or posedge n322 )
    begin
             if (n322) \global_acc[24]  <= 1'b0;
        else \global_acc[24]  <= n330;
    end
    assign n249 = ~\global_acc[24]  ;
    assign #1 \add_in[24]  = (mode ? \global_acc[24]  : 1'b0);
    assign #1 \add_in[23]  = (mode ? \global_acc[23]  : 1'b0);
    assign #1 \add_in[22]  = (mode ? \global_acc[22]  : 1'b0);
    assign #1 \add_in[21]  = (mode ? \global_acc[21]  : 1'b0);
    assign #1 \add_in[20]  = (mode ? \global_acc[20]  : 1'b0);
    assign #1 \add_in[19]  = (mode ? \global_acc[19]  : 1'b0);
    assign #1 \add_in[18]  = (mode ? \global_acc[18]  : 1'b0);
    assign #1 \add_in[17]  = (mode ? \global_acc[17]  : 1'b0);
    assign #1 \add_in[16]  = (mode ? \global_acc[16]  : 1'b0);
    assign #1 \add_in[15]  = (mode ? \global_acc[15]  : 1'b0);
    assign #1 \add_in[14]  = (mode ? \global_acc[14]  : 1'b0);
    assign #1 \add_in[13]  = (mode ? \global_acc[13]  : 1'b0);
    assign #1 \add_in[12]  = (mode ? \global_acc[12]  : 1'b0);
    assign #1 \add_in[11]  = (mode ? \global_acc[11]  : 1'b0);
    assign #1 \add_in[10]  = (mode ? \global_acc[10]  : 1'b0);
    assign #1 \add_in[9]  = (mode ? \global_acc[9]  : 1'b0);
    assign #1 \add_in[8]  = (mode ? \global_acc[8]  : 1'b0);
    assign #1 \add_in[7]  = (mode ? \global_acc[7]  : 1'b0);
    assign #1 \add_in[6]  = (mode ? \global_acc[6]  : 1'b0);
    assign #1 \add_in[5]  = (mode ? \global_acc[5]  : 1'b0);
    assign #1 \add_in[4]  = (mode ? \global_acc[4]  : 1'b0);
    assign #1 \add_in[3]  = (mode ? \global_acc[3]  : 1'b0);
    assign #1 \add_in[2]  = (mode ? \global_acc[2]  : 1'b0);
    assign #1 \add_in[1]  = (mode ? \global_acc[1]  : 1'b0);
    assign #1 \add_in[0]  = (mode ? \global_acc[0]  : 1'b0);
    assign #1 {n250, \mac_add_res[24] , \mac_add_res[23] , \mac_add_res[22] ,
        \mac_add_res[21] , \mac_add_res[20] , \mac_add_res[19] , \mac_add_res[18] ,
        \mac_add_res[17] , \mac_add_res[16] , \mac_add_res[15] , \mac_add_res[14] ,
        \mac_add_res[13] , \mac_add_res[12] , \mac_add_res[11] , \mac_add_res[10] ,
        \mac_add_res[9] , \mac_add_res[8] , \mac_add_res[7] , \mac_add_res[6] ,
        \mac_add_res[5] , \mac_add_res[4] , \mac_add_res[3] , \mac_add_res[2] ,
        \mac_add_res[1] , \mac_add_res[0] } = {\add_in[24] , \add_in[23] ,
        \add_in[22] , \add_in[21] , \add_in[20] , \add_in[19] , \add_in[18] ,
        \add_in[17] , \add_in[16] , \add_in[15] , \add_in[14] , \add_in[13] ,
        \add_in[12] , \add_in[11] , \add_in[10] , \add_in[9] , \add_in[8] ,
        \add_in[7] , \add_in[6] , \add_in[5] , \add_in[4] , \add_in[3] ,
        \add_in[2] , \add_in[1] , \add_in[0] } + {1'b0, \temp_product[23] ,
        \temp_product[22] , \temp_product[21] , \temp_product[20] , \temp_product[19] ,
        \temp_product[18] , \temp_product[17] , \temp_product[16] , \temp_product[15] ,
        \temp_product[14] , \temp_product[13] , \temp_product[12] , \temp_product[11] ,
        \temp_product[10] , \temp_product[9] , \temp_product[8] , \temp_product[7] ,
        \temp_product[6] , \temp_product[5] , \temp_product[4] , \temp_product[3] ,
        \temp_product[2] , \temp_product[1] , \temp_product[0] };
    assign #1 n318 = \temp_product[31]  | \temp_product[30]  | \temp_product[29]  | \temp_product[28]  | \temp_product[27]  | \temp_product[26]  | \temp_product[25]  | \temp_product[24]  ;
    assign #1 overflow = n318 | \mac_add_res[24]  ;
    assign #1 n324 = ~calc_en ;
    assign #1 n325 = n190 & n324 ;
    assign #1 n326 = ~n0 ;
    assign #1 n3 = ~\global_acc[24]  ;
    assign #1 n4 = ~\global_acc[23]  ;
    assign #1 n5 = ~\global_acc[22]  ;
    assign #1 n6 = ~\global_acc[21]  ;
    assign #1 n7 = ~\global_acc[20]  ;
    assign #1 n8 = ~\global_acc[19]  ;
    assign #1 n15 = ~\global_acc[18]  ;
    assign #1 n25 = ~\global_acc[17]  ;
    assign #1 n26 = ~\global_acc[16]  ;
    assign #1 n27 = ~\global_acc[15]  ;
    assign #1 n28 = ~\global_acc[14]  ;
    assign #1 n32 = ~\global_acc[13]  ;
    assign #1 n37 = ~\global_acc[12]  ;
    assign #1 n38 = ~\global_acc[11]  ;
    assign #1 n39 = ~\global_acc[10]  ;
    assign #1 n40 = ~\global_acc[9]  ;
    assign #1 n41 = ~\global_acc[8]  ;
    assign #1 n42 = ~\global_acc[7]  ;
    assign #1 n43 = ~\global_acc[6]  ;
    assign #1 n44 = ~\global_acc[5]  ;
    assign #1 n45 = ~\global_acc[4]  ;
    assign #1 n46 = ~\global_acc[3]  ;
    assign #1 n47 = ~\global_acc[2]  ;
    assign #1 n48 = ~\global_acc[1]  ;
    assign #1 n49 = ~\global_acc[0]  ;
    assign #1 n50 = n3 & n4 & n5 & n6 & n7 & n8 & n15 & n25 ;
    assign #1 n51 = n26 & n27 & n28 & n32 & n37 & n38 & n39 & n40 ;
    assign #1 n52 = n41 & n42 & n43 & n44 & n45 & n46 & n47 & n48 ;
    assign #1 n0 = n49 & n50 & n51 & n52 ;
    assign #1 n327 = ~n326 ;
    assign #1 n328 = n325 & n327 ;
    assign #1 n329 = mac_carry | overflow ;
    assign #1 n330 = (n328 ? \mac_add_res[24]  : \global_acc[24] );
    assign #1 n331 = (n328 ? \mac_add_res[23]  : \global_acc[23] );
    assign #1 n332 = (n328 ? \mac_add_res[22]  : \global_acc[22] );
    assign #1 n333 = (n328 ? \mac_add_res[21]  : \global_acc[21] );
    assign #1 n334 = (n328 ? \mac_add_res[20]  : \global_acc[20] );
    assign #1 n335 = (n328 ? \mac_add_res[19]  : \global_acc[19] );
    assign #1 n336 = (n328 ? \mac_add_res[18]  : \global_acc[18] );
    assign #1 n337 = (n328 ? \mac_add_res[17]  : \global_acc[17] );
    assign #1 n338 = (n328 ? \mac_add_res[16]  : \global_acc[16] );
    assign #1 n339 = (n328 ? \mac_add_res[15]  : \global_acc[15] );
    assign #1 n340 = (n328 ? \mac_add_res[14]  : \global_acc[14] );
    assign #1 n341 = (n328 ? \mac_add_res[13]  : \global_acc[13] );
    assign #1 n342 = (n328 ? \mac_add_res[12]  : \global_acc[12] );
    assign #1 n343 = (n328 ? \mac_add_res[11]  : \global_acc[11] );
    assign #1 n344 = (n328 ? \mac_add_res[10]  : \global_acc[10] );
    assign #1 n345 = (n328 ? \mac_add_res[9]  : \global_acc[9] );
    assign #1 n346 = (n328 ? \mac_add_res[8]  : \global_acc[8] );
    assign #1 n347 = (n328 ? \mac_add_res[7]  : \global_acc[7] );
    assign #1 n348 = (n328 ? \mac_add_res[6]  : \global_acc[6] );
    assign #1 n349 = (n328 ? \mac_add_res[5]  : \global_acc[5] );
    assign #1 n350 = (n328 ? \mac_add_res[4]  : \global_acc[4] );
    assign #1 n351 = (n328 ? \mac_add_res[3]  : \global_acc[3] );
    assign #1 n352 = (n328 ? \mac_add_res[2]  : \global_acc[2] );
    assign #1 n353 = (n328 ? \mac_add_res[1]  : \global_acc[1] );
    assign #1 n354 = (n328 ? \mac_add_res[0]  : \global_acc[0] );
    assign #1 n355 = (n328 ? \mac_add_res[23]  : mac_result[23]);
    assign #1 n356 = (n328 ? \mac_add_res[22]  : mac_result[22]);
    assign #1 n357 = (n328 ? \mac_add_res[21]  : mac_result[21]);
    assign #1 n358 = (n328 ? \mac_add_res[20]  : mac_result[20]);
    assign #1 n359 = (n328 ? \mac_add_res[19]  : mac_result[19]);
    assign #1 n360 = (n328 ? \mac_add_res[18]  : mac_result[18]);
    assign #1 n361 = (n328 ? \mac_add_res[17]  : mac_result[17]);
    assign #1 n362 = (n328 ? \mac_add_res[16]  : mac_result[16]);
    assign #1 n363 = (n328 ? \mac_add_res[15]  : mac_result[15]);
    assign #1 n364 = (n328 ? \mac_add_res[14]  : mac_result[14]);
    assign #1 n365 = (n328 ? \mac_add_res[13]  : mac_result[13]);
    assign #1 n366 = (n328 ? \mac_add_res[12]  : mac_result[12]);
    assign #1 n367 = (n328 ? \mac_add_res[11]  : mac_result[11]);
    assign #1 n368 = (n328 ? \mac_add_res[10]  : mac_result[10]);
    assign #1 n369 = (n328 ? \mac_add_res[9]  : mac_result[9]);
    assign #1 n370 = (n328 ? \mac_add_res[8]  : mac_result[8]);
    assign #1 n371 = (n328 ? \mac_add_res[7]  : mac_result[7]);
    assign #1 n372 = (n328 ? \mac_add_res[6]  : mac_result[6]);
    assign #1 n373 = (n328 ? \mac_add_res[5]  : mac_result[5]);
    assign #1 n374 = (n328 ? \mac_add_res[4]  : mac_result[4]);
    assign #1 n375 = (n328 ? \mac_add_res[3]  : mac_result[3]);
    assign #1 n376 = (n328 ? \mac_add_res[2]  : mac_result[2]);
    assign #1 n377 = (n328 ? \mac_add_res[1]  : mac_result[1]);
    assign #1 n378 = (n328 ? \mac_add_res[0]  : mac_result[0]);
    assign #1 n379 = (n328 ? n329 : mac_carry);
    always @( posedge clk or posedge n322 )
    begin
             if (n322) \global_acc[23]  <= 1'b0;
        else \global_acc[23]  <= n331;
    end
    assign n251 = ~\global_acc[23]  ;
    always @( posedge clk or posedge n322 )
    begin
             if (n322) \global_acc[22]  <= 1'b0;
        else \global_acc[22]  <= n332;
    end
    assign n252 = ~\global_acc[22]  ;
    always @( posedge clk or posedge n322 )
    begin
             if (n322) \global_acc[21]  <= 1'b0;
        else \global_acc[21]  <= n333;
    end
    assign n253 = ~\global_acc[21]  ;
    always @( posedge clk or posedge n322 )
    begin
             if (n322) \global_acc[20]  <= 1'b0;
        else \global_acc[20]  <= n334;
    end
    assign n254 = ~\global_acc[20]  ;
    always @( posedge clk or posedge n322 )
    begin
             if (n322) \global_acc[19]  <= 1'b0;
        else \global_acc[19]  <= n335;
    end
    assign n255 = ~\global_acc[19]  ;
    always @( posedge clk or posedge n322 )
    begin
             if (n322) \global_acc[18]  <= 1'b0;
        else \global_acc[18]  <= n336;
    end
    assign n256 = ~\global_acc[18]  ;
    always @( posedge clk or posedge n322 )
    begin
             if (n322) \global_acc[17]  <= 1'b0;
        else \global_acc[17]  <= n337;
    end
    assign n257 = ~\global_acc[17]  ;
    always @( posedge clk or posedge n322 )
    begin
             if (n322) \global_acc[16]  <= 1'b0;
        else \global_acc[16]  <= n338;
    end
    assign n258 = ~\global_acc[16]  ;
    always @( posedge clk or posedge n322 )
    begin
             if (n322) \global_acc[15]  <= 1'b0;
        else \global_acc[15]  <= n339;
    end
    assign n259 = ~\global_acc[15]  ;
    always @( posedge clk or posedge n322 )
    begin
             if (n322) \global_acc[14]  <= 1'b0;
        else \global_acc[14]  <= n340;
    end
    assign n260 = ~\global_acc[14]  ;
    always @( posedge clk or posedge n322 )
    begin
             if (n322) \global_acc[13]  <= 1'b0;
        else \global_acc[13]  <= n341;
    end
    assign n261 = ~\global_acc[13]  ;
    always @( posedge clk or posedge n322 )
    begin
             if (n322) \global_acc[12]  <= 1'b0;
        else \global_acc[12]  <= n342;
    end
    assign n262 = ~\global_acc[12]  ;
    always @( posedge clk or posedge n322 )
    begin
             if (n322) \global_acc[11]  <= 1'b0;
        else \global_acc[11]  <= n343;
    end
    assign n263 = ~\global_acc[11]  ;
    always @( posedge clk or posedge n322 )
    begin
             if (n322) \global_acc[10]  <= 1'b0;
        else \global_acc[10]  <= n344;
    end
    assign n264 = ~\global_acc[10]  ;
    always @( posedge clk or posedge n322 )
    begin
             if (n322) \global_acc[9]  <= 1'b0;
        else \global_acc[9]  <= n345;
    end
    assign n265 = ~\global_acc[9]  ;
    always @( posedge clk or posedge n322 )
    begin
             if (n322) \global_acc[8]  <= 1'b0;
        else \global_acc[8]  <= n346;
    end
    assign n266 = ~\global_acc[8]  ;
    always @( posedge clk or posedge n322 )
    begin
             if (n322) \global_acc[7]  <= 1'b0;
        else \global_acc[7]  <= n347;
    end
    assign n267 = ~\global_acc[7]  ;
    always @( posedge clk or posedge n322 )
    begin
             if (n322) \global_acc[6]  <= 1'b0;
        else \global_acc[6]  <= n348;
    end
    assign n268 = ~\global_acc[6]  ;
    always @( posedge clk or posedge n322 )
    begin
             if (n322) \global_acc[5]  <= 1'b0;
        else \global_acc[5]  <= n349;
    end
    assign n269 = ~\global_acc[5]  ;
    always @( posedge clk or posedge n322 )
    begin
             if (n322) \global_acc[4]  <= 1'b0;
        else \global_acc[4]  <= n350;
    end
    assign n270 = ~\global_acc[4]  ;
    always @( posedge clk or posedge n322 )
    begin
             if (n322) \global_acc[3]  <= 1'b0;
        else \global_acc[3]  <= n351;
    end
    assign n271 = ~\global_acc[3]  ;
    always @( posedge clk or posedge n322 )
    begin
             if (n322) \global_acc[2]  <= 1'b0;
        else \global_acc[2]  <= n352;
    end
    assign n272 = ~\global_acc[2]  ;
    always @( posedge clk or posedge n322 )
    begin
             if (n322) \global_acc[1]  <= 1'b0;
        else \global_acc[1]  <= n353;
    end
    assign n273 = ~\global_acc[1]  ;
    always @( posedge clk or posedge n322 )
    begin
             if (n322) \global_acc[0]  <= 1'b0;
        else \global_acc[0]  <= n354;
    end
    assign n274 = ~\global_acc[0]  ;
    always @( posedge clk or posedge n322 )
    begin
             if (n322) mac_result[23] <= 1'b0;
        else mac_result[23] <= n355;
    end
    assign n275 = ~mac_result[23] ;
    always @( posedge clk or posedge n322 )
    begin
             if (n322) mac_result[22] <= 1'b0;
        else mac_result[22] <= n356;
    end
    assign n276 = ~mac_result[22] ;
    always @( posedge clk or posedge n322 )
    begin
             if (n322) mac_result[21] <= 1'b0;
        else mac_result[21] <= n357;
    end
    assign n277 = ~mac_result[21] ;
    always @( posedge clk or posedge n322 )
    begin
             if (n322) mac_result[20] <= 1'b0;
        else mac_result[20] <= n358;
    end
    assign n278 = ~mac_result[20] ;
    always @( posedge clk or posedge n322 )
    begin
             if (n322) mac_result[19] <= 1'b0;
        else mac_result[19] <= n359;
    end
    assign n279 = ~mac_result[19] ;
    always @( posedge clk or posedge n322 )
    begin
             if (n322) mac_result[18] <= 1'b0;
        else mac_result[18] <= n360;
    end
    assign n280 = ~mac_result[18] ;
    always @( posedge clk or posedge n322 )
    begin
             if (n322) mac_result[17] <= 1'b0;
        else mac_result[17] <= n361;
    end
    assign n281 = ~mac_result[17] ;
    always @( posedge clk or posedge n322 )
    begin
             if (n322) mac_result[16] <= 1'b0;
        else mac_result[16] <= n362;
    end
    assign n282 = ~mac_result[16] ;
    always @( posedge clk or posedge n322 )
    begin
             if (n322) mac_result[15] <= 1'b0;
        else mac_result[15] <= n363;
    end
    assign n283 = ~mac_result[15] ;
    always @( posedge clk or posedge n322 )
    begin
             if (n322) mac_result[14] <= 1'b0;
        else mac_result[14] <= n364;
    end
    assign n284 = ~mac_result[14] ;
    always @( posedge clk or posedge n322 )
    begin
             if (n322) mac_result[13] <= 1'b0;
        else mac_result[13] <= n365;
    end
    assign n285 = ~mac_result[13] ;
    always @( posedge clk or posedge n322 )
    begin
             if (n322) mac_result[12] <= 1'b0;
        else mac_result[12] <= n366;
    end
    assign n286 = ~mac_result[12] ;
    always @( posedge clk or posedge n322 )
    begin
             if (n322) mac_result[11] <= 1'b0;
        else mac_result[11] <= n367;
    end
    assign n287 = ~mac_result[11] ;
    always @( posedge clk or posedge n322 )
    begin
             if (n322) mac_result[10] <= 1'b0;
        else mac_result[10] <= n368;
    end
    assign n288 = ~mac_result[10] ;
    always @( posedge clk or posedge n322 )
    begin
             if (n322) mac_result[9] <= 1'b0;
        else mac_result[9] <= n369;
    end
    assign n289 = ~mac_result[9] ;
    always @( posedge clk or posedge n322 )
    begin
             if (n322) mac_result[8] <= 1'b0;
        else mac_result[8] <= n370;
    end
    assign n290 = ~mac_result[8] ;
    always @( posedge clk or posedge n322 )
    begin
             if (n322) mac_result[7] <= 1'b0;
        else mac_result[7] <= n371;
    end
    assign n291 = ~mac_result[7] ;
    always @( posedge clk or posedge n322 )
    begin
             if (n322) mac_result[6] <= 1'b0;
        else mac_result[6] <= n372;
    end
    assign n292 = ~mac_result[6] ;
    always @( posedge clk or posedge n322 )
    begin
             if (n322) mac_result[5] <= 1'b0;
        else mac_result[5] <= n373;
    end
    assign n293 = ~mac_result[5] ;
    always @( posedge clk or posedge n322 )
    begin
             if (n322) mac_result[4] <= 1'b0;
        else mac_result[4] <= n374;
    end
    assign n294 = ~mac_result[4] ;
    always @( posedge clk or posedge n322 )
    begin
             if (n322) mac_result[3] <= 1'b0;
        else mac_result[3] <= n375;
    end
    assign n295 = ~mac_result[3] ;
    always @( posedge clk or posedge n322 )
    begin
             if (n322) mac_result[2] <= 1'b0;
        else mac_result[2] <= n376;
    end
    assign n296 = ~mac_result[2] ;
    always @( posedge clk or posedge n322 )
    begin
             if (n322) mac_result[1] <= 1'b0;
        else mac_result[1] <= n377;
    end
    assign n297 = ~mac_result[1] ;
    always @( posedge clk or posedge n322 )
    begin
             if (n322) mac_result[0] <= 1'b0;
        else mac_result[0] <= n378;
    end
    assign n298 = ~mac_result[0] ;
    always @( posedge clk or posedge n322 )
    begin
             if (n322) mac_carry <= 1'b0;
        else mac_carry <= n379;
    end
    assign n299 = ~mac_carry ;
    always @( posedge clk or posedge n322 )
    begin
             if (n322) calc_done <= 1'b0;
        else calc_done <= n328;
    end
    assign n300 = ~calc_done ;
    always @( posedge clk or posedge n322 )
    begin
             if (n322) \cnt[2]  <= 1'b0;
        else \cnt[2]  <= n22;
    end
    assign n301 = ~\cnt[2]  ;

endmodule

module sync_fifo(clk, rst_n, wr_en, wr_data, rd_en, rd_data, full, empty);
input clk, rst_n, wr_en, rd_en;
output full, empty;
input  [24:0] wr_data;
output [24:0] rd_data;
reg \wr_ptr[2] , \wr_ptr[1] , \wr_ptr[0] , \rd_ptr[2] , \rd_ptr[1] ,
     \rd_ptr[0] , \mem[3][0] , \mem[3][1] , \mem[3][2] , \mem[3][3] ,
     \mem[3][4] , \mem[3][5] , \mem[3][6] , \mem[3][7] , \mem[3][8] ,
     \mem[3][9] , \mem[3][10] , \mem[3][11] , \mem[3][12] , \mem[3][13] ,
     \mem[3][14] , \mem[3][15] , \mem[3][16] , \mem[3][17] , \mem[3][18] ,
     \mem[3][19] , \mem[3][20] , \mem[3][21] , \mem[3][22] , \mem[3][23] ,
     \mem[3][24] , \mem[2][0] , \mem[2][1] , \mem[2][2] , \mem[2][3] ,
     \mem[2][4] , \mem[2][5] , \mem[2][6] , \mem[2][7] , \mem[2][8] ,
     \mem[2][9] , \mem[2][10] , \mem[2][11] , \mem[2][12] , \mem[2][13] ,
     \mem[2][14] , \mem[2][15] , \mem[2][16] , \mem[2][17] , \mem[2][18] ,
     \mem[2][19] , \mem[2][20] , \mem[2][21] , \mem[2][22] , \mem[2][23] ,
     \mem[2][24] , \mem[1][0] , \mem[1][1] , \mem[1][2] , \mem[1][3] ,
     \mem[1][4] , \mem[1][5] , \mem[1][6] , \mem[1][7] , \mem[1][8] ,
     \mem[1][9] , \mem[1][10] , \mem[1][11] , \mem[1][12] , \mem[1][13] ,
     \mem[1][14] , \mem[1][15] , \mem[1][16] , \mem[1][17] , \mem[1][18] ,
     \mem[1][19] , \mem[1][20] , \mem[1][21] , \mem[1][22] , \mem[1][23] ,
     \mem[1][24] , \mem[0][0] , \mem[0][1] , \mem[0][2] , \mem[0][3] ,
     \mem[0][4] , \mem[0][5] , \mem[0][6] , \mem[0][7] , \mem[0][8] ,
     \mem[0][9] , \mem[0][10] , \mem[0][11] , \mem[0][12] , \mem[0][13] ,
     \mem[0][14] , \mem[0][15] , \mem[0][16] , \mem[0][17] , \mem[0][18] ,
     \mem[0][19] , \mem[0][20] , \mem[0][21] , \mem[0][22] , \mem[0][23] ,
     \mem[0][24] ;
wire n5, n6, n35, n36, n37, n38, n40, n41, n42, n43, n44, n45, n46, n47, n49,
     n50, n51, n52, n53, n54, n0, n3, n4, n7, n8, n9, n10, n11, n12, n13, n14,
     n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29,
     n30, n31, n32, n33, n34, n39, n48, n55, n56, n57, n58, n59, n60, n61, n62,
     n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77,
     n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92,
     n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105,
     n106, n107, n108, n109, n110, n111, n112, n113, n114, n115, n116, n117,
     n118, n119, n120, n121, n122, n123, n124, n125, n126, n127, n128, n129,
     n130, n131, n132, n133, n190, n191, n192, n193, n194, n195, n196, n197,
     n198, n199, n200, n201, n202, n203, n204, n205, n206, n207, n208, n209,
     n210, n211, n212, n213, n214, n215, n216, n217, n218, n219, n220, n221,
     n222, n223, n224, n225, n226, n227, n228, n229, n230, n231, n232, n233,
     n234, n235, n236, n237, n238, n239, n240, n241, n242, n243, n244, n245,
     n246, n247, n248, n249, n250, n251, n252, n253, n254, n255, n256, n257,
     n258, n259, n260, n261, n262, n263, n264, n265, n266, n267, n268, n269,
     n270, n271, n272, n273, n274, n275, n276, n277, n278, n279, n280, n281,
     n282, n283, n284, n285, n286, n287, n288, n289, n290, n291, n292, n293,
     n294, n295, n296, n297;
    assign #1 empty = ({\wr_ptr[2] , \wr_ptr[1] , \wr_ptr[0] } == {\rd_ptr[2] , \rd_ptr[1] , \rd_ptr[0] } ? 1 : 0);
    assign #1 n5 = \wr_ptr[2]  ^ \rd_ptr[2] ;
    assign #1 n6 = ({\wr_ptr[1] , \wr_ptr[0] } == {\rd_ptr[1] , \rd_ptr[0] } ? 1 : 0);
    assign #1 full = n5 & n6 ;
    assign #1 n35 = ~rst_n ;
    assign #1 n36 = ~full ;
    assign #1 n37 = wr_en & n36 ;
    assign #1 {n190, n40, n41, n42} = {\wr_ptr[2] , \wr_ptr[1] , \wr_ptr[0] } + {1'b0,
        1'b0, 1'b1};
    assign #1 n43 = (n37 ? n40 : \wr_ptr[2] );
    assign #1 n44 = (n37 ? n41 : \wr_ptr[1] );
    assign #1 n45 = (n37 ? n42 : \wr_ptr[0] );
    assign #1 n46 = ~empty ;
    assign #1 n47 = rd_en & n46 ;
    assign #1 {n191, n49, n50, n51} = {\rd_ptr[2] , \rd_ptr[1] , \rd_ptr[0] } + {1'b0,
        1'b0, 1'b1};
    assign #1 n52 = (n47 ? n49 : \rd_ptr[2] );
    assign #1 n53 = (n47 ? n50 : \rd_ptr[1] );
    assign #1 n54 = (n47 ? n51 : \rd_ptr[0] );
    always @( posedge clk or posedge n35 )
    begin
             if (n35) \wr_ptr[1]  <= 1'b0;
        else \wr_ptr[1]  <= n44;
    end
    assign n192 = ~\wr_ptr[1]  ;
    always @( posedge clk or posedge n35 )
    begin
             if (n35) \wr_ptr[0]  <= 1'b0;
        else \wr_ptr[0]  <= n45;
    end
    assign n193 = ~\wr_ptr[0]  ;
    always @( posedge clk or posedge n35 )
    begin
             if (n35) \rd_ptr[2]  <= 1'b0;
        else \rd_ptr[2]  <= n52;
    end
    assign n194 = ~\rd_ptr[2]  ;
    always @( posedge clk or posedge n35 )
    begin
             if (n35) \rd_ptr[1]  <= 1'b0;
        else \rd_ptr[1]  <= n53;
    end
    assign n195 = ~\rd_ptr[1]  ;
    always @( posedge clk or posedge n35 )
    begin
             if (n35) \rd_ptr[0]  <= 1'b0;
        else \rd_ptr[0]  <= n54;
    end
    assign n196 = ~\rd_ptr[0]  ;
    assign #1 n38 = (n35 ? 1'b0 : n37);
    always @( posedge clk or posedge n35 )
    begin
             if (n35) \wr_ptr[2]  <= 1'b0;
        else \wr_ptr[2]  <= n43;
    end
    assign n197 = ~\wr_ptr[2]  ;
    assign #1 rd_data[0] = n0 & \mem[3][0] 
         | n3 & \mem[2][0] 
         | n4 & \mem[1][0] 
         | n7 & \mem[0][0] ;
    assign #1 rd_data[1] = n0 & \mem[3][1] 
         | n3 & \mem[2][1] 
         | n4 & \mem[1][1] 
         | n7 & \mem[0][1] ;
    assign #1 rd_data[2] = n0 & \mem[3][2] 
         | n3 & \mem[2][2] 
         | n4 & \mem[1][2] 
         | n7 & \mem[0][2] ;
    assign #1 rd_data[3] = n0 & \mem[3][3] 
         | n3 & \mem[2][3] 
         | n4 & \mem[1][3] 
         | n7 & \mem[0][3] ;
    assign #1 rd_data[4] = n0 & \mem[3][4] 
         | n3 & \mem[2][4] 
         | n4 & \mem[1][4] 
         | n7 & \mem[0][4] ;
    assign #1 rd_data[5] = n0 & \mem[3][5] 
         | n3 & \mem[2][5] 
         | n4 & \mem[1][5] 
         | n7 & \mem[0][5] ;
    assign #1 rd_data[6] = n0 & \mem[3][6] 
         | n3 & \mem[2][6] 
         | n4 & \mem[1][6] 
         | n7 & \mem[0][6] ;
    assign #1 rd_data[7] = n0 & \mem[3][7] 
         | n3 & \mem[2][7] 
         | n4 & \mem[1][7] 
         | n7 & \mem[0][7] ;
    assign #1 rd_data[8] = n0 & \mem[3][8] 
         | n3 & \mem[2][8] 
         | n4 & \mem[1][8] 
         | n7 & \mem[0][8] ;
    assign #1 rd_data[9] = n0 & \mem[3][9] 
         | n3 & \mem[2][9] 
         | n4 & \mem[1][9] 
         | n7 & \mem[0][9] ;
    assign #1 rd_data[10] = n0 & \mem[3][10] 
         | n3 & \mem[2][10] 
         | n4 & \mem[1][10] 
         | n7 & \mem[0][10] ;
    assign #1 rd_data[11] = n0 & \mem[3][11] 
         | n3 & \mem[2][11] 
         | n4 & \mem[1][11] 
         | n7 & \mem[0][11] ;
    assign #1 rd_data[12] = n0 & \mem[3][12] 
         | n3 & \mem[2][12] 
         | n4 & \mem[1][12] 
         | n7 & \mem[0][12] ;
    assign #1 rd_data[13] = n0 & \mem[3][13] 
         | n3 & \mem[2][13] 
         | n4 & \mem[1][13] 
         | n7 & \mem[0][13] ;
    assign #1 rd_data[14] = n0 & \mem[3][14] 
         | n3 & \mem[2][14] 
         | n4 & \mem[1][14] 
         | n7 & \mem[0][14] ;
    assign #1 rd_data[15] = n0 & \mem[3][15] 
         | n3 & \mem[2][15] 
         | n4 & \mem[1][15] 
         | n7 & \mem[0][15] ;
    assign #1 rd_data[16] = n0 & \mem[3][16] 
         | n3 & \mem[2][16] 
         | n4 & \mem[1][16] 
         | n7 & \mem[0][16] ;
    assign #1 rd_data[17] = n0 & \mem[3][17] 
         | n3 & \mem[2][17] 
         | n4 & \mem[1][17] 
         | n7 & \mem[0][17] ;
    assign #1 rd_data[18] = n0 & \mem[3][18] 
         | n3 & \mem[2][18] 
         | n4 & \mem[1][18] 
         | n7 & \mem[0][18] ;
    assign #1 rd_data[19] = n0 & \mem[3][19] 
         | n3 & \mem[2][19] 
         | n4 & \mem[1][19] 
         | n7 & \mem[0][19] ;
    assign #1 rd_data[20] = n0 & \mem[3][20] 
         | n3 & \mem[2][20] 
         | n4 & \mem[1][20] 
         | n7 & \mem[0][20] ;
    assign #1 rd_data[21] = n0 & \mem[3][21] 
         | n3 & \mem[2][21] 
         | n4 & \mem[1][21] 
         | n7 & \mem[0][21] ;
    assign #1 rd_data[22] = n0 & \mem[3][22] 
         | n3 & \mem[2][22] 
         | n4 & \mem[1][22] 
         | n7 & \mem[0][22] ;
    assign #1 rd_data[23] = n0 & \mem[3][23] 
         | n3 & \mem[2][23] 
         | n4 & \mem[1][23] 
         | n7 & \mem[0][23] ;
    assign #1 rd_data[24] = n0 & \mem[3][24] 
         | n3 & \mem[2][24] 
         | n4 & \mem[1][24] 
         | n7 & \mem[0][24] ;
    assign #1 n7 = ~\rd_ptr[0]  & ~\rd_ptr[1]  ;
    assign #1 n4 = \rd_ptr[0]  & ~\rd_ptr[1]  ;
    assign #1 n3 = ~\rd_ptr[0]  & \rd_ptr[1]  ;
    assign #1 n0 = \rd_ptr[0]  & \rd_ptr[1]  ;
    assign #1 n9 = n38 & n8 ;
    assign #1 n11 = n38 & n10 ;
    assign #1 n13 = n38 & n12 ;
    assign #1 n15 = n38 & n14 ;
    assign #1 n14 = ~\wr_ptr[0]  & ~\wr_ptr[1]  ;
    assign #1 n12 = \wr_ptr[0]  & ~\wr_ptr[1]  ;
    assign #1 n10 = ~\wr_ptr[0]  & \wr_ptr[1]  ;
    assign #1 n8 = \wr_ptr[0]  & \wr_ptr[1]  ;
    assign #1 n16 = n15 & wr_data[0] | ~n15 & \mem[0][0]  ;
    assign #1 n17 = n15 & wr_data[1] | ~n15 & \mem[0][1]  ;
    assign #1 n18 = n15 & wr_data[2] | ~n15 & \mem[0][2]  ;
    assign #1 n19 = n15 & wr_data[3] | ~n15 & \mem[0][3]  ;
    assign #1 n20 = n15 & wr_data[4] | ~n15 & \mem[0][4]  ;
    assign #1 n21 = n15 & wr_data[5] | ~n15 & \mem[0][5]  ;
    assign #1 n22 = n15 & wr_data[6] | ~n15 & \mem[0][6]  ;
    assign #1 n23 = n15 & wr_data[7] | ~n15 & \mem[0][7]  ;
    assign #1 n24 = n15 & wr_data[8] | ~n15 & \mem[0][8]  ;
    assign #1 n25 = n15 & wr_data[9] | ~n15 & \mem[0][9]  ;
    assign #1 n26 = n15 & wr_data[10] | ~n15 & \mem[0][10]  ;
    assign #1 n27 = n15 & wr_data[11] | ~n15 & \mem[0][11]  ;
    assign #1 n28 = n15 & wr_data[12] | ~n15 & \mem[0][12]  ;
    assign #1 n29 = n15 & wr_data[13] | ~n15 & \mem[0][13]  ;
    assign #1 n30 = n15 & wr_data[14] | ~n15 & \mem[0][14]  ;
    assign #1 n31 = n15 & wr_data[15] | ~n15 & \mem[0][15]  ;
    assign #1 n32 = n15 & wr_data[16] | ~n15 & \mem[0][16]  ;
    assign #1 n33 = n15 & wr_data[17] | ~n15 & \mem[0][17]  ;
    assign #1 n34 = n15 & wr_data[18] | ~n15 & \mem[0][18]  ;
    assign #1 n39 = n15 & wr_data[19] | ~n15 & \mem[0][19]  ;
    assign #1 n48 = n15 & wr_data[20] | ~n15 & \mem[0][20]  ;
    assign #1 n55 = n15 & wr_data[21] | ~n15 & \mem[0][21]  ;
    assign #1 n56 = n15 & wr_data[22] | ~n15 & \mem[0][22]  ;
    assign #1 n57 = n15 & wr_data[23] | ~n15 & \mem[0][23]  ;
    assign #1 n58 = n15 & wr_data[24] | ~n15 & \mem[0][24]  ;
    assign #1 n59 = n13 & wr_data[0] | ~n13 & \mem[1][0]  ;
    assign #1 n60 = n13 & wr_data[1] | ~n13 & \mem[1][1]  ;
    assign #1 n61 = n13 & wr_data[2] | ~n13 & \mem[1][2]  ;
    assign #1 n62 = n13 & wr_data[3] | ~n13 & \mem[1][3]  ;
    assign #1 n63 = n13 & wr_data[4] | ~n13 & \mem[1][4]  ;
    assign #1 n64 = n13 & wr_data[5] | ~n13 & \mem[1][5]  ;
    assign #1 n65 = n13 & wr_data[6] | ~n13 & \mem[1][6]  ;
    assign #1 n66 = n13 & wr_data[7] | ~n13 & \mem[1][7]  ;
    assign #1 n67 = n13 & wr_data[8] | ~n13 & \mem[1][8]  ;
    assign #1 n68 = n13 & wr_data[9] | ~n13 & \mem[1][9]  ;
    assign #1 n69 = n13 & wr_data[10] | ~n13 & \mem[1][10]  ;
    assign #1 n70 = n13 & wr_data[11] | ~n13 & \mem[1][11]  ;
    assign #1 n71 = n13 & wr_data[12] | ~n13 & \mem[1][12]  ;
    assign #1 n72 = n13 & wr_data[13] | ~n13 & \mem[1][13]  ;
    assign #1 n73 = n13 & wr_data[14] | ~n13 & \mem[1][14]  ;
    assign #1 n74 = n13 & wr_data[15] | ~n13 & \mem[1][15]  ;
    assign #1 n75 = n13 & wr_data[16] | ~n13 & \mem[1][16]  ;
    assign #1 n76 = n13 & wr_data[17] | ~n13 & \mem[1][17]  ;
    assign #1 n77 = n13 & wr_data[18] | ~n13 & \mem[1][18]  ;
    assign #1 n78 = n13 & wr_data[19] | ~n13 & \mem[1][19]  ;
    assign #1 n79 = n13 & wr_data[20] | ~n13 & \mem[1][20]  ;
    assign #1 n80 = n13 & wr_data[21] | ~n13 & \mem[1][21]  ;
    assign #1 n81 = n13 & wr_data[22] | ~n13 & \mem[1][22]  ;
    assign #1 n82 = n13 & wr_data[23] | ~n13 & \mem[1][23]  ;
    assign #1 n83 = n13 & wr_data[24] | ~n13 & \mem[1][24]  ;
    assign #1 n84 = n11 & wr_data[0] | ~n11 & \mem[2][0]  ;
    assign #1 n85 = n11 & wr_data[1] | ~n11 & \mem[2][1]  ;
    assign #1 n86 = n11 & wr_data[2] | ~n11 & \mem[2][2]  ;
    assign #1 n87 = n11 & wr_data[3] | ~n11 & \mem[2][3]  ;
    assign #1 n88 = n11 & wr_data[4] | ~n11 & \mem[2][4]  ;
    assign #1 n89 = n11 & wr_data[5] | ~n11 & \mem[2][5]  ;
    assign #1 n90 = n11 & wr_data[6] | ~n11 & \mem[2][6]  ;
    assign #1 n91 = n11 & wr_data[7] | ~n11 & \mem[2][7]  ;
    assign #1 n92 = n11 & wr_data[8] | ~n11 & \mem[2][8]  ;
    assign #1 n93 = n11 & wr_data[9] | ~n11 & \mem[2][9]  ;
    assign #1 n94 = n11 & wr_data[10] | ~n11 & \mem[2][10]  ;
    assign #1 n95 = n11 & wr_data[11] | ~n11 & \mem[2][11]  ;
    assign #1 n96 = n11 & wr_data[12] | ~n11 & \mem[2][12]  ;
    assign #1 n97 = n11 & wr_data[13] | ~n11 & \mem[2][13]  ;
    assign #1 n98 = n11 & wr_data[14] | ~n11 & \mem[2][14]  ;
    assign #1 n99 = n11 & wr_data[15] | ~n11 & \mem[2][15]  ;
    assign #1 n100 = n11 & wr_data[16] | ~n11 & \mem[2][16]  ;
    assign #1 n101 = n11 & wr_data[17] | ~n11 & \mem[2][17]  ;
    assign #1 n102 = n11 & wr_data[18] | ~n11 & \mem[2][18]  ;
    assign #1 n103 = n11 & wr_data[19] | ~n11 & \mem[2][19]  ;
    assign #1 n104 = n11 & wr_data[20] | ~n11 & \mem[2][20]  ;
    assign #1 n105 = n11 & wr_data[21] | ~n11 & \mem[2][21]  ;
    assign #1 n106 = n11 & wr_data[22] | ~n11 & \mem[2][22]  ;
    assign #1 n107 = n11 & wr_data[23] | ~n11 & \mem[2][23]  ;
    assign #1 n108 = n11 & wr_data[24] | ~n11 & \mem[2][24]  ;
    assign #1 n109 = n9 & wr_data[0] | ~n9 & \mem[3][0]  ;
    assign #1 n110 = n9 & wr_data[1] | ~n9 & \mem[3][1]  ;
    assign #1 n111 = n9 & wr_data[2] | ~n9 & \mem[3][2]  ;
    assign #1 n112 = n9 & wr_data[3] | ~n9 & \mem[3][3]  ;
    assign #1 n113 = n9 & wr_data[4] | ~n9 & \mem[3][4]  ;
    assign #1 n114 = n9 & wr_data[5] | ~n9 & \mem[3][5]  ;
    assign #1 n115 = n9 & wr_data[6] | ~n9 & \mem[3][6]  ;
    assign #1 n116 = n9 & wr_data[7] | ~n9 & \mem[3][7]  ;
    assign #1 n117 = n9 & wr_data[8] | ~n9 & \mem[3][8]  ;
    assign #1 n118 = n9 & wr_data[9] | ~n9 & \mem[3][9]  ;
    assign #1 n119 = n9 & wr_data[10] | ~n9 & \mem[3][10]  ;
    assign #1 n120 = n9 & wr_data[11] | ~n9 & \mem[3][11]  ;
    assign #1 n121 = n9 & wr_data[12] | ~n9 & \mem[3][12]  ;
    assign #1 n122 = n9 & wr_data[13] | ~n9 & \mem[3][13]  ;
    assign #1 n123 = n9 & wr_data[14] | ~n9 & \mem[3][14]  ;
    assign #1 n124 = n9 & wr_data[15] | ~n9 & \mem[3][15]  ;
    assign #1 n125 = n9 & wr_data[16] | ~n9 & \mem[3][16]  ;
    assign #1 n126 = n9 & wr_data[17] | ~n9 & \mem[3][17]  ;
    assign #1 n127 = n9 & wr_data[18] | ~n9 & \mem[3][18]  ;
    assign #1 n128 = n9 & wr_data[19] | ~n9 & \mem[3][19]  ;
    assign #1 n129 = n9 & wr_data[20] | ~n9 & \mem[3][20]  ;
    assign #1 n130 = n9 & wr_data[21] | ~n9 & \mem[3][21]  ;
    assign #1 n131 = n9 & wr_data[22] | ~n9 & \mem[3][22]  ;
    assign #1 n132 = n9 & wr_data[23] | ~n9 & \mem[3][23]  ;
    assign #1 n133 = n9 & wr_data[24] | ~n9 & \mem[3][24]  ;
    always @( posedge clk )
    begin
        \mem[3][0]  <= n109;
    end
    assign n198 = ~\mem[3][0]  ;
    always @( posedge clk )
    begin
        \mem[3][1]  <= n110;
    end
    assign n199 = ~\mem[3][1]  ;
    always @( posedge clk )
    begin
        \mem[3][2]  <= n111;
    end
    assign n200 = ~\mem[3][2]  ;
    always @( posedge clk )
    begin
        \mem[3][3]  <= n112;
    end
    assign n201 = ~\mem[3][3]  ;
    always @( posedge clk )
    begin
        \mem[3][4]  <= n113;
    end
    assign n202 = ~\mem[3][4]  ;
    always @( posedge clk )
    begin
        \mem[3][5]  <= n114;
    end
    assign n203 = ~\mem[3][5]  ;
    always @( posedge clk )
    begin
        \mem[3][6]  <= n115;
    end
    assign n204 = ~\mem[3][6]  ;
    always @( posedge clk )
    begin
        \mem[3][7]  <= n116;
    end
    assign n205 = ~\mem[3][7]  ;
    always @( posedge clk )
    begin
        \mem[3][8]  <= n117;
    end
    assign n206 = ~\mem[3][8]  ;
    always @( posedge clk )
    begin
        \mem[3][9]  <= n118;
    end
    assign n207 = ~\mem[3][9]  ;
    always @( posedge clk )
    begin
        \mem[3][10]  <= n119;
    end
    assign n208 = ~\mem[3][10]  ;
    always @( posedge clk )
    begin
        \mem[3][11]  <= n120;
    end
    assign n209 = ~\mem[3][11]  ;
    always @( posedge clk )
    begin
        \mem[3][12]  <= n121;
    end
    assign n210 = ~\mem[3][12]  ;
    always @( posedge clk )
    begin
        \mem[3][13]  <= n122;
    end
    assign n211 = ~\mem[3][13]  ;
    always @( posedge clk )
    begin
        \mem[3][14]  <= n123;
    end
    assign n212 = ~\mem[3][14]  ;
    always @( posedge clk )
    begin
        \mem[3][15]  <= n124;
    end
    assign n213 = ~\mem[3][15]  ;
    always @( posedge clk )
    begin
        \mem[3][16]  <= n125;
    end
    assign n214 = ~\mem[3][16]  ;
    always @( posedge clk )
    begin
        \mem[3][17]  <= n126;
    end
    assign n215 = ~\mem[3][17]  ;
    always @( posedge clk )
    begin
        \mem[3][18]  <= n127;
    end
    assign n216 = ~\mem[3][18]  ;
    always @( posedge clk )
    begin
        \mem[3][19]  <= n128;
    end
    assign n217 = ~\mem[3][19]  ;
    always @( posedge clk )
    begin
        \mem[3][20]  <= n129;
    end
    assign n218 = ~\mem[3][20]  ;
    always @( posedge clk )
    begin
        \mem[3][21]  <= n130;
    end
    assign n219 = ~\mem[3][21]  ;
    always @( posedge clk )
    begin
        \mem[3][22]  <= n131;
    end
    assign n220 = ~\mem[3][22]  ;
    always @( posedge clk )
    begin
        \mem[3][23]  <= n132;
    end
    assign n221 = ~\mem[3][23]  ;
    always @( posedge clk )
    begin
        \mem[3][24]  <= n133;
    end
    assign n222 = ~\mem[3][24]  ;
    always @( posedge clk )
    begin
        \mem[2][0]  <= n84;
    end
    assign n223 = ~\mem[2][0]  ;
    always @( posedge clk )
    begin
        \mem[2][1]  <= n85;
    end
    assign n224 = ~\mem[2][1]  ;
    always @( posedge clk )
    begin
        \mem[2][2]  <= n86;
    end
    assign n225 = ~\mem[2][2]  ;
    always @( posedge clk )
    begin
        \mem[2][3]  <= n87;
    end
    assign n226 = ~\mem[2][3]  ;
    always @( posedge clk )
    begin
        \mem[2][4]  <= n88;
    end
    assign n227 = ~\mem[2][4]  ;
    always @( posedge clk )
    begin
        \mem[2][5]  <= n89;
    end
    assign n228 = ~\mem[2][5]  ;
    always @( posedge clk )
    begin
        \mem[2][6]  <= n90;
    end
    assign n229 = ~\mem[2][6]  ;
    always @( posedge clk )
    begin
        \mem[2][7]  <= n91;
    end
    assign n230 = ~\mem[2][7]  ;
    always @( posedge clk )
    begin
        \mem[2][8]  <= n92;
    end
    assign n231 = ~\mem[2][8]  ;
    always @( posedge clk )
    begin
        \mem[2][9]  <= n93;
    end
    assign n232 = ~\mem[2][9]  ;
    always @( posedge clk )
    begin
        \mem[2][10]  <= n94;
    end
    assign n233 = ~\mem[2][10]  ;
    always @( posedge clk )
    begin
        \mem[2][11]  <= n95;
    end
    assign n234 = ~\mem[2][11]  ;
    always @( posedge clk )
    begin
        \mem[2][12]  <= n96;
    end
    assign n235 = ~\mem[2][12]  ;
    always @( posedge clk )
    begin
        \mem[2][13]  <= n97;
    end
    assign n236 = ~\mem[2][13]  ;
    always @( posedge clk )
    begin
        \mem[2][14]  <= n98;
    end
    assign n237 = ~\mem[2][14]  ;
    always @( posedge clk )
    begin
        \mem[2][15]  <= n99;
    end
    assign n238 = ~\mem[2][15]  ;
    always @( posedge clk )
    begin
        \mem[2][16]  <= n100;
    end
    assign n239 = ~\mem[2][16]  ;
    always @( posedge clk )
    begin
        \mem[2][17]  <= n101;
    end
    assign n240 = ~\mem[2][17]  ;
    always @( posedge clk )
    begin
        \mem[2][18]  <= n102;
    end
    assign n241 = ~\mem[2][18]  ;
    always @( posedge clk )
    begin
        \mem[2][19]  <= n103;
    end
    assign n242 = ~\mem[2][19]  ;
    always @( posedge clk )
    begin
        \mem[2][20]  <= n104;
    end
    assign n243 = ~\mem[2][20]  ;
    always @( posedge clk )
    begin
        \mem[2][21]  <= n105;
    end
    assign n244 = ~\mem[2][21]  ;
    always @( posedge clk )
    begin
        \mem[2][22]  <= n106;
    end
    assign n245 = ~\mem[2][22]  ;
    always @( posedge clk )
    begin
        \mem[2][23]  <= n107;
    end
    assign n246 = ~\mem[2][23]  ;
    always @( posedge clk )
    begin
        \mem[2][24]  <= n108;
    end
    assign n247 = ~\mem[2][24]  ;
    always @( posedge clk )
    begin
        \mem[1][0]  <= n59;
    end
    assign n248 = ~\mem[1][0]  ;
    always @( posedge clk )
    begin
        \mem[1][1]  <= n60;
    end
    assign n249 = ~\mem[1][1]  ;
    always @( posedge clk )
    begin
        \mem[1][2]  <= n61;
    end
    assign n250 = ~\mem[1][2]  ;
    always @( posedge clk )
    begin
        \mem[1][3]  <= n62;
    end
    assign n251 = ~\mem[1][3]  ;
    always @( posedge clk )
    begin
        \mem[1][4]  <= n63;
    end
    assign n252 = ~\mem[1][4]  ;
    always @( posedge clk )
    begin
        \mem[1][5]  <= n64;
    end
    assign n253 = ~\mem[1][5]  ;
    always @( posedge clk )
    begin
        \mem[1][6]  <= n65;
    end
    assign n254 = ~\mem[1][6]  ;
    always @( posedge clk )
    begin
        \mem[1][7]  <= n66;
    end
    assign n255 = ~\mem[1][7]  ;
    always @( posedge clk )
    begin
        \mem[1][8]  <= n67;
    end
    assign n256 = ~\mem[1][8]  ;
    always @( posedge clk )
    begin
        \mem[1][9]  <= n68;
    end
    assign n257 = ~\mem[1][9]  ;
    always @( posedge clk )
    begin
        \mem[1][10]  <= n69;
    end
    assign n258 = ~\mem[1][10]  ;
    always @( posedge clk )
    begin
        \mem[1][11]  <= n70;
    end
    assign n259 = ~\mem[1][11]  ;
    always @( posedge clk )
    begin
        \mem[1][12]  <= n71;
    end
    assign n260 = ~\mem[1][12]  ;
    always @( posedge clk )
    begin
        \mem[1][13]  <= n72;
    end
    assign n261 = ~\mem[1][13]  ;
    always @( posedge clk )
    begin
        \mem[1][14]  <= n73;
    end
    assign n262 = ~\mem[1][14]  ;
    always @( posedge clk )
    begin
        \mem[1][15]  <= n74;
    end
    assign n263 = ~\mem[1][15]  ;
    always @( posedge clk )
    begin
        \mem[1][16]  <= n75;
    end
    assign n264 = ~\mem[1][16]  ;
    always @( posedge clk )
    begin
        \mem[1][17]  <= n76;
    end
    assign n265 = ~\mem[1][17]  ;
    always @( posedge clk )
    begin
        \mem[1][18]  <= n77;
    end
    assign n266 = ~\mem[1][18]  ;
    always @( posedge clk )
    begin
        \mem[1][19]  <= n78;
    end
    assign n267 = ~\mem[1][19]  ;
    always @( posedge clk )
    begin
        \mem[1][20]  <= n79;
    end
    assign n268 = ~\mem[1][20]  ;
    always @( posedge clk )
    begin
        \mem[1][21]  <= n80;
    end
    assign n269 = ~\mem[1][21]  ;
    always @( posedge clk )
    begin
        \mem[1][22]  <= n81;
    end
    assign n270 = ~\mem[1][22]  ;
    always @( posedge clk )
    begin
        \mem[1][23]  <= n82;
    end
    assign n271 = ~\mem[1][23]  ;
    always @( posedge clk )
    begin
        \mem[1][24]  <= n83;
    end
    assign n272 = ~\mem[1][24]  ;
    always @( posedge clk )
    begin
        \mem[0][0]  <= n16;
    end
    assign n273 = ~\mem[0][0]  ;
    always @( posedge clk )
    begin
        \mem[0][1]  <= n17;
    end
    assign n274 = ~\mem[0][1]  ;
    always @( posedge clk )
    begin
        \mem[0][2]  <= n18;
    end
    assign n275 = ~\mem[0][2]  ;
    always @( posedge clk )
    begin
        \mem[0][3]  <= n19;
    end
    assign n276 = ~\mem[0][3]  ;
    always @( posedge clk )
    begin
        \mem[0][4]  <= n20;
    end
    assign n277 = ~\mem[0][4]  ;
    always @( posedge clk )
    begin
        \mem[0][5]  <= n21;
    end
    assign n278 = ~\mem[0][5]  ;
    always @( posedge clk )
    begin
        \mem[0][6]  <= n22;
    end
    assign n279 = ~\mem[0][6]  ;
    always @( posedge clk )
    begin
        \mem[0][7]  <= n23;
    end
    assign n280 = ~\mem[0][7]  ;
    always @( posedge clk )
    begin
        \mem[0][8]  <= n24;
    end
    assign n281 = ~\mem[0][8]  ;
    always @( posedge clk )
    begin
        \mem[0][9]  <= n25;
    end
    assign n282 = ~\mem[0][9]  ;
    always @( posedge clk )
    begin
        \mem[0][10]  <= n26;
    end
    assign n283 = ~\mem[0][10]  ;
    always @( posedge clk )
    begin
        \mem[0][11]  <= n27;
    end
    assign n284 = ~\mem[0][11]  ;
    always @( posedge clk )
    begin
        \mem[0][12]  <= n28;
    end
    assign n285 = ~\mem[0][12]  ;
    always @( posedge clk )
    begin
        \mem[0][13]  <= n29;
    end
    assign n286 = ~\mem[0][13]  ;
    always @( posedge clk )
    begin
        \mem[0][14]  <= n30;
    end
    assign n287 = ~\mem[0][14]  ;
    always @( posedge clk )
    begin
        \mem[0][15]  <= n31;
    end
    assign n288 = ~\mem[0][15]  ;
    always @( posedge clk )
    begin
        \mem[0][16]  <= n32;
    end
    assign n289 = ~\mem[0][16]  ;
    always @( posedge clk )
    begin
        \mem[0][17]  <= n33;
    end
    assign n290 = ~\mem[0][17]  ;
    always @( posedge clk )
    begin
        \mem[0][18]  <= n34;
    end
    assign n291 = ~\mem[0][18]  ;
    always @( posedge clk )
    begin
        \mem[0][19]  <= n39;
    end
    assign n292 = ~\mem[0][19]  ;
    always @( posedge clk )
    begin
        \mem[0][20]  <= n48;
    end
    assign n293 = ~\mem[0][20]  ;
    always @( posedge clk )
    begin
        \mem[0][21]  <= n55;
    end
    assign n294 = ~\mem[0][21]  ;
    always @( posedge clk )
    begin
        \mem[0][22]  <= n56;
    end
    assign n295 = ~\mem[0][22]  ;
    always @( posedge clk )
    begin
        \mem[0][23]  <= n57;
    end
    assign n296 = ~\mem[0][23]  ;
    always @( posedge clk )
    begin
        \mem[0][24]  <= n58;
    end
    assign n297 = ~\mem[0][24]  ;

endmodule

module spi_tx(clk, rst_n, fifo_empty, tx_data, tx_carry, fifo_pop, sum_out,
     out_ready, carry_out);
input clk, rst_n, fifo_empty, tx_carry;
output fifo_pop, sum_out, out_ready, carry_out;
input  [23:0] tx_data;
reg fifo_pop, out_ready, carry_out, sum_out, \shift_reg[22] , \shift_reg[21] ,
     \shift_reg[20] , \shift_reg[19] , \shift_reg[18] , \shift_reg[17] ,
     \shift_reg[16] , \shift_reg[15] , \shift_reg[14] , \shift_reg[13] ,
     \shift_reg[12] , \shift_reg[11] , \shift_reg[10] , \shift_reg[9] ,
     \shift_reg[8] , \shift_reg[7] , \shift_reg[6] , \shift_reg[5] ,
     \shift_reg[4] , \shift_reg[3] , \shift_reg[2] , \shift_reg[1] ,
     \shift_reg[0] , \out_cnt[4] , \out_cnt[3] , \out_cnt[2] , \out_cnt[1] ,
     \out_cnt[0] ;
wire n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21,
     n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36,
     n37, n38, n39, n40, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52,
     n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67,
     n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82,
     n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97,
     n98, n99, n100, n101, n102, n103, n104, n105, n106, n107, n108, n136, n137,
     n138, n139, n140, n141, n142, n143, n144, n145, n146, n147, n148, n149,
     n150, n151, n152, n153, n154, n155, n156, n157, n158, n159, n160, n161,
     n162, n163, n164, n165, n166, n167, n168, n169;
    assign #1 n6 = ~rst_n ;
    assign #1 n7 = ~out_ready ;
    assign #1 n8 = ~fifo_empty ;
    assign #1 n9 = (n8 ? tx_data[23] : sum_out);
    assign #1 n10 = (n8 ? tx_data[22] : \shift_reg[22] );
    assign #1 n11 = (n8 ? tx_data[21] : \shift_reg[21] );
    assign #1 n12 = (n8 ? tx_data[20] : \shift_reg[20] );
    assign #1 n13 = (n8 ? tx_data[19] : \shift_reg[19] );
    assign #1 n14 = (n8 ? tx_data[18] : \shift_reg[18] );
    assign #1 n15 = (n8 ? tx_data[17] : \shift_reg[17] );
    assign #1 n16 = (n8 ? tx_data[16] : \shift_reg[16] );
    assign #1 n17 = (n8 ? tx_data[15] : \shift_reg[15] );
    assign #1 n18 = (n8 ? tx_data[14] : \shift_reg[14] );
    assign #1 n19 = (n8 ? tx_data[13] : \shift_reg[13] );
    assign #1 n20 = (n8 ? tx_data[12] : \shift_reg[12] );
    assign #1 n21 = (n8 ? tx_data[11] : \shift_reg[11] );
    assign #1 n22 = (n8 ? tx_data[10] : \shift_reg[10] );
    assign #1 n23 = (n8 ? tx_data[9] : \shift_reg[9] );
    assign #1 n24 = (n8 ? tx_data[8] : \shift_reg[8] );
    assign #1 n25 = (n8 ? tx_data[7] : \shift_reg[7] );
    assign #1 n26 = (n8 ? tx_data[6] : \shift_reg[6] );
    assign #1 n27 = (n8 ? tx_data[5] : \shift_reg[5] );
    assign #1 n28 = (n8 ? tx_data[4] : \shift_reg[4] );
    assign #1 n29 = (n8 ? tx_data[3] : \shift_reg[3] );
    assign #1 n30 = (n8 ? tx_data[2] : \shift_reg[2] );
    assign #1 n31 = (n8 ? tx_data[1] : \shift_reg[1] );
    assign #1 n32 = (n8 ? tx_data[0] : \shift_reg[0] );
    assign #1 n33 = (n8 ? tx_carry : carry_out);
    assign #1 n34 = (n8 ? 1'b1 : \out_cnt[4] );
    assign #1 n35 = (n8 ? 1'b0 : \out_cnt[3] );
    assign #1 n36 = (n8 ? 1'b1 : \out_cnt[2] );
    assign #1 n37 = (n8 ? 1'b1 : \out_cnt[1] );
    assign #1 n38 = (n8 ? 1'b1 : \out_cnt[0] );
    assign #1 n39 = (n8 ? 1'b1 : out_ready);
    assign #1 n40 = ((({\out_cnt[4] , \out_cnt[3] , \out_cnt[2] , \out_cnt[1] , \out_cnt[0] } >  {1'b0, 1'b0, 1'b0, 1'b0, 1'b0} ) & (~1'b0 | 1'b0 & ~(\out_cnt[4]  & ~1'b0 )) | (1'b0 & ~\out_cnt[4]  & 1'b0 )) ? 1'b1:1'b0);
    assign #1 n136 = ((({\out_cnt[4] , \out_cnt[3] , \out_cnt[2] , \out_cnt[1] , \out_cnt[0] } >= {1'b0, 1'b0, 1'b0, 1'b0, 1'b0} ) & (~1'b0 | 1'b0 & ~(\out_cnt[4]  & ~1'b0 )) | (1'b0 & ~\out_cnt[4]  & 1'b0 )) ? 1'b1:1'b0);
    assign #1 {n137, n42, n43, n44, n45, n46} = {\out_cnt[4] , \out_cnt[3] ,
        \out_cnt[2] , \out_cnt[1] , \out_cnt[0] } + {1'b1, 1'b1, 1'b1, 1'b1,
        1'b0} + 1'b1;
    assign #1 n47 = (n40 ? \shift_reg[22]  : sum_out);
    assign #1 n48 = (n40 ? \shift_reg[21]  : \shift_reg[22] );
    assign #1 n49 = (n40 ? \shift_reg[20]  : \shift_reg[21] );
    assign #1 n50 = (n40 ? \shift_reg[19]  : \shift_reg[20] );
    assign #1 n51 = (n40 ? \shift_reg[18]  : \shift_reg[19] );
    assign #1 n52 = (n40 ? \shift_reg[17]  : \shift_reg[18] );
    assign #1 n53 = (n40 ? \shift_reg[16]  : \shift_reg[17] );
    assign #1 n54 = (n40 ? \shift_reg[15]  : \shift_reg[16] );
    assign #1 n55 = (n40 ? \shift_reg[14]  : \shift_reg[15] );
    assign #1 n56 = (n40 ? \shift_reg[13]  : \shift_reg[14] );
    assign #1 n57 = (n40 ? \shift_reg[12]  : \shift_reg[13] );
    assign #1 n58 = (n40 ? \shift_reg[11]  : \shift_reg[12] );
    assign #1 n59 = (n40 ? \shift_reg[10]  : \shift_reg[11] );
    assign #1 n60 = (n40 ? \shift_reg[9]  : \shift_reg[10] );
    assign #1 n61 = (n40 ? \shift_reg[8]  : \shift_reg[9] );
    assign #1 n62 = (n40 ? \shift_reg[7]  : \shift_reg[8] );
    assign #1 n63 = (n40 ? \shift_reg[6]  : \shift_reg[7] );
    assign #1 n64 = (n40 ? \shift_reg[5]  : \shift_reg[6] );
    assign #1 n65 = (n40 ? \shift_reg[4]  : \shift_reg[5] );
    assign #1 n66 = (n40 ? \shift_reg[3]  : \shift_reg[4] );
    assign #1 n67 = (n40 ? \shift_reg[2]  : \shift_reg[3] );
    assign #1 n68 = (n40 ? \shift_reg[1]  : \shift_reg[2] );
    assign #1 n69 = (n40 ? \shift_reg[0]  : \shift_reg[1] );
    assign #1 n70 = (n40 ? 1'b0 : \shift_reg[0] );
    assign #1 n71 = (n40 ? n42 : \out_cnt[4] );
    assign #1 n72 = (n40 ? n43 : \out_cnt[3] );
    assign #1 n73 = (n40 ? n44 : \out_cnt[2] );
    assign #1 n74 = (n40 ? n45 : \out_cnt[1] );
    assign #1 n75 = (n40 ? n46 : \out_cnt[0] );
    assign #1 n76 = (n40 ? out_ready : 1'b0);
    assign #1 n77 = (n7 ? n9 : n47);
    assign #1 n78 = (n7 ? n10 : n48);
    assign #1 n79 = (n7 ? n11 : n49);
    assign #1 n80 = (n7 ? n12 : n50);
    assign #1 n81 = (n7 ? n13 : n51);
    assign #1 n82 = (n7 ? n14 : n52);
    assign #1 n83 = (n7 ? n15 : n53);
    assign #1 n84 = (n7 ? n16 : n54);
    assign #1 n85 = (n7 ? n17 : n55);
    assign #1 n86 = (n7 ? n18 : n56);
    assign #1 n87 = (n7 ? n19 : n57);
    assign #1 n88 = (n7 ? n20 : n58);
    assign #1 n89 = (n7 ? n21 : n59);
    assign #1 n90 = (n7 ? n22 : n60);
    assign #1 n91 = (n7 ? n23 : n61);
    assign #1 n92 = (n7 ? n24 : n62);
    assign #1 n93 = (n7 ? n25 : n63);
    assign #1 n94 = (n7 ? n26 : n64);
    assign #1 n95 = (n7 ? n27 : n65);
    assign #1 n96 = (n7 ? n28 : n66);
    assign #1 n97 = (n7 ? n29 : n67);
    assign #1 n98 = (n7 ? n30 : n68);
    assign #1 n99 = (n7 ? n31 : n69);
    assign #1 n100 = (n7 ? n32 : n70);
    assign #1 n101 = (n7 ? n33 : carry_out);
    assign #1 n102 = (n7 ? n34 : n71);
    assign #1 n103 = (n7 ? n35 : n72);
    assign #1 n104 = (n7 ? n36 : n73);
    assign #1 n105 = (n7 ? n37 : n74);
    assign #1 n106 = (n7 ? n38 : n75);
    assign #1 n107 = (n7 ? n39 : n76);
    assign #1 n108 = (n7 ? n8 : 1'b0);
    always @( posedge clk or posedge n6 )
    begin
             if (n6) \shift_reg[22]  <= 1'b0;
        else \shift_reg[22]  <= n78;
    end
    assign n138 = ~\shift_reg[22]  ;
    always @( posedge clk or posedge n6 )
    begin
             if (n6) \shift_reg[21]  <= 1'b0;
        else \shift_reg[21]  <= n79;
    end
    assign n139 = ~\shift_reg[21]  ;
    always @( posedge clk or posedge n6 )
    begin
             if (n6) \shift_reg[20]  <= 1'b0;
        else \shift_reg[20]  <= n80;
    end
    assign n140 = ~\shift_reg[20]  ;
    always @( posedge clk or posedge n6 )
    begin
             if (n6) \shift_reg[19]  <= 1'b0;
        else \shift_reg[19]  <= n81;
    end
    assign n141 = ~\shift_reg[19]  ;
    always @( posedge clk or posedge n6 )
    begin
             if (n6) \shift_reg[18]  <= 1'b0;
        else \shift_reg[18]  <= n82;
    end
    assign n142 = ~\shift_reg[18]  ;
    always @( posedge clk or posedge n6 )
    begin
             if (n6) \shift_reg[17]  <= 1'b0;
        else \shift_reg[17]  <= n83;
    end
    assign n143 = ~\shift_reg[17]  ;
    always @( posedge clk or posedge n6 )
    begin
             if (n6) \shift_reg[16]  <= 1'b0;
        else \shift_reg[16]  <= n84;
    end
    assign n144 = ~\shift_reg[16]  ;
    always @( posedge clk or posedge n6 )
    begin
             if (n6) \shift_reg[15]  <= 1'b0;
        else \shift_reg[15]  <= n85;
    end
    assign n145 = ~\shift_reg[15]  ;
    always @( posedge clk or posedge n6 )
    begin
             if (n6) \shift_reg[14]  <= 1'b0;
        else \shift_reg[14]  <= n86;
    end
    assign n146 = ~\shift_reg[14]  ;
    always @( posedge clk or posedge n6 )
    begin
             if (n6) \shift_reg[13]  <= 1'b0;
        else \shift_reg[13]  <= n87;
    end
    assign n147 = ~\shift_reg[13]  ;
    always @( posedge clk or posedge n6 )
    begin
             if (n6) \shift_reg[12]  <= 1'b0;
        else \shift_reg[12]  <= n88;
    end
    assign n148 = ~\shift_reg[12]  ;
    always @( posedge clk or posedge n6 )
    begin
             if (n6) \shift_reg[11]  <= 1'b0;
        else \shift_reg[11]  <= n89;
    end
    assign n149 = ~\shift_reg[11]  ;
    always @( posedge clk or posedge n6 )
    begin
             if (n6) \shift_reg[10]  <= 1'b0;
        else \shift_reg[10]  <= n90;
    end
    assign n150 = ~\shift_reg[10]  ;
    always @( posedge clk or posedge n6 )
    begin
             if (n6) \shift_reg[9]  <= 1'b0;
        else \shift_reg[9]  <= n91;
    end
    assign n151 = ~\shift_reg[9]  ;
    always @( posedge clk or posedge n6 )
    begin
             if (n6) \shift_reg[8]  <= 1'b0;
        else \shift_reg[8]  <= n92;
    end
    assign n152 = ~\shift_reg[8]  ;
    always @( posedge clk or posedge n6 )
    begin
             if (n6) \shift_reg[7]  <= 1'b0;
        else \shift_reg[7]  <= n93;
    end
    assign n153 = ~\shift_reg[7]  ;
    always @( posedge clk or posedge n6 )
    begin
             if (n6) \shift_reg[6]  <= 1'b0;
        else \shift_reg[6]  <= n94;
    end
    assign n154 = ~\shift_reg[6]  ;
    always @( posedge clk or posedge n6 )
    begin
             if (n6) \shift_reg[5]  <= 1'b0;
        else \shift_reg[5]  <= n95;
    end
    assign n155 = ~\shift_reg[5]  ;
    always @( posedge clk or posedge n6 )
    begin
             if (n6) \shift_reg[4]  <= 1'b0;
        else \shift_reg[4]  <= n96;
    end
    assign n156 = ~\shift_reg[4]  ;
    always @( posedge clk or posedge n6 )
    begin
             if (n6) \shift_reg[3]  <= 1'b0;
        else \shift_reg[3]  <= n97;
    end
    assign n157 = ~\shift_reg[3]  ;
    always @( posedge clk or posedge n6 )
    begin
             if (n6) \shift_reg[2]  <= 1'b0;
        else \shift_reg[2]  <= n98;
    end
    assign n158 = ~\shift_reg[2]  ;
    always @( posedge clk or posedge n6 )
    begin
             if (n6) \shift_reg[1]  <= 1'b0;
        else \shift_reg[1]  <= n99;
    end
    assign n159 = ~\shift_reg[1]  ;
    always @( posedge clk or posedge n6 )
    begin
             if (n6) \shift_reg[0]  <= 1'b0;
        else \shift_reg[0]  <= n100;
    end
    assign n160 = ~\shift_reg[0]  ;
    always @( posedge clk or posedge n6 )
    begin
             if (n6) \out_cnt[4]  <= 1'b0;
        else \out_cnt[4]  <= n102;
    end
    assign n161 = ~\out_cnt[4]  ;
    always @( posedge clk or posedge n6 )
    begin
             if (n6) \out_cnt[3]  <= 1'b0;
        else \out_cnt[3]  <= n103;
    end
    assign n162 = ~\out_cnt[3]  ;
    always @( posedge clk or posedge n6 )
    begin
             if (n6) \out_cnt[2]  <= 1'b0;
        else \out_cnt[2]  <= n104;
    end
    assign n163 = ~\out_cnt[2]  ;
    always @( posedge clk or posedge n6 )
    begin
             if (n6) \out_cnt[1]  <= 1'b0;
        else \out_cnt[1]  <= n105;
    end
    assign n164 = ~\out_cnt[1]  ;
    always @( posedge clk or posedge n6 )
    begin
             if (n6) \out_cnt[0]  <= 1'b0;
        else \out_cnt[0]  <= n106;
    end
    assign n165 = ~\out_cnt[0]  ;
    always @( posedge clk or posedge n6 )
    begin
             if (n6) out_ready <= 1'b0;
        else out_ready <= n107;
    end
    assign n166 = ~out_ready ;
    always @( posedge clk or posedge n6 )
    begin
             if (n6) fifo_pop <= 1'b0;
        else fifo_pop <= n108;
    end
    assign n167 = ~fifo_pop ;
    always @( posedge clk or posedge n6 )
    begin
             if (n6) carry_out <= 1'b0;
        else carry_out <= n101;
    end
    assign n168 = ~carry_out ;
    always @( posedge clk or posedge n6 )
    begin
             if (n6) sum_out <= 1'b0;
        else sum_out <= n77;
    end
    assign n169 = ~sum_out ;

endmodule

module mac16(clk, rst_n, in_ready, mode, inA, inB, sum_out, out_ready, carry);
input clk, rst_n, in_ready, mode, inA, inB;
output sum_out, out_ready, carry;
reg mode_d1, mode_d2;
wire mode_toggle, sys_rst_n, \rx_data_A[15] , \rx_data_A[14] , \rx_data_A[13] ,
     \rx_data_A[12] , \rx_data_A[11] , \rx_data_A[10] , \rx_data_A[9] ,
     \rx_data_A[8] , \rx_data_A[7] , \rx_data_A[6] , \rx_data_A[5] ,
     \rx_data_A[4] , \rx_data_A[3] , \rx_data_A[2] , \rx_data_A[1] ,
     \rx_data_A[0] , \rx_data_B[15] , \rx_data_B[14] , \rx_data_B[13] ,
     \rx_data_B[12] , \rx_data_B[11] , \rx_data_B[10] , \rx_data_B[9] ,
     \rx_data_B[8] , \rx_data_B[7] , \rx_data_B[6] , \rx_data_B[5] ,
     \rx_data_B[4] , \rx_data_B[3] , \rx_data_B[2] , \rx_data_B[1] ,
     \rx_data_B[0] , rx_valid, \calc_result[23] , \calc_result[22] ,
     \calc_result[21] , \calc_result[20] , \calc_result[19] , \calc_result[18] ,
     \calc_result[17] , \calc_result[16] , \calc_result[15] , \calc_result[14] ,
     \calc_result[13] , \calc_result[12] , \calc_result[11] , \calc_result[10] ,
     \calc_result[9] , \calc_result[8] , \calc_result[7] , \calc_result[6] ,
     \calc_result[5] , \calc_result[4] , \calc_result[3] , \calc_result[2] ,
     \calc_result[1] , \calc_result[0] , calc_carry, calc_valid,
     \fifo_rdata[23] , \fifo_rdata[22] , \fifo_rdata[21] , \fifo_rdata[20] ,
     \fifo_rdata[19] , \fifo_rdata[18] , \fifo_rdata[17] , \fifo_rdata[16] ,
     \fifo_rdata[15] , \fifo_rdata[14] , \fifo_rdata[13] , \fifo_rdata[12] ,
     \fifo_rdata[11] , \fifo_rdata[10] , \fifo_rdata[9] , \fifo_rdata[8] ,
     \fifo_rdata[7] , \fifo_rdata[6] , \fifo_rdata[5] , \fifo_rdata[4] ,
     \fifo_rdata[3] , \fifo_rdata[2] , \fifo_rdata[1] , \fifo_rdata[0] ,
     fifo_rcarry, fifo_empty, tx_pop, n6, n10, n12, n14;
    assign #1 n6 = ~rst_n ;
    always @( posedge clk or posedge n6 )
    begin
             if (n6) mode_d2 <= 1'b0;
        else mode_d2 <= mode_d1;
    end
    assign n12 = ~mode_d2 ;
    assign #1 mode_toggle = mode_d1 ^ mode_d2;
    assign #1 n10 = ~mode_toggle ;
    assign #1 sys_rst_n = rst_n & n10 ;
    spi_rx u_spi_rx (.clk(clk), .rst_n(sys_rst_n), .in_ready(in_ready), .inA(inA),
        .inB(inB), .data_A({\rx_data_A[15] , \rx_data_A[14] , \rx_data_A[13] ,
        \rx_data_A[12] , \rx_data_A[11] , \rx_data_A[10] , \rx_data_A[9] ,
        \rx_data_A[8] , \rx_data_A[7] , \rx_data_A[6] , \rx_data_A[5] , \rx_data_A[4] ,
        \rx_data_A[3] , \rx_data_A[2] , \rx_data_A[1] , \rx_data_A[0] }),
        .data_B({\rx_data_B[15] , \rx_data_B[14] , \rx_data_B[13] , \rx_data_B[12] ,
        \rx_data_B[11] , \rx_data_B[10] , \rx_data_B[9] , \rx_data_B[8] ,
        \rx_data_B[7] , \rx_data_B[6] , \rx_data_B[5] , \rx_data_B[4] , \rx_data_B[3] ,
        \rx_data_B[2] , \rx_data_B[1] , \rx_data_B[0] }), .valid_out(rx_valid));
    compute_engine u_compute_engine (.clk(clk), .rst_n(sys_rst_n), .mode(mode_d2),
        .rx_valid(rx_valid), .data_A({\rx_data_A[15] , \rx_data_A[14] , \rx_data_A[13] ,
        \rx_data_A[12] , \rx_data_A[11] , \rx_data_A[10] , \rx_data_A[9] ,
        \rx_data_A[8] , \rx_data_A[7] , \rx_data_A[6] , \rx_data_A[5] , \rx_data_A[4] ,
        \rx_data_A[3] , \rx_data_A[2] , \rx_data_A[1] , \rx_data_A[0] }),
        .data_B({\rx_data_B[15] , \rx_data_B[14] , \rx_data_B[13] , \rx_data_B[12] ,
        \rx_data_B[11] , \rx_data_B[10] , \rx_data_B[9] , \rx_data_B[8] ,
        \rx_data_B[7] , \rx_data_B[6] , \rx_data_B[5] , \rx_data_B[4] , \rx_data_B[3] ,
        \rx_data_B[2] , \rx_data_B[1] , \rx_data_B[0] }), .mac_result({\calc_result[23] ,
        \calc_result[22] , \calc_result[21] , \calc_result[20] , \calc_result[19] ,
        \calc_result[18] , \calc_result[17] , \calc_result[16] , \calc_result[15] ,
        \calc_result[14] , \calc_result[13] , \calc_result[12] , \calc_result[11] ,
        \calc_result[10] , \calc_result[9] , \calc_result[8] , \calc_result[7] ,
        \calc_result[6] , \calc_result[5] , \calc_result[4] , \calc_result[3] ,
        \calc_result[2] , \calc_result[1] , \calc_result[0] }), .mac_carry(calc_carry),
        .calc_done(calc_valid));
    sync_fifo u_sync_fifo (.clk(clk), .rst_n(sys_rst_n), .wr_en(calc_valid),
        .wr_data({calc_carry, \calc_result[23] , \calc_result[22] , \calc_result[21] ,
        \calc_result[20] , \calc_result[19] , \calc_result[18] , \calc_result[17] ,
        \calc_result[16] , \calc_result[15] , \calc_result[14] , \calc_result[13] ,
        \calc_result[12] , \calc_result[11] , \calc_result[10] , \calc_result[9] ,
        \calc_result[8] , \calc_result[7] , \calc_result[6] , \calc_result[5] ,
        \calc_result[4] , \calc_result[3] , \calc_result[2] , \calc_result[1] ,
        \calc_result[0] }), .rd_en(tx_pop), .rd_data({fifo_rcarry, \fifo_rdata[23] ,
        \fifo_rdata[22] , \fifo_rdata[21] , \fifo_rdata[20] , \fifo_rdata[19] ,
        \fifo_rdata[18] , \fifo_rdata[17] , \fifo_rdata[16] , \fifo_rdata[15] ,
        \fifo_rdata[14] , \fifo_rdata[13] , \fifo_rdata[12] , \fifo_rdata[11] ,
        \fifo_rdata[10] , \fifo_rdata[9] , \fifo_rdata[8] , \fifo_rdata[7] ,
        \fifo_rdata[6] , \fifo_rdata[5] , \fifo_rdata[4] , \fifo_rdata[3] ,
        \fifo_rdata[2] , \fifo_rdata[1] , \fifo_rdata[0] }), .empty(fifo_empty));
    spi_tx u_spi_tx (.clk(clk), .rst_n(sys_rst_n), .fifo_empty(fifo_empty),
        .tx_data({\fifo_rdata[23] , \fifo_rdata[22] , \fifo_rdata[21] , \fifo_rdata[20] ,
        \fifo_rdata[19] , \fifo_rdata[18] , \fifo_rdata[17] , \fifo_rdata[16] ,
        \fifo_rdata[15] , \fifo_rdata[14] , \fifo_rdata[13] , \fifo_rdata[12] ,
        \fifo_rdata[11] , \fifo_rdata[10] , \fifo_rdata[9] , \fifo_rdata[8] ,
        \fifo_rdata[7] , \fifo_rdata[6] , \fifo_rdata[5] , \fifo_rdata[4] ,
        \fifo_rdata[3] , \fifo_rdata[2] , \fifo_rdata[1] , \fifo_rdata[0] }),
        .tx_carry(fifo_rcarry), .fifo_pop(tx_pop), .sum_out(sum_out), .out_ready(out_ready),
        .carry_out(carry));
    always @( posedge clk or posedge n6 )
    begin
             if (n6) mode_d1 <= 1'b0;
        else mode_d1 <= mode;
    end
    assign n14 = ~mode_d1 ;

endmodule

