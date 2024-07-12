`timescale 1ns / 1ps

// 可调频率的分频器
module timer (
    input clk_in,
    input [31:0] output_freq,  // 输出频率
    output clk_out
);
  reg [31:0] clk_count;
  reg rclk;
  always @(posedge clk_in) begin
    // 计算分频器的值
    if (clk_count < (100000000 / output_freq) - 1) begin
      clk_count <= clk_count + 1;
      rclk <= 1'b0;
    end else begin
      clk_count <= 0;
      rclk <= 1'b1;
    end
  end
  assign clk_out = rclk;
endmodule



