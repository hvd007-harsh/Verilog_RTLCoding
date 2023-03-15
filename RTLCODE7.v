`timescale 1ns / 1ps 

module day7(input [3:0] a , b, [0:0] cin , output [3:0]s, [4:0]c );
genvar i;
 assign c[0] = cin; 
 for(i=0; i <=5; i = i+1)
 begin 
 assign c[i+1] = (a[i] & b[i])| (a[i] ^ b[i]) & c[i];
 assign s[i] = ( a[i] ^ b[i] ) ^ c[i] ;
 end
 endmodule
 
 
`timescale 1ns / 1ps 


module day7tb();
wire [4:0]c; 
wire [3:0]s; 
reg [3:0]a,b;
reg [3:0]cin; 
day7 duu1(.a(a),.b(b),.cin(cin),.s(s),.c(c));
genvar i;
initial begin 
a = 4'b0; 
b = 4'b0; 
cin = 1'b0; 
end
always #10 a[0] =~ a[0];
always #20 a[1] =~ a[1];
always #30 a[2] =~ a[2];
always #40 a[3] =~ a[3]; 
always #50 b[0] =~ b[0];
always #60 b[1] =~ b[1];
always #70 b[2] =~ b[2];
always #80 b[3] =~ b[3];

endmodule
