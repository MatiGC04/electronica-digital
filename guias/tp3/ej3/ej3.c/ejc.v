/*
c. Diseñe y Simule un codificador de ocho líneas a binario natural con prioridad de las
entradas. Compare el codificador desarrollado con el presentado en la hoja de datos
del componente CD4532.
*/
module ejc (
    input [8:0] D,            // Entrada decimal codificada 1-de-10
    output reg [3:0] BCD,    // Salida en BCD (número binario de 0 a 9)
    output reg Gs           // Salida de habilitación por la tabla GS
);

    always @(*) begin
        // Se evalúa qué línea de entrada está activa con prioridad de mayor a menor
        casez (D)
        // decimal activo    valor BCD  activo Gs
            8'b1???????: begin BCD = 3'd7; Gs = 1'b1; end // bit 7 activo → 7 en binario
            8'b01??????: begin BCD = 3'd6; Gs = 1'b1; end // bit 6 activo → 6 en binario
            8'b001?????: begin BCD = 3'd5; Gs = 1'b1; end // bit 5 activo → 5 en binario
            8'b0001????: begin BCD = 3'd4; Gs = 1'b1; end // bit 4 activo → 4 en binario
            8'b00001???: begin BCD = 3'd3; Gs = 1'b1; end // bit 3 activo → 3 en binario
            8'b000001??: begin BCD = 3'd2; Gs = 1'b1; end // bit 2 activo → 2 en binario
            8'b0000001?: begin BCD = 3'd1; Gs = 1'b1; end // bit 1 activo → 1 en binario
            8'b00000001: begin BCD = 3'd0; Gs = 1'b1; end // bit 0 activo → 0 en binario
            8'b00000000: begin BCD = 3'bxxx; Gs = 1'b0; end // Ninguna entrada activa
            default: begin BCD = 'bx; Gs = 'bx; end       // Caso inválido: más de una entrada activa o ninguna
        endcase
    end
endmodule