import alu_pkg::*;

module alu (
    input  logic       clk,
    input  logic       nrst,
    input  logic [7:0] operand_0,
    input  logic [7:0] operand_1,
    input  logic [2:0] operation,
    input  logic       carry_in,
    input  logic       invert_op_1,
    output logic [7:0] result,
    output logic       carry_out,
    output logic       zero_flag
);

  logic [7:0] lu_result [6];
  
  logic [7:0] op_1;
  logic [7:0] op_0;


  assign op_0 = operand_0;
  assign op_1 = invert_op_1? (~operand_1): operand_1;

  task automatic put (input [7:0] field);
    begin
      result    = field;
      zero_flag = ~|field;
    end
  endtask

  always_comb begin
    case (operation)
      ALU_OP_TEST : begin
          put(op_0);
          carry_out = 0;
        end
      ALU_OP_SUM : begin
          {carry_out, result} = op_0 + op_1 + carry_in;
        end
      ALU_OP_AND : begin
          put(op_0 & op_1);
          carry_out = 0;
        end
      ALU_OP_OR : begin
          put(op_0 | op_1);
          carry_out = 0;
        end
      ALU_OP_XOR : begin
          put(op_0 ^ op_1);
          carry_out = 0;
        end
      ALU_OP_SHIFT_LEFT : begin
          put(op_0 << op_1);
          carry_out = 0;
        end
      ALU_OP_SHIFT_RIGHT : begin
          put(op_0 >> op_1);
          carry_out = 0;
        end
      ALU_OP_NOT : begin
          put(~op_0);
          carry_out = 0;
        end
    endcase
  end
endmodule
