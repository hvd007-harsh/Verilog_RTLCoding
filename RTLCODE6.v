`timescale 1ns / 1ps
module Bit64Addr(input clk , we, rst,[5:0]addr,[7:0]din, output [7:0]out);
	reg [7:0] temp; 
	reg [7:0] mem; 
	integer i ; 
	always@(posedge clk)
	begin 
    if(rst)
	begin 
	for(i=0; i<=64;i=i+1)
	begin
	mem[i] = 8'h00; 
	end
	temp <= 8'h00;
	end
	else 
	begin 
	if(we)
	mem[addr] <= din;
	else 
	temp <= mem[addr]; 
	end 
	end 
	assign out = temp ; 
endmodule

`timescale 1ns/1ps

module Bit64Tb();
	reg clk,we,rst;
	reg [5:0]addr;
	reg [7:0]din;
	wire[7:0]out; 
	genvar i ; 
	Bit64Addr duu1(.clk(clk),.we(we),.rst(rst),.addr(addr),.din(din),.out(out));
	initial begin 
	clk =1'b0;
	addr = 1'b0; 
	rst = 1'b0;
	we = 1'b0; 
	din = 8'b0; 
	end
	always #5 clk =~ clk; 
	always #500 rst =~ rst;
	always #100 we =~ we; 
	always #2 addr[0] = addr[0]; 
	always #4 din[0] =~din[0];
	for(i = 1 ; i <=31; i = i*5)
	begin 
	always #i addr[i] =~ addr[i];
	end 
	for(i=1;i<41; i=i*5)
	begin 
	always #i din[i] =~ din[i];
	end
endmodule


