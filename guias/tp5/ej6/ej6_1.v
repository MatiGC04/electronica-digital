`include "../ej2/FF_D.v"

module R_4B_FFD(
    input wire [3:0] B,
    output wire [3:0] sQ,
    input wire sclk
)
    wire [3:0] ignore;
    genvar i; // siempre q se use generate
    // integer i; // es para bloques always o test bench
    generate
        for(i=0; i<4; i = i + 1 )begin // solo funciona i++ en bloque always con en tb
            FF_D ffd(
                .D(B[i]),
                .clk(sclk),
                .Q(sQ[i]),
                .Qn(ignore[i])
            )
        end
    endgenerate
endmodule