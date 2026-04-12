module mult16(a, b, result);
input  [15:0] a;
input  [15:0] b;
output [31:0] result;
wire n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80,
     n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95,
     n96, n97, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107, n108,
     n109, n110, n111, n112, n113, n114, n115, n116, n117, n118, n119, n120,
     n121, n122, n123, n124, n125, n126, n127, n128, n129;
    assign #1 {result[31:0]} = {a[15:0]} * {b[15:0]};

endmodule

