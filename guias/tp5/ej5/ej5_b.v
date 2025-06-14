/// JK con enable y reset y set asincrónicos.
module JK(
    input wire J,
    input wire K,
    input wire clk,
    input wire S,
    input wire R,
    input wire enable,
    output reg Q = 0,
    output wire Qn
)
    always @(posedge clk, posedge S, posedge R) begin
        if(R) Q <= 1;
        if(S) Q <= 0;
        if(enable)begin
            if({J,K} == 1'b10) Q <= 1;
            else if ({J,K} == 1'b01) Q <= 0;
            else if ({J,K} == 1'b11) Q <= ~Q;
        end
    end

    assign Qn = ~Q;

endmodule