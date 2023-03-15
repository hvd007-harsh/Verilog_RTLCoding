`timescale 1ns/ 1ps
/*
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.09.2022 17:14:46
// Design Name: 
// Module Name: dataMEM
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
*/
module datamemvar(clk , we_DM, dataDM,addDM, outDM);
input  clk;
input  we_DM;
input  [31:0] dataDM; 
input  [31:0] addDM; 
output [31:0] outDM;
reg    [31:0] outDM;
reg    [31:0] mem [0:31];

always@ (posedge clk)
begin 
  if(we_DM == 1) begin
    mem[addDM] =dataDM; 
  end
  else if(we_DM == 0) begin 
   outDM= mem[addDM]; 
  end 
end
endmodule

`timescale 1ns/ 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.09.2022 17:16:46
// Design Name: 
// Module Name: dataMEM
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module tb_datamem();
reg clk; 
reg we_DM;
reg [31:0] dataDM; 
reg [11:0] addDM; 
wire [31:0] outDM; 

//Instiation of the design
datamemvar d1(.clk(clk),.we_DM(we_DM),.dataDM(dataDM),.addDM(addDM),.outDM(outDM));

initial 
begin 
	clk <= 0; 
	we_DM <= 0; 
	dataDM <=32'h0000000;
	addDM <= 12'h000; 
	
end
// Clock setup 
always #5 clk = ~clk; 
//Address setup 
always #60 addDM = addDM + 12'h001; 
//Stimulus 
initial
begin 
    #5 we_DM <= 1; 
	#5 dataDM <= 32'h1dfe;
	#30 we_DM <= 0; 
	 
	#30 we_DM <= 1; 
	#5 dataDM <= 32'h1001; 
	#30 we_DM <= 0;
end
endmodule