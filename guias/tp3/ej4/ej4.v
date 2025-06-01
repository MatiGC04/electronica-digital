/*
a. Diseñe un conversor de código binario natural de 4 bits a código BCD;
*/
module binary_2_bcd (
    input [3:0] BN,
    output reg [3:0] BCD // Entrada de 4 bits
);

    always @(*) begin
        if( BN <= 4'd9)
            BCD = BN; //como es solo una unica instruccion no es necesario el begin-end
        else
            BCD = 4'bxxxx;
    end
endmodule

module binary_2_gray (
    input [3:0] BN,
    output reg [3:0] G

);
    always @(*) begin
        if( BN <= 4'd9) begin
            // Como pasar de BN->G
            /*
            1 - El bit MSB se mantiene
            2 - De izq a derecha aplicamos suma binaria para cada par adyacente de bits (el acarreo se descarta)
            por ejemplo =  0011 -> 0 se fija, 0+0 = 0, 0+1 = 1, 1+1 = 0 (1 de acarreo descartado)
                        --> 0010
            para esto utilizaremos el operador XOR ( ^ ) que devuelve 1 si son diferentes
            recordar que eun reg de bits
            se ordena asi:
            G[LSB _ _ _ MSB]
            */
            G[3] = BN[3]; //MSB
            G[2] = BN[3] ^ BN[2];
            G[1] = BN[2] ^ BN[1];
            G[0] = BN[1] ^ BN[0];

        end else begin
            G = 4'bxxxx;

        end
    end
endmodule


/*
Como se nos aclara que son 4 bits entonces -> segun la formula
n + p <= 2^p - 1, en este caso n=4, si le damos valores a p llegamos a que
p=3, entonces tenemos 4 bits de datos y 3 de paridad.
*/
module bin_2_hamming_pair(
    input [0:3] BN,
    output reg [6:0] H

);

    always @(*) begin
        if( BN< 4'd16)begin
        // Como obtener BN->H
        /*
        Sea BN = d1 d2 d3 d4
        pero los indices de BN ES 0 a 3
        p1 = d1 + d2 + d4
        p2 = d1 + d3 + d4
        p3 = d2 + d3 + d4
        entonces defino los p1, p2 y p3 aplicando  xor entre los d_i
        */
            H[0] = BN[0] ^ BN[1] ^ BN[3]; //p3
            H[1] = BN[0] ^ BN[2] ^ BN[3]; //p2
            H[3] = BN[1] ^ BN[2] ^ BN[3]; //p1

            H[2] = BN[0]; //d1
            H[4] = BN[1]; //d2
            H[5] = BN[2]; //d3
            H[6] = BN[3]; //d4
        end else begin
            H = 7'bxxxxxxx;
        end
    end


endmodule