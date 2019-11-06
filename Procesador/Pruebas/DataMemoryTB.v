`timescale 1ns / 1ps

module DataMemoryTB;
	//Entradas
	reg memRd;
	reg memWr;
	reg [63:0] dataWr;
	reg [63:0] dir;

	//Salidas
	wire [63:0] dataRd;

	//Instancia la Unit Under Test (UUT)
	DataMemory uut (
		.memRd(memRd), 
		.memWr(memWr), 
		.dataWr(dataWr), 
		.dataRd(dataRd), 
		.dir(dir)
	);

	initial begin
		//Inicializamos las entradas
		memRd = 0;
		memWr = 0;
		dir = 0;
		dataWr = 0;
		#100;

        /*
        Las siguientes pruebas nos ayudan a verificar si funciona
        la escritura y la lectura de la memoria
        */
		
		memRd = 0;
		memWr = 1;
		dir = 1;
		dataWr = 64'b11;
		#100;
		
		memRd = 0;
		memWr = 1;
		dir = 0;
		dataWr = 64'b1111111111111;
		#100;
		
		memRd = 1;
		memWr = 0;
		dir = 1;
		dataWr = 0;
		#100;
		
		memRd = 1;
		memWr = 0;
		dir = 0;
		dataWr = 0;
		#100;
	end    
endmodule