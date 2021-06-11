//篮球24秒计时显示器
module basketball_24s(rst, pause, clk, timesh, timesl, alarm, display1, display2); 
	input rst, pause, clk; 				//置零，暂停，时钟信号
	output reg [3:0] timesh, timesl; //秒的高位低位
	output reg alarm;							//闹钟信号
	output [6:0] display1, display2;	//显示信号
	wire LE, BL, LT;						//LE,BL,LT为使能信号, LT,BL为低有效测试信号
	
	assign {LE, BL, LT} = 3'b011;		//显示模块正常运行
	
	//第一个显示器显示时间高位，第二个显示时间低位
	disp_decoder I1(LE, BL, LT, timesh, display1[6:0]);
	disp_decoder I2(LE, BL, LT, timesl, display2[6:0]);

//	assign alarm = ({timesh,timesl} == 8'h00) && (rst == 1'b1);	//正常计数且时间为0时闹钟工作
	
	always @(posedge clk or negedge rst or negedge pause) begin 
		if (~rst) {timesh, timesl} <= 8'h24; 						//重设时间为24s
		else if (~pause) {timesh,timesl} <= {timesh, timesl}; //pause暂停
		else if ({timesh, timesl} == 8'h00) 						//计时为0时暂停
			{timesh, timesl} <= {timesh, timesl}; 
		//时钟递减计时，低位满十高位退位
		else if (timesl == 4'h0) begin
			timesh <= timesh - 1'b1;
			timesl <= 4'h9;
		end
		else begin
			timesh <= timesh;
			timesl <= timesl - 1'b1;
		end
		alarm = ({timesh,timesl} == 8'h00) && (rst == 1'b1);	//正常计数且时间为0时闹钟工作
	end
endmodule 
