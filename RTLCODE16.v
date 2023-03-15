/* 

 PISO : A piso shift register is used to change the data from parallel to serial form 
 each are situated with counter of flip flop 
This shift register includes three connections only the PI (parallel i/p), PO (parallel o/p) & the CLK signal.

*/
`timescale 1ns/1ps

module piso(clock,pin,sout,load);
input [3:0] pin;
input clock,load; 
output reg sout;
reg [3:0] temp= 0; 
always @(posedge clock)
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
reg clock,load; 
reg[3:0] pin; 
wire sout; 
piso dut(.clock(clock),.pin(pin),.sout(sout),.load(load));

initial
begin
$monitor("pin = %b, sout = %b, load = %b",pin,sout,load);
end

initial 
begin 
clock =0;
pin = 4'b1010; 
load = 1'b1; 
#10;
load = 1'b0; 
#50
load = 1'b1; 
#10;
load = 1'b0; 
end
always #5 clock =~ clock; 
endmodule