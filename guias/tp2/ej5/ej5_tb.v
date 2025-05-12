`default_nettype none
`timescale 100 ns / 10 ns

module ej5_tb();

parameter DURATION = 100;
reg reset;
// Agregar los parametrso que se necesiten para la simulación
reg A;
reg B;
reg C;

//. . .

wire f;
wire g;
wire h;
wire l;
wire fb;
wire gb;
wire hb;
wire lb;
// Cambiar el tamaño de los registros según la cantidad de entradas
// N = 2^n - 1
parameter k = 4; // Cambiar según la cantidad de entradas
parameter N = (2**k) - 1; // Cambiar según la cantidad de entradas
reg[k-1:0] n;

ej5 UUT (
    .A(A),
    .B(B),
    .C(C),

    .f(f),
    .g(g),
    .h(h),
    .l(l),

    .fb(fb),
    .gb(gb),
    .hb(hb),
    .lb(lb)

    // ...
);

initial begin
    $dumpfile("ej5_tb.vcd");
    $dumpvars(0, ej5_tb);
    $display("...Iniciando simulación...");
    reset = 1;
    #1;
    $display("reset = %b", reset);
    reset = 0;
    // Simulación mediante for, el vector n depende de la cantidad de entradas
    // tener en cuenta que el máximo valor que puede tomar es 2^n - 1
    for (integer n = 0; n < N+1; n++) begin
        {A, B, C} = n;
        #1;
    end
    $display("...Simulación terminada...");
    #(DURATION) $finish;
end

endmodule