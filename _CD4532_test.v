timescale 1ns / 1ps

module test;

	// Inputs
	reg EI;
	reg [7:0] I;
	// Outputs
	wire [2:0] Y;
	wire GS;
	wire EO;

	// Instantiate the Unit Under Test (UUT)
	encoder8_3 uut (
		.EI(EI), 
		.I(I), 
		.Y(Y), 
		.GS(GS), 
		.EO(EO)
	);

	parameter PERIOD = 100;
	
	initial begin
		// Initialize Inputs
		EI = 0;
		I = 0;

		// Wait 500 ns for global reset to finish
		#500;
        
		// Add stimulus here
		
		EI = 0; I=8'b1111_1111;
		#PERIOD
		EI = 0; I=8'b0111_1101;
		#PERIOD
		EI = 1; I=8'b1111_1101;
		#PERIOD
		EI = 1; I=8'b0111_1100;
		#PERIOD
		EI = 1; I=8'b0001_1111;
	end   
endmodule
