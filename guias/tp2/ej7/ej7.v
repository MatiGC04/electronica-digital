
module ej7(
    // Entradas
    input wire A,
    input wire B,
    input wire C,
    input wire D,
    input wire x,
    input wire y,
    input wire z,

    // Salidas
    output wire Y,
    output wire Yb,
    output wire Z,
    output wire Zb,
    output wire F2,
    output wire F2b
);

assign Y = (~A & D) | (A & ~C & D) | (A & ~B & C) | (A & B & C & D);

assign Yb = ((~A | (A & ~C) | (A & B & C)) & D) | (A & ~B & C);

assign Z = (B & D) | (A & ~C & D);

assign Zb = (B | (A & ~C)) & D;

assign F2 = (~x & ~y & z) | (~x & y & z) | (x & ~y);

assign F2b = (~x & z) | (x & ~y);
endmodule