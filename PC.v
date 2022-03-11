module PC(
	input [31:0] Next_Instruction,//addr_in
	input PCWrite,//control signal 
 	input clk,//clock
 	output reg [31:0] Instruction_Address//Instruction_Address
);

always@(posedge clk)begin//read addr_in
	Instruction_Address<=Next_Instruction;
end
always@(negedge PCWrite)begin//if Hazard we need to read Instruction again
	Instruction_Address<=Instruction_Address-4;
end
endmodule
