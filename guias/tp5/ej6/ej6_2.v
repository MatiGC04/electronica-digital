/*
-------------------------------------------------------------------------------
EXPLICACIÓN SOBRE LATCH D EN VERILOG:

- Un latch D es un elemento de almacenamiento que copia la entrada a la salida
  mientras la señal de enable está activa (nivel alto). Cuando enable está inactivo,
  la salida mantiene su valor anterior.

- NO es correcto instanciar 4 flip-flops D (como FF_D) para implementar un latch,
  porque los flip-flops D responden al flanco de un clock, no al nivel de enable.

- Tampoco es correcto usar un bloque generate con if(enable) para lógica dinámica,
  ya que generate solo existe en tiempo de síntesis y no controla el comportamiento
  en tiempo de ejecución.

- La forma correcta de modelar un latch D de 4 bits en Verilog es usando un bloque
  always @(*) y una asignación condicional sobre enable, como se muestra abajo.

- Si realmente quisieras instanciar 4 latches D, deberías tener un módulo Latch_D
  y luego instanciarlo 4 veces, pero en la práctica se usa el always @(*) como aquí.

-------------------------------------------------------------------------------
*/

module R_4B_LatchD(
    input wire [3:0] B,
    output reg [3:0] sQ,
    input wire enable
);
    always @(*) begin
        if (enable)
            sQ = B;
        // else: mantiene el valor anterior (comportamiento de latch)
    end
endmodule