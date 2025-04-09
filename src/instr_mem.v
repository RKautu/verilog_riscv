// src/instr_mem.v
module instr_mem (
    input [31:0] addr,
    output [31:0] instr
);

    reg [31:0] memory [0:255];

    initial begin
        // Sample instructions (R-type add example)
        memory[0] = 32'b0000000_00011_00010_00001_000_0110011; // add x1, x2, x3
        memory[1] = 32'b0000000_00100_00001_00010_000_0110011; // add x2, x1, x4
        // You can add more
    end

    assign instr = memory[addr[9:2]]; // word-aligned (ignore lower 2 bits)

endmodule
