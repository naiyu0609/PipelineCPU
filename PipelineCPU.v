module PipelineCPU(
 	input [31:0] Addr_in,//run instruction address
 	input clk,//clock
 	output [31:0] Addr_o//next instruction address
);
wire [31:0]Instruction_Address;//from PC output
wire [31:0]RSdata;//the data of Register1 
wire [31:0]RTdata;//the data of Register2
wire [31:0]RDdata;//input data to RF
wire [31:0]Instruction;//Instruction
wire [31:0]ALUSrc1;//ALU Source1
wire [31:0]ALUSrc2;//ALU Source2
wire [31:0]IF_ID_Instruction;//output IF_ID
wire IF_ID_Write;//IF_ID Control signal
wire PCWrite;//PC Control signal
wire Flashctrl;//Hazard control signal to clean control signal
wire [8:0]Ctrl;//Control Signal
wire [31:0]ID_EX_RS_data;//ID_EX output RS
wire [31:0]ID_EX_RT_data;//ID_EX output RT
wire [31:0]ID_EX_immediate;//ID_EX output
wire [4:0]ID_EX_shamt;//ID_EX output
wire [5:0]ID_EX_funct;//ID_EX output
wire [4:0]ID_EX_RS_Address;//ID_EX output RS Address
wire [4:0]ID_EX_RT_Address;//ID_EX output RT Address
wire [4:0]ID_EX_RD_Address;//ID_EX output RD Address
wire [2:0]ID_EX_ALUOp;//ID_EX output Control signal
wire ID_EX_RegDst;//ID_EX output Control signal
wire ID_EX_MemRead;//ID_EX output Control signal
wire ID_EX_MemtoReg;//ID_EX output Control signal
wire ID_EX_MemWrite;//ID_EX output Control signal
wire ID_EX_ALUSrc;//ID_EX output Control signal
wire ID_EX_RegWrite;//ID_EX output Control signal
wire [31:0]immediate;//SE output
wire [5:0]operation;//ALU operation
wire [2:0]ALUOp;//the signal for ALU Op
wire RegDst;//the signal for RD_address
wire MemRead;//the signal for memory read or not
wire MemtoReg;//the signal for which data(ALU result or memory data) is write data in RF
wire MemWrite;//the signal for memory write or not
wire ALUSrc;//the signal for comfirm ALU source2
wire RegWrite;//the signal for register write or not
wire [4:0]Write_Address;//the wirte in address
wire [31:0]ALUResult;//ALU Result
wire [31:0]EX_MEM_ALUResult;//EX_MEM output ALUResult
wire zero;//ALU flag
wire carry;//ALU flag
wire [1:0]ForwardA;//selet
wire [1:0]ForwardB;//selet
wire [31:0]ForwardB_data;//ForwardB_data
wire [31:0]EX_MEM_RT_data;//EX_MEM output data
wire [4:0]EX_MEM_Write_Address;//EX_MEM output address to write in 
wire EX_MEM_RegWrite;//EX_MEM Control signal
wire EX_MEM_MemtoReg;//EX_MEM Control signal
wire EX_MEM_MemRead;//EX_MEM Control signal
wire EX_MEM_MemWrite;//EX_MEM Control signal
wire [31:0]DM_data;//data from memory
wire [4:0]MEM_WB_Write_Address;//MEM_WB output address to write in
wire [31:0]MEM_WB_DM_data;//MEM_WB output data
wire [31:0]MEM_WB_ALUResult;//MEM_WB output data
wire MEM_WB_RegWrite;//MEM_WB Control signal
wire MEM_WB_MemtoReg;//MEM_WB Control signal

