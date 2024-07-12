`timescale 1ns / 1ps

module testbench;
  reg clk;
  reg rst;
  reg cin;
  wire [7:0] dout;

  // 实例化待测模块
  ColorfulLight uut (
      .clk (clk),
      .rst (rst),
      .cin (cin),
      .dout(dout)
  );

  // 时钟生成
  always begin
    #5 clk = ~clk;  // 生成10ns周期的时钟
  end

  // 测试序列
  initial begin
    // 初始化
    clk = 0;
    rst = 1;
    cin = 0;
    #20000000 rst = 0;  // 复位结束

    // 测试序列
    #20000000 cin = 1;  // 控制信号置1
    #20000000 cin = 0;  // 控制信号置0
    #20000000 cin = 1;  // 控制信号置1
    #20000000 cin = 0;  // 控制信号置0
    #20000000 cin = 1;  // 控制信号置1
    #20000000 cin = 0;  // 控制信号置0

    #20000000 $finish;  // 结束测试
  end
endmodule
