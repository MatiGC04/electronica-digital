module REG_PP_4bit(
    input wire [3:0] D_in;
    output wire [3:0] Q
);

    genvar i;
    generate
        for(i=0; i<4; i++) begin : FF_GEN
            FFD_sync_en ff(
                .clk(clk),
                .reset(reset),
                .set(set),
                .en(enable),
                .D(D_in),
                .Q(Q(i)),
                .Qn() // no usamos Qn en este caso

            );
        end
    endgenerate
endmodule