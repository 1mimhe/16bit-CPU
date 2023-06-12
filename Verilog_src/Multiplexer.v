module Multiplexer16
	(input select,
	 input [15:0] input1,
	 input [15:0] input2,
	 output wire [15:0] result
    );
	 
	assign result = (select) ? input2 : input1;

endmodule
