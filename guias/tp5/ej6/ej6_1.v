`include "../ej2/FF_D.v"

module R_4B_FFD(
    input wire [3:0] B,
    output reg [3:0] sQ,
    input wire sclk
)
    wire [3:0]ignore;
    generate
        for(i=0; i<4; i++)begin
            FF_D ffd(
                .D(B[i]),
                .clk(sclk),
                .Q(sQ[i]),
                .Qn(ignore[i])
            )
        end
    endgenerate
endmodule