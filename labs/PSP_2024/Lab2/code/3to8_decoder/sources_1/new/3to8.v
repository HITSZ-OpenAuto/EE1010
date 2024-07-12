`timescale 1ns / 1ps
module three_to_eight (
    input  EN,
    input  in_A0,
    input  in_A1,
    input  in_A2,
    output out_Y0,
    output out_Y1,
    output out_Y2,
    output out_Y3,
    output out_Y4,
    output out_Y5,
    output out_Y6,
    output out_Y7
);
  assign out_Y0 = EN ? ({in_A2, in_A1, in_A0} == 3'b000) : 0;
  assign out_Y1 = EN ? ({in_A2, in_A1, in_A0} == 3'b001) : 0;
  assign out_Y2 = EN ? ({in_A2, in_A1, in_A0} == 3'b010) : 0;
  assign out_Y3 = EN ? ({in_A2, in_A1, in_A0} == 3'b011) : 0;
  assign out_Y4 = EN ? ({in_A2, in_A1, in_A0} == 3'b100) : 0;
  assign out_Y5 = EN ? ({in_A2, in_A1, in_A0} == 3'b101) : 0;
  assign out_Y6 = EN ? ({in_A2, in_A1, in_A0} == 3'b110) : 0;
  assign out_Y7 = EN ? ({in_A2, in_A1, in_A0} == 3'b111) : 0;
endmodule



