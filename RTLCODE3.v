module Binary2GrayBit(input [15:0] a, output [15:0] b);
genvar i;
assign b[15] = a[15] ;
for(i=15;i>=0;i=i-1)
begin 
assign b[i] = a[i+1]^a[i] ; 
end

endmodule

module day3tb();
wire [15:0] y; 
reg  [15:0] a ; 
genvar i; 
Binary2GrayBit dd1(.a(a),.b(b));
initial begin 
a= 16'b0000;
end
for( i=1; i<=15;i=i+1)
begin 
always#i a[i]=~a[i];
end
always#1 a[0]=~a[0];
endmodule