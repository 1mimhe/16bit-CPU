module ControlUnit(
		input [3:0]Opcode,
		output reg RegDst,
		output reg ALUsrc,
		output reg MemtoReg,
		output reg RegWrite,
		output reg MemWrite,
		output reg Branch,
		output reg ExtOp,
		output reg [2:0]ALUctr
		);
		reg o0, o1, o2, o3;
		assign o0 = Opcode[0]; assign o1 = Opcode[1];
		assign o2 = Opcode[2]; assign o3 = Opcode[3];
		reg add, sub, mul, div, ori, nor_, nand_, sw, lw, blt; 
always @(*)
begin
	add = ~o3 & ~o2 & ~o1 & ~o0;
	sub = ~o3 & ~o2 & ~o1 & o0;
	mul = ~o3 & ~o2 & o1 & ~o0;
	div = ~o3 & ~o2 & o1 & o0;
	ori = ~o3 & o2 & ~o1 & ~o0;
	nor_ = ~o3 & o2 & ~o1 & o0;
	nand_ = ~o3 & o2 & o1 & ~o0;
	sw = ~o3 & o2 & o1 & o0;
	lw = o3 & ~o2 & ~o1 & ~o0;
	blt = o3 & ~o2 & ~o1 & o0;

	RegDst = add | sub | mul | div | nor_ | nand_;
	ALUsrc = ori | sw | lw;
	MemtoReg = lw;
	RegWrite = RegDst | ori | lw;
	MemWrite = sw;
	Branch = blt;
	ExtOp =	lw | sw;

	if(MemWrite) ALUctr = 3'b000;
	else ALUctr = Opcode[2:0];
end

endmodule
