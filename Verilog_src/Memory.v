module Memory(
		input clk,
		input memwrite,
		input memread,
		input[15:0] address,
		input[15:0] writedata,
		output reg[15:0] readdata
		);
	
	reg[15:0] memory[0:65535];
	
	always @(posedge clk)
	begin
		if(memwrite) memory[address] <= writedata;
	end
	
	always @(negedge clk)
	begin
		if(memread) readdata <= memory[address];
	end
	
endmodule
