`timescale 1ns / 1ps

/*
    Las entradas de la Sign-Extend Unit seran:
    ins -> una porcion de la intruccion, que a nivel genelar
           va de [25:0].
    sseu -> es una señal de control que viene de la control unit,
            y permite definir que porcion de ins va a ser completada 
            dentro de los 64 bits.
    sgnedvalue -> es la salida de la SEU, sacando el valor completo de
                  64 bits y con su signo correspondiente (de ser necesario).
*/
module SEU(ins, sseu, signedval);
    input [25:0] ins;
    input [1:0] sseu;
    output [63:0] signedval;

    //genera una variable para llenar los espacios necesarios
    reg [63:0] value = 0;

    always @(ins) begin
        //Si seu = 00 -> trabajamos los datos [21:10]
        if(sseu[1] == 0 & sseu[0] == 0)
            for(i=0; i<64; i=i+1) begin
                value[i] <= 0;
            end
            for(i=0; i<12; i=i+1) begin
                value[i] <= ins[i+10];
            end
        //Si seu = 01 -> trabajamos los datos [25:0]
        //Si el digito 25 es 0 llenamos con 0, pero si es 1 se llena con 1
        else if(sseu[1] == 0 & sseu[0] == 1)
            if(ins[25] == 0)
                for(i=0; i<64; i=i+1) begin
                    value[i] <= 0;
                end
                for(i=0; i<26; i=i+1) begin
                    value[i] <= ins[i];
                end
            else if(ins[25] == 1)
                for(i=0; i<64; i=i+1) begin
                    value[i] <= 0;
                end
                for(i=0; i<26; i=i+1) begin
                    value[i] <= ins[i];
                end
        //Si seu = 10 -> trabajamos los datos [23:5]
        //Si el digito 23 es 0 llenamos con 0, pero si es 1 se llena con 1
        else if(sseu[1] == 0 & sseu[0] == 1)
            if(ins[23] == 0)
                for(i=0; i<64; i=i+1) begin
                    value[i] <= 0;
                end
                for(i=0; i<19; i=i+1) begin
                    value[i] <= ins[i+5];
                end
            else if(ins[23] == 1)
                for(i=0; i<64; i=i+1) begin
                    value[i] <= 0;
                end
                for(i=0; i<19; i=i+1) begin
                    value[i] <= ins[i+5];
                end
        //Si seu = 11 -> trabajamos los datos [20:12]
        //Si el digito 20 es 0 llenamos con 0, pero si es 1 se llena con 1
        else if(sseu[1] == 0 & sseu[0] == 1)
            if(ins[20] == 0)
                for(i=0; i<64; i=i+1) begin
                    value[i] <= 0;
                end
                for(i=0; i<9; i=i+1) begin
                    value[i] <= ins[i+12];
                end
            else if(ins[20] == 1)
                for(i=0; i<64; i=i+1) begin
                    value[i] <= 0;
                end
                for(i=0; i<9; i=i+1) begin
                    value[i] <= ins[i+12];
                end
    end

    //Asignamos como salida el dato completo en value
    assign signedval = value;
endmodule