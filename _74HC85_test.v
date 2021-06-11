module test;

	// Inputs
    reg Igt; reg Ilt; reg Ieq; reg [3:0] A; reg [3:0] B;

	// Outputs
	wire Fgt;
	wire Flt;
	wire Feq;

	// Instantiate the Unit Under Test (UUT)
	comparator_4 uut (
		.Igt(Igt), 
		.Ilt(Ilt), 
		.Ieq(Ieq), 
		.A(A), 
		.B(B), 
		.Fgt(Fgt), 
		.Flt(Flt), 
		.Feq(Feq)
	);

	initial begin
		// Initialize Inputs
		Igt = 0; Ilt = 0; Ieq = 1; A = 0; B = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		
			Igt=1; Ilt=0; Ieq=0; A=4'b0000; B=4'b1111;
			#100
			Igt=0;Ilt=1;Ieq=0;A=4'b0111;B=4'b0011;
			#100
			Igt=0;Ilt=0;Ieq=1;A=4'b0000;B=4'b0000;
			#100
			Igt=0;Ilt=0;Ieq=1;A=4'b0101;B=4'b0010;
			#100
			Igt=0;Ilt=0;Ieq=1;A=4'b1000;B=4'b0110;
	end 
endmodule
