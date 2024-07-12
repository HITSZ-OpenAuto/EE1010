`timescale 1ns / 1ps
module three_to_eight_tb ();
  reg ENt, A0t, A1t, A2t;
  wire Y0t, Y1t, Y2t, Y3t, Y4t, Y5t, Y6t, Y7t;

  three_to_eight UUT (
      .EN(ENt),
      .in_A0(A0t),
      .in_A1(A1t),
      .in_A2(A2t),
      .out_Y0(Y0t),
      .out_Y1(Y1t),
      .out_Y2(Y2t),
      .out_Y3(Y3t),
      .out_Y4(Y4t),
      .out_Y5(Y5t),
      .out_Y6(Y6t),
      .out_Y7(Y7t)
  );
  initial begin
    {ENt, A2t, A1t, A0t} = 4'b0000;
    #5{ENt, A2t, A1t, A0t} = 4'b0001;
    #5{ENt, A2t, A1t, A0t} = 4'b0010;
    #5{ENt, A2t, A1t, A0t} = 4'b0011;
    #5{ENt, A2t, A1t, A0t} = 4'b0100;
    #5{ENt, A2t, A1t, A0t} = 4'b0101;
    #5{ENt, A2t, A1t, A0t} = 4'b0110;
    #5{ENt, A2t, A1t, A0t} = 4'b0111;
    #5{ENt, A2t, A1t, A0t} = 4'b1000;
    #5{ENt, A2t, A1t, A0t} = 4'b1001;
    #5{ENt, A2t, A1t, A0t} = 4'b1010;
    #5{ENt, A2t, A1t, A0t} = 4'b1011;
    #5{ENt, A2t, A1t, A0t} = 4'b1100;
    #5{ENt, A2t, A1t, A0t} = 4'b1101;
    #5{ENt, A2t, A1t, A0t} = 4'b1110;
    #5{ENt, A2t, A1t, A0t} = 4'b1111;
    #5{ENt, A2t, A1t, A0t} = 4'b0000;
    #10 $finish;
  end
endmodule
