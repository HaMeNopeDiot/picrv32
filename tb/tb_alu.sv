


module alu_tb ();

/* ALU TYPE INSTRUCTIONS */
localparam ALU_OP_TEST          = 3'd0;
localparam ALU_OP_SUM           = 3'd1;
localparam ALU_OP_AND           = 3'd2;
localparam ALU_OP_OR            = 3'd3;
localparam ALU_OP_XOR           = 3'd4;
localparam ALU_OP_SHIFT_LEFT    = 3'd5;
localparam ALU_OP_SHIFT_RIGHT   = 3'd6;
localparam ALU_OP_NOT           = 3'd7;


logic clk;
logic nrst;
logic [7:0] operand_0;
logic [7:0] operand_1;
logic [2:0] operation;
logic carry_in;
logic invert_op_1;
logic [7:0] result;
logic carry_out, zero_flag;

always #10 clk = ~clk;

alu alu_inst (
    .clk(clk),
    .nrst(nrst),
    .operand_0(operand_0),
    .operand_1(operand_1),
    .operation(operation),
    .result(result),
    .carry_in(carry_in),
    .invert_op_1(invert_op_1),
    .carry_out(carry_out),
    .zero_flag(zero_flag)
);

initial begin
    $dumpfile("tb_alu.vcd");
    $dumpvars(0, alu_tb);
    clk = '0;
    nrst = '1;
    carry_in = '0;
    invert_op_1 = '0;
    operand_0 = 8'b10101010;
    operand_1 = 8'b11110000;

    operation = ALU_OP_TEST;
    #20;
    operation = ALU_OP_SUM;
    #20;
    operation = ALU_OP_AND;
    #20;
    operation = ALU_OP_OR;
    #20;
    operation = ALU_OP_XOR;
    #20;
    operation = ALU_OP_SHIFT_LEFT;
    #20;
    operation = ALU_OP_SHIFT_RIGHT;
    #20;
    operation = ALU_OP_NOT;
    #20;
    invert_op_1 = '1;
    carry_in = '1;
    operation = ALU_OP_SUM;
    #20;
    invert_op_1 = '0;
    #20;
    carry_in = '0;
    #20;
    $finish;
end


endmodule