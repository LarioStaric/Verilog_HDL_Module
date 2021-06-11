//P315_4位双向移位寄存器_74HC194
module bdirect_shift_reg(			
	input CR, S1, S0, CP, DSR, DSL,
	input [3:0] D,
	output reg [3:0] Q
);			
/*
	DSR:右移串行数据输入端
	DSL:左移串行数据输入端
	CR_n:异步清零输入端
	CP:时钟信号
	S1,S0:控制信号
	D:预置输入数据
	Q:输出数据
*/
	always@(posedge CP or negedge CR)
	begin
		if(~CR)    Q <= 4'b0000;  //CR异步置零的优先级最高
		else
		begin
			case({S1, S0})             //判断控制信号
			2'b00: Q <= Q;
			2'b01: Q <= {Q[2:0], DSR};    //使用位拼接运算符实现数据的左右移动
			2'b10: Q <= {DSL, Q[3:1]};
			2'b11: Q <= D;
			endcase 
		end
	end
endmodule
