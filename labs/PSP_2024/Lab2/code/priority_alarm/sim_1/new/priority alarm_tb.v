`timescale 1ns / 1ps
module alarm_tb ();
  reg I0t, I1t, I2t, I3t;
  wire Y0t, Y1t, Y2t;

  alarm UUT (
      .in_I0 (I0t),
      .in_I1 (I1t),
      .in_I2 (I2t),
      .in_I3 (I3t),
      .out_Y0(Y0t),
      .out_Y1(Y1t),
      .out_Y2(Y2t)
  );
  initial begin
    {I0t, I1t, I2t, I3t} = 4'b0000;
    #5{I0t, I1t, I2t, I3t} = 4'b0001;
    #5{I0t, I1t, I2t, I3t} = 4'b0010;
    #5{I0t, I1t, I2t, I3t} = 4'b0011;
    #5{I0t, I1t, I2t, I3t} = 4'b0100;
    #5{I0t, I1t, I2t, I3t} = 4'b0101;
    #5{I0t, I1t, I2t, I3t} = 4'b0110;
    #5{I0t, I1t, I2t, I3t} = 4'b0111;
    #5{I0t, I1t, I2t, I3t} = 4'b1000;
    #5{I0t, I1t, I2t, I3t} = 4'b1001;
    #5{I0t, I1t, I2t, I3t} = 4'b1010;
    #5{I0t, I1t, I2t, I3t} = 4'b1011;
    #5{I0t, I1t, I2t, I3t} = 4'b1100;
    #5{I0t, I1t, I2t, I3t} = 4'b1101;
    #5{I0t, I1t, I2t, I3t} = 4'b1110;
    #5{I0t, I1t, I2t, I3t} = 4'b1111;
    #5{I0t, I1t, I2t, I3t} = 4'b0000;
    #10 $finish;

  end
endmodule

