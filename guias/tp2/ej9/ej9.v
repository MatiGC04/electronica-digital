module ej9(
    input wire A,
    input wire B,
    input wire C,
    input wire D,
    input wire E,

    output wire f,
    output wire g,
    output wire h,
    output wire i,

    //funciones reducidas por karnaugh
    output wire fk,
    output wire gk,
    output wire hk,
    output wire ik
    /*
    output wire gK,
    output wire hK,
    output wire iK
    */

); // fk, gk, hk, ik son las expresiones booleanas resultantes por medio del metodo de karnaugh

    // a)
    assign f = (A & ~B & C) | (~A & B & ~C) | (A & B & C);
    assign fk = (~A & B & ~C) | (A & C);
    // b)
    assign g = (A | ~B) & (A | ~B | ~C) & (B | C | ~D) & (~A | B | ~C |D);
    assign gk =  (~B&~C&~D) | (A&B) | (~A&~B&C) | (~B&C&D);
    // c)
    assign h = (A | B | C) & (~A | ~B | ~C) & (A | ~B | C);
    assign hk = (A&~C) | (A&~B) | (~A&C);

    // d)
    assign i = (~A & B & ~C & D & ~E) | (~A & ~B & ~C & D & E) | (A & ~B & ~C & D & E) | (A & B & ~C & ~D & ~E) |
           (~A & B & C & D & ~E) | (~A & B & C & ~D & E) | (~A & ~B & ~C & ~D & ~E) | (~A & ~B & C & D & E) |
           (A & B & ~C & D & ~E) | (A & B & ~C & D & E);
    assign ik = ~A&~B&~C&~D&~E | ~A&B&C&~D&E | A&B&~C&~E | A&B&~C&D | ~A&B&D&~E | ~B&~C&D&E | ~A&~B&D&E;
endmodule