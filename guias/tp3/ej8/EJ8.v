module EJ8(
    input wire[3:0] Entrada,
    input wire LT, BI,
    output wire [6:0] Salida
);


reg[6:0]  aux;


always @(*) begin

    // esto se puede hacer imaginando al display como
    /*
       _a_
    f |_g_|b
    e |___|c   .
        d
    */
    // Tabla de conversión BCD a display 7 segmentos
    // dec | A B C D | a b c d e f g
    //-------------------------------
    //  0  | 0 0 0 0 | 1 1 1 1 1 1 0
    //  1  | 0 0 0 1 | 0 1 1 0 0 0 0
    //  2  | 0 0 1 0 | 1 1 0 1 1 0 1
    //  3  | 0 0 1 1 | 1 1 1 1 0 0 1
    //  4  | 0 1 0 0 | 0 1 1 0 0 1 1
    //  5  | 0 1 0 1 | 1 0 1 1 0 1 1
    //  6  | 0 1 1 0 | 1 0 1 1 1 1 1
    //  7  | 0 1 1 1 | 1 1 1 0 0 0 0
    //  8  | 1 0 0 0 | 1 1 1 1 1 1 1
    //  9  | 1 0 0 1 | 1 1 1 0 0 1 1
    case (Entrada)
            4'b0001: aux = 7'b0110000; // 1
            4'b0010: aux = 7'b1101101; // 2
            4'b0011: aux = 7'b1111001; // 3
            4'b0100: aux = 7'b0110011; // 4
            4'b0101: aux = 7'b1011011; // 5
            4'b0110: aux = 7'b1011111; // 6
            4'b0111: aux = 7'b1110000; // 7
            4'b1000: aux = 7'b1111111; // 8
            4'b1001: aux = 7'b1110011; // 9
            default: aux = 7'b1111110; // 0
        endcase

    if (BI == 1'b0) begin
        aux = 7'b0000000;
    end
    if (LT == 1'b1) begin
        aux = 7'b1111111;
    end
    if ((LT == 1'b1) && (BI == 1'b1)) begin
        aux = 7'b1111111;
    end



end
 assign Salida = aux;




endmodule