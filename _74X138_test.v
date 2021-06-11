module test;

	// Inputs
	reg [2:0] En;
	reg [2:0] I;

	// Outputs
	wire [7:0] Y;

	// Instantiate the Unit Under Test (UUT)
	decoder3_8 uut (
		.En(En), 
		.I(I), 
		.Y(Y)
	);
	
	parameter PERIOD = 100;

	initial begin
		// Initialize Inputs
		En = 0;
		I = 0;

		// Wait 100 ns for global reset to finish
		#100; 
        
		// Add stimulus here
		
		En = 0; I=3'b000;
		#PERIOD
		En = 0; I=3'b001;
		#PERIOD
		En = 1; I=3'b001;
		#PERIOD
		En = 1; I=3'b010;
		#PERIOD
		En = 1; I=3'b110;

	end
      
endmodule
