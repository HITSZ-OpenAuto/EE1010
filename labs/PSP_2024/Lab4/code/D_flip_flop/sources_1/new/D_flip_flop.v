`timescale 1ns / 1ps
module D_flip_flop (
    input  clk,
    input  reset,
    input  en,
    input  d,
    output q
);
  reg q_reg;  // 寄存器
  always @(posedge clk, posedge reset) begin
    if (reset) q_reg <= 1'b0;
    else if (en) q_reg <= d;
  end
  assign q = q_reg;
endmodule




