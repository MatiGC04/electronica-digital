`timescale 1ns/1ps

module FF_T_tb();

// Entradas
reg sclk;
reg sT;

// Salidas
wire sQ;
wire sQn;

FF_T UUT(
    .T(sT),
    .clk(sclk),
    .Q(sQ),
    .Qn(sQn)
);

// Generador de reloj: periodo de 10 ns
always #5 sclk = ~sclk;

initial begin
  $dumpfile("FF_T_tb.vcd");
  $dumpvars(0, FF_T_tb);

  sclk = 0;
  sT = 0;

  // Secuencia de prueba
  #12 sT = 1;   // Cambia a 1 antes del siguiente flanco
  #10 sT = 0;   // Cambia a 0 después de un ciclo
  #10 sT = 1;   // Cambia a 1 después de otro ciclo
  #10 sT = 0;   // Cambia a 0 después de otro ciclo

  $finish;
end

endmodule