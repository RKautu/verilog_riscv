module writeback(
    input mem_to_reg,
    input [31:0] alu_result,
    input [31:0] mem_data,
    output [31:0] write_back_data
);

assign write_back_data = mem_to_reg ? mem_data : alu_result;

endmodule
