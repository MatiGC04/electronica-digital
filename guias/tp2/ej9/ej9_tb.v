// FIJO
`default_nettype none
`timescale 100 ns / 10 ns

module ej9_tb();

// FIJO
parameter DURATION = 100;
reg reset;
// Cambiar el tamaño de los registros según la cantidad de entradas
// N = 2^n - 1
parameter k = 5; // Cambiar según la cantidad de entradas
parameter N = (2**k) - 1 ;
// Agregar los parametrso que se necesiten para la simulación
reg A;
reg B;
reg C;
reg D;
reg E;
//

wire f;
wire g;
wire h;
wire i;
wire fk;
wire gk;
wire hk;
wire ik;
reg[k-1:0] n;

ej9 UUT (
    .A(A),
    .B(B),
    .C(C),
    .D(D),
    .E(E),

    .f(f),
    .g(g),
    .h(h),
    .i(i),
    //funciones reducidas por karnaugh
    .fk(fk),
    .gk(gk),
    .hk(hk),
    .ik(ik)
    // ...
);

initial begin
    $dumpfile("ej9_tb.vcd");
    $dumpvars(0, ej9_tb);

    reset = 1;
    #1;
    reset = 0;
    // Simulación mediante for, el vector n depende de la cantidad de entradas
    // tener en cuenta que el máximo valor que puede tomar es 2^n - 1
    for (integer n = 0; n <= N; n++) begin
        // Se ponen las entradas en el orden que se necesiten
        // para g
            {A, B, C, D, E} = n;

        #1;
    end

    #(DURATION) $finish;
end

endmodule