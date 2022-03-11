`timescale 1ns/1ns
module tb_PipelineCPU();

reg [31:0] Addr_in;
reg clk;
wire [31:0] Addr_o;

PipelineCPU PipelineCPU(Addr_in,clk,Addr_o);

initial begin
	clk=1;
	Addr_in=32'd0;
#500	$finish;
end
always begin//Creat a clock which the period is 10ns and the duty cycle is 50%
#5	clk=~clk;
end
always begin
#10 Addr_in=Addr_o;
end
endmodule
