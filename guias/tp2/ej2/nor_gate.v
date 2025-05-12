
// Definición del módulo nor_gate
module nor_gate(
    input wire A,   // Entrada A (1 bit)
    input wire B,
    input wire C,   // Entrada B (1 bit)
    output wire X   // Salida X (1 bit)
);
    //quiero hacer un assign de una compuerta nor , norAnorBnorC
    assign X = ~(A | B | C);
    //o lo que es lo mismo
    // assign X = (~A) & (~B) & (~C);


endmodule