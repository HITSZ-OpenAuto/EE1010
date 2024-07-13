`timescale 1ns / 1ps
module D_flip_flop_tb ();
  reg  clk;
  reg  reset;
  reg  en;
  reg  d;
  wire q;

  D_flip_flop UUT (
      .clk(clk),
      .reset(reset),
      .en(en),
      .d(d),
      .q(q)
  );

  initial begin
    clk = 1'b0;
    reset = 1'b1;
    en = 1'b0;
    d = 1'b0;
    #20 reset = 1'b0;
    #20 en = 1'b1;
    #40 en = 1'b0;
    #20 reset = 1'b1;
    #20 reset = 1'b0;
    #50 $finish;
  end
  // 产生时钟信号，每 5ns 翻转一次
  always begin
    clk = 1'b0;
    #5 clk = 1'b1;
    #5;
  end
  // 产生输入信号 d，每 8ns 翻转一次
  always begin
    d = 1'b0;
    #8 d = 1'b1;
    #8;
  end
endmodule


