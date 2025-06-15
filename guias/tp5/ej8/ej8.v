module shift_reg_bidir_4b(
    input wire d,         // Entrada serie
    input wire clk,
    input wire direccion, // 0: derecha, 1: izquierda
    output wire [3:0] out // out[3]=Q3 (LSB), out[0]=Q0 (MSB)
);
    wire [3:0] q_next;

    // Lógica combinacional para seleccionar el dato de entrada de cada FF_D
    // Según la figura:
    // Si direccion=1 (derecha):
    //   - El dato serie 'd' entra por Q0
    //   - Q1 toma el valor de Q0
    //   - Q2 toma el valor de Q1
    //   - Q3 toma el valor de Q2
    // Si direccion=0 (izquierda):
    //   - El dato serie 'd' entra por Q3
    //   - Q2 toma el valor de Q3
    //   - Q1 toma el valor de Q2
    //   - Q0 toma el valor de Q1

    assign q_next[3] = direccion ? out[2] :      d;
    assign q_next[2] = direccion ? out[1] : out[3];
    assign q_next[1] = direccion ? out[0] : out[2];
    assign q_next[0] = direccion ? d      : out[1];

    // Instanciación de los 4 flip-flops D
    // Cada FF_D toma como entrada el valor calculado por q_next[x]
    FF_D ff3(.D(q_next[3]), .clk(clk), .Q(out[3]), .Qn()); // Q3 (LSB)
    FF_D ff2(.D(q_next[2]), .clk(clk), .Q(out[2]), .Qn()); // Q2
    FF_D ff1(.D(q_next[1]), .clk(clk), .Q(out[1]), .Qn()); // Q1
    FF_D ff0(.D(q_next[0]), .clk(clk), .Q(out[0]), .Qn()); // Q0 (MSB)


endmodule