`timescale 1ns / 1ps

module bin_to_dec (
    input clk,
    input update,
    input sw4,
    sw5,
    sw6,
    sw7,
    output [6:0] dk,
    output reg select_1,
    output reg select_2
);
  reg [26:0] divide_clk;
  reg cout_1s;
  reg [6:0] dkout_reg;
  reg [6:0] dk1_reg;
  reg [6:0] dk2_reg;
  reg state;

  always @(posedge clk) begin
    if (!update) {dk1_reg, dk2_reg} <= {dk1_reg, dk2_reg};
    else
      case ({
        sw7, sw6, sw5, sw4
      })
        4'b0000: {dk1_reg, dk2_reg} = 14'b11111101111110;
        4'b0001: {dk1_reg, dk2_reg} = 14'b01100001111110;
        4'b0010: {dk1_reg, dk2_reg} = 14'b11011011111110;
        4'b0011: {dk1_reg, dk2_reg} = 14'b11110011111110;
        4'b0100: {dk1_reg, dk2_reg} = 14'b01100111111110;
        4'b0101: {dk1_reg, dk2_reg} = 14'b10110111111110;
        4'b0110: {dk1_reg, dk2_reg} = 14'b10111111111110;
        4'b0111: {dk1_reg, dk2_reg} = 14'b11100001111110;
        4'b1000: {dk1_reg, dk2_reg} = 14'b11111111111110;
        4'b1001: {dk1_reg, dk2_reg} = 14'b11110111111110;
        4'b1010: {dk1_reg, dk2_reg} = 14'b11111100110000;
        4'b1011: {dk1_reg, dk2_reg} = 14'b01100000110000;
        4'b1100: {dk1_reg, dk2_reg} = 14'b11011010110000;
        4'b1101: {dk1_reg, dk2_reg} = 14'b11110010110000;
        4'b1110: {dk1_reg, dk2_reg} = 14'b01100110110000;
        4'b1111: {dk1_reg, dk2_reg} = 14'b10110110110000;
      endcase
  end

  // 对 100M 时钟分频产生 100Hz 时钟信号
  always @(posedge clk) begin
    if (divide_clk < 1000000 - 1) begin
      divide_clk <= divide_clk + 1;
      cout_1s <= 1'b0;
    end else begin
      divide_clk <= 0;
      cout_1s <= 1'b1;
    end
  end

  // 切换不同灯管
  always @(posedge clk) begin
    if (cout_1s) begin
      if (state == 0) begin
        dkout_reg <= dk1_reg;
        select_1 <= 1;
        select_2 <= 0;
        state <= 1;
      end else begin
        dkout_reg <= dk2_reg;
        select_1 <= 0;
        select_2 <= 1;
        state <= 0;
      end
    end
  end

  assign dk = dkout_reg;
endmodule


