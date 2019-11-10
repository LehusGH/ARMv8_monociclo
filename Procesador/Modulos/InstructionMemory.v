`timescale 1ns / 1ps

module InstructionMemory(
    input [61:0] direccion,//señal enviada a traves del program counter
    output [31:0] instruccion//instruccion a ejecutar
    );

	reg [7:0] IM [127:0];//creamos matriz para guardar las instrucciones a ejecutar
	assign direccion = {{direccion[31:2]}, 2'b0}
	assign instruccion[31:24] = IM[direccion];//asignamos la instruccion pedida a la salida
	assign instruccion[31:24] = IM[direccion+1];
	assign instruccion[23:16] = IM[direccion+2];
	assign instruccion[15:8] = IM[direccion+3];
	assign instruccion[7:0] = IM[direccion+4];

	initial begin 
		$readmemb("instrucciones.txt",IM);//cargamos las instrucciones 
	end
endmodule
