module MUX32b(
 	input [31:0] data1,//value1
 	input [31:0] data2,//value2
 	input select,//control
 	output [31:0] data_o//output
 );
assign	data_o=(select)? data1:data2;//if select is 1,output is data1.if select is 0,output is data2.

endmodule
