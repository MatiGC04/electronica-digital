module FF_T(
    input wire T,
    input wire clk,
    output reg Q = 0,
    output wire Qn
);
    //initial Q = 0; // Solo para simulación
    always @(posedge clk) begin
        case(T)
            1'b1: Q <= ~Q;
            1'b0: Q <= Q;
        endcase
    end
    assign Qn = ~Q;

endmodule