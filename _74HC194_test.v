module test;

	// Inputs
	reg CR;
	reg S1;
	reg S0;
	reg CP;
	reg DSR;
	reg DSL;
	reg [3:0] D;

	// Outputs
	wire [3:0] Q;

	// Instantiate the Unit Under Test (UUT)
	bdirect_shift_reg uut (
		.CR(CR), 
		.S1(S1), 
		.S0(S0), 
		.CP(CP), 
		.DSR(DSR), 
		.DSL(DSL), 
		.D(D), 
		.Q(Q)
	);
	
	parameter PERIOD = 10;

	//**在此处添加时钟信号**
		always begin
		CP = 1'b0; 
		#(PERIOD/2) CP= 1'b1;
		#(PERIOD/2);
		end
		
	initial begin
		// Initialize Inputs
		CR = 0;S1 = 0;S0 = 0;CP = 0;DSR = 0;DSL = 0;D = 0;
			
		// Wait 100 ns for global reset to finish
		#100;   
		// Add stimulus here
		
			//预置为1111
			CR=1;S1=1;S0=1;DSR=0;DSL=0;D=4'b1111;
			#10
			//清零
			CR=0;S1=1;S0=1;DSR=0;DSL=0;D=4'b1111;

			#10
			//左移，DSL=1
			CR=1;S1=1;S0=0;DSR=0;DSL=1;D=4'b1111;
			#10
			//左移，DSL=0
			CR=1;S1=1;S0=0;DSR=0;DSL=0;D=4'b1111;
			#10
			//左移，DSL=1
			CR=1;S1=1;S0=0;DSR=0;DSL=1;D=4'b1111;
			#10
			//左移，DSL=0
			CR=1;S1=1;S0=0;DSR=0;DSL=0;D=4'b1111;
			
			#10
			//右移，DSR=1
			CR=1;S1=0;S0=1;DSR=1;DSL=0;D=4'b1111;
			#10
			//右移，DSR=0
			CR=1;S1=0;S0=1;DSR=0;DSL=0;D=4'b1111;
			#10
			//右移，DSR=1
			CR=1;S1=0;S0=1;DSR=1;DSL=0;D=4'b1111;
			#10
			//右移，DSR=0
			CR=1;S1=0;S0=1;DSR=0;DSL=0;D=4'b1111;

	end
      
endmodule
