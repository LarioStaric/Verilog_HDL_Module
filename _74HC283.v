//P194_超前进位加法器_74HC283
module fulladder_4b(
	input [3:0] A,B,		//输入加数
	input Cex,				//上一级的进位
	output reg[3:0] S,	//相加结果
	output reg CO			//进位
);

	reg [3:0] P,G;		//中间变量
	wire [3:0] C;
	
	//实例化超前进位电路
	carry_lookahead C1(
	.P(P),
	.G(G),
	.Cex(Cex),
	.C(C)
	);
	
	always@(*)begin
		P = A^B;		//P: A xor B
		G = A&B;		//G: A and B
		CO = C[3];
		S[3]=P[3]^C[2];
		S[2]=P[2]^C[1];
		S[1]=P[1]^C[0];
		S[0]=P[0]^Cex;
	end
endmodule


//进位控制
module carry_lookahead(
	input [3:0] P,G,	//P: A xor B
							//G: A and B
	input Cex,			//上一级的进位
	output reg[3:0] C	//本级进位
); 

	always@(*) begin	//各位进位逻辑表达式描述
		C[0] = G[0] | (P[0] & Cex );
		C[1] = G[1] | (P[1] & C[0]);
		C[2] = G[2] | (P[2] & C[1]);
		C[3] = G[3] | (P[3] & C[2]);
	end
endmodule
