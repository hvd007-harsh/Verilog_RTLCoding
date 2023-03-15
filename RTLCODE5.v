`timescale 1ns / 1ps 

module vedic2x2( input [1:0] a,b , output [3:0] y);
wire[3:0] temp;
assign temp[1:0] = (a[1] & b[0]) | (a[0] & b[1]);
assign y[0] = a[0] & b[0] ; 
assign y[1] = temp[0];
assign temp[3:2] =  ( a[1] & b[1]) | temp[1] ; 
assign y[2] = temp[2]; 
assign y[3] = temp[3]; 


endmodule 


`timescale 1ns /1ps 

module tb(); 
wire[3:0] y; 
reg [1:0]a, b; 
vedic2x2 duu(.a(a),.b(b),.y(y));
initial begin 
a = 2'b00;
b = 2'b00; 

end 
always #10 a[0] =~ a[0]; 
always #20 a[1] =~ a[1]; 
always #30 b[0] =~ b[0]; 
always #40 b[1] =~ b[1];

endmodule