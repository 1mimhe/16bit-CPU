module InstructionMemory(
			input[15:0] pc,
			output reg[15:0] inst
			);

	reg[15:0] memory [0:65535];
	
	initial $readmemh("instructions.txt", memory);

	assign inst = memory[pc];

endmodule
