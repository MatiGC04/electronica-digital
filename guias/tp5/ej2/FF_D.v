/*
tiene solo una entrada de datos (D). El flip- flop D
transfiere los datos entre la entrada y su salida
después de un pulso de reloj. Los flip-flopsD se
construyen a partir de un flip-flop SR conectando un
inversor entre las entradas S y R. */

//caso FF tipo D sin set ni reset
module FF_D(
    input wire D,
    input wire clk,
    output reg Q = 0;
    output wire Qn;
);
    always @(posedge clk) begin
        Q <= D;
    end
    assign Qn = ~Q;
endmodule