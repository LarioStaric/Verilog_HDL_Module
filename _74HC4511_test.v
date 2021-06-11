`timescale 1ns / 1ps

module test;
	// Inputs
	reg LE;
	reg BL;
	reg LT;
	reg [3:0] D;
	// Outputs
	wire [6:0] L;
	// Instantiate the Unit Under Test (UUT)
	disp_decoder uut (
		.LE(LE), 
		.BL(BL), 
		.LT(LT), 
		.D(D), 
		.L(L)
	);

	parameter PERIOD = 10;
	
	initial begin
		// Initialize Inputs
		LE = 0; BL = 0; LT = 0; D = 0;
        
		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
			LE=1; BL=1; LT=0; D=4'b0000;//灯测试
			#PERIOD
			LE=0; BL=1; LT=1; D=4'b0100;//七段译码器测试
			#PERIOD
			LE=0; BL=1; LT=1; D=4'b1001;
			#PERIOD
			LE=0; BL=1; LT=1; D=4'b1101;//无效状态
			#PERIOD
			LE=1; BL=1; LT=1; D=4'b0100;//锁存
			#PERIOD
			LE=0; BL=1; LT=1; D=4'b0100;
			#PERIOD
			LE=1; BL=0; LT=1; D=4'b0000;//灭灯

	end     
endmodule
