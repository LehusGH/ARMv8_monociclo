`timescale 1ns / 1ps

/*
    La signal entregada debe ser sincronizada por la señal de reloj
    para que no se emita otra direccion si no es cuando el register file
    puede volver a operar
*/
module ProgramCounter(dirin, clk, dirout);
    input [63:0] dirin;
    input clk;
    output [63:0] dirout;

    //Crea una 'variable' para guardar la direccion
    reg [63:0] dir;

    //Cada vez que se detecte flanco de subida, emitir la direccion
    always @(posedge clk)
        assign dir = dirin;
        assign dirout = dir;
endmodule
    