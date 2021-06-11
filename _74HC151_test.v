module test;

	// Inputs
	reg En;
	reg [2:0] S;
	reg [7:0] D;
	// Outputs
	wire Y;  wire Yn;   
	// Instantiate the Unit Under Test (UUT)
	MUX8_1 uut (
		.En(En), 
		.S(S), 
		.D(D), 
		.Y(Y), 
		.Yn(Yn)
	);

	parameter PERIOD = 10;
		
	initial begin
		// Initialize Inputs
		En = 0; S = 0; D = 0;
		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		
		En=1; S=3'b111; D=8'b1111_1111;
		#PERIOD
		En=0; S=3'b111; D=8'b1111_1111;
		#PERIOD
		En=0; S=3'b000; D=8'b1111_1111;
		#PERIOD
		En=0; S=3'b000; D=8'b1111_1110;
		#PERIOD
		En=0; S=3'b001; D=8'b0101_0101;
		#PERIOD
		En=0; S=3'b010; D=8'b0101_0101;
		#PERIOD
		En=0; S=3'b011; D=8'b0101_0101;
		#PERIOD
		En=0; S=3'b100; D=8'b0101_0101;
	end   
endmodule
