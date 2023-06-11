module CPU(
	input clk,
	input clear,
	output[15:0] ALURes, pc
    );
	 
	 wire [15:0] WriteData;
	 wire [15:0] ALURes;
	 wire [15:0] MemRes;
	 
	 wire [15:0]ins;
	 wire zero;
	 wire branch;
	 wire [19:0]imm;
	 
	 InstructionMemory ins_mem(clk, zero, branch, imm, ins);
	 
	 wire lw;
	 wire sw;
	 wire rtype;
	 Control_Unit cu(ins[19:16], branch, lw, sw, rtype);
	 
	 wire [3:0] out;
	 ControlUnit acu(ins[19:16], rtype, branch, out);
	 
	 wire [3:0] Dest;
	 wire RW;
	 
	 mid1(rtype, lw, ins, Dest, ALURes, MemRes, WBData, RW);
	 
	 wire [3:0] Reg1;
	 wire [3:0] Reg2;
	 wire clear_reg;
	 wire [19:0] out_reg1;
	 wire [19:0] out_reg2;
	 
	 RegisterFile(clk, RW, Dest, WBData, clear_reg, Reg1, Reg2, out_reg1, out_reg2);

	 ALU(Reg1, Reg2, out, ALURes, zero);
	 
	 wire writeif;
	 wire readif;
	 wire clear_mem;
	 
	 Memory(clk, ALURes, out_reg2, writeif, readif, clear_mem, MemRes);
endmodule
