// FIJO
`default_nettype none
`timescale 100 ns / 10 ns

module FF_D_tb();

// FIJO
parameter DURATION = 100;
reg reset;


//instancio las entradas y salidas
reg sD;
reg sclk;
wire sQ;
wire sQn;
// enlazo las entradas y salidas del flip-flop JK
FF_D UUT (
    .clk(sclk),
    .D(sD),
    .Q(sQ),
    .Qn(sQn)
);

initial begin
    $dumpfile("FF_D_tb.vcd");
    $dumpvars(0, sclk, sD, sQ, sQn);
    reset = 1;
    #1;
    reset = 0;
    // asumo que sQ0 se inicializa en 1'b0
    sQ = 1'b0;

    sclk = 1'b1;

    for(integer n = 0; n<4; n++) begin
        D = n; // asigno los valores de j, k y Q0
        #5;
        sQ= sQn; // actualizo Q0 con el valor de Q1
    end


    #(DURATION) $finish;
end

endmodule