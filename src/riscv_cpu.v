module riscv_cpu (
    input clk,
    input reset
);

// IF Stage
wire [31:0] pc_out, instr;

pc PC (
    .clk(clk),
    .reset(reset),
    .pc_out(pc_out)
);

instr_mem IMEM (
    .addr(pc_out),
    .instr(instr)
);

// ID Stage
wire [4:0] rs1, rs2, rd;
wire [31:0] reg_data1, reg_data2, imm;
wire reg_write, mem_to_reg, mem_read, mem_write, alu_src;
wire [3:0] alu_op;

decode DECODE (
    .instr(instr),
    .rs1(rs1),
    .rs2(rs2),
    .rd(rd),
    .imm(imm),
    .reg_write(reg_write),
    .mem_to_reg(mem_to_reg),
    .mem_read(mem_read),
    .mem_write(mem_write),
    .alu_src(alu_src),
    .alu_op(alu_op)
);

register_file RF (
    .clk(clk),
    .rs1(rs1),
    .rs2(rs2),
    .rd(rd),
    .reg_write(reg_write),
    .write_data(write_back_data),
    .read_data1(reg_data1),
    .read_data2(reg_data2)
);

// EX Stage
wire [31:0] alu_in2, alu_result;

assign alu_in2 = alu_src ? imm : reg_data2;

alu ALU (
    .input1(reg_data1),
    .input2(alu_in2),
    .alu_op(alu_op),
    .result(alu_result)
);

// MEM Stage
wire [31:0] mem_data;

data_mem DMEM (
    .clk(clk),
    .addr(alu_result),
    .write_data(reg_data2),
    .mem_read(mem_read),
    .mem_write(mem_write),
    .read_data(mem_data)
);

// WB Stage
wire [31:0] write_back_data;

writeback WB (
    .mem_to_reg(mem_to_reg),
    .alu_result(alu_result),
    .mem_data(mem_data),
    .write_back_data(write_back_data)
);

endmodule
