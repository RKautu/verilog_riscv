module memory(
    input clk,
    input mem_write,
    input mem_read,
    input [31:0] alu_result,
    input [31:0] write_data,
    output [31:0] read_data
);

data_mem dmem(
    .clk(clk),
    .mem_write(mem_write),
    .mem_read(mem_read),
    .addr(alu_result),
    .write_data(write_data),
    .read_data(read_data)
);

endmodule
