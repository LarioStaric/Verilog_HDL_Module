//P323_四位同步二进制递增计数器_74LVC161
module counter15(CR, PE, CEP, CET, CP, D, Q, TC);
    input CR, PE, CEP, CET, CP;
    input [3:0] D;		//输入信号
    output reg [3:0] Q;	//输出信号
    output TC;				//进位信号

    assign TC = ((&Q) & CET == 1);	//当且仅当Q=1111, CET=1时TC为1
	 
    always @(posedge CP, negedge CR, posedge PE) 
	 begin
        if (CR == 0) 		Q <= 4'b0000;	//CR异步清零
        else if (PE == 0) 	Q <= D;			//PE预置信号
        else if (CEP == 0) Q <= Q;			//CEP=0保持
        else if (CET == 0) Q <= Q;			//CET=0保持	
        else 					Q = Q + 4'b0001;	//正常计数
    end
endmodule 
