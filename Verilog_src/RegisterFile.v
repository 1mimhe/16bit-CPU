module RegisterFile(
		input clk,
		input regwrite,
		input[3:0] regread1,
		input[3:0] regread2,
		input[3:0] regdst,
		input[15:0] writedata,
		output wire[15:0] readdata1,
		output wire[15:0] readdata2
		);	
					 
	reg[15:0] R[0:15];

	always @(posedge clk)
	begin
		if(regwrite) R[regdst] <= writedata;
	end

	assign readdata1 = R[regread1];
	assign readdata2 = R[regread2];

	
endmodule

