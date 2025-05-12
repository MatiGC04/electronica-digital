///Modulo para la operación AND
module expression_w_boole(
    input wire A,
    input wire B,
    input wire C,
    input wire D,
    output wire f,
    output wire g,
    output wire h
  
);
    // a) sea 1  si una o mas variables son 1
    assign f = A | B | C | D;
    // b) sea 1 si todas las variables son 1
    assign g = A & B & C & D;
    // c) sea 1 si 2 de sus variables son 1
    // assign h = (A|B|~C|~D) & (A|~B|C|~D) & (A|~B|~C|D) & (~A|B|C|~D) & (~A|B|~C|D) & (~A|~B|C|D);
    assign h = ~(
        (A & B & ~C & ~D) |  // A y B son 1
        (A & C & ~B & ~D) |  // A y C son 1
        (A & D & ~B & ~C) |  // A y D son 1
        (B & C & ~A & ~D) |  // B y C son 1
        (B & D & ~A & ~C) |  // B y D son 1
        (C & D & ~A & ~B)    // C y D son 1
    );
endmodule