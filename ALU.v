module ALU(
	input [31:0] Source1, //Register1 input
	input [31:0] Source2, //Register2 input
	input [5:0] operation, //Operation code
	input [4:0] shamt, //Shift amount
	output reg [31:0] result, //Result output
	output zero,//Zero flag
	output reg carry //Carry flag
);

assign zero=(result==0)?1:0;//If the result is zero,the zero flag is 1

always@(Source1 or Source2 or operation or shamt)begin
	case(operation[5:0])//Identify function code
		6'd27: {carry,result}<=Source1+Source2;//Function ADD
		6'd28: result<=Source1-Source2;//Function SUB
		6'd29: result<=Source1>>shamt;//Function SRL
		6'd30: result<=Source1<<shamt;//Function SLL
		6'd31: result<=Source1^Source2;//Function XOR
		6'd32: result<=Source1&Source2;//Function AND
		6'd33: result<=(Source1<Source2)?32'd1:32'd0;//Function slt
		default: result<=result;//If function code no match,maintain the result 
	endcase
end

initial begin//initial value
	result=32'd0;
	carry=0;
end
endmodule
