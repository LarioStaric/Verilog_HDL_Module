`timescale 1ns / 1ps

module test;

	// Inputs
	reg [3:0] S;
	reg [15:0] D;

	// Outputs
	wire Y;
	wire Y_n;

	// Instantiate the Unit Under Test (UUT)
	MUX16_1 uut (
		.S(S), 
		.D(D), 
		.Y(Y), 
		.Y_n(Y_n)
	);

	initial begin
		// Initialize Inputs
		S = 0;
		D = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
			S = 4'b0000; 
			D = 16'b1011_0010_0110_1111; 
			#2 S = 4'b0001;
			#2 S = 4'b0010;
			#2 S = 4'b0011;
			#2 S = 4'b0100;
			#2 S = 4'b0101;
			#2 S = 4'b0110;
			#2 S = 4'b0111;
			#2 S = 4'b1000;
			#2 S = 4'b1001;

	end    
endmodule
