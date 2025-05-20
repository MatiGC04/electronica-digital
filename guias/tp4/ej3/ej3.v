module menor(
    input [3:0] A,
    input [3:0] B,
    output reg menor
);
    always @(*) begin
        if (A < B) begin
            menor = 1'b1;
        end else begin
            menor = 1'b0;
        end
    end
endmodule

module igual(
    input [3:0] A,
    input [3:0] B,
    output reg igual
);
    always @(*) begin
        if (A == B) begin
            igual = 1'b1;
        end else begin
            igual = 1'b0;
        end
    end
endmodule

module mayor(
    input [3:0] A,
    input [3:0] B,
    output reg mayor
);
    always @(*) begin
        if (A > B) begin
            mayor = 1'b1;
        end else begin
            mayor = 1'b0;
        end
    end
endmodule

module comparador(
    input [3:0] A,
    input [3:0] B,
    output menor,
    output igual,
    output mayor
);
    menor menor_inst (
        .A(A),
        .B(B),
        .menor(menor)
    );

    igual igual_inst (
        .A(A),
        .B(B),
        .igual(igual)
    );

    mayor mayor_inst (
        .A(A),
        .B(B),
        .mayor(mayor)
    );
endmodule