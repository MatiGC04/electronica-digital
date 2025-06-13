/*
1. Diseñe e implemente en Verilog un flip-flop JK. Analice y compruebe el correcto
funcionamiento de cada circuito mediante simulación de un testbench.
*/

module FF_JK(
    input wire clock,
    input wire j,
    input wire k,
    //input wire enable, // lo necesito como estado inicial,
    output reg Q, // estado actual (segun la tabla seria Q(t+1))
    output wire Qn, // complemento
)
    // reg salida = 1'b0; //estado default va en el tb
    wire [1:0] entradas = {j,k};
    always @(posedge clock)begin
        if(entradas == 2'b00){
            Q <=  Q;
        }
        else if(entradas == 2'b01){
            Q <= 1'b0 ;
        }else if(entradas == 2'b10){
            Q <= 1'b1;
        }else if(entradas == 2'b11){
            Q <= ~Q;
        }
    end

    /* O con la ecuación lógica
    always @(posedge clock) begin
        Q <= (j & ~Q) | (~k & Q);
    end
    */
    assign Qn = ~Q;

endmodule