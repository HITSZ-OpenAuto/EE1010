`timescale 1ns / 1ps

module ColorfulLight (
    input clk,  // 时钟信号
    input rst,  // 复位信号
    input cin,  // 控制信号 
    output reg [7:0] dout  // 输出信号
);
  reg [2:0] CS, NS;  // CS 当前状态，NS 下一状态
  wire clk_200Hz, clk_2Hz;  // 200Hz,2Hz 时钟信号
  // 定义状态 12345
  parameter [2:0] S0 = 3'b000, S1 = 3'b001, S2 = 3'b010, S3 = 3'b011, S4 = 3'b100;
  reg waiting;
  timer TIMER200 (
      .clk_in(clk),
      .clk_out(clk_200Hz),
      .output_freq(200)
  );
  timer TIMER2 (
      .clk_in(clk),
      .clk_out(clk_2Hz),
      .output_freq(2)
  );
  wire cin_real;
  debouncer Vcin (
      .clk(clk_200Hz),
      .in (cin),
      .out(cin_real)
  );

  // 第一个 always 块，采用同步时序的方式描述状态转移
  always @(posedge clk) begin
    if (rst) CS <= S0;
    else CS <= NS;
  end

  // 第二个 always 块, 组合逻辑的方式判断状态转移条件，描述状态转移规律
  always @(*) begin
    if (rst) NS = S0;
    else if (waiting) begin
      if (!cin_real) waiting = 0;
    end else begin
      if (cin_real) begin
        waiting = 1;
        case (CS)
          S0: NS = S1;
          S1: NS = S2;
          S2: NS = S3;
          S3: NS = S4;
          S4: NS = S0;
          default: NS = S0;
        endcase

      end
    end
  end
  reg [7:0] dout_s1;
  reg [7:0] dout_s2;
  reg [7:0] dout_s3;

  // 第三个 always 模块使用同步时序电路描述每个状态的输出
  always @(posedge clk) begin
    case (CS)
      S0: begin  // 全灭
        dout <= 8'b00000000;
        dout_s1 <= 8'b00000001;
        dout_s2 <= 8'b01010101;
        dout_s3 <= 8'b00000001;
      end
      S1: dout <= 8'b11111111;  // 全亮
      S2: begin  // 交替闪烁，逆时针旋转
        if (clk_2Hz) begin
          dout <= dout_s1;
          dout_s1 <= {dout_s1[6:0], dout_s1[7]};
        end else dout <= dout;
      end
      S3: begin  // 交替闪烁，顺时针旋转
        if (clk_2Hz) begin
          dout <= dout_s3;
          dout_s3 <= {dout_s3[0], dout_s3[7:1]};
        end else dout <= dout;
      end
      S4: begin
        if (clk_2Hz) begin
          dout <= dout_s2;
          dout_s2 <= {dout_s2[6:0], dout_s2[7]};
        end else dout <= dout;
      end
      default: dout <= 8'b00000000;
    endcase
  end
endmodule

