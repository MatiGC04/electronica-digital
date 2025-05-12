`default_nettype none
`timescale 100 ns / 10 ns


module ej4_tb();
// Define el módulo del testbench llamado `eje1_tb`.

parameter DURATION = 100;
// Parámetro que define la duración total de la simulación en unidades de tiempo.

reg reset;
// Señal de tipo `reg` para simular un reset del circuito bajo prueba.

// --- PARTE FIJA (SIEMPRE USAR) ---
// Declaración de señales de entrada (reg) y salida (wire)
reg A;
reg B;
reg C;
reg D;
reg E;
reg F;

wire f;
wire g;
wire h;

wire fb;
wire gb;
wire hb;

// Como tenemos 6 entradas, el máximo valor que puede tomar es 2^6 - 1 = 63
// por eso se define un registro de 63 bits
reg[63:0] n;


// Instanciación del módulo bajo prueba
ej4 UUT(
    .A(A),
    .B(B),
    .C(C),
    .D(D),
    .f(f),
    .g(g),
    .h(h),
    .fb(fb),
    .gb(gb),
    .hb(hb)
);

// --- PARTE FIJA (SIEMPRE USAR) ---
initial begin
  $dumpfile("ej4_tb.vcd");
  // filepath: c:\Users\Matias\Documents\electronica-digital\guias\tp2\ej3\expression_w_boole_tb.v
  // Crea un archivo de salida llamado `eje2_tb.vcd` para almacenar la traza de la simulación.

  $dumpvars(0, ej4_tb);
  // Especifica que se monitorearán todas las variables del módulo `eje1_tb`.

  $display("Iniciando simulación..."); 
  reset = 1;
  // Activa la señal de reset al inicio de la simulación.

  #1;
  // Espera 1 unidad de tiempo (100 ns en este caso).

  reset = 0;
  $display("Simulacion en proceso...");

  // Desactiva la señal de reset.


  for (n = 0; n < 64; n++) begin

    {A, B, C, D, E, F} = n;
    // Asinga el valor binario que toma n, y lo segmenta en un vector de
    // 4 bits y va asignando cada uno a A, B, C y D.
    // Por ejemplo,
    // Si n = 1, entonces A = 0, B = 0, C = 0, D = 1.
    // Recordar se asigna de derecha a izquierda.

    #1;
    // Espera 1 unidad de tiempo (100 ns) antes de pasar al siguiente bit.
  end

  // Finalizar simulación
  #(DURATION) $display("Fin de la simulación");
  // Espera el tiempo definido por `DURATION` y muestra un mensaje indicando el fin de la simulación.

  $finish;
  // Finaliza la simulación.
end

endmodule
// Fin del módulo del testbench.