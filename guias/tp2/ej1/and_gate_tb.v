/*
 * Testbench para la compuerta AND
 *
 * Un testbench es un módulo Verilog que:
 * 1. Genera estímulos (valores de entrada) para el circuito bajo prueba
 * 2. Monitorea las salidas
 * 3. No tiene entradas/salidas reales - es solo para simulación
 */


//parte fija
`default_nettype none
`define VCD_OUTPUT "and_gate.vcd" //aca solo cambiar al nombre del archivo .v (sin cambiar .vcd)
`define DUMPSTR(x) "x.vcd"
`timescale 100 ns / 10 ns

module and_gate_tb();
    // Declaración de señales:
    // Los 'reg' son variables que podemos cambiar en el testbench
    reg A;  // Simula la entrada A del circuito
    reg B;  // Simula la entrada B del circuito

    // Los 'wire' son conexiones que solo pueden ser leídas
    wire X; // Conecta a la salida X del circuito bajo prueba

/*
* Instanciación del módulo bajo prueba (Unit Under Test - UUT)
* Conectamos las señales del testbench a los puertos del módulo:
* .A(A) significa: conecta el puerto A del módulo a la señal A del testbench
*/

and_gate UUT ( // Asegúrate de que el nombre del módulo coincida con el definido en tu diseño
    .A(A),
    .B(B),
    .X(X)
);

/*
* Bloque initial: Secuencia de estímulos que se ejecuta una vez al inicio
* Aquí generamos todas las combinaciones posibles de A y B
*/

initial begin
    //parte fija
    $dumpfile("and_gate_tb.vcd"); // Nombre del archivo test bentch
    $dumpvars(0, and_gate_tb); // Nombre del modulo test bench

        // Inicialización de todas las entradas
        A = 0;
        B = 0;

        // Espera inicial para que la simulación se estabilice
        #10;  // Espera 10 unidades de tiempo (10ns según el timescale)

        // Caso de prueba 2: A=0, B=1
        A = 0; B = 1;
        #10;

        // Caso de prueba 3: A=1, B=0
        A = 1; B = 0;
        #10;

        // Caso de prueba 4: A=1, B=1
        A = 1; B = 1;
        #10;

        // Finaliza la simulación
        $finish;  // Comando especial de Verilog para terminar simulación
end


endmodule