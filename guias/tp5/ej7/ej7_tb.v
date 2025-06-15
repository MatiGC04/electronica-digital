`timescale 1ns / 1ps

module tb_shift_reg_4b_sp();

  // Señales
  reg clk;
  reg B;
  wire [3:0] sQ;

  // Instancia del módulo bajo prueba
  shift_reg_4b_sp dut (
    .B(B),
    .sclk(clk),
    .sQ(sQ)
  );

  // Clock: periodo de 10ns
  initial clk = 0;
  always #5 clk = ~clk;

  // Estímulos
  initial begin
    $display("Tiempo\tB\t sQ");
    $monitor("%4dns\t%b\t %b", $time, B, sQ);

    // Inicialización
    B = 0;

    // Reset: si tu diseño lo requiere

    // Cargar 4 bits: b3 b2 b1 b0 = 1 0 1 1 (por ejemplo)
    // Deben entrar como: b0 primero, luego b1, luego b2, luego b3

    // b0 = 1
    #3 B = 1; #10;

    // b1 = 1
    #3 B = 1; #10;

    // b2 = 0
    #3 B = 0; #10;

    // b3 = 1
    #3 B = 1; #10;

    // Esperar un poco más para ver salida estable
    #20;

    $finish;
  end

endmodule
