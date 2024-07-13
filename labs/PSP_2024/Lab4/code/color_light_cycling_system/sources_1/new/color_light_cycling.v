`timescale 1ns / 1ps

module ten_counter_LED (
    input clk,
    input enable,
    output [3:0] out
);
  reg [26:0] divide_clk;
  reg [3:0] cnt_reg;
  reg [3:0] out_reg;
  reg cout_1s;

  // 对 100M 时钟分频产生 1Hz 时钟信号
  always @(posedge clk) begin
    if (divide_clk < 100000000 - 1) begin
      divide_clk <= divide_clk + 1;
      cout_1s <= 1'b0;
    end else begin
      divide_clk <= 0;
      cout_1s <= 1'b1;
    end
  end
  // 1Hz 时钟频率的十进制计数器
  always @(posedge clk) begin
    if (enable && cout_1s) begin
      if (cnt_reg < 11) cnt_reg <= cnt_reg + 1;
      else cnt_reg <= 0;
    end else cnt_reg <= cnt_reg;
  end

  always @* begin
    case ({
      cnt_reg
    })
      4'b0000: {out_reg} = 4'b0001;
      4'b0001: {out_reg} = 4'b0011;
      4'b0010: {out_reg} = 4'b0111;
      4'b0011: {out_reg} = 4'b1111;
      4'b0100: {out_reg} = 4'b0111;
      4'b0101: {out_reg} = 4'b0011;
      4'b0110: {out_reg} = 4'b0001;
      4'b0111: {out_reg} = 4'b0000;
      4'b1000: {out_reg} = 4'b1111;
      4'b1001: {out_reg} = 4'b0000;
      4'b1010: {out_reg} = 4'b1111;
      4'b1011: {out_reg} = 4'b0000;
      default: {out_reg} = 4'b0000;
    endcase
  end
  assign out = out_reg;
endmodule




