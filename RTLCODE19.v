timescale 1ns/1ps;

module Dflipflop(Din,reset,clk,q, q_bar); 

input clk, reset,Din; 
output q,q_bar ; 
reg q;

assign q_bar = ~q; 

always @( posedge clk)
begin 
    if(reset ==1'b1)
     begin 
	  q <= 1'b0; 
	 end
    else 
	  begin 
       q <= Din; 
	  end
    end 	
endmodule


module JohnsonCounter( input clk ,reset, output [3:0] q);

wire w1; 
 
not a(w1,q[3]);

Dflipflop d1(.clk(clk),.reset(reset),.Din(w1),.q(q[0])); 
Dflipflop d2(.clk(clk),.reset(reset),.Din(q[0]),.q(q[1]));
Dflipflop d3(.clk(clk),.reset(reset),.Din(q[1]),.q(q[2])); 
Dflipflop d4(.clk(clk),.reset(reset),.Din(q[2]),.q(q[3]));
 
endmodule 




module JohnsonCounter_tb(); 
reg reset ,clk ; 
wire [3:0] q;

 JohnsonCounter dut(.q(q),.reset(reset),.clk(clk)); 
 
 
 initial 
    begin 
	  clk = 1'b0; 
        forever #5 clk = ~clk; 	  
	end
	
  initial 
   begin 
    reset = 1'b1; 
	#10; 
	reset = 1'b0; 
   end
endmodule

