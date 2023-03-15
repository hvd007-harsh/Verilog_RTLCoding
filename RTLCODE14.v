`timescale 1ns/1ps 

module Decimal2Binary_Encoder(Decimal,Binary);
    input [9:0] Decimal; 
	output[3:0] Binary; 
	reg [3:0] Binary; 
	always @(Decimal) 
	   begin 
	        case(Decimal) 
			    10'b0000000001: Binary = 4'b0000;
				10'b0000000010: Binary = 4'b0001; 
				10'b0000000100: Binary = 4'b0010; 
				10'b0000001000: Binary = 4'b0011; 
				10'b0000100000: Binary = 4'b0100; 
				10'b0001000000: Binary = 4'b0101; 
				10'b0010000000: Binary = 4'b0110;
				10'b0100000000: Binary = 4'b1000; 
				10'b1000000000: Binary = 4'b1001;
			
			    default: Binary = 4'b0000; 
			endcase
		end
endmodule
	
module Decimal2Binary_Encoder_tb;
    reg [9:0] Decimal; 
	wire [3:0] Binary;
	
Decimal2Binary_Encoder dut(.Decimal(Decimal), .Binary(Binary)); 

initial 
   begin
       Decimal = 1; 
	#2 Decimal = 2;
    #2 Decimal = 4; 
	#2 Decimal = 8; 
	#2 Decimal = 16;
	#2 Decimal = 32;
	#2 Decimal = 64;
	#2 Decimal = 128;
	#2 Decimal = 256;
	#2 Decimal = 512;
	#2 Decimal = 1024;	
  end
endmodule
