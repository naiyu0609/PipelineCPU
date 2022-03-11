module MUX32b_3to1(
 	input [31:0] data1,//value1
 	input [31:0] data2,//value2
	input [31:0] data3,//value3
 	input [1:0]select,//control
 	output [31:0] data_o//output
 );
assign	data_o=(select==2'd0)? data1:(select==2'd1)? data2:data3;//if select is 00,output is data1.if select is 01,output is data2.if select is 10,output is data3.

endmodule
