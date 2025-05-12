// FIJO
`default_nettype none
`timescale 100 ns / 10 ns

module [nombre_modulo]_tb();

// FIJO
parameter DURATION = 100;
reg reset;
// Agregar los parametrso que se necesiten para la simulación
reg A;
reg B;
reg C;
reg D;
//. . .

wire f;
wire g;
wire h;
// Cambiar el tamaño de los registros según la cantidad de entradas
// N = 2^n - 1
k = [nro] ;
N = (2**k) -1 ;
reg[k-1:0] n;

[nombre_modulo] UUT (
    .A(A),
    .B(B),
    .C(C),
    .D(D),
    .E(E),
    .F(F),
    .f(f),
    .g(g),
    .h(h)
    // ...
);

initial begin
    $dumpfile("[nombre_modulo]_tb.vcd");
    $dumpvars(0, [nombre_modulo]_tb);

    reset = 1;
    #1;
    reset = 0;
    // Simulación mediante for, el vector n depende de la cantidad de entradas
    // tener en cuenta que el máximo valor que puede tomar es 2^n - 1
    for (integer n = 0; n < 64; n++) begin
        {A, B, C, D, E, F} = n;
        #1;
    end

    #(DURATION) $finish;
end

endmodule