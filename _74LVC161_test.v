module test;
	// Inputs
	reg CR;
	reg PE;
	reg CEP;
	reg CET;
	reg CP;
	reg [3:0] D;
	// Outputs
	wire [3:0] Q;
	wire TC;
	// Instantiate the Unit Under Test (UUT)
	counter15 uut (
		.CR(CR), 
		.PE(PE), 
		.CEP(CEP), 
		.CET(CET), 
		.CP(CP), 
		.D(D), 
		.Q(Q), 
		.TC(TC)
	);

	always #1 CP = ~CP;
	
	initial begin
		// Initialize Inputs
		CR = 0;PE = 0;CEP = 0;CET = 0;CP = 0;D = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		  CP = 0; CR = 0; PE = 0; CEP = 1; CET = 1; D = 4'b0110;
        #2 CR = 1;
        #2 PE = 1;
		#20
        #2 CEP = 0;
        #2 CET = 0;

	end
      
endmodule
