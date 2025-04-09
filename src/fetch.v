// src/fetch.v
module fetch (
    input clk,
    input reset,
    output [31:0] instr,
    output [31:0] pc_out
);

    wire [31:0] pc_next;

    pc PC (
        .clk(clk),
        .reset(reset),
        .pc_in(pc_next),
        .pc_out(pc_out)
    );

    assign pc_next = pc_out + 4;

    instr_mem IM (
        .addr(pc_out),
        .instr(instr)
    );

endmodule
