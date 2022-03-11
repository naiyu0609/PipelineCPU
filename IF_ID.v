module IF_ID(
 	input [31:0] Instruction_in,//input instruction
 	input clk,//clock
	input IF_ID_Write,//signal of Writing or not
 	output reg [31:0] Instruction_out//output instruction
);

reg [31:0] IF_ID_reg;//store instruction

always@(posedge clk)begin//let output data equal Register data 
	Instruction_out<=IF_ID_reg;
end
always@(Instruction_in)begin//read data in register
	IF_ID_reg<=Instruction_in;
end
always@(negedge IF_ID_Write)begin//let output equal 0
	Instruction_out<=32'd0;
end
initial begin
	IF_ID_reg=32'd0;
	Instruction_out=32'd0;
end
endmodule
