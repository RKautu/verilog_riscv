module data_mem(
    input clk,
    input mem_write,
    input mem_read,
    input [31:0] addr,
    input [31:0] write_data,
    output reg [31:0] read_data
);

reg [31:0] mem [0:255]; // simple 256-word memory

always @(posedge clk) begin
    if (mem_write)
        mem[addr[7:0]] <= write_data;
end

always @(*) begin
    if (mem_read)
        read_data = mem[addr[7:0]];
    else
        read_data = 0;
end

endmodule
