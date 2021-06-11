module test;

	// Inputs
	reg [4:0] B;
	reg E;

	// Outputs
	wire [31:0] L;

	// Instantiate the Unit Under Test (UUT)
	decoder5_32 uut (
		.B(B), 
		.E(E), 
		.L(L)
	);

	initial begin
		// Initialize Inputs
		B = 0;
		E = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		  #2 B = 5'b00001;
        #2 B = 5'b00010;
        #2 B = 5'b00011;
        #2 B = 5'b00100;
        #2 B = 5'b00101;
        #2 B = 5'b00110;
        #2 B = 5'b00111;
        #2 B = 5'b01000;

	end
endmodule
