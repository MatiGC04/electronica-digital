`include "sumador_1b.v"
`include "restador_1b.v"

module ALU(
    input numero1,
    input numero2,
    input [2:0] codigo_operacion,
    input in,
    output reg salida
);
    //wire [7:0] mux_inputs
    wire sum_salida, sum_out;
    wire rest_salida, rest_out;
    wire prod_l, suma_l, rest_l, compl;
    sumador_1b SUM(
        .A(numero1),
        .B(numero2),
        .Cin(in),
        .S(sum_salida),
        .Cout(sum_out)
    );
    restador_1b REST(
        .A(numero1),
        .B(numero2),
        .Bin(in),
        .Bout(rest_out),
        .R(rest_salida)
    );
    producto_logico PROD(
        .A(numero1),
        .B(numero2),
        .S(prod_l)
    );
    suma_logica SUMA(
        .A(numero1),
        .B(numero2),
        .S(suma_l)
    );
    complemento COMPL(
        .A(numero1),
        .B(numero2),
        .S(compl)
    );
    always @(*) begin
        case (codigo_operacion)
            3'b001: begin // Suma
                out = sum_out;
                salida = sum_salida;
            end
            3'b010: begin // Resta
                out = rest_out;
                salida = rest_salida;
            end
            3'b100: begin // Suma logica
                out = suma_l;
                salida = 1'b0;
            end
            3'b101: begin // Producto logico
                salida = prod_l;
            end
            3'b110: begin // Complemento de A
                salida = compl;
            end
            default: begin
                out = 1'b0;
                salida = 1'b0;
            end
        endcase
    end
endmodule