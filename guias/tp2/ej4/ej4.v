module ej4(
    input wire A,
    input wire B,
    input wire C,
    input wire D,

    output wire f,
    output wire fb,
    output wire g,
    output wire gb,
    output wire h,
    output wire hb,

);
    // fb, gb, hb, son las expresiones booleanas simplificadas de f, g y h respectivamente
    
    // a)
    assign f = ~(A&~B | ~C&D | E&F );
    assign fb = (~A|B) & (C|~D) & (E|~F);

    // b)
    assign g = ~(~(A|B) | (C|~D) | D&~(E|~F));
    assign gb = (A|B&~C) | (~D|(~E|~F));

    // c)
    assign h = ~(~(A|B&~C) | D&~(E|~F));
    assign hb = (A&B) | ((~D|~C)&(E|~F)) | ((~A|B) & (C&D));

