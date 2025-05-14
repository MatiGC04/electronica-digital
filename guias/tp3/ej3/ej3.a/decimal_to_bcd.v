/*
a. Diseñe y Simule un codificador decimal a BCD Natural. Compare el codificador desarrollado
con el presentado en la hoja de datos del componente CD40147;
*/

/*
El código BCD (del inglés
Decimal Codificado en Binario), es un
código donde cada dígito decimal se
representa como un grupo de 4 bits.
*/

/*
Características clave del CD40147:
Tipo de codificador: Codificador de prioridad BCD de 10 líneas a 4 líneas.
Funcionalidad: Convierte una entrada de 10 líneas (0-9) a un código BCD de 4 líneas.
Fabricante: Texas Instruments.
Tipo de embalaje: DIP-16.
Uso: Ideal para decodificar señales de entrada decimal a código BCD para su uso en sistemas digitales. 
*/


// ============================================================================
// Módulo: codificador_decimal_a_bcd
// Descripción:
//   Este módulo toma una entrada decimal codificada en 1-de-10 (10 bits),
//   donde solo un bit debe estar en alto (1), y produce la salida BCD (4 bits)
//   correspondiente al índice de ese bit activado.
//
//   Ejemplo
//     D = 10'b0000001000 → entrada 3 activa → BCD = 4'b0011 (que es 3 en binario)
//
//   Si más de una entrada está activa o ninguna lo está, la salida es indefinida (xxxx).
// ============================================================================
module cod_decimal_bcd (
    input  [9:0] D,         // Entrada decimal codificada 1-de-10
    output reg [3:0] BCD    // Salida en BCD (número binario de 0 a 9)
);

    always @(*) begin
        // Se evalúa qué línea de entrada está activa (solo debe haber un '1')
        case (D)
            10'b0000000001: BCD = 4'd0; // bit 0 activo → 0 en binario
            10'b0000000010: BCD = 4'd1; // bit 1 activo → 1 en binario
            10'b0000000100: BCD = 4'd2; // bit 2 activo → 2 en binario
            10'b0000001000: BCD = 4'd3; // bit 3 activo → 3 en binario
            10'b0000010000: BCD = 4'd4; // bit 4 activo → 4 en binario
            10'b0000100000: BCD = 4'd5; // bit 5 activo → 5 en binario
            10'b0001000000: BCD = 4'd6; // bit 6 activo → 6 en binario
            10'b0010000000: BCD = 4'd7; // bit 7 activo → 7 en binario
            10'b0100000000: BCD = 4'd8; // bit 8 activo → 8 en binario
            10'b1000000000: BCD = 4'd9; // bit 9 activo → 9 en binario
            default: BCD = 4'bxxxx;     // Caso inválido: más de una entrada activa o ninguna
        endcase
    end

endmodule


    /*
    always @(*) begin
        case (x)
            0: y = 4'b0000;
            1: y = 4'b0001;
            2: y = 4'b0010;
            3: y = 4'b0011;
            4: y = 4'b0100;
            5: y = 4'b0101;
            6: y = 4'b0110;
            7: y = 4'b0111;
            8: y = 4'b1000;
            9: y = 4'b1001;
            default: y = 4'bxxxx; // Default case for invalid inputs
        endcase
    end
    */
