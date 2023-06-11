module CPU(
	input clk
    );
	reg[15:0] pc;
	wire RegWrite; // Control Unit Signal
	wire MemWrite;
	wire MemRead;
	wire MemToReg;
	wire ALUsrc;
	wire Branch;
	wire RegDst;
	wire[2:0] ALUctr;
	wire zero;
	wire[15:0] instruction;
	wire ExtOp;
	reg[15:0] ext_imm;
	wire[15:0] readdata1;
	wire[15:0] readdata2;
	wire[15:0] ALUResult;
	reg[3:0] regwrite; // Register Destination
	wire[15:0] readdata; // From Memory
	reg [15:0] writedata;
	reg[15:0] ALUinput2;

	InstructionMemory ins_mem(pc, instruction);

	ControlUnit control_unit(instruction[15:12], RegDst, ALUsrc, MemToReg, RegWrite, MemWrite, MemRead, Branch, ExtOp, ALUctr);

	always @(*)
	begin
		if (ExtOp)
			ext_imm <= instruction[3:0] <<< 12;
		else
			ext_imm <= instruction[3:0] << 12;
	end
	
	always @(posedge clk)
	begin
		if (Branch && zero)
			pc <= (pc + 1) + ext_imm;
		else
			pc <= pc + 1;
	end
	
	always @(*)
	begin
		if (RegDst)
			regwrite <= instruction[3:0];
		else
			regwrite <= instruction[7:4];
	end
	
	RegisterFile regfile(clk, RegWrite, instruction[11:8], instruction[7:4], regwrite, writedata, readdata1, readdata2);
	
	always @(*)
	begin
		if (ALUsrc)
			ALUinput2 <= ext_imm;
		else
			ALUinput2 <= readdata2;
	end
	
	ALU alu(readdata1, ALUinput2, ALUctr, ALUResult, zero);

	always @(*)
	begin
		if (MemToReg)
			writedata <= readdata;
		else
			writedata <= ALUResult;
	end
	
	Memory memory(clk, MemWrite, MemRead, ALUsrc, readdata2, readdata);
endmodule
