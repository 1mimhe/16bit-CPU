module CPU(
	input clk
    );
	reg[15:0] pc = 16'd0;
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
	wire[3:0] regwrite; // Register Destination
	wire[15:0] readdata; // From Memory
	wire [15:0] writedata;
	wire[15:0] ALUinput2;

	InstructionMemory ins_mem(pc, instruction);

	ControlUnit control_unit(instruction[15:12], RegDst, ALUsrc, MemToReg, RegWrite, MemWrite, MemRead, Branch, ExtOp, ALUctr);

    always @(posedge clk)
    begin
        if (ExtOp)
            ext_imm = $signed(instruction[3:0]);
        else
            ext_imm = { 12'd0, instruction[3:0] };
    end
	
	always @(*)
	begin
		if (Branch && zero)
			pc <= (pc + 1) + ext_imm;
		else
			pc <= pc + 1;
	end
	
	
	RegisterFile regfile(clk, RegWrite, instruction[11:8], instruction[7:4], regwrite, writedata, readdata1, readdata2);
	
	ALU alu(readdata1, ALUinput2, ALUctr, ALUResult, zero);
	
	Memory memory(clk, MemWrite, MemRead, ALUsrc, readdata2, readdata);

	Multiplexer16 mul_1(MemToReg, readdata, ALUResult, writedata);
	Multiplexer16 mul_2(ALUsrc, ext_imm, readdata2, ALUinput2);	
	Multiplexer4 mul_3(RegDst, instruction[3:0], instruction[7:4], regwrite);

endmodule
