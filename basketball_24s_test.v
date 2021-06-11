module test;

	// Inputs
	reg rst;
	reg pause;
	reg clk;

	// Outputs
	wire [3:0] timesh;
	wire [3:0] timesl;
	wire alarm;
	wire [6:0] display1;
	wire [6:0] display2;

	// Instantiate the Unit Under Test (UUT)
	basketball_24s uut (
		.rst(rst), 
		.pause(pause), 
		.clk(clk), 
		.timesh(timesh), 
		.timesl(timesl), 
		.alarm(alarm), 
		.display1(display1), 
		.display2(display2)
	);
	
	always #1 clk = ~clk;

	initial begin
		// Initialize Inputs
		rst = 0;
		pause = 0;
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
			clk = 0; rst = 0; pause = 1;
			#20 rst = 1;
			#50 pause = 0;
			#20 rst = 0;

	end   
endmodule
