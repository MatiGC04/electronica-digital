
// --- PARTE FIJA (SIEMPRE USAR) ---
`default_nettype none
// Deshabilita la inferencia automática de tipos de señales para evitar errores comunes.

`timescale 100 ns / 10 ns
// Define la escala de tiempo para la simulación:
// - La unidad de tiempo es 100 ns.
// - La precisión de los retardos es de 10 ns.

module nor_gate_tb();
// Define el módulo del testbench llamado `nor_gate_tb`.

parameter DURATION = 100;
// Parámetro que define la duración total de la simulación en unidades de tiempo.

reg reset;
// Señal de tipo `reg` para simular un reset del circuito bajo prueba.

// --- PARTE FIJA (SIEMPRE USAR) ---
// Declaración de señales de entrada (reg) y salida (wire)

reg A;
reg B;
reg C;

wire X;


integer n;
// Variable entera para usar como índice en el bucle `for`.

// Segun la grafica del ejercicio se puede ver que cada variable A,B,C recibe 18 estimulos
// entonces se definen los registros i,j,k de 19 bits
// para poder simular los 19 estimulos de cada variable 
reg [18:0] i;


reg [18:0] j;


reg [18:0] k;


// Instanciación del módulo bajo prueba
nor_gate UUT (
    .A(A),  // Conecta la señal `A` del testbench al puerto `A` del módulo.
    .B(B),  // Conecta la señal `B` del testbench al puerto `B` del módulo.
    .C(C),  // Conecta la señal `C` del testbench al puerto `C` del módulo.
    .X(X)   // Conecta la señal `X` del módulo al testbench para monitoreo.
   
);

// --- PARTE FIJA (SIEMPRE USAR) --
initial begin
  $dumpfile("nor_gate_tb.vcd");
  $dumpvars(0, nor_gate_tb);
  // o tambien  
  //$dumpvars(0, A, B, C, X);
  
  
 

  reset = 1;
  // Activa la señal de reset al inicio de la simulación.

  #1;
  // Espera 1 unidad de tiempo (100 ns en este caso).

  reset = 0;
  // Desactiva la señal de reset.

  // Generar estímulos para las entradas
  i = 19'b0111111000011110000;
  // Asigna un patrón binario de 19 bits a la señal `i` (estímulos para `A`).

  j = 19'b0000111100001111000;
  // Asigna un patrón binario de 19 bits a la señal `j` (estímulos para `B`).

  k = 19'b0010010001000100010;
  // Asigna un patrón binario de 19 bits a la señal `k` (estímulos para `C`).

  for (n = 19; n >= 0; n = n - 1) begin
    // Bucle para recorrer los 9 bits de las señales `i` y `j`.

    A = i[n];
    // Asigna el bit `n` de `i` a la señal `A`.

    B = j[n];
    // Asigna el bit `n` de `j` a la señal `B`.

    C = k[n];

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