/*
   Author : Harsh Dixit 
   Date : 17-02-2022
*/
`timescale 100ns


module piso(clk,pin,sout,load); 
input [3:0] pin; 
input clk,load;

output reg sout ; 
reg [3:0] temp =0; 

always @(posedge clk)
begin 
if(load)
temp <= pin ; 
else 
begin
sout <= temp[3];
temp <= {temp[2:0],1'b0};
end
end
endmodule                                                            


module piso_tb();
reg[3:0] pin ; 
reg clk, load; 

wire sout; 

piso dut(.clk(clk),.pin(pin),.sout(sout),.load(load));



initial
begin
clk = 0;
pin = 4'b1010;
load = 1'b1; 
 #10; 
load= 1'b0;
 #10; 
load= 1'b1; 
 #50;
load= 1'b1; 
pin= 4'b0101; 
 #10;
load = 1'b0;
end

endmodule