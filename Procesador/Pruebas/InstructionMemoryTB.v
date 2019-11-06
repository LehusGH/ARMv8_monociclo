`timescale 1ns / 1ps

module InstructionMemoryTB;
	//Entrada, la direccion de la instruccion
	reg [63:0] direccion;

	//La salida es una instruccion de 32 bits
	wire [32:0] instruccion;

	//Instancia la Unit Under Test (UUT)
	InstructionMemory uut (
		.direccion(direccion), 
		.instruccion(instruccion)
	);

	initial begin
		//busqueda en la posicion 1
		direccion = 64'b1;
		#100;
		
      //busqueda en la posicion 2
		direccion = 64'b10;
		#100;
		
		//busqueda en la posicion 3
		direccion = 64'b11;
		#100;
		
		//busqueda en la posicion 4
		direccion = 64'b100;
		#100;
		
		//busqueda en la posicion 5
		direccion = 64'b101;
		#100;
	end   
endmodule