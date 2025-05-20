// FIJO
`default_nettype none
`timescale 100 ns / 10 ns

module ej3_tb();

// FIJO
parameter DURATION = 100;
reg reset;
// Cambiar el tamaño de los registros según la cantidad de entradas


reg [3:0] A;
reg [3:0] B;
// Agregar los parametrso que se necesiten para la simulación
wire menor;
wire igual;
wire mayor;
comparador UUT (
    .A(A),
    .B(B),
    .menor(menor),
    .igual(igual),
    .mayor(mayor)
);

initial begin
    $dumpfile("ej3_tb.vcd");
    $dumpvars(0, ej3_tb);

    reset = 1;
    #1;
    reset = 0;
    // Fijar un valor para A y variar B para mostrar las comparaciones
    A = 4'b0111; // Valor fijo de A (7 en binario)

    // B menor que A
    B = 4'b0100; // 4 en binario
    #1;
    $display("A = %b, B = %b | menor: %b, igual: %b, mayor: %b", A, B, menor, igual, mayor);

    // B igual a A
    B = 4'b0111; // 7 en binario
    #1;
    $display("A = %b, B = %b | menor: %b, igual: %b, mayor: %b", A, B, menor, igual, mayor);

    // B mayor que A
    B = 4'b1010; // 10 en binario
    #1;
    $display("A = %b, B = %b | menor: %b, igual: %b, mayor: %b", A, B, menor, igual, mayor);

    #(DURATION) $finish;
end

endmodule