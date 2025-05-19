`include  "..\ej1\sumador_1b.v"
`include  "..\ej1\restador_1b.v"

module sumador_4b(
    input  [3:0] A,
    input  [3:0] B,
    //input Cin,
    output [3:0] S,
    output       Cout
);
    wire C1, C2, C3;
    sumador_1b s0(.A(A[0]), .B(B[0]), .Cin(1'b0), .S(S[0]), .Cout(C1)); //no es necesario el carry inicial, pq siempre es 0
    sumador_1b s1(.A(A[1]), .B(B[1]), .Cin(C1),  .S(S[1]), .Cout(C2));
    sumador_1b s2(.A(A[2]), .B(B[2]), .Cin(C2),  .S(S[2]), .Cout(C3));
    sumador_1b s3(.A(A[3]), .B(B[3]), .Cin(C3),  .S(S[3]), .Cout(Cout));
endmodule

module restador_4b(
    input [3:0] A,
    input [3:0] B,
    //input Bin,
    output [3:0] R,
    output Bout
);
    wire C1, C2, C3;
    /*
    if (A[0]==1'b0 && B[0]==1'b1) begin
        assign Bin = 1'b1;
    end
    */
    restador_1b r0(.A(A[0]), .B(B[0]), .Bin(1'b0), .R(R[0]), .Bout(C1));
    restador_1b r1(.A(A[1]), .B(B[1]), .Bin(C1),  .R(R[1]), .Bout(C2));
    restador_1b r2(.A(A[2]), .B(B[2]), .Bin(C2),  .R(R[2]), .Bout(C3));
    restador_1b r3(.A(A[3]), .B(B[3]), .Bin(C3),  .R(R[3]), .Bout(Bout));
endmodule