module RAM_16X4 (
    input wire clk, reset, set, write_enable, read_enable,
    input wire [3:0] addr, data_in,
    output wire [3:0] data_out
);
    wire [15:0] enable_lines;
    wire [3:0] q_lines [15:0];

    assign enable_lines = (wire_enable) ? (16'b1 << addr) : 16'b0;

    /*
    si tengo 16'b1 <<addr
    o
    0000000000000001 <<addr
    y corre la posicion del 1 de acuerdo a la direccion de addr

    */
    genvar i;
    generate
        for(i=0; i<16; i++) begin : memory_cells
            REG_PP_4bit reg_inst(
                .clk(clk),
                .reset(reset),
                .set(set),
                .enable(enable_lines[i]),
                .D_in(data_in),
                .Q(q_lines[i])
            )
        end
    endgenerate
    // Multiplexor para seleccionar salida de lectura
    // siempre voy a tener n multiplexores, con n = n° de salidas.
    assign data_out = (read_enable) ? q_lines(addre) : 4'bz; // alta impedancia
endmodule