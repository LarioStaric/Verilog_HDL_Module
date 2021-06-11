//P169_3-8线译码器_74X138
module decoder3_8(I, En, Y);
	input wire[2:0] En;
	input wire[2:0] I;
	output reg[7:0] Y;
                    
//   assign Y = (En==3'b100) ? ~(8'b0000_0001 << I) : 8'b0000_0000;
	
    always @(I, En) begin
        if (En != 3'b100)
            Y = 8'b1111_1111;
        else begin
            case (I)
                3'b000: Y = 8'b0111_1111;
                3'b001: Y = 8'b1011_1111;
                3'b010: Y = 8'b1101_1111;
                3'b011: Y = 8'b1110_1111;
                3'b100: Y = 8'b1111_0111;
                3'b101: Y = 8'b1111_1011;
                3'b110: Y = 8'b1111_1101;
                3'b111: Y = 8'b1111_1110;
            endcase
        end
    end
 endmodule
