module CPU_tb;
	
	reg clk;
	
	CPU uut(
		.clk(clk)
	);

 	initial begin 
		clk = 0;
    	forever begin
    	#50 clk = ~clk;
    	end
	end
endmodule
