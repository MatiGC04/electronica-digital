/// JK con reset y set asincrónicos.
module JK(
    input wire J,
    input wire K,
    input wire clk,
    input wire S,
    input wire R,
    output reg Q = 0,
    output wire Qn
)
    always @(posedge clk, posedge S, posedge R) begin
        if(R) Q <= 0;
        if(S) Q <= 1;
            case({J,K})
            1'b10: Q <= 1;
            1'b01: Q <= 0;
            1'b11: Q <= ~Q;
            endcase
    end

    assign Qn = ~Q;

endmodule