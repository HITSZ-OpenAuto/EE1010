`timescale 1ns / 1ps
module alarm (
    input  in_I0,
    input  in_I1,
    input  in_I2,
    input  in_I3,
    output out_Y0,
    output out_Y1,
    output out_Y2
);
  assign out_Y0 = in_I0 | in_I1 | in_I2 | in_I3;
  assign out_Y1 = in_I2 | in_I3;
  assign out_Y2 = (in_I3 | in_I1) & (~in_I2 | in_I3);
endmodule

