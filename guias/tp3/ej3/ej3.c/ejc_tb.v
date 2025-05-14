// FIJO
`default_nettype none
`timescale 100 ns / 10 ns

module ejc_tb();

// FIJO
parameter DURATION = 100;
reg reset;

reg [7:0] D;
wire [3:0] BCD;
wire Gs;
ejc UUT (
    .D(D),         // Entrada decimal codificada 1-de-10
    .BCD(BCD),
    .Gs(Gs)      // Salida en BCD (número binario de 0 a 9)
    // ...
);

initial begin
    $dumpfile("ejc_tb.vcd");
    $dumpvars(0, ejc_tb);

    reset = 1;
    #1;
    reset = 0;
    //quiero probar todos los casos del 1 al 10 y que los muestre en un $display

    for (integer i = 0; i <8; i++) begin
        D = i;
        #1;
        //$display("Input D = %d, Output BCD = %b", D, BCD);
        // $display("Input BCD = %b, Output D = %b ()", BCD, i, D);
        $display(" D = %0d /%b --> BCD = %b",i,D, BCD);

    end


    #(DURATION) $finish;
end

endmodule