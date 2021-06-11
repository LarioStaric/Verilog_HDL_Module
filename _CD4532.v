//P164_8-3优先编码器_CD4532
module encoder8_3(EI, I, Y, GS, EO);	
	input EI;				//输入使能端，高电平有效
	input[7:0] I;			//输入一位十进制数，高位优先
	output reg[2:0] Y;	//输出3位二进制码
	output reg GS, EO;	//优先编码工作状态标志GS，输出使能端EO
	
	always@(*)
	begin
		if(EI == 0)	//使能端为0
			begin
			Y <= 3'b000;
			GS <= 0;
			EO <= 0;
			end
		else 
			casex(I)	//输入端对应十进制码，输出端对应二进制码.注意是casex
				8'b0000_0000 : begin Y<=3'b000; EO<=1; GS<=0;end
				8'b1xxx_xxxx : begin Y<=3'b111; EO<=0; GS<=1;end
				8'b01xx_xxxx : begin Y<=3'b110; EO<=0; GS<=1;end
				8'b001x_xxxx : begin Y<=3'b101; EO<=0; GS<=1;end
				8'b0001_xxxx : begin Y<=3'b100; EO<=0; GS<=1;end
				8'b0000_1xxx : begin Y<=3'b011; EO<=0; GS<=1;end
				8'b0000_01xx : begin Y<=3'b010; EO<=0; GS<=1;end
				8'b0000_001x : begin Y<=3'b001; EO<=0; GS<=1;end
				8'b0000_0001 : begin Y<=3'b000; EO<=0; GS<=1;end
			endcase
	end	
endmodule
