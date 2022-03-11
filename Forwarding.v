module Forwarding(
	input [4:0]ID_EX_RSAddress,//ID_EX_RS
	input [4:0]ID_EX_RTAddress,//ID_EX_RT
 	input [4:0]EX_MEM_WriteAddress,//EX_MEM_RD
 	input [4:0]MEM_WB_WriteAddress,//MEM_WB_RD
	input EX_MEM_RegWrite,//EX_MEM_RegWrite signal
 	input MEM_WB_RegWrite,//MEM_WB_RegWrite signal
 	output reg [1:0] ForwardA,//MUX selet
	output reg [1:0] ForwardB//MUX selet
);
always@(ID_EX_RSAddress or ID_EX_RTAddress or EX_MEM_WriteAddress or MEM_WB_WriteAddress  or EX_MEM_RegWrite or MEM_WB_RegWrite)begin
	ForwardA=2'b00;
	ForwardB=2'b00;
	if(EX_MEM_RegWrite&&(EX_MEM_WriteAddress!= 5'd0)&&(EX_MEM_WriteAddress==ID_EX_RSAddress)) ForwardA=2'b10;//EX Hazard
	if(MEM_WB_RegWrite&&(MEM_WB_WriteAddress!= 5'd0)&&(EX_MEM_WriteAddress!=ID_EX_RSAddress)&&(MEM_WB_WriteAddress==ID_EX_RSAddress)) ForwardA=2'b01;//MEM Hazard
	if(EX_MEM_RegWrite&&(EX_MEM_WriteAddress!= 5'd0)&&(EX_MEM_WriteAddress==ID_EX_RTAddress)) ForwardB=2'b10;//EX Hazard
	if(MEM_WB_RegWrite&&(MEM_WB_WriteAddress!= 5'd0)&&(EX_MEM_WriteAddress!=ID_EX_RTAddress)&&(MEM_WB_WriteAddress==ID_EX_RTAddress)) ForwardB=2'b01;//MEM Hazard

end
endmodule