PC PC(Addr_in,PCWrite,clk,Instruction_Address);
Adder Adder(32'd4,Instruction_Address,Addr_o);
IM IM(Instruction_Address,clk,Instruction);
IF_ID IF_ID(Instruction,clk,IF_ID_Write,IF_ID_Instruction);

Hazard_detection Hazard_detection(IF_ID_Instruction[25:21],IF_ID_Instruction[20:16],ID_EX_RT_Address,
	                          ID_EX_MemRead,ID_EX_MemWrite,
	                          Flashctrl,PCWrite,IF_ID_Write);

Control ctrl(IF_ID_Instruction[31:26],ALUOp,RegDst,MemRead,MemtoReg,MemWrite,ALUSrc,RegWrite);
MUX9b MUX_ID(9'd0,{RegWrite,MemtoReg,MemRead,MemWrite,ALUOp,RegDst,ALUSrc},Flashctrl,Ctrl);
RF RF(clk,MEM_WB_RegWrite,IF_ID_Instruction[25:21],IF_ID_Instruction[20:16],MEM_WB_Write_Address,RSdata,RTdata,RDdata);
SE SE(IF_ID_Instruction[15:0],immediate);
ID_EX ID_EX(RSdata,RTdata,immediate,IF_ID_Instruction[10:6],IF_ID_Instruction[5:0],IF_ID_Instruction[25:21],IF_ID_Instruction[20:16],IF_ID_Instruction[15:11],
	    Ctrl,clk,
	    ID_EX_RS_data,ID_EX_RT_data,ID_EX_immediate,ID_EX_shamt,ID_EX_funct,ID_EX_RS_Address,ID_EX_RT_Address,ID_EX_RD_Address,
	    ID_EX_RegWrite,ID_EX_MemtoReg,ID_EX_MemRead,ID_EX_MemWrite,ID_EX_ALUOp,ID_EX_RegDst,ID_EX_ALUSrc);


MUX32b_3to1 MUX_EX1(ID_EX_RS_data,RDdata,EX_MEM_ALUResult,ForwardA,ALUSrc1);
MUX32b_3to1 MUX_EX2(ID_EX_RT_data,RDdata,EX_MEM_ALUResult,ForwardB,ForwardB_data);
MUX32b MUX_EX3(ID_EX_immediate,ForwardB_data,ID_EX_ALUSrc,ALUSrc2);
ALUctrl ALUctrl(ID_EX_funct,ID_EX_ALUOp,operation);
ALU ALU(ALUSrc1,ALUSrc2,operation,ID_EX_shamt,ALUResult,zero,carry);
MUX5b MUX_EX4(ID_EX_RD_Address,ID_EX_RT_Address,ID_EX_RegDst,Write_Address);
Forwarding Forwarding(ID_EX_RS_Address,ID_EX_RT_Address,EX_MEM_Write_Address,MEM_WB_Write_Address,
                      EX_MEM_RegWrite,MEM_WB_RegWrite,
                      ForwardA,ForwardB);
EX_MEM EX_MEM(ALUResult,ForwardB_data,Write_Address,ID_EX_RegWrite,ID_EX_MemtoReg,ID_EX_MemRead,ID_EX_MemWrite,clk,
 	      EX_MEM_ALUResult,EX_MEM_RT_data,EX_MEM_Write_Address,
              EX_MEM_RegWrite,EX_MEM_MemtoReg,EX_MEM_MemRead,EX_MEM_MemWrite);








DM DM(clk,EX_MEM_ALUResult,EX_MEM_RT_data,EX_MEM_MemRead,EX_MEM_MemWrite,DM_data);
MEM_WB MEM_WB(DM_data,EX_MEM_ALUResult,EX_MEM_Write_Address,EX_MEM_MemtoReg,EX_MEM_RegWrite,clk,
              MEM_WB_DM_data,MEM_WB_ALUResult,MEM_WB_Write_Address,
              MEM_WB_MemtoReg,MEM_WB_RegWrite);



MUX32b MUX_WB(MEM_WB_DM_data,MEM_WB_ALUResult,MEM_WB_MemtoReg,RDdata);

endmodule

