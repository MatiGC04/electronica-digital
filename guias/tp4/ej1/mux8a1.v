module mux8a1(
    input  [7:0] D,         // 8 entradas de datos
    input  [2:0] sel,       // Selector de 3 bits
    output       Y          // Salida
);
    assign Y = D[sel];
endmodule