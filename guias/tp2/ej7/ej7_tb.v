// FIJO
`default_nettype none
`timescale 100 ns / 10 ns

module ej7_tb();

// FIJO
parameter DURATION = 100;
reg reset;
// Cambiar el tamaño de los registros según la cantidad de entradas
// N = 2^n - 1
parameter k = 4; // n° de variables del primer circuito
parameter N = (2**k) - 1 ;

parameter k2 = 3; // n° de variables del segundo circuito
parameter N2 = (2**k2) - 1 ;
// Agregar los parametrso que se necesiten para la simulación
reg A;
reg B;
reg C;
reg D;
reg x;
reg y;
reg z;
//. . .

wire Y;
wire Z;
wire Yb;
wire Zb;

wire F2;
wire F2b;

//como las variables del primer circuito son 4 comparado al 2do que son 3, podemos 
// usar el mismo registro para el segundo circuito
reg[k-1:0] n;

ej7 UUT (
    .A(A),
    .B(B),
    .C(C),
    .D(D),
    .x(x),
    .y(y),
    .z(z),
    .Y(Y),
    .Z(Z),
    .Yb(Yb),
    .Zb(Zb),
    .F2(F2),
    .F2b(F2b)
);

initial begin
    $dumpfile("ej7_tb.vcd");
    $dumpvars(0, ej7_tb);

    reset = 1;
    #1;
    reset = 0;
    // Simulación mediante for, el vector n depende de la cantidad de entradas
    // tener en cuenta que el máximo valor que puede tomar es 2^n - 1
    for (n = 0; n < N; n++) begin

    {A, B, C, D} = n;
    // Asigna el valor de `n` a las señales `A`, `B`, `C` y `D` en forma de vector de 4 bits.

    if(n<=N2)
      {x,y,z} = n;


    #1;
    // Espera 1 unidad de tiempo (100 ns) antes de pasar al siguiente bit.
  end

    #(DURATION) $finish;
end

endmodule