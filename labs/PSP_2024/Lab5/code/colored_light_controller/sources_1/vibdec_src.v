`timescale 1ns / 1ps

// 按键消抖：只有当连续三个输入信号都为1时，输出信号才为1，否则输出信号为0
module debouncer (
    input clk,
    input in,
    output reg out
);
  reg [2:0] delay;
  initial {delay} = 3'b000;

  always @(posedge clk) begin
    delay[0] <= in;
    delay[1] <= delay[0];
    delay[2] <= delay[1];
  end

  always @(posedge clk)
    if ({delay} == 3'b111) out = 1;
    else out = 0;
endmodule


