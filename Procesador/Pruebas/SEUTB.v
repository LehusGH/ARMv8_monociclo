`timescale 1ns / 1ps

module SEUTB;
	//Entradas
	reg [1:0] seu;
	reg [25:0] ins;

	//Salidas
	wire [63:0] value;

	//Instantiate the Unit Under Test (UUT)
	SEU uut (
		.seu(seu), 
		.ins(ins), 
		.value(value)
	);

	initial begin	
		seu = 2'b00;
		ins = 26'b110101010101110101010;
		#100;
		
		seu = 2'b01;
		#100;
		
		seu = 2'b10;
		#100;
		
		seu = 2'b11;
		#100;
	end 
endmodule