module ej9(
    input wire A,
    input wire B,
    input wire C,
    input wire D,
    input wire E,

    output wire f,
    output wire g,
    output wire h,
    output wire i

    //funciones reducidas por karnaugh
    /* output wire fb,
    output wire gb,
    output wire hb,
    output wire ib */

); // fk, gk, hk, ik son las expresiones booleanas resultantes por medio del metodo de karnaugh

    // a)
    assign f = (A & ~B & C) | (~A & B & ~C) | (A & B & C);

    // b)
    assign g = (A | ~B) & (A | ~B | ~C) & (B | C | ~D) & (~A | B | ~C |D);

    // c)
    assign h = (A | B | C) & (~A | ~B | ~C) & (A | ~B | C);

    // d)
    assign i = (~A & B & ~C & D & ~E) | (~A & ~B & ~C & D & E) | (A & ~B & ~C & D & E) | (A & B & ~C & ~D & ~E) |
           (~A & B & C & D & ~E) | (~A & B & C & ~D & E) | (~A & ~B & ~C & ~D & ~E) | (~A & ~B & C & D & E) |
           (A & B & ~C & D & ~E) | (A & B & ~C & D & E);
endmodule