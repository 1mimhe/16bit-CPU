module ALU(
	input [15:0]A,
	input [15:0]B,
	input [2:0]Opcode,
	output reg [15:0]Result,
	output reg ZERO
	);
	integer i;

always @(*)
begin
	case(Opcode)
	3'b000 : Result = A + B;
	3'b001 : Result = A - B;
	3'b010 : Result = A * B;
	3'b011 : Result = A / B;
	3'b100 : Result = A | B;
	3'b101 : Result = ~(A | B);
	3'b110 : Result = ~(A & B);
	endcase	
	// assign ZERO
	for(i=0; i<16; i=i+1)
	begin
	ZERO = ZERO | Result[i];
	end
	ZERO = ~ZERO;
end

endmodule