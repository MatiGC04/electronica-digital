module RAM_16X4_tb();

    reset_test = 1: #10; reset_test = 0;
    set_test = 0;
    // habilito la memoria, pongo la direccion, si voy a escribir pongo el dato, y luego haabilito la escritura

    write_enable_test = 1;
    addr_test = 4'd0; data_in_test = 4'b1010; #10;

    addr_test = 4'd0; #10

    // que significan esas zzz, es alta impedancia, la salida esta esta desabilitada.

    /*
    cuando reseteas la memoria se desabilita, es decir se pone en alta impedancia, hasta el dato ingresado.
    que es la alta impedancia?
    los enable son activos alto (en la practica podemos usar activo alto o bajo siempre hay q especificarlo),
    en algunas hojas de datos el enable esta negado
            Enable
            |
            o
            |


    Trabajo Practico
    grupo de a 2
    PRESENTACION + CODIGO
    Hablar de la toma de decisiones, implementacion
    No se pide informe.
    Se busca que utilicemos los conocimientos aplicados durante el año
    No valoran que sea el codigo optimo
    Se valora que en la defensa se utilice la terminologia correcta.

    Que se hace?
    tiempo de exposicion:
    fecha de entrega 23/06
    */