module alu(
    input [31:0] in1,
    input [31:0] in2,
    input [3:0] alu_control,
    output reg [31:0] result
);

always @(*) begin
    case (alu_control)
        4'b0000: result = in1 & in2;  // AND
        4'b0001: result = in1 | in2;  // OR
        4'b0010: result = in1 + in2;  // ADD
        4'b0110: result = in1 - in2;  // SUB
        4'b0111: result = (in1 < in2) ? 1 : 0;  // SLT
        default: result = 0;
    endcase
end

endmodule
