`include "../ej5/ej5_a.v"
module ej9(
    input wire w,
    output wire z,
    input wire clock,
    output wire Q1, Q0,
    output wire Z
)

    wire D1, D0;
    assign D1 = (Q1 & ~Q0) | (w & Q0);
    assign D0 = (w & ~Q0) | (Q1 & ~Q0) | (w & Q1);
    /*
    module FF_D(
    input wire D,
    input wire clk,
    output reg Q = 0,
    output wire Qn
    );
    */
    FF_D ffd1(.D(D1), .clk(clock), .Q(Q1), Qn());
    FF_D ffd1(.D(D0), .clk(clock), .Q(Q0), Qn());

    assign Z = Q1 & Q0;
endmodule