module ALU_tb;

	reg [15:0]A;
	reg [15:0]B;
	reg [2:0]Opcode;

	wire [15:0]Result;
	wire ZERO;
	
	ALU uut(
		.A(A),
		.B(B),
		.Opcode(Opcode),
		.Result(Result),
		.ZERO(ZERO)
	);
	initial begin
	// testing Adder and Subtractor
	A = 12;
	B = 35;
	Opcode = 3'b000;
	#100;

	A = 35;
	B = 12;
	Opcode = 3'b001;
	#100;

	A = 12;
	B = 35;
	Opcode = 3'b001;
	#100;
	// testing ZERO
	A = 10;
	B = 10;
	Opcode = 3'b001;
	#100;

	// Multiplier test
	A = 2;
	B = 4;
	Opcode = 3'b010;
	#100;

	A = 100;
	B = 69;
	Opcode = 3'b010;
	#100;

	// Divider test
	A = 6;
	B = 2;
	Opcode = 3'b011;
	#100;

	A = 5;
	B = 10;
	Opcode = 3'b011;
	#100;

	A = 80;
	B = 3;
	Opcode = 3'b011;
	#100;

	// OR test
	A = 12;
	B = 5;
	Opcode = 3'b100;
	#100;
	// NOR test
	A = 12;
	B = 5;
	Opcode = 3'b101;
	#100;
	// NAND test
	A = 12;
	B = 5;
	Opcode = 3'b110;
	#100;

	end
endmodule
