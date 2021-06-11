//74X139和74X138构成5-32线译码器_P170
module decoder5_32(B, E, L);
    input [4:0] B;
    input E;
    output [31:0] L;
    wire [3:0] Y;
    wire [2:0] E0, E1, E2, E3;

    assign E0 = {1, 0, Y[0]}; 
    assign E1 = {1, 0, Y[1]}; 
    assign E2 = {1, 0, Y[2]}; 
    assign E3 = {1, 0, Y[3]};

    HC139 I1(B[4:3], E, Y);
    decoder3_8 I2(B[2:0], E0, L[7:0]);
    decoder3_8 I3(B[2:0], E1, L[15:8]);
    decoder3_8 I4(B[2:0], E2, L[23:16]);
    decoder3_8 I5(B[2:0], E3, L[31:24]);

endmodule

module HC139(
    input [1:0] A,
    input E,
    output reg [3:0] Y
    );

    always @(E, A) begin
        if (E == 1)
            Y = 4'b1111;
        else begin
            case (A)
                2'b00: Y = 4'b0111;
                2'b01: Y = 4'b1011;
                2'b10: Y = 4'b1101;
                2'b11: Y = 4'b1110;
            endcase
        end
    end
endmodule
