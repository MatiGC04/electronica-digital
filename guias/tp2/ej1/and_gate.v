/*
 * Módulo principal que implementa una compuerta AND
 *
 * Este módulo tiene dos entradas (A, B) y una salida (X)
 * La salida X será 1 lógico sólo cuando ambas entradas A Y B sean 1
 *
 * Diagrama de pines:
 *       _____
 * A ---|     |
 *      | AND |--- X
 * B ---|_____|
 */

// Definición del módulo and_gate
module and_gate(
    // Declaración de puertos:
    input wire A,   // Entrada A (1 bit), tipo wire (conexión física)
    input wire B,   // Entrada B (1 bit), tipo wire
    output wire X   // Salida X (1 bit), tipo wire
);
    // Lógica del circuito:
    // La asignación continua (assign) hace que X siempre sea igual a A AND B
    // El operador & es el AND bit a bit en Verilog
    assign X = (A & B);
    /*
     * En hardware, esto se traduce a:
     * - Una compuerta AND física conectada a las señales A y B
     * - La salida de esa compuerta va directamente a X
     * - No hay elementos de memoria (flip-flops) ya que es pura lógica combinacional
     */

endmodule