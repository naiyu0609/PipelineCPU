module SE(
 	input [15:0] data_i,//input 16-bit
 	output [31:0] data_o//output 32-bit
);

assign	data_o={16'd0,data_i};

endmodule
