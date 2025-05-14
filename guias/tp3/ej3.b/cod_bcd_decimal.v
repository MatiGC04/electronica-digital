/*
b. Diseñe y Simule un decodificador BCD a decimal. Compare el decodificador
desarrollado con el presentado en la hoja de datos del componente CD4028;
*/
module cod_bcd_decimal (
    input  [3:0] BCD,         // Entrada BCD (4 bits)
    output reg [9:0] D      // Salida decimal codificada 1-de-10 (10 bits)
);

    always @(*) begin
    case (BCD)
        // Para cada valor de entrada del BCD (0-9), se asigna un valor de salida decimal
        // ese valor de salida decimal es el correspondiente a la posición del bit activo
        // en la salida D (10 bits)
        4'b0000: D = 10'b0000000001; // 0
        4'b0001: D = 10'b0000000010; // 1
        4'b0010: D = 10'b0000000100; // 2
        4'b0011: D = 10'b0000001000; // 3
        4'b0100: D = 10'b0000010000; // 4
        4'b0101: D = 10'b0000100000; // 5
        4'b0110: D = 10'b0001000000; // 6
        4'b0111: D = 10'b0010000000; // 7
        4'b1000: D = 10'b0100000000; // 8
        4'b1001: D = 10'b1000000000; // 9
        default: D = 10'bxxxxxxxxxx;
    endcase
    //comparo con la tabla de CD4028B y veo que son iguales xd
    allways @(*) begin
        case (BCD)
            4'b0000: D = 10'b0000000001; // 0
            4'b0001: D = 10'b0000000010; // 1
            4'b0010: D = 10'b0000000100; // 2
            4'b0011: D = 10'b0000001000; // 3
            4'b0100: D = 10'b0000010000; // 4
            4'b0101: D = 10'b0000100000; // 5
            4'b0110: D = 10'b0001000000; // 6
            4'b0111: D = 10'b0010000000; // 7
            4'b1000: D = 10'b0100000000; // 8
            4'b1001: D = 10'b1000000000; // 9
            default: D = 10'bxxxxxxxxxx;
        endcase
    end
end
endmodule