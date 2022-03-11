module EX_MEM(
 	input [31:0] ALU_result_in,//input of ALU Result
	input [31:0] RT_data_in,//input of RT data
	input [4:0] Write_Address_in,//input of the address which will be writed in
	input RegWrite_in,//input of the signal for register write or not
	input MemtoReg_in,//input of the signal for which data(ALU result or memory data) is write data in RF
	input MemRead_in,//input of the signal for memory read or not
 	input MemWrite_in,//input of the signal for memory write or not
 	input clk,//clock
 	output reg  [31:0] ALU_result_out,//output from EX_MEM Register
	output reg  [31:0] RT_data_out,//output from EX_MEM Register
	output reg  [4:0] Write_Address_out,//output from EX_MEM Register
	output reg RegWrite_out,//output from EX_MEM Register
	output reg MemtoReg_out,//output from EX_MEM Register
	output reg MemRead_out,//output from EX_MEM Register
 	output reg MemWrite_out//output from EX_MEM Register
);
	reg  [31:0] ALU_result;//Register for store data
	reg  [31:0] RT_data;//Register for store data
	reg  [4:0] Write_Address;//Register for store data
	reg RegWrite;//Register for store data
	reg MemtoReg;//Register for store data
	reg MemRead;//Register for store data
 	reg MemWrite;//Register for store data

always@(posedge clk)begin//let output data equal Register data 
	ALU_result_out<=ALU_result;
	RT_data_out<=RT_data;
	Write_Address_out<=Write_Address;
	RegWrite_out<=RegWrite;
	MemtoReg_out<=MemtoReg;
	MemRead_out<=MemRead;
 	MemWrite_out<=MemWrite;
end
always@(ALU_result_in or RT_data_in or Write_Address_in or RegWrite_in or MemtoReg_in or MemRead_in or MemWrite_in)begin//read data in register
	ALU_result<=ALU_result_in;
	RT_data<=RT_data_in;
	Write_Address<=Write_Address_in;
	RegWrite<=RegWrite_in;
	MemtoReg<=MemtoReg_in;
	MemRead<=MemRead_in;
 	MemWrite<=MemWrite_in;
end
initial begin
	ALU_result=32'd0;
	RT_data=32'd0;
	Write_Address=5'd0;
	RegWrite=0;
	MemtoReg=0;
	MemRead=0;
 	MemWrite=0;

	ALU_result_out=32'd0;
	RT_data_out=32'd0;
	Write_Address_out=5'd0;
	RegWrite_out=0;
	MemtoReg_out=0;
	MemRead_out=0;
 	MemWrite_out=0;
end
endmodule
