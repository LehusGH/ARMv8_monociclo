`timescale 1ns / 1ps

/*
	Ver diagrama dibujado en el papel. Son todas las entradas creadas
	para el register file.
	wr representa una señal de si se desea escribir o no.
	clk es la señal de reloj.
	rn, rm y rd son los operadores y el destino de escritura para proximas
	operaciones.
*/
module RegisterFile(rn, rm, rd, d, clk, wr, data1, data2);
	input [4:0] rn;
	input [4:0] rm; 
	input [4:0] rd; 
	input [63:0] d; 
	input clk; 
	input wr; 
	output [63:0] data1; 
	output [63:0] data2;
	
	//Matriz de registros -> 32 de 64bits
	reg [63:0] RF [31:0];
	
	/*
	Los datos seleccionados de los multiplexores se alojan en data1 y data 2.
	Son los datos de salida de Rn y Rm.
	*/
	assign data1 = RF[rn];
	assign data2 = RF[rm];
	
	//Cuando se quiere escribir (wr) se escribe el dato d en el registro destino rd
	always @(posedge clk)
		begin
			if (wr)
				RF[rd] <= d;
		end
	
	/*
	A partir del archivo matriz.txt hacemos que se cargue en los registros (matriz)
	RF los datos que hay en ese archivo. Es lo primero que se realiza por el initial begin.
	*/
	initial begin
		$readmemb("RF.txt", RF);
	end
endmodule