module RegisterFile(
		input clk,
		input regwrite,
		input[3:0] regread1,
		input[3:0] regread2,
		input[3:0] regdst,
		input[15:0] writedata,
		output reg[15:0] readdata1,
		output reg[15:0] readdata2
		);	
					 
	reg[15:0] R[0:15];
	
	always @(posedge clk)
	begin
		if(regwrite) R[regdst] <= writedata;
	end

	always @(negedge clk)
	begin
		readdata1 = R[regread1];
		readdata2 = R[regread2];
	end
	
endmodule

