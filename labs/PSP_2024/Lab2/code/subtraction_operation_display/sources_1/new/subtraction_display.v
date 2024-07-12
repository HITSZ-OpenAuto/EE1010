`timescale 1ns / 1ps

module subtraction_display (
    input  [3:0] SW7_4,   // 被减数输入
    input  [3:0] SW3_0,   // 减数输入
    output [6:0] SEG1,    // 数码管 DK1 显示
    output [6:0] SEG5,    // 数码管 DK5 显示
    output       DK1_EN,  // DK1 片选信号
    output       DK5_EN   // DK5 片选信号
);

  // 中间信号
  wire [4:0] result; // 5位输出
  wire [3:0] tens;   // 十位数
  wire [3:0] units;  // 个位数

  // 片选信号，高电平使能
  assign DK1_EN = 1;
  assign DK5_EN = 1;

  // 减法运算
  assign result = SW7_4 - SW3_0;

  // 结果转换为十进制
  binary_to_bcd bcd_converter (
      .binary(result),
      .tens  (tens),
      .units  (units)
  );

  // 数码管驱动
  bcd_to_7segment seg1 (
      .decimal(tens),
      .segment(SEG1)
  );

  bcd_to_7segment seg5 (
      .decimal(units),
      .segment(SEG5)
  );
endmodule

// 二进制 -> 十进制模块
module binary_to_bcd (
    input [4:0] binary,
    output reg [3:0] tens,
    output reg [3:0] units
);
  always @(*) begin
    tens = binary / 10;
    units = binary % 10;
  end
endmodule

// BCD -> 数码管显示模块
module bcd_to_7segment (
    input [3:0] decimal,
    output reg [6:0] segment
);
  always @(*) begin
    case (decimal)
      4'd0: segment = 7'b0111111;
      4'd1: segment = 7'b0000110;
      4'd2: segment = 7'b1011011;
      4'd3: segment = 7'b1001111;
      4'd4: segment = 7'b1100110;
      4'd5: segment = 7'b1101101;
      4'd6: segment = 7'b1111101;
      4'd7: segment = 7'b0000111;
      4'd8: segment = 7'b1111111;
      4'd9: segment = 7'b1101111;
      default: segment = 7'b0000000;  // 默认不显示
    endcase
  end
endmodule

