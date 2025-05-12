module ej5(
    input wire A,
    input wire B,
    input wire C,


    output wire f,
    output wire g,
    output wire h,
    output wire l,
    output wire fb,
    output wire gb,
    output wire hb,
    output wire lb
);
    // fb, gb, hb,y lb son las expresiones booleanas simplificadas de f, g y h respectivamente
    // a)
    assign f = ( A&(~A | A&B) );
    assign fb = ( A&B );

    // b)
    assign g = ( B&C | ~B&C );
    assign gb = (C);

    // c)
    assign h = A&B | A&(B | C) | B&(B | C);
    assign hb = ( (A&C) | B );

    // d)
    assign l = (A | ~A)&(A&B | A&B&~C);
    assign lb = (A&B);
endmodule