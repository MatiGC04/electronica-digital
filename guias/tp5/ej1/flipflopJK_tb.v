// FIJO
`default_nettype none
`timescale 100 ns / 10 ns

module flipflopJk_tb();

// FIJO
parameter DURATION = 100;
reg reset;


//instancio las entradas y salidas
wire sclk;
wire sj;
wire sk;
reg sQ0;
reg sQ1;
// enlazo las entradas y salidas del flip-flop JK
flipflopjk UUT (
    .clk(sclk),
    .j(sj),
    .k(sk),
    .Q0(sQ0),
    .Q1(sQ1)
);

initial begin
    $dumpfile("flipflopJK_tb.vcd");
    $dumpvars(0, sclk, sj, sk, sQ0, sQ1);
    reset = 1;
    #1;
    reset = 0;
    // asumo que sQ0 se inicializa en 1'b0
    sQ0 = 1'b0;

    sclk = 1'b1;

    for(integer n = 0; n<4; n++) begin
        {j, k} = n; // asigno los valores de j, k y Q0
        #5;
        sQ0= sQ1; // actualizo Q0 con el valor de Q1
    end


    #(DURATION) $finish;
end

endmodule