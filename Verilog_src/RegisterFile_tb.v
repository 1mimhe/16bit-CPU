module RegisterFile_tb;
	
	reg clk;
	reg regwrite;
	reg [3:0]regread1;
	reg [3:0]regread2;
	reg [3:0]regdst;
	reg [15:0] writedata;

	wire[15:0] readdata1;
	wire[15:0] readdata2;
	
	RegisterFile uut(
		.clk(clk),
		.regwrite(regwrite),
		.regread1(regread1),
		.regread2(regread2),
		.regdst(regdst),
		.writedata(writedata),
		.readdata1(readdata1),
		.readdata2(readdata2)
	);

 	initial begin 
		clk = 0;
    	forever begin
    	#50 clk = ~clk;
    	end
	end
	initial begin
	// init
	regwrite = 1;
	regdst = 4'b0000;
	writedata = 16'h0007;
	regread1 = 4'b0000;
	regread2 = 4'b0001;
	#100;

	// init
	regwrite = 0;
	regdst = 4'b0101;
	writedata = 16'd0;
	regread1 = 4'b0000;
	regread2 = 4'b0010;
	#100;

	// init
	regwrite = 1;
	regdst = 4'b0101;
	writedata = 16'h0024;
	regread1 = 4'b0101;
	regread2 = 4'b0000;
	#100;

	// init
	regwrite = 0;
	regdst = 4'b0101;
	writedata = 16'd0;
	regread1 = 4'b0101;
	regread2 = 4'b0000;
	#100;
	end
endmodule