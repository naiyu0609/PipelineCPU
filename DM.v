module DM(
 	input clk,//Clock
 	input [31:0] Address,//Memory address
 	input [31:0] data,//Memory data by address
 	input MemRead,//Control output data
 	input MemWrite,//Control input data
 	output reg [31:0] DM_data//output data
);
	integer i;//For initial
	reg[7:0]Memdata[127:0];//Creat 128 memory address each address is 8-bit

always@(negedge clk or Address)begin//Write data in the memory
	if(MemWrite) {Memdata[Address], Memdata[Address+1], Memdata[Address+2], Memdata[Address+3]} <= data;
end
always@(posedge clk or Address)begin//Read data
	DM_data <= {Memdata[Address], Memdata[Address+1], Memdata[Address+2], Memdata[Address+3]};
end

initial begin//initial value
	DM_data=32'd0;
	for(i=0;i<=127;i=i+1)begin
		Memdata[i] = 8'b0;
	end
end
endmodule
