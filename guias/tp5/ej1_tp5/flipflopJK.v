module flipflopJK(
    input wire clk,
    input wire j,
    input wire k,
    input Q0,
    output reg Q1,
);

    always @(posedge clk)begin
        case(j, k)
            2'b00: Q1 = Q0;
            2'b01: Q1 = 1'b0;
            2'b10: Q1 = 1'b1;
            2'b11: Q1 = ~Q0;
        default: Q1 = 1'bx;
        endcase
    end

endmodule