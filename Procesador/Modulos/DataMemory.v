`timescale 1ns / 1ps

module DataMemory(memRd, memWr, dataWr, dataRd, dir);
    input memRd;
    input memWr;
    input [63:0] dir;
    input [63:0] dataWr;
    output [63:0] dataRd;

    /*
    Matriz que simula la data memory (memoria ram?).
    En este caso utilizamos una memoria que puede guardar 32 datos.
    */
    reg [63:0] DM [31:0];

    /*
    Cuando queremos escribir, buscamos en la memoria la direccion dir, y 
    de ahi se extrae el dato hacia la salida dataRd. En cualquier caso, 
    la salida es el dato que se aloja en dicha direccion
    */
    always @(dir) begin
        if(memWr)
            DM[dir] <= dataWr;
        else if(~memRd & ~memWr)
            DM[dir] <= dataWr;
    end

    //La salida siempre esta en DM[dir]
    assign dataRd = DM[dir];
endmodule