module FFD(
    input wire D,
    input wire clk,
    input wire reset,
    input wire set,
    //input wire enable,
    output wire Q, Qn

);

    reg salida = 0;
    always @(posedge clk or posedge reset or posedge set) begin
        if (reset) begin
            salida <= 0;
        end else if (set) begin
            salida <= 1;
        end else if (enable) begin
            salida <= D;
        end
    end
endmodule