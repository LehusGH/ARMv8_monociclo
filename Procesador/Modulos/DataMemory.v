`timescale 1ns / 1ps

module DataMemory(
    input memrd,//entrada MemWr indicando si se va a leer 
    input memwr,//entrada MemWr indicando si se va a escribir
    input [63:0] dir,//entrada de la direccion en donde se va a escribir
    input [63:0] datawr,//dato que se va a escribir
    output reg [63:0] datard//dato que vamos trabajar, dato en el cual se va a escribir o que se va a escribir
    );

	 reg [7:0] MEMORIA [4065:0];//RAM
	 initial begin 
		$readmemb("MEMORIA.txt",MEMORIA);//cargamos la memoria
	end

    /*
    Para que la lectura  o escritura se hagan correctamente, se sustituyen los 3 bits
    menos significativos de la direccion de memoria por 0.
    */
    dir <= {{dir[63:3]}, 3'b0};

	always @(memrd,memwr,dir,datawr) begin //cada vez que cambie la entrada se ejecuta este paso
		if(memwr =='b1) begin//si queremos escribir, entonces primero necesitamos guardar en memoria
            MEMORIA[dir] <= datawr[63:56];
            MEMORIA[dir+1] <= datawr[55:48];
            MEMORIA[dir+2] <= datawr[47:40];
            MEMORIA[dir+3] <= datawr[39:32];
            MEMORIA[dir+4] <= datawr[31:24];
            MEMORIA[dir+5] <= datawr[23:16];
            MEMORIA[dir+6] <= datawr[15:8];
            MEMORIA[dir+7] <= datawr[7:0];
		end

		if(memrd =='b1) begin
		    datard[63:56] = MEMORIA[dir];//se le asigna el dato que vamos a utilizar de la memoria
            datard[55:48] = MEMORIA[dir+1];
            datard[47:40] = MEMORIA[dir+2];
            datard[39:32] = MEMORIA[dir+3];
            datard[31:24] = MEMORIA[dir+4];
            datard[23:16] = MEMORIA[dir+5];
            datard[15:8] = MEMORIA[dir+6];
            datard[7:0] = MEMORIA[dir+7];
        end

		if(memrd == 'b0)
			datard = 64'b0;	
	 end
endmodule
