`include "mux_8_1/mux_8_1.v"

module barrel_shifter (
    input [3:0] E,
    input [2:0] cod,
    output wire [3:0] S
);

wire S0, S1, S2, S3;

mux_8_1 muxS0 (
    .d0(E[0]), // NO
    .d1(E[1]), // DLD
    .d2(1'b0), // DLI
    .d3(E[1]), // RD
    .d4(E[0]), 
    .d5(E[1]), // DAD
    .d6(1'b0), // DAI
    .d7(E[3]), // RI
    .sel(cod),
    .o0(S0)
);

mux_8_1 muxS1 (
    .d0(E[1]), // NO
    .d1(E[2]), // DLD
    .d2(E[0]), // DLI
    .d3(E[2]), // RD
    .d4(E[1]),
    .d5(E[2]), // DAD
    .d6(E[0]), // DAI
    .d7(E[0]), // RI
    .sel(cod),
    .o0(S1)
);

mux_8_1 muxS2 (
    .d0(E[2]), // NO
    .d1(E[3]), // DLD
    .d2(E[1]), // DLI
    .d3(E[3]), // RD
    .d4(E[2]),
    .d5(E[3]), // DAD
    .d6(E[1]), // DAI
    .d7(E[1]), // RI
    .sel(cod),
    .o0(S2)
);

mux_8_1 muxS3 (
    .d0(E[3]), // NO
    .d1(1'b0), // DLD
    .d2(E[2]), // DLI
    .d3(E[0]), // RD
    .d4(E[3]), 
    .d5(E[3]), // DAD
    .d6(E[3]), // DAI
    .d7(E[2]), // RI
    .sel(cod),
    .o0(S3)
);

assign S = {S3, S2, S1, S0};

endmodule