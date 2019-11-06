`timescale 1ns / 1ps

/*
	Este es el test bench para el register file
*/
module RegisterFileTB;
	//Entradas
	reg [4:0] rn;
	reg [4:0] rm;
	reg [4:0] rd;
	reg [63:0] d;
	reg clk = 0;
	reg wr = 0;

	//Salidas
	wire [63:0] data1;
	wire [63:0] data2;

	//Instancia la Unit Under Test (UUT)
	RegisterFile uut (
		.rn(rn), 
		.rm(rm), 
		.rd(rd), 
		.d(d), 
		.clk(clk), 
		.wr(wr), 
		.data1(data1), 
		.data2(data2)
	);
	
	//Variar la señal de reloj cada 10ns
	always #10 clk = ~clk;
	always #100 wr = ~wr;
	always #50 d = ~d;
		
	initial begin
		//Inicializamos las entradas

        //El registro 0 es Rn
        //El registro 1 es Rm
		rn = 0;
		rm = 1;
		rd = 0;
		d = 64'b1101;
		clk = 0;
		wr = 0;

		// Wait 100 ns for global reset to finish
		#100;
	end
endmodule