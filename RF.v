module RF(
 	input clk,//Clock
	input RegWrite,//The signal of write in register or not
 	input [4:0] RS_Address,//The address of register1
 	input [4:0] RT_Address,//The address of register2
 	input [4:0] RD_Address,//The address of register write in 
 	output reg [31:0] RSdata,//The data of register1
 	output reg [31:0] RTdata,//The data of register2
	input [31:0] RDdata//The data of register write in
);

reg [31:0] register[31:0];//Creat 32 registers

always@(negedge clk)begin
	RSdata<=register[RS_Address];//Read the data of register1 at the address1
	RTdata<=register[RT_Address];//Read the data of register2 at the address2
end
always@(RD_Address)begin
	if(RegWrite) register[RD_Address]=RDdata;//Write data in the register at the address
end

initial begin//initial RF
	register [0]= 32'd0;
	register [1]= 32'd11;
	register [2]= 32'd370;
	register [3]= 32'd183;
	register [4]= 32'd91;
	register [5]= 32'd234;
	register [6]= 32'd53;
	register [7]= 32'd124;
	register [8]= 32'd317;
	register [9]= 32'd179;
	register [10]= 32'd101;
	register [11]= 32'd161;
	register [12]= 32'd77;
	register [13]= 32'd320;
	register [14]= 32'd152;
	register [15]= 32'd10;
	register [16]= 32'd100;
	register [17]= 32'd100;
	register [18]= 32'd245;
	register [19]= 32'd19;
	register [20]= 32'd2;
	register [21]= 32'd13;
	register [22]= 32'd262;
	register [23]= 32'd185;
	register [24]= 32'd180;
	register [25]= 32'd180;
	register [26]= 32'd198;
	register [27]= 32'd178;
	register [28]= 32'd235;
	register [29]= 32'd22;
	register [30]= 32'd1000;
	register [31]= 32'd75;
end
endmodule
