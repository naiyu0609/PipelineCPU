module ALUctrl(
 	input [5:0] funct,//the instruction last 6 bits
 	input [2:0] ALUOp,//the signal from controller
 	output reg [5:0] operation//the signal to the ALU operation
);

always@(funct or ALUOp)begin
	case(ALUOp)//identify the signal of controller is what type
		3'b010:begin//R-Type
			case(funct)
				6'd21:operation=6'd27;//ADD
				6'd22:operation=6'd28;//SUB
				6'd23:operation=6'd29;//SRL
				6'd24:operation=6'd30;//SLL
				6'd25:operation=6'd31;//XOR
				6'd26:operation=6'd32;//AND
				6'd27:operation=6'd33;//SLT
		      	endcase
		end
		3'b000:operation=6'd27;//Type of LW SW addi
		3'b001:operation=6'd28;//Type of subi
		3'b101:operation=6'd28;//type of beq
	endcase
end
initial begin//initial value
	operation=6'd0;
end
endmodule
