module MUX5b(
 	input [4:0] data1,//value1
 	input [4:0] data2,//value2
 	input select,//control
 	output [4:0] data_o//output
);
assign data_o=(select)?data1:data2;//if select is 1,output is data1.if select is 0,output is data2.


endmodule
