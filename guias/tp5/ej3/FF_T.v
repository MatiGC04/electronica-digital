module FF_T(
    input wire T,
    input wire clk,
    output reg Q,
    output wire Qn
)
    always @(posedge clk)begin
        case(T):
            1'b1: Q = ~Q;
            1'b0: Q = Q;
        endcase
    end
    assign Qn = ~Q;

endmodule