`timescale 1ns / 1ps;

module DMIO(
    input [63:0] switchs,
    input [63:0] alures,
    input [63:0] datawr,
    input memWr,
    input memRd,
    output reg [63:0] dataRd
    output reg [7:0] leds;
    );

    //La direccion donde se guarda el dato en la data memory
    wire [11:0] address = alures[11:0];
    //La señal que habilita la escritura en la data memory -> Sustituye a memWr? no
    wire wr = ~alures[12] & memWr;
    //Salida l¿de la DM
    wire [63:0] dato;
    //El dato que se desea mostrar en los LEDS son los 8 bits menos significativos
    wire [7:0] datoleds = datawr[7:0]; 
    //Validar si se escribira en el registro para los LEDs
    wire enablewr = alures[12] & memWr;
    //señal de control para el multiplexor
    //Se selecicona si la salida será un dato que entra de los switchs o si será el dato leido de memoria
    wire cmux = alures[12];

    DataMemory DM(memRd, wr, address, datawr, dato);
    LedsOut LEDS(datoleds, enablewr, leds);
    multiplexorSexentayCuatro muxDMIO(cmux, dato, switchs, dataRd);

endmodule