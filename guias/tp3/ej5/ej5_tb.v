`default_nettype none
`timescale 1ns / 1ns

module ej5_tb();

    reg [3:0] I;      // Entradas para el mux
    reg [1:0] S;      // Selector
    wire F;           // Salida del mux

    reg D;
    reg [3:0] d;
    wire [3:0] f;
    wire [3:0] f_top;

    // Instancia del circuito top
    mux_demux_top UUT_top (
        .D(d),
        .S(S),
        .f(f_top)
    );
    // Instancia del multiplexor
    mux_4_1 UUT_mux (
        .I(I),
        .S(S),
        .F(F)
    );

    // Instancia del demultiplexor
    demux_1_4 UUT_demux (
        .S(S),
        .D(D),
        .f(f)
    );



    initial begin
        $dumpfile("ej5_tb.vcd");
        $dumpvars(0, I, S, F, D, d, f);

        // Prueba del MUX
        $display("Prueba del MUX 4:1");
        for (integer i = 0; i < 16; i = i + 1) begin
            I = i;
            for (integer j = 0; j < 4; j = j + 1) begin
                S = j;
                #1;
                $display("MUX: I = %b, S = %b, F = %b", I, S, F);
            end
        end

        // Prueba del DEMUX
        $display("Prueba del DEMUX 1:4");
        for (integer j = 0; j < 4; j = j + 1) begin
            S = j;
            D = 1'b1;
            #1;
            $display("D = %b, S = %b, f = %b", D, S, f);
            D = 1'b0;
            #1;
            $display(": D = %b, S = %b, f = %b", D, S, f);
        end
        // prueba enunciado d)
        d = 4'b0110;

        $display("Prueba del circuito mux_demux_top con D = %b", d);

        // Secuencia de S según la gráfica (puedes ajustar los tiempos si lo deseas)
        S = 2'b00; #1; $display("S = %b, f = %b", S, f_top);
        S = 2'b01; #1; $display("S = %b, f = %b", S, f_top);
        S = 2'b10; #1; $display("S = %b, f = %b", S, f_top);
        S = 2'b11; #1; $display("S = %b, f = %b", S, f_top);
        S = 2'b11; #1; $display("S = %b, f = %b", S, f_top);
        S = 2'b11; #1; $display("S = %b, f = %b", S, f_top);
        S = 2'b01; #1; $display("S = %b, f = %b", S, f_top);
        S = 2'b00; #1; $display("S = %b, f = %b", S, f_top);
        S = 2'b10; #1; $display("S = %b, f = %b", S, f_top);
        S = 2'b01; #1; $display("S = %b, f = %b", S, f_top);
        S = 2'b11; #1; $display("S = %b, f = %b", S, f_top);
        S = 2'b00; #1; $display("S = %b, f = %b", S, f_top);

        $display("Fin de la prueba mux_demux_top");
        $finish;

    end

endmodule