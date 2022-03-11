module ID_EX(
 	input [31:0] RS_data_in,//input of data
	input [31:0] RT_data_in,//input of data
	input [31:0] immediate_in,//input of data
	input [4:0] shamt_in,//input of data
	input [5:0] funct_in,//input of data
	input [4:0] RS_Address_in,//input of data
	input [4:0] RT_Address_in,//input of data
	input [4:0] RD_Address_in,//input of data
	input [8:0]Ctrl,//input of control signal
 	input clk,//clock
 	output reg  [31:0] RS_data_out,//output data
	output reg  [31:0] RT_data_out,//output data
	output reg  [31:0] immediate_out,//output data
	output reg  [4:0] shamt_out,//output data
	output reg  [5:0] funct_out,//output data
	output reg  [4:0] RS_Address_out,//output data
	output reg  [4:0] RT_Address_out,//output data
	output reg  [4:0] RD_Address_out,//output data
	output reg RegWrite_out,//output control signal
	output reg MemtoReg_out,//output control signal
	output reg MemRead_out,//output control signal
 	output reg MemWrite_out,//output control signal
	output reg [2:0] ALUOp_out,//output control signal
 	output reg RegDst_out,//output control signal
 	output reg ALUSrc_out//output control signal
);
	reg MemRead;//to store control signal
	reg MemWrite;//to store control signal
	reg [4:0] RT_Address;//store data
	reg  [31:0] RS_data;//store data
	reg  [31:0] RT_data;//store data
	reg  [31:0] immediate;//store data
	reg  [4:0] shamt;//store data
	reg  [5:0] funct;//store data
	reg  [4:0] RS_Address;//store data
	reg  [4:0] RD_Address;//store data
	reg RegWrite;//to store control signal
	reg MemtoReg;//to store control signal
	reg [2:0] ALUOp;//to store control signal
 	reg RegDst;//to store control signal
 	reg ALUSrc;//to store control signal

always@(posedge clk)begin//let output data equal Register data 
	RS_data_out<=RS_data;
	RT_data_out<=RT_data;
	immediate_out<=immediate;
	shamt_out<=shamt;
	funct_out<=funct;
	RS_Address_out<=RS_Address;
	RT_Address_out<=RT_Address;
	RD_Address_out<=RD_Address;
	RegWrite_out<=RegWrite;
	MemtoReg_out<=MemtoReg;
	MemRead_out<=MemRead;
 	MemWrite_out<=MemWrite;
	ALUOp_out<=ALUOp;
 	RegDst_out<=RegDst;
 	ALUSrc_out<=ALUSrc;	
end
always@(RS_data_in or RT_data_in or immediate_in or shamt_in or funct_in or RS_Address_in or RT_Address_in or RD_Address_in or Ctrl)begin//read data in register
	RS_data<=RS_data_in;
	RT_data<=RT_data_in;
	immediate<=immediate_in;
	shamt<=shamt_in;
	funct<=funct_in;
	RS_Address<=RS_Address_in;
	RT_Address<=RT_Address_in;
	RD_Address<=RD_Address_in;
	RegWrite<=Ctrl[8];
	MemtoReg<=Ctrl[7];
	MemRead<=Ctrl[6];
 	MemWrite<=Ctrl[5];
	ALUOp<=Ctrl[4:2];
 	RegDst<=Ctrl[1];
 	ALUSrc<=Ctrl[0];	
end
initial begin
	RS_data=32'd0;
	RT_data=32'd0;
	immediate=32'd0;
	shamt=5'd0;
	funct=6'd0;
	RS_Address=5'd0;
	RT_Address=5'd0;
	RD_Address=5'd0;
	RegWrite=0;
	MemtoReg=0;
	MemRead=0;
 	MemWrite=0;
	ALUOp=3'd0;
 	RegDst=0;
 	ALUSrc=0;	
	RS_data_out=32'd0;
	RT_data_out=32'd0;
	immediate_out=32'd0;
	shamt_out=5'd0;
	funct_out=6'd0;
	RS_Address_out=5'd0;
	RT_Address_out=5'd0;
	RD_Address_out=5'd0;
	RegWrite_out=0;
	MemtoReg_out=0;
	MemRead_out=0;
 	MemWrite_out=0;
	ALUOp_out=3'd0;
 	RegDst_out=0;
 	ALUSrc_out=0;	
end
endmodule
