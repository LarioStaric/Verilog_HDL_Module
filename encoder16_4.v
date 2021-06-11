//16-4线编码器_两片CD4532_P166
module encoder16_4(EI1, I, L, GS, EO0);
    input EI1;              	// 高电平有效的输入使能端
    input [15:0] I;         	// 8个信号输入端
    output [3:0] L;				    // 3个信号输出端
    output  GS, EO0;       		// 优先编码工作状态标志GS和输出使能端EO
    wire [2:0] Y0, Y1;
    wire EO1, GS1, GS0;

    encoder8_3 I1(EI1, I[15:8], Y1, GS1, EO1);	//输入高位信号
    encoder8_3 I2(EO1, I[7:0], Y0, GS0, EO0);		//输入低位信号

    assign GS = GS1 | GS0;
    assign L[2:0] = {Y1[2] | Y0[2], Y1[1] | Y0[1], Y1[0] | Y0[0]};
    assign L[3] = GS1;
endmodule  
