`timescale 1ns/1ps



/*
 Synchronous Counter :  A synchronous Counter is the counter in which the clock input with all the
 flip-flops uses the same source and produces the output at the same time.
 
 The synchronous Counter also referred to as a parallel counter is the one in which each
 establishing flip-flops are clocked with the similar clock input at the same time 
 



*/


module Sync_counter(clock ,reset, Up_Down,count); 
input clock,reset,Up_Down; 
output [3:0] count; 
reg [3:0] count = 0 ; 

always @( posedge clock)
begin 
if(reset == 1)
count <= 0;
else 
if(Up_Down ==1 ) // Up_counter 
count <= 1'b1 + count ; 
else 
count <= count - 1'b1; 
end 
endmodule 

module Sync_counter_tb(); 
reg clock,reset,Up_Down; 
wire [3:0] count; 

Sync_counter dut(.clock(clock),.reset(reset),.Up_Down(Up_Down),.count(count));

initial 
begin 
clock =0; 
reset =0; 
Up_Down =1 ; 
#150 
Up_Down =0; 
#150 
reset =1 ; 
end

always #5 clock = ~clock ; 

endmodule
