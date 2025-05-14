// FIJO
`default_nettype none
`timescale 100 ns / 10 ns

module cod_bcd_decimal_tb();

// FIJO
parameter DURATION = 100;
reg reset;
// Cambiar el tamaño de los registros según la cantidad de entradas
// N = 2^n - 1
reg [3:0] BCD;
wire [9:0] D;

cod_bcd_decimal UUT (
    .D(D),         // Entrada decimal codificada 1-de-10
    .BCD(BCD)      // Salida en BCD (número binario de 0 a 9)
    // ...
);

initial begin
    $dumpfile("cod_bcd_decimal_tb.vcd");
    $dumpvars(0, cod_bcd_decimal_tb);

    reset = 1;
    #1;
    reset = 0;
    //quiero probar todos los casos del 1 al 10 y que los muestre en un $display

    for (integer i = 0; i <10; i++) begin
        BCD = i;
        #1;
        //$display("Input D = %d, Output BCD = %b", D, BCD);
        // $display("Input BCD = %b, Output D = %b ()", BCD, i, D);
        $display(" BCD = %b --> D = %0d / %b", BCD, i, D);

    end










    #(DURATION) $finish;
end

endmodule