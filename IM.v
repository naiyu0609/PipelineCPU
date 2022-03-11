module IM(
 	input [31:0] Addr_in,//the value is the address of running instruction
	input clk,//clock
 	output reg [31:0] Instruction//run instruction
);
	integer i;
	reg [31:0]Instr[199:0];//Creat 200 Instruction address each is 32-bit


always@(posedge clk or Addr_in)begin
	Instruction=Instr[Addr_in/4];//the address of instruction is 4times
end

initial begin
	for(i=0;i<200;i=i+1)begin
		Instr[i]=32'd0;
	end	
	Instr[0]=32'b010100_01001_01001_01000_00000_010101;//add $t0, $t1, $t1
	Instr[1]=32'b010100_01010_01100_01001_00000_010110;//sub $t1, $t2, $t4
	Instr[2]=32'b010100_01101_00000_01100_00010_010111;//srl $t4, $t5, 2
	Instr[3]=32'b010100_01110_00000_01110_00100_011000;//sll $t6, $t6, 4
	Instr[4]=32'b010100_01001_01010_01011_00000_011001;//xor $t3, $t1, $t2
	Instr[5]=32'b010100_01010_01100_01101_00000_011010;//and $t5, $t4, $t2

	Instr[6]=32'b101011_01111_01000_0000000000000010;//sw $t0, 2($t7) 
	Instr[7]=32'b100011_01111_10011_0000000000000010;//lw $s3, 2($t7)
	Instr[8]=32'b101011_01111_10100_0000000000000100;//sw $s4, 4($t7)
	Instr[9]=32'b101011_01010_01000_0000000000000010;//sw $t0, 2($t2)
	Instr[10]=32'b100011_01010_10100_0000000000000011;//lw $s4, 3($t2)

	Instr[11]=32'b010100_01101_01100_01110_00000_010101;//add $t6, $t5, $t4
	Instr[12]=32'b010100_01110_01101_01111_00000_010110;//sub $t7, $t6, $t5
	Instr[13]=32'b010100_01110_01111_01011_00000_010101;//add $t3, $t6, $t7
	Instr[14]=32'b100011_01010_10001_0000000000000010;//lw $s1, 2($t2)
	Instr[15]=32'b101011_01101_10001_0000000000000010;//sw $s1, 2($t5) 
	Instr[16]=32'b100011_01101_01001_0000000000000010;//lw $t1, 2($t5)
	Instr[17]=32'b010100_01001_01001_01010_00000_010101;//add $t2, $t1, $t1
end
endmodule
