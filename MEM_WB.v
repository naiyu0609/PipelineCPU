module MEM_WB(
 	input [31:0] DM_data_in,//input data
	input [31:0] ALU_result_in,//input data
	input [4:0] Write_Address_in,//input data
 	input MemtoReg_in,//input control signal
 	input RegWrite_in,//input control signal
 	input clk,//clock
 	output reg [31:0] DM_data_out,//output data
	output reg [31:0] ALU_result_out,//output data
	output reg [4:0] Write_Address_out,//output data
 	output reg MemtoReg_out,//output control signal
 	output reg RegWrite_out//output control signal
);
	reg [31:0] DM_data;//store data
	reg [31:0] ALU_result;//store data
	reg [4:0] Write_Address;//store data
 	reg MemtoReg;//store control signal
 	reg RegWrite;//store control signal

always@(posedge clk)begin//let output data equal Register data 
	DM_data_out<=DM_data;
	ALU_result_out<=ALU_result;
	Write_Address_out<=Write_Address;
 	MemtoReg_out<=MemtoReg;
 	RegWrite_out<=RegWrite;
end
always@(DM_data_in or ALU_result_in or Write_Address_in or MemtoReg_in or RegWrite_in)begin//read data in register
	DM_data<=DM_data_in;
	ALU_result<=ALU_result_in;
	Write_Address<=Write_Address_in;
 	MemtoReg<=MemtoReg_in;
 	RegWrite<=RegWrite_in;
end
initial begin
	DM_data<=32'd0;
	ALU_result<=32'd0;
	Write_Address<=5'd0;
 	MemtoReg<=0;
 	RegWrite<=0;

	DM_data_out<=32'd0;
	ALU_result_out<=32'd0;
	Write_Address_out<=5'd0;
 	MemtoReg_out<=0;
 	RegWrite_out<=0;
end
endmodule
