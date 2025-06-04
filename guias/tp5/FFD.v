module FFD_async_en(
    input wire D,
    input wire clk,
    input wire, reset,
    input wire set,
    input wire en,
    output reg Q,
    output wire Qn


);
assign Qn = ~Q;

always @(posedge clk or posedge reset or posedge set)begin
    if(reset)
        Q <= 1b0;
    else if(set)
        Q <= 1'b0;
    else if (en)



endmodule