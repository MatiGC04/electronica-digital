// FIJO
`default_nettype none
`timescale 100 ns / 10 ns

module ej6_tb();

// FIJO
parameter DURATION = 100;
reg reset;
// Cambiar el tamaño de los registros según la cantidad de entradas
// N = 2^n - 1
parameter k = 4; // Cambiar según la cantidad de entradas
parameter N = (2**k) - 1 ;


// Agregar los parametrso que se necesiten para la simulación
reg A;
reg B;
reg C;
reg D;

//. . .

wire f;
wire g;
wire h;
wire fs;
wire fp;
wire gs;
wire gp;
wire hs;
wire hp;


reg[k-1:0] n;

ej6 UUT (
    .A(A),
    .B(B),
    .C(C),
    .D(D),
    .f(f),
    .g(g),
    .h(h),
    .fs(fs),
    .fp(fp),
    .gs(gs),
    .gp(gp),
    .hs(hs),
    .hp(hp)
    // ...
);

reg test_interval;
initial begin
    $dumpfile("ej6_tb.vcd");
    $dumpvars(0, ej6_tb);

    reset = 1;

    #1;
    reset = 0;
    // Simulación mediante for, el vector n depende de la cantidad de entradas
    // tener en cuenta que el máximo valor que puede tomar es 2^n - 1
    for (integer n = 0; n <= N; n++) begin
        {A, B, C, D} = n;
        #1;
    end

    #(DURATION) $finish;
end

endmodule