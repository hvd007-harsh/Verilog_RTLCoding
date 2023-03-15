module dflipflop(input din,clk,rst,output reg q,qbar);
   always@(posedge clk)
    begin
     if(rst==1'b1)
      begin
       q=1'b0;
       qbar=1'b1;
	  end
     else
      begin
      q=din;
      qbar=~din;
      end
   
    end    
 endmodule

module dfftb();
wire q,qbar;
reg clk,din,rst;
dflipflop d1(.clk(clk),.rst(rst),.din(din),.q(q),.qbar(qbar));
initial
  begin
   clk=1'b0;
   rst=1'b0;
   din=1'b0;

end
always#5 clk=~clk;
always#10 din=~din;
always#100 rst=~rst;


endmodule