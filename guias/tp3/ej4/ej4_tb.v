// FIJO
`default_nettype none
`timescale 100 ns / 10 ns

module ej4_tb(); // <--- El nombre del módulo coincide con el archivo

parameter DURATION = 100;
reg reset;

reg [3:0] BN;
wire [3:0] BCD;
wire [3:0] G;
wire [6:0] H;

binary_2_bcd UUT (
    .BN(BN),
    .BCD(BCD)
);
binary_2_gray UUT2 (
    .BN(BN),
    .G(G)
);
bin_2_hamming_pair UUT3 ( // <--- Ojo: el nombre correcto es bin_2_hamming_pair
    .BN(BN),
    .H(H)
);

initial begin
    $dumpfile("ej4_tb.vcd");
    $dumpvars(0, BN, BCD, G, H);

    reset = 1;
    #1;
    reset = 0;
    // porque es de 0 a 9
    /*
    for (integer i = 0; i < 10; i = i + 1) begin
        BN = i;
        #1;
        $display("BN = %b --> BCD = %b, Gray = %b, Hamming = %b", BN, BCD, G, H);
    end
    */
    // otra forma de usar el for

    for (BN = 0; BN < 10; BN = BN + 1) begin
        #1;
        $display("BN = %b --> BCD = %b, Gray = %b, Hamming = %b", BN, BCD, G, H);
    end
    $display("Simulación completada.");
    #(DURATION) $finish;
end

endmodule