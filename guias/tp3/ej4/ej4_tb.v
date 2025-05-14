// FIJO
`default_nettype none
`timescale 100 ns / 10 ns

module binary_2_bcd_tb();

// FIJO
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
binary_2_hamming_pair UUT3 (
    .BN(BN),
    .H(H)
);

initial begin
    $dumpfile("ej4_tb.vcd"); // Archivo para la simulación
    $dumpvars(0, BN, BCD, G, H); // Variables a mostrar en la simulación

    reset = 1;
    #1;
    reset = 0;
    // Prueba todas las combinaciones de entrada
    for (integer i = 0; i < 16; i = i + 1) begin
        BN = i; // Asigna el valor del contador a la entrada BN
        #1; // Espera 1 unidad de tiempo
        $display("BN = %b --> BCD = %b, Gray = %b, Hamming = %b", BN, BCD, G, H);
    end
    $display("Simulación completada.");
    #(DURATION) $finish; // Finaliza la simulación
end


endmodule