module Shift_Operators( in, sel,out);
 input [3:0] in; 
 input [1:0] sel;
 output reg [3:0] out; 
 wire [3:0] in; 
 wire [1:0] sel; 
 
 always @(in or sel)
 begin 
 case (sel) 
   2'b00 : out = in <<1 ; //Logical left shift 
   2'b01 : out = in >>1 ; //Logical left shift 
   2'b10 : out = in <<<1 ; //Arithematic Left Shift 
   2'b11 : out = in >>>1 ; //Arithematic right shift
  default : out = 4'b0000; 
  endcase 
  end 
endmodule

module Shift_Operators_tb(); 

 reg [3:0] in; 
 reg [1:0] sel; 
 reg [3:0] out; 
 integer i ; 
 Shift_Operators dut(.in(in), .sel(sel), .out(out));
 
 initial 
 begin 
 {in } = 1'b0; 
  #2;
 {in } = 4'b0110;
end

initial 
begin 
for(i=0; i< 4; i=i+1)
begin
sel = i;
#5; 
end
end

endmodule
 
  