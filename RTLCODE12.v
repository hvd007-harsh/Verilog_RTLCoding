module Seven_Segment_Display(bcd,segment ); 
	input [3:0] bcd; 
	output[7:0] segment; 
	reg [7:0] segment; 
	
always @(bcd)
	begin 
		case(bcd) 
		  4'b0000: segment = 8'b11000000;
		  4'b0001: segment = 8'b11111001;
		  4'b0010: segment = 8'b10100100;
		  4'b0011: segment = 8'b10110000;
		  4'b0100: segment = 8'b10010010;
		  4'b0110: segment = 8'b10000010;
		  4'b0111: segment = 8'b11111000;
		  4'b1000: segment = 8'b10000000;
		  4'b1001: segment = 8'b10010000;
		  
		default :  segment =  8'b11111111;
    endcase
  end
 endmodule
 
 module Seven_Segment_Display_tb;
		reg [3:0] bcd; 
		wire [7:0] segment; 
		integer i ; 
		
	Seven_Segment_Display dut (.bcd(bcd),.segment(segment) );
	
	task initialize; 
	{bcd } = 0; 
	endtask 
	
	task stimulus ; 
	begin 
	 for ( i =0 ; i <16 ; i = i+1)
	 begin 
	 {bcd } = 1;
	 #10;
	 end
	 end
	 endtask
	 
	 initial 
	 begin 
	 initialize;
	 stimulus; 
	 end
	 
	 initial begin
		for(i=0;i<16; i = i+1)
		begin 
		  bcd =1;
		 #10;
	    end
	 end
	 
endmodule
  
 