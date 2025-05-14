// ============================================================================
// Módulo: codificador_generico
// Descripción:
//   Codificador decimal a código arbitrario.
//   Entrada: D (1-de-10, 10 bits, solo un '1' activo a la vez)
//   Salida: CODE (4 bits, codificado según el esquema deseado)
// 
//   Se incluyen ejemplos de:
//     - Codificación Exceso-3
//     - Codificación Gray
//     - Caso general (para completar cualquier tabla)
// ============================================================================
module codificador_generico (
    input  [9:0] D,         // Entrada 1-de-10
    output reg [3:0] CODE   // Salida codificada
);

    always @(*) begin
        case (D)

            // ---------------------------
            // Ejemplo: Codificación Exceso-3
            // (valor decimal + 3 en binario)
            // ---------------------------
            10'b0000000001: CODE = 4'b0011; // 0 + 3 = 3
            10'b0000000010: CODE = 4'b0100; // 1 + 3 = 4
            10'b0000000100: CODE = 4'b0101; // 2 + 3 = 5
            10'b0000001000: CODE = 4'b0110; // 3 + 3 = 6
            10'b0000010000: CODE = 4'b0111; // 4 + 3 = 7
            10'b0000100000: CODE = 4'b1000; // 5 + 3 = 8
            10'b0001000000: CODE = 4'b1001; // 6 + 3 = 9
            10'b0010000000: CODE = 4'b1010; // 7 + 3 = 10
            10'b0100000000: CODE = 4'b1011; // 8 + 3 = 11
            10'b1000000000: CODE = 4'b1100; // 9 + 3 = 12

            // ---------------------------
            // Ejemplo: Codificación Gray
            // ---------------------------
            // 10'b0000000001: CODE = 4'b0000; // decimal 0 → Gray 0000
            // 10'b0000000010: CODE = 4'b0001; // decimal 1 → Gray 0001
            // 10'b0000000100: CODE = 4'b0011; // decimal 2 → Gray 0011
            // 10'b0000001000: CODE = 4'b0010; // decimal 3 → Gray 0010
            // 10'b0000010000: CODE = 4'b0110; // decimal 4 → Gray 0110
            // 10'b0000100000: CODE = 4'b0111; // decimal 5 → Gray 0111
            // 10'b0001000000: CODE = 4'b0101; // decimal 6 → Gray 0101
            // 10'b0010000000: CODE = 4'b0100; // decimal 7 → Gray 0100
            // 10'b0100000000: CODE = 4'b1100; // decimal 8 → Gray 1100
            // 10'b1000000000: CODE = 4'b1101; // decimal 9 → Gray 1101

            // ---------------------------
            // // Caso general: escribí acá tu tabla personalizada
            // // Reemplazá los valores por los códigos deseados
            // ---------------------------
            // 10'b0000000001: CODE = 4'b_ _ _ _; // decimal 0 → código ?
            // 10'b0000000010: CODE = 4'b_ _ _ _; // decimal 1 → código ?
            // 10'b0000000100: CODE = 4'b_ _ _ _; // decimal 2 → código ?
            // 10'b0000001000: CODE = 4'b_ _ _ _; // decimal 3 → código ?
            // 10'b0000010000: CODE = 4'b_ _ _ _; // decimal 4 → código ?
            // 10'b0000100000: CODE = 4'b_ _ _ _; // decimal 5 → código ?
            // 10'b0001000000: CODE = 4'b_ _ _ _; // decimal 6 → código ?
            // 10'b0010000000: CODE = 4'b_ _ _ _; // decimal 7 → código ?
            // 10'b0100000000: CODE = 4'b_ _ _ _; // decimal 8 → código ?
            // 10'b1000000000: CODE = 4'b_ _ _ _; // decimal 9 → código ?

            default: CODE = 4'bxxxx; // Error: más de una línea activa o ninguna

        endcase
    end

endmodule
