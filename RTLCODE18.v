/*
 4-Bit Binary Multiplier 
 
 input A0, B0 and C0 Output 
*/

module Binary_Multiplier(A0,B0,C0);
input [3:0] A0 , B0; 
output [7:0] C0; 
wire [3:0] m0 ;
wire [4:0] m1; 
wire [5:0] m2; 
wire [6:0] m3; 

//middle terms 
wire [7:0] s1,s2,s3; 

assign m0= {4{A0[0]}}&{B0[3:0]}; 
assign m1= {4{A0[1]}}&{B0[3:0]}; 
assign m2= {4{A0[1]}}&{B0[3:0]}; 
assign m3= {4{A0[1]}}&{B0[3:0]}; 

assign s1= m0+(m1<<1 );
assign s2= s1+(m2<<1 ); 
assign s3= s2+(m3<<1 ); 

assign C0 = s3 ; 

endmodule

module tb_binary();
    reg [3:0] A0, B0;
	wire[7:0] C0; 
 Binary_Multiplier dut(.A0(A0), .B0(B0), .C0(C0));
 initial
     begin
        A0 =  4'b0110 ; B0 =  4'b0110 ; 
        #10 
        A0 =  4'b0010 ; B0 =  4'b0110 ; 
        #10 	
        A0 =  4'b0111 ; B0 =  4'b0101; 
        #10 
        A0 =  4'b0111 ; B0 =  4'b0111 ; 
        #10
		A0 = 4'b0101 ; B0 = 4'b0101; 
		#10
		A0 = 4'b0111 ; B0 = 4'b0011; 
		#10 
		A0 = 4'b0100 ; B0 = 4'b0110; 
	end
endmodule 