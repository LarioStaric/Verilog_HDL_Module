module test;

	// Inputs
	reg [3:0] A;reg [3:0] B;reg Cex;
	// Outputs
	wire [3:0] S;
	wire CO;

	// Instantiate the Unit Under Test (UUT)
	fulladder_4b uut (
		.A(A), 
		.B(B), 
		.Cex(Cex), 
		.S(S), 
		.CO(CO)
	);
	initial begin
		// Initialize Inputs
		A = 0;B = 0;Cex = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

			A=4'h0;B=4'h0;Cex=0;
			#10
			A=4'h0;B=4'h0;Cex=1;
			#10
			A=4'h1;B=4'h0;Cex=1;
			#10
			A=4'h1;B=4'h1;Cex=1;
			#10
			A=4'h5;B=4'ha;Cex=1;
			#10
			A=4'ha;B=4'ha;Cex=0;
			#10
			A=4'hf;B=4'ha;Cex=0;
			#10
			A=4'hf;B=4'hf;Cex=0;
	
	end    
endmodule
