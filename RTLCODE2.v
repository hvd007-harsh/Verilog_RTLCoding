/* module shiftreg(input din,clk,clr, output reg y );
   reg [3:0] temp;
   always (@posedge clk)
   begin 
   if(clr)
    temp = 4'b0;
   else 
   begin 
	 
   temp = temp>>1'b1;
   temp[3]=din; 
	 end
	  y = temp[0];  
  end

endmodule
*/
module shiftreg(input din,clk,clr,output reg y
               
    );
    reg [3:0]temp;
    always@(posedge clk)
    begin
    if(clr)
    temp=4'b0;
    else
    begin
   
   temp=temp>>1'b1;
   temp[3]=din ;
    
    end
    y=temp[0];
    end
endmodule

module strb();
wire y; 
reg din,clk,clr; 
reg [3:0] temp;
shiftreg du1(.clk(clk),.din(din),.clr(clr),.y(y));
initial 
   begin 
      clk= 1'b1; 
	  clr= 1'b0; 
	  din= 1'b0; 
	end
  always #5   clk=~clk; 
  always #100 clr=~clr;
  always #20  din =~din; 
endmodule
