`timescale 1ns / 1ps

module test;

	// Inputs
	reg [15:0] A;
	reg [15:0] B;

	// Outputs
	wire F_eq;
	wire F_gt;
	wire F_lt;

	// Instantiate the Unit Under Test (UUT)
	comparator_16b uut (
		.A(A), 
		.B(B), 
		.F_eq(F_eq), 
		.F_gt(F_gt), 
		.F_lt(F_lt)
	);

	initial begin
		// Initialize Inputs
		A = 0;
		B = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

		A = 16'b0000_0000_0000_0000; 
		B = 16'b0000_1000_0000_0000;
		#5 A = 16'b1010_0001_0000_0000;
		#5 A = 16'b0000_1000_1001_1000;
		#5 A = 16'b0001_0100_0100_1000;
		#5 A = 16'b0000_0000_1000_1001;
		#5 A = 16'b0001_0000_0000_1010;
		#5 A = 16'b0000_0000_0000_0011;
		#5 A = 16'b0000_0000_0000_0001;
		
	end   
endmodule
