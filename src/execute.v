module execute(
    input [31:0] read_data1,
    input [31:0] read_data2,
    input [31:0] imm,
    input alu_src,
    input [3:0] alu_control,
    output [31:0] alu_result
);

wire [31:0] operand2;

assign operand2 = alu_src ? imm : read_data2;

alu my_alu(
    .in1(read_data1),
    .in2(operand2),
    .alu_control(alu_control),
    .result(alu_result)
);

endmodule
