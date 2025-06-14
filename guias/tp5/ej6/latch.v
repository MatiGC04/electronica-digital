module latch(
    input d,
    input enable,
    output reg q = 0
)
    /// recordar q latch es combinacional y no secuencial por eso
    // q = n y  no q <= n
    always @(*) begin
        if (enable) begin
            q = d; // Si enable está activo, copia d a q
        end
        // Si enable no está activo, q mantiene su valor anterior (comportamiento de latch)
    end
endmodule