
%`include "REG_PP_4bit/FFD...."
module RAM_16X4(
    input wire clk,
    input wire reset,
    input wire set,
    input wire write_enable,
    input wire read_enable,
    input wire [3:0] D_in,
    output wire [3:0] Q


);
    genvar i;
    generate
        for(i=0; i<4, i++)begin : FF_GEN
            .clk(clk),
            .reset(reset),
            .set(set),
            .enable(write_enable),
            .D(D_in[i]),
            .Q(Q[i])


    endgenerate
endmodule