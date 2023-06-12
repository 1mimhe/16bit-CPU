module Memory_tb;
	
		reg clk;
		reg memwrite;
		reg memread;
		reg[15:0] address;
		reg[15:0] writedata;

		wire[15:0] readdata;
	
	Memory uut(
		.clk(clk),
		.memwrite(memwrite),
		.memread(memread),
		.address(address),
		.writedata(writedata),
		.readdata(readdata)
	);

 	initial begin 
		clk = 0;
    	forever begin
    	#50 clk = ~clk;
    	end
	end
	initial begin
	// init
	memwrite = 0;
	memread = 0;
	address = 16'd0;
	writedata = 16'd0;
	#100;

	memwrite = 1;
	memread = 0;
	address = 16'd0;
	writedata = 16'h1111;
	#100;

	memwrite = 0;
	memread = 1;
	address = 16'd0;
	writedata = 16'd0;
	#100;

	memwrite = 1;
	memread = 0;
	address = 16'h1234;
	writedata = 16'h9999;
	#100;

	memwrite = 0;
	memread = 1;
	address = 16'h1234;
	writedata = 16'd0;
	#100;
	end
endmodule

