module Hazard_detection(
	input [4:0]IF_ID_RSAddress,//IF_ID_RS
	input [4:0]IF_ID_RTAddress,//IF_ID_RT
	input [4:0]ID_EX_RTAddress,//ID_EX_RT
	input ID_EX_MemRead,//ID_EX_MemRead
	input ID_EX_MemWrite,//ID_EX_MemWrite
	output reg Flashctrl,//signal to flash control signal
	output reg PCWrite,//control PC write in or not
	output reg IF_ID_Write//control IF_ID write in or not
);

always@(IF_ID_RSAddress or IF_ID_RTAddress or ID_EX_RTAddress or ID_EX_MemRead or ID_EX_MemWrite)begin
	Flashctrl=0;
	PCWrite=1;
	IF_ID_Write=1;
	if(ID_EX_MemRead && ((ID_EX_RTAddress == IF_ID_RSAddress)|(ID_EX_RTAddress==IF_ID_RTAddress)))begin//LW Data Hazard
		Flashctrl=1;
		PCWrite=0;
		IF_ID_Write=0;
	end
end
initial begin
	Flashctrl=0;
	PCWrite=1;
	IF_ID_Write=1;
end
endmodule
