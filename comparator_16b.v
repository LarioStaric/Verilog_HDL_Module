//74HC85组成16位数值比较器_P189
module comparator_16b(A, B, F_eq, F_gt, F_lt);
    input [15:0] A, B;
    output F_eq, F_gt, F_lt;
	 
    wire F0_eq, F0_gt, F0_lt, 	//输出进位信号
			F1_eq, F1_gt, F1_lt, 
			F2_eq, F2_gt, F2_lt, 
			F3_eq, F3_gt, F3_lt;
			
    wire I_eq, I_gt, I_lt;		//输入进位信号

    assign I_gt = 0;
    assign I_lt = 0;
    assign I_eq = 1;
	 
	 //每次从低到高比较4位，低一级的进位输出作为高一级的进位输入
    comparator_4b I0(A[3:0],   B[3:0],   F0_eq, F0_gt, F0_lt, I_eq,  I_gt,  I_lt);
    comparator_4b I1(A[7:4], 	 B[7:4],   F1_eq, F1_gt, F1_lt, F0_eq, F0_gt, F0_lt);
    comparator_4b I2(A[11:8],  B[11:8],  F2_eq, F2_gt, F2_lt, F1_eq, F1_gt, F1_lt);
    comparator_4b I3(A[15:12], B[15:12], F_eq,  F_gt,  F_lt,  F2_eq, F2_gt, F2_lt);
	  
endmodule 
