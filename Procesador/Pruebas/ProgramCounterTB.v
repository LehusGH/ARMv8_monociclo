`timescale 1ns / 1ps

module ProgramCounterTB;
    //Entradas
    reg [63:0] dirin;
    reg clk = 0;

    //Salidas
    wire [63:0] dirout;

    //Instancia la UUT
    ProgramCounter uut (
        .dirin(dirin),
        .clk(clk),
        .dirout(dirout)
    );

    //Variamos el clk cada 10ns
    always #10 clk = ~clk;
	 always #10 dirin = dirin + 1;

    initial begin
        dirin = 64'b111;
        #100;
    end
endmodule
