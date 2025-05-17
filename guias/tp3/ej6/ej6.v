/*
6.Diseñe e implemente en Verilog un circuito que genere los bits de paridad de Hamming
para un dato de 8 bits. Realice lo mismo para el circuito corrector correspondiente. Analice
y compruebe el correcto funcionamiento de cada circuito mediante testbench.
Ayuda: Piense en cada una de las funciones (generador y corrector) como dos circuitos por separado.

*/
module b8_2_hamming (
    input [7:0] D,
    output [11:0] H
);

    // Paridad
    assign H[0] = D[0] ^ D[2] ^ D[4] ^ D[6];         // P1 = d1⊕d3⊕d5⊕d7
    assign H[1] = D[1] ^ D[2] ^ D[5] ^ D[6];         // P2 = d2⊕d3⊕d6⊕d7
    assign H[3] = D[3] ^ D[4] ^ D[5] ^ D[6];         // P3 = d4⊕d5⊕d6⊕d7
    assign H[7] = D[7];                              // P4 = d8 (si usás Hamming(12,8), P4 es d8)

    // Datos
    assign H[2] = D[0]; // d1
    assign H[4] = D[1]; // d2
    assign H[5] = D[2]; // d3
    assign H[6] = D[3]; // d4
    assign H[8] = D[4]; // d5
    assign H[9] = D[5]; // d6
    assign H[10] = D[6]; // d7
    assign H[11] = D[7]; // d8
endmodule

module b8_2_hamming_corrector (
    input [11:0] H,
    output reg [7:0] D,
    output reg [3:0] E
);

    always @(*) begin
        // Inicializo la salida a 0
        D = 8'b00000000;
        E = 4'b0000;

        // Calculo los bits de paridad
        wire P1, P2, P3, P4;
        assign P1 = H[0] ^ H[2] ^ H[4] ^ H[6] ^ H[8] ^ H[10];
        assign P2 = H[1] ^ H[2] ^ H[5] ^ H[6] ^ H[9] ^ H[10];
        assign P3 = H[3] ^ H[4] ^ H[5] ^ H[6] ^ H[11];
        assign P4 = H[7] ^ H[8] ^ H[9] ^ H[10] ^ H[11];

        // Si hay errores
        if (P1 || P2 || P3 || P4) begin
            E[0] = P1; // los guardo en orden
            E[1] = P2;
            E[2] = P3;
            E[3] = P4;

            // Corrijo el error en el bit correspondiente
            if (E != 4'b0000) begin
                // invierto el bit
                D[E-1] <= ~H[E-1];
            end
        end else begin
            // Si no hay errores, copio los datos originales
            D <= {H[11], H[10], H[9], H[8], H[6], H[5], H[4], H[2]};
        end
    end
endmodule