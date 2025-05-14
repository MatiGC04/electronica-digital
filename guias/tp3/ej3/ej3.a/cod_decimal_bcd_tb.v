// FIJO
`default_nettype none
`timescale 100 ns / 10 ns

module cod_decimal_bcd_tb();

// FIJO
parameter DURATION = 100;
reg reset;
// Cambiar el tamaño de los registros según la cantidad de entradas
// N = 2^n - 1
reg [9:0] D;
wire [3:0] BCD;

cod_decimal_bcd UUT (
    .D(D),         // Entrada decimal codificada 1-de-10
    .BCD(BCD)      // Salida en BCD (número binario de 0 a 9)
    // ...
);

initial begin
    $dumpfile("cod_decimal_bcd_tb.vcd");
    $dumpvars(0, cod_decimal_bcd_tb);

    reset = 1;
    #1;
    reset = 0;
    //quiero probar todos los casos del 1 al 10 y que los muestre en un $display

    for (integer i = 0; i <10; i++) begin
        D = 10'b1 << i; // Desplazo el '1' a la posición correspondiente
        #1;
        //$display("Input D = %d, Output BCD = %b", D, BCD);
        $display("Input D = %b (posicion %0d), Output BCD = %b", D, i, BCD);

    end










    #(DURATION) $finish;
end

endmodule