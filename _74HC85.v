//P189_4位集成数值比较器_74HC85
module comparator_4b(A, B, Feq, Fgt, Flt, Ieq, Igt, Ilt);

	input [3:0] A, B;		//输入两个4位需要比较的数值，前者与后者关系
	output reg Feq, Fgt, Flt;	//上一级的结果联合A与B比较结果
	input Ieq, Igt, Ilt;		//扩展输入端，低级的输出做为输入	

	always@(*) 
	begin
		if(A == B)	begin				//高位相同，比较低位
			if(Igt && !Ilt && !Ieq) begin
				Fgt=1; Flt=0; Feq=0;
				end
			else if(Ilt && !Igt && !Ieq) begin
				Fgt=0; Flt=1; Feq=0;
				end
			else if(!Ilt && !Igt && Ieq) begin
				Fgt=0; Flt=0; Feq=1;
				end
			end
		else if(A > B) begin
			Fgt=1; Flt=0; Feq=0;
			end
		else if(A < B) begin
			Fgt=0; Flt=1; Feq=0;
			end
	end
endmodule 
