`timescale 1ns / 1ps;

module LedsOut(
    input [7:0] data;
    input wr;
    output reg [7:0] datal;
    );

    //Entra un dato
    always @(data, wr, datal) begin
        if(wr)
            datal <= data;
    end
endmodule