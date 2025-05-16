/*
5.Explique qué es y cómo funcionan un multiplexor y un demultiplexor.¿Para qué sirve? De
ejemplos de aplicación.
a. Diseñe, simule e impacte en la FPGA un circuito multiplexor de 4 entradas;
b. Diseñe, simule e impacte en la FPGA un circuito demultiplexor de 4 salidas;
c. Compare los resultados de los incisos anteriores con aquellos presentados en la
hoja de datos del componente CD4051;
*/

module mux_4_1 (
    // 4 entradas independientes
    input [3:0] I, // Entradas
    input [1:0] S, // Selección
    output F // Salida
);
    // I es el vector de 4 entradas (I0, I1, I2, I3)
    // S es el vector de 2 bits que selecciona una de las 4 entradas (S0, S1)
    //Forma correcta mirando la tabla de verdad de S0 , S1 | F
    /*
    S0 S1 | F
    0  0  | I0
    0  1  | I1
    1  0  | I2
    1  1  | I3

    F = ~S0*~S1*I0 + ~S0*S1*~I1 + S0*~S1*I2 + S0*S1*I3
    */
    assign F = (~S[0]&~S[1]&I[0]) | // S=00
               (~S[0]&S[1]&~I[1])  | // S=01
               (S[0]&~S[1]&I[2])  | // S=10
               (S[0]&S[1]&I[3]);    // S=11

    /* Otra forma de hacerlo
    assign Y = (S == 2'b00) ? I[0] :
               (S == 2'b01) ? I[1] :
               (S == 2'b10) ? I[2] : // ↓ valor por defecto
               (S == 2'b11) ? I[3] : 1'b0;
    sino tambien
    assign Y = I[S];
    */
endmodule

// b)
module demux_1_4 (
    input [1:0] S,
    input D,
    output wire [3:0] f
);
    assign f[0] = D & ~S[0] & ~S[1];
    assign f[1] = D & ~S[0] & S[1];
    assign f[2] = D & S[0] & ~S[1];
    assign f[3] = D & S[0] & S[1];
    // Otra forma de hacerlo
    /*
      always @(*) begin
        // Inicializo la salida a 0
        f = 4'b0000;
        // Según el valor de S, activo una de las salidas
        case (S)
            2'b00: f[0] = D; // Activo la salida 0
            2'b01: f[1] = D; // Activo la salida 1
            2'b10: f[2] = D; // Activo la salida 2
            2'b11: f[3] = D; // Activo la salida 3
            default: f = 4'b0000; // Por defecto, todas las salidas en 0
        endcase
    end 
    */

endmodule