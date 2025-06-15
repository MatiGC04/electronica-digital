`include "../ej2/FF_D.v"
module shift_reg_4b_sp(
    input wire B,         // Entrada serie
    input wire sclk,
    output wire [3:0] sQ
);
    wire q1, q2, q3;

    FF_D ff0(.D(B),     .clk(sclk), .Q(sQ[0]), .Qn());
    FF_D ff1(.D(sQ[0]), .clk(sclk), .Q(sQ[1]), .Qn());
    FF_D ff2(.D(sQ[1]), .clk(sclk), .Q(sQ[2]), .Qn());
    FF_D ff3(.D(sQ[2]), .clk(sclk), .Q(sQ[3]), .Qn());

endmodule