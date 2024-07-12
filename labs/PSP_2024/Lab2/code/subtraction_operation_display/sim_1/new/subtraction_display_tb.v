`timescale 1ns / 1ps

module subtraction_display_tb;
  reg  [3:0] SW7_4;  // 被减数输入
  reg  [3:0] SW3_0;  // 减数输入
  wire [6:0] SEG1;  // 数码管DK1显示
  wire [6:0] SEG5;  // 数码管DK5显示
  wire       DK1_EN;  // DK1片选信号
  wire       DK5_EN;  // DK5片选信号

  subtraction_display uut (
      .SW7_4 (SW7_4),
      .SW3_0 (SW3_0),
      .SEG1  (SEG1),
      .SEG5  (SEG5),
      .DK1_EN(DK1_EN),
      .DK5_EN(DK5_EN)
  );

  initial begin
    SW7_4 = 4'd0;
    SW3_0 = 4'd0;

    #10 SW7_4 = 4'd9;
    SW3_0 = 4'd5;  // 9 - 5 = 4
    #10 SW7_4 = 4'd8;
    SW3_0 = 4'd3;  // 8 - 3 = 5
    #10 SW7_4 = 4'd7;
    SW3_0 = 4'd2;  // 7 - 2 = 5
    #10 SW7_4 = 4'd6;
    SW3_0 = 4'd4;  // 6 - 4 = 2
    #10 SW7_4 = 4'd5;
    SW3_0 = 4'd5;  // 5 - 5 = 0
    #10 SW7_4 = 4'd4;
    SW3_0 = 4'd6;  // 4 - 6 = -2 (溢出，数码管显示不正确)
    #10 SW7_4 = 4'd0;
    SW3_0 = 4'd0;  // 0 - 0 = 0

    #10 $finish;
  end
endmodule
