package alu_pkg;
    typedef enum logic [3:0] {
        ALU_OP_TEST          = 4'd0,
        ALU_OP_SUM           = 4'd1,
        ALU_OP_AND           = 4'd2,
        ALU_OP_OR            = 4'd3,
        ALU_OP_XOR           = 4'd4,
        ALU_OP_SHIFT_LEFT    = 4'd5,
        ALU_OP_SHIFT_RIGHT   = 4'd6,
        ALU_OP_NOT           = 4'd7
    } alu_cmd;

endpackage