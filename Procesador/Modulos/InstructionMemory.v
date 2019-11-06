`timescale 1ns / 1ps

module InstructionMemory(direccion, instruccion);
	//A la IM le entra una direccion donde buscar la instruccion en la memoria
	input [63:0] direccion;
	output [32:0] instruccion;
	
	//Simulamos la memoria como una matriz que puede contener 32 instrucciones (opcional)
	reg [31:0] IM [31:0];
	assign instruccion = IM[direccion];
	
	initial begin
		$readmemb("IM.txt", IM);
	end
	
endmodule