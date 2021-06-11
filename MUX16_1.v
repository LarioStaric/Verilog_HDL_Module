//16-1数据选择器_两片74LS151_P186
module MUX16_1(S, D, Y, Y_n);
	input [3:0] S;
	input [15:0] D;
	output Y, Y_n;
	wire Y0, Y0_n, Y1, Y1_n;
	
	MUX8_1 I0 (S[3],  S[2:0], D[7:0], Y0, Y0_n);
	MUX8_1 I1 (~S[3], S[2:0], D[15:8], Y1, Y1_n);

	assign Y = Y0 | Y1;
	assign Y_n = Y0_n & Y1_n;
	 
endmodule
