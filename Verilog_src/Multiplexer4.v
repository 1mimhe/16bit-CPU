module Multiplexer4
	(input select,
	 input [3:0] input1,
	 input [3:0] input2,
	 output wire [3:0] result
    );
	 
	assign result = (select) ? input2 : input1;

endmodule
