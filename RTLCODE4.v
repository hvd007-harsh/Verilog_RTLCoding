`timescale 1ns / 1ps

module seqdec(input a,clk,rst, output reg y);
	parameter idle = 0 ;
	parameter s0 = 1;
	parameter s1 = 2; 
	parameter s2 = 3; 
	reg[1:0]state = idle;
	
	always@(posedge clk)
	  begin 
		case(state)
		
		idle:
		if(rst)
		begin
		state = idle; 
		y <= 1'b0;
		end
		else
		begin 
		y <= 1'b0;
		state <= s0;
		end
		
		s0:
		if(a)
		begin 
		y <=1'b0;
		state<=s1;
		end
		else 
		begin 
		state<=s0;
		y<=1'b0;
		end
		
		
		s1: 
		if(a==1'b0)
		begin 
		y<=1'b0;
		state<= s2;
		end
		else 
		begin 
		state<=s0;
		y<=1'b0;
		end
		
		
		s2:
		if(a==1'b0)
		begin 
		y<=1'b1;
		state<=s0; 
		end
		else
		begin 
		y<=1'b0; 
		state<=s0;
		end
		
		
		endcase
	end
endmodule 




module seqdectb();
wire y;
reg a,clk,rst; 
seqdec duu1(.a(a),.clk(clk),.rst(rst),.y(y));

initial begin 
clk =1'b0; 
rst =1'b0;
a = 1'b1; 
#10 a= 1'b0; 
#10 a= 1'b0;
#10 a= 1'b1;
#10 a= 1'b0; 
#10 a= 1'b0;
#10 a= 1'b0; 
#10 a= 1'b0;
#10 a= 1'b1; 
#10 a= 1'b0;
#10 a= 1'b0; 
#10 a= 1'b0;
#10 a= 1'b0;
#10 a= 1'b1; 
#10 a= 1'b0;
#10 a= 1'b0; 
#10 a= 1'b0;
#10 a= 1'b0;
#10 a= 1'b1; 
#10 a= 1'b0;
#10 a= 1'b0; 
#10 a= 1'b0;
#10 a= 1'b1; 
#10 a= 1'b0;
#10 a=1'b1;
#10 a=1'b0;
#10 a=1'b0;
#10 a=1'b0;
#10 a=1'b0;
#10 a=1'b1;
#10 a=1'b0;
#10 a=1'b0;
#10 a=1'b0;
#10 a=1'b0;
#10 a=1'b1;
#10 a=1'b0;
#10 a=1'b0;
#10 a=1'b0;
#10 a=1'b0;
#10 a=1'b1;
#10 a=1'b0;
#10 a=1'b0;
#10 a=1'b0;
#10 a=1'b0;
#10 a=1'b1;
#10 a=1'b0;
#10 a=1'b0;
#10 a=1'b0;
#10 a=1'b0;
#10 a=1'b1;
#10 a=1'b0;
#10 a=1'b0;
#10 a=1'b0;
#10 a=1'b0;
#10 a=1'b1;
#10 a=1'b0;
#10 a=1'b0;

end

always#5 clk=~clk;
always#100 rst=~rst;


endmodule