module ControlUnit_tb;

	reg [3:0]Opcode;

	wire RegDst;
	wire ALUsrc;
	wire MemtoReg;
	wire RegWrite;
	wire MemWrite;
	wire Branch;
	wire ExtOp;
	wire [2:0]ALUctr;
	
	ControlUnit uut(
		.Opcode(Opcode),
		.RegDst(RegDst),
		.ALUsrc(ALUsrc),
		.MemtoReg(MemtoReg),
		.RegWrite(RegWrite),
		.MemWrite(MemWrite),
		.Branch(Branch),
		.ExtOp(ExtOp),
		.ALUctr(ALUctr)
	);
	initial begin
	// R-type testing
	Opcode = 4'b0000;
	#100;

	Opcode = 4'b0001;
	#100;

	Opcode = 4'b0010;
	#100;

	Opcode = 4'b0011;
	#100;

	Opcode = 4'b0101;
	#100;

	Opcode = 4'b0110;
	#100;

	// ori test
	Opcode = 4'b0100;
	#100;

	// sw test
	Opcode = 4'b0111;
	#100;

	// lw test
	Opcode = 4'b1000;
	#100;

	// blt test
	Opcode = 4'b1001;
	#100;
	end
endmodule
