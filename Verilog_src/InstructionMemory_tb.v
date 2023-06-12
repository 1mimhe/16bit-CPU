module InstructionMemory_tb;
	
	reg[15:0] pc;

	wire[15:0] inst;
	
	InstructionMemory uut(
		.pc(pc),
		.inst(inst)
	);

	initial begin
	// init
	pc = 16'd0;
	#100;

	pc = 16'h0001;
	#100;

	pc = 16'h0002;
	#100;

	pc = 16'h0003;
	#100;
	end
endmodule
