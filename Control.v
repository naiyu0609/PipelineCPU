module Control(
 	input [5:0] Op,//the instruction first 6bits
 	output reg [2:0] ALUOp,//the signal for ALUctrl
 	output reg RegDst,//the signal for RD_address
 	output reg MemRead,//the signal for memory read or not
 	output reg MemtoReg,//the signal for which data(ALU result or memory data) is write data in RF
 	output reg MemWrite,//the signal for memory write or not
 	output reg ALUSrc,//the signal for comfirm ALU source2
 	output reg RegWrite//the signal for register write or not
);
always@(Op)begin
	ALUOp=3'd0;
	RegDst=0;
	MemRead=0;
	MemWrite=0;
 	ALUSrc=0;
 	RegWrite=0;
	MemtoReg=0;
	case(Op)
		6'd8:{ALUOp,RegDst,MemRead,MemtoReg,MemWrite,ALUSrc,RegWrite}=11'b000_0_0_0_0_1_1;//setting of addi
		6'd9:{ALUOp,RegDst,MemRead,MemtoReg,MemWrite,ALUSrc,RegWrite}=11'b001_0_0_0_0_1_1;//setting of subi
		6'd20:{ALUOp,RegDst,MemRead,MemtoReg,MemWrite,ALUSrc,RegWrite}=11'b010_1_0_0_0_0_1;//setting of R-type
		6'd35:{ALUOp,RegDst,MemRead,MemtoReg,MemWrite,ALUSrc,RegWrite}=11'b000_0_1_1_0_1_1;//setting of LW
		6'd43:{ALUOp,RegDst,MemRead,MemtoReg,MemWrite,ALUSrc,RegWrite}=11'b000_0_0_0_1_1_0;//setting of SW
	endcase
end	

initial begin//initial value
	ALUOp=3'd0;
	RegDst=0;
	MemRead=0;
	MemWrite=0;
 	ALUSrc=0;
 	RegWrite=0;
	MemtoReg=0;
end
endmodule
