`default_nettype none
`timescale 100 ns / 10 ns

module ej2_tb();

reg [3:0] A, B;
wire [3:0] S, R;
wire Cout, Bout;

// Instancia de los módulos
sumador_4b SUMA(
    .A(A),
    .B(B),
    .S(S),
    .Cout(Cout)
);

restador_4b RESTA(
    .A(A),
    .B(B),
    .Bin(1'b0), // resta normal
    .R(R),
    .Bout(Bout)
);

initial begin
    $dumpfile("ej2_tb.vcd");
    $dumpvars(0, ej2_tb);

    $display("----------------------------------------------------------");
    $display("|  A  |  B  | Suma | Cout | Resta | Bout |");
    // $display("----------------------------------------------------------");
    for (A = 0; A < 16; A = A + 1) begin
        for (B = 0; B < 16; B = B + 1) begin
            #1; // Espera para propagación
            $display("| %2d | %2d | %4d |  %b   | %5d |  %b   |", A, B, S, Cout, R, Bout);
        end
    end
    $display("----------------------------------------------------------");
    $finish;
end

endmodule