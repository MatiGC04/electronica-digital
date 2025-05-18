module sumador_1b(
    input A,
    input B,
    input Cin
    output Cout,
    output S
);
    assign S = Cin ^ (A^B)
    assign Cout = ( Cin & (B | A) ) | (A & B);

endmodule