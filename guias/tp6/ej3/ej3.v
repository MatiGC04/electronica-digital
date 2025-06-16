`include "../ej5/ej5_a.v" // Ajusta la ruta si es necesario
module ej3(
    input wire D,
    input wire clk,
    input wire RE,
    output wire Q1, Q0;
);
    wire J1, K1, J0, K0;

    assign J1 = ~RE & ~Q1 & Q0;
    assign K1 = Q0 | RE;
    assign J0 = 1'b1;
    assign K0 = ~RE;
    /*
    input wire J,
    input wire K,
    input wire clk,
    input wire S,
    input wire R,
    output reg Q = 0,
    output wire Qn
    */
    FF_JK jk1(.J(J1), .K(K1), .clk(clk), .S(), .R(), .Q(Q1));
    FF_JK jk0(.J(J0), .K(K0), .clk(clk), .S(), .R(), .Q(Q0));
endmodule