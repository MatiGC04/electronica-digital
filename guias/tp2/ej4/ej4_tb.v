// --- PARTE FIJA (SIEMPRE USAR) ---
`default_nettype none
// Deshabilita la inferencia automática de tipos de señales para evitar errores comunes.

`timescale 100 ns / 10 ns
// Define la escala de tiempo para la simulación:
// - La unidad de tiempo es 100 ns.
// - La precisión de los retardos es de 10 ns.

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

wire f;
wire g;
wire h;

wire fb;
wire gb;
wire hb;


integer n;
// Variable entera para controlar el bucle de simulación.;



// Instanciación del módulo bajo prueba
ej4 UUT(
    .A(A),  // Conecta la señal `A` del testbench al puerto `A` del módulo.
    .B(B),  // Conecta la señal `B` del testbench al puerto `B` del módulo.
    .C(C),  // Conecta la señal `C` del testbench al puerto `C` del módulo.
    .D(D),  // Conecta la señal `D` del testbench al puerto `D` del módulo.
    .f(f), // Conecta la señal de salida `X` del módulo al puerto `f` del testbench.
    .g(g), // Conecta la señal de salida `Y` del módulo al puerto `g` del testbench.
    .h(h)  // Conecta la señal de salida `Z` del módulo al puerto `h` del testbench.
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


  for (n = 0; n < 16; n++) begin

    {A, B, C, D} = n;
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