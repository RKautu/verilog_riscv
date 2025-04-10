module decode(
    input [31:0] instr,
    input clk,
    input reg_write,
    input [31:0] write_data,
    output [31:0] read_data1,
    output [31:0] read_data2,
    output [6:0] opcode,
    output [4:0] rd,
    output [4:0] rs1,
    output [4:0] rs2,
    output [31:0] imm
);

assign opcode = instr[6:0];
assign rd     = instr[11:7];
assign rs1    = instr[19:15];
assign rs2    = instr[24:20];
assign imm    = {{20{instr[31]}}, instr[31:20]}; // I-type immediate

register_file RF(
    .clk(clk),
    .reg_write(reg_write),
    .rs1(rs1),
    .rs2(rs2),
    .rd(rd),
    .write_data(write_data),
    .read_data1(read_data1),
    .read_data2(read_data2)
);

endmodule
