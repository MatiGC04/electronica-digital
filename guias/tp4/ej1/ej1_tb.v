`timescale 1ns/1ps
`include "ej1.v"
`include "sumador_1b.v"
`include "restador_1b.v"
`include "producto_logico.v"
`include "suma_logica.v"
`include "complemento.v"

module ej1_tb;

    reg a, b, cin;
    reg [2:0] op;
    wire result;

    // Instancia de la ALU
    ALU dut (
        .numero1(a),
        .numero2(b),
        .codigo_operacion(op),
        .in(cin),
        .salida(result)
    );

    initial begin
        $display("op | cin | a | b | result");
        $display("-------------------------");

        // Suma: 1 + 0 + 0 = 1
        op = 3'b001; cin = 0; a = 1; b = 0; #10;
        $display("%b |  %b  | %b | %b |   %b", op, cin, a, b, result);

        // Resta: 1 - 1 - 0 = 0
        op = 3'b010; cin = 0; a = 1; b = 1; #10;
        $display("%b |  %b  | %b | %b |   %b", op, cin, a, b, result);

        // Suma lógica (OR): 1 | 0 = 1
        op = 3'b100; cin = 0; a = 1; b = 0; #10;
        $display("%b |  %b  | %b | %b |   %b", op, cin, a, b, result);

        // Producto lógico (AND): 1 & 1 = 1
        op = 3'b101; cin = 0; a = 1; b = 1; #10;
        $display("%b |  %b  | %b | %b |   %b", op, cin, a, b, result);

        // Complemento de A: ~1 = 0
        op = 3'b110; cin = 0; a = 1; b = 0; #10;
        $display("%b |  %b  | %b | %b |   %b", op, cin, a, b, result);

        // Default: código inválido
        op = 3'b000; cin = 0; a = 0; b = 0; #10;
        $display("%b |  %b  | %b | %b |   %b", op, cin, a, b, result);

        $finish;
    end

endmodule