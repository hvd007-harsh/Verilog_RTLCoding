`timescale 1ns / 1ps



module ALU( a, b,opcode,mode,outALU,za ,zb ,eq,gt , lt); 
input [15:0] a ; 
input [15:0] b ; 
input [2:0] opcode; 
input mode; 
output [31:0] outALU; 
output za,zb,eq ,gt, lt ; 

reg [31:0] outALU;
reg za, zb, eq, gt, lt;

wire [31:0] outau; 
wire [31:0] outlu; 

wire tza,tzb,teq,tgt,tlt; 

//Instantiation of the modules 
arith a1(.a(a) ,.b(b),.opcode(opcode),.outau(outau));
logic l1(.a(a),.b(b),.opcode(opcode),.outlu(outlu),.za(tza),.zb(tzb),.eq(teq),.gt(tgt),.lt(tlt));

// At every change of a , b , mode and opcode, we need to select the output.

always@(a,b,mode,opcode)
begin
	if(mode == 0) begin
    assign outALU = outau;
	end
	else if (mode == 1) begin
	assign outALU = outlu;
	end
	else begin
	assign outALU = 32'h00000000;
	end
	assign za = tza;
	assign zb = tzb;
	assign eq = teq;
	assign gt = tgt;
	assign lt = tlt;
end
endmodule

module arith(a,b ,opcode,outau) ;
input [15:0] a; 
input [15:0] b; 
input [2:0] opcode; 
output [31:0] outau; 
reg [31:0] outau ; 
always @(a,b,opcode)
begin 
       case(opcode)
	   3'b000: outau = a+b; 
	   3'b001: outau = a*b;
	   3'b010: if(a>b) begin 
				outau = a-b;
			   end
			   else begin 
			    outau = b-a; 
			   end
			   
	   3'b011: if(a>b) begin 
				outau = a/b; 
			   end
			   else begin 
			    outau = b/a ; 
			   end 
		default: outau = 32'h00000000;
		endcase
	end
endmodule


module logic(a,b,opcode,outlu, za,zb ,eq,gt,lt ) ; 
input [15:0] a; 
input [15:0] b; 
input [2:0] opcode ; 
output [31:0] outlu; 
output za,zb,eq,gt,lt; 

reg[31:0] outlu ; 
reg za,zb,eq,gt,lt; 
always@(a,b,opcode)
begin 
    case(opcode) 
	3'b000: outlu = (a & b); 
	3'b001: outlu = (a | b); 
	3'b010: outlu = (~(a|b));
	3'b100: outlu = (~a);
	3'b101: outlu = (~b); 
	3'b110: outlu = (a^b); 
	3'b111: outlu = (~(a ^ b)); 
	default : outlu = 32'h00000000;
	endcase
end
always@(a,b)
begin
    if(a==b) begin 
	eq = 1; 
	end
	else begin 
	eq = 0; 
	end
	
	if(a > b) begin 
	gt =1 ;
	end
	else begin 
	gt =0 ;
    end
	
	if(a < b ) begin 
	lt =1; 
	end 
	else begin 
	lt =0; 
	end
	
	if(a == 16'h0000) begin 
	za = 1; 
	end
	else begin 
	za = 0;
	end
	
	if( b == 16'h0000) begin 
	zb = 1;
	end
	else begin 
	zb = 0; 
	end
end
endmodule

module tb();
reg [15:0] a;
reg [15:0] b;
reg [2:0] opcode;
reg mode;
wire [31:0] outALU;
wire za,zb,eq,gt,lt;

ALU duu1(.a(a),.b(b),.opcode(opcode),.mode(mode),.outALU(outALU));

initial begin
a=16'h0000; b= 16'h0000; opcode = 1'h0;
#5 a = 16'h0000; 
#5 b=16'h0001;
#5 opcode = 1'h1;
#5 opcode = 1'h2; 
#5 opcode = 1'h3;
#5 opcode = 1'h4; 
#50 
 a = 16'h0100; 
 end
 
 endmodule 