`timescale 1ns / 1ps

module SEU(seu, ins, value);
	input [1:0] seu;
	input [25:0] ins;
	output reg [63:0] value;
	
	wire [11:0] ALUImm = ins[21:10];
	wire [8:0] DTAddress = ins[20:12];
	wire [25:0] BRAddress = ins[25:0];
	wire [19:0] CBAddress = ins[23:5]; 
	
	always@(seu, ins)
	begin
		case(seu)
			2'b00: value <= {52'b0, ALUImm};
			2'b01: value <= {{36{BRAddress[25]}}, BRAddress, 2'b0};
			2'b10: value <= {{43{CBAddress[18]}}, CBAddress, 2'b0};
			2'b11: value <= {{55{DTAddress[8]}}, DTAddress};
		endcase
	end
endmodule
