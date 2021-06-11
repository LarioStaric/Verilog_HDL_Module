//P185_八位数据选择器_74HC151
module MUX8_1(
	input En,			//En为使能端，低电平有效
	input [2:0] S,		//S 为选择输入信号
	input [7:0] D,		//D 为8路输入信号
	output reg Y,Yn	//Y 信号输出; Y_n:信号输出,低电平有效
);

	always @(*) begin
		if(!En) begin
		//使能端有效
			case(S)
				3'b000:begin Y=D[0]; Yn=~D[0];end
				3'b001:begin Y=D[1]; Yn=~D[1];end
				3'b010:begin Y=D[2]; Yn=~D[2];end
				3'b011:begin Y=D[3]; Yn=~D[3];end
				3'b100:begin Y=D[4]; Yn=~D[4];end
				3'b101:begin Y=D[5]; Yn=~D[5];end
				3'b110:begin Y=D[6]; Yn=~D[6];end
				3'b111:begin Y=D[7]; Yn=~D[7];end
			endcase
		end
		else begin
			Y=0; Yn=1;
		end
	end
endmodule
