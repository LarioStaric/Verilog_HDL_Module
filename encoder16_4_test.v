module test;
	// Inputs
	reg EI1;
	reg [15:0] I;
	// Outputs
	wire [3:0] L;
	wire GS;
	wire EO0;
	// Instantiate the Unit Under Test (UUT)
	encoder16_4 uut (
		.EI1(EI1), 
		.I(I), 
		.L(L), 
		.GS(GS), 
		.EO0(EO0)
	);
	initial begin
		// Initialize Inputs
		EI1 = 0;  I = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		  #2 EI1 = 1;
        #2 I = 16'b0000_0000_0000_0000;
        #2 I = 16'b1000_0000_0000_0000;
        #2 I = 16'b0100_0000_0000_0100;
        #2 I = 16'b0010_0000_0000_0100;
        #2 I = 16'b0001_0000_1000_0100;
        #2 I = 16'b0000_1000_0100_0100;
        #2 I = 16'b0000_0100_0100_0100;
        #2 I = 16'b0000_0010_0000_0100;
        #2 I = 16'b0000_0001_0000_0100;
        #2 I = 16'b0000_0000_1000_0000;
        #2 I = 16'b0000_0000_0100_0000;
        #2 I = 16'b0000_0000_0010_0000;
        #2 I = 16'b0000_0000_0001_0000;
        #2 I = 16'b0000_0000_0000_1000;
        #2 I = 16'b0000_0000_0000_0100;
	end     
endmodule
