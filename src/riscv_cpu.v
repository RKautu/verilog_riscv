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

// ID + EX + MEM + WB will be added in next steps

endmodule
