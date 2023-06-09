module InstructionMemory(
			input[15:0] pc,
			output reg[15:0] inst
			);

	reg[31:0] memory [0:65535];
	
	initial $readmemh("code.txt",memory);

	assign inst = memory[pc];

endmodule
