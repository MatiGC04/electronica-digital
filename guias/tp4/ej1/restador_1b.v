module restador_1b(
    input A,
    input B,
    input Bin
    output Bout,
    output R

);
    assign R = A ^ B ^ Bin;
    assign Bout = B&Bin | ~A&Bin | ~A&B;
endmodule