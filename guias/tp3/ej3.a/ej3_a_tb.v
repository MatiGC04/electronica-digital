// FIJO
`default_nettype none
`timescale 100 ns / 10 ns

module ej3_a_tb();

// FIJO
parameter DURATION = 100;
reg reset;
// Cambiar el tamaño de los registros según la cantidad de entradas
// N = 2^n - 1
parameter k = 1; // Cambiar según la cantidad de entradas
parameter N = (2**k) - 1 ;
// Agregar los parametrso que se necesiten para la simulación
reg x
//. . .

wire y

reg[k-1:0] n;

ej3_a UUT (
    .x(x),
    .y(y)
    // ...
);

initial begin
    $dumpfile("[nombre_modulo]_tb.vcd");
    $dumpvars(0, [nombre_modulo]_tb);

    reset = 1;
    #1;
    reset = 0;
    

    #(DURATION) $finish;
end

endmodule