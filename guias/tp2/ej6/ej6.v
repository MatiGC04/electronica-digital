module ej6(
    input wire A,
    input wire B,
    input wire C,
    input wire D,


    output wire f,
    output wire fs,
    output wire fp,
    output wire g,
    output wire gs,
    output wire gp,
    output wire h,
    output wire hs,
    output wire hp
);
    // Función original f
    assign f = ( (A | (~B & C)) & C );

    // Función original g
    assign g = (A & ~B & C) | (~A & ~B) | (A & B & ~C & D);

    // Función original h
    assign h = ( (A & B) | (C & D & ((A & ~B) | (C & D))) );


    // Función simplificada de f
    assign fs = (~A & ~B & C) | (A & ~B & C) | (A & B & C);  // Puedes cambiar esta lógica según sea necesario
    assign fp = (A | B | C) & (A | ~B | C) & (A | ~B | ~C) & (~A | B | C) & (~A | ~B | C);

    // Función simplificada de g
    assign gs = (~A & ~B & ~C & ~D) | (~A & ~B & ~C & D) | (~A & ~B & C & ~D) | (~A & ~B & C & D) | (A & ~B & C & ~D) | (A & ~B & C & D) | (A & B & ~C & D);
    assign gp = (A | ~B | C | D) & (A | ~B | C | ~D) & (A | ~B | ~C | D) & (A | ~B | ~C | ~D) & (~A | B | C | D) & (~A | B | C | ~D) & (~A | ~B | C | D) & (~A | ~B | ~C | D) & (~A | ~B | ~C | ~D);

    // Función simplificada de h
    assign hs = (~A & ~B & C & D) | (~A & B & C & D) | (A & ~B & C & D) | (A & B & ~C & ~D) | (A & B & ~C & D) | (A & B & C & ~D) | (A & B & C & D);
    assign hp = (A | B | C | D) & (A | B | C | ~D) & (A | B | ~C | D) & (A | ~B | C | D) & (A | ~B | C | ~D) & (A | ~B | ~C | D) & (~A | B | C | D) & (~A | B | C | ~D) & (~A | B | ~C | D);
endmodule
