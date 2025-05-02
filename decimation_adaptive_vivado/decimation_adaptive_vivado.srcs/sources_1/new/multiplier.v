// -------------------------------------------------------------
// 
// File Name: multiplier.v
// Edited: 2024-12-27 21:13:14
// 
// Designed by Vivado 2020.2, MATLAB R2020b, and SysGen 2020.2
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: multiplier
//
// Version: 0.1
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module multiplier
          (clk,
           enb,
           in1,
           in2,
           out);


  input   clk;
  input   enb;
  input   signed [24:0] in1;  // sfix25_En13
  input   signed [30:0] in2;  // sfix31_En21
  output  signed [55:0] out;  // sfix56_En34


  reg signed [55:0] out_1;  // sfix56_En34
  reg signed [24:0] in1d1;  // sfix25
  reg signed [24:0] in1d2;  // sfix25
  reg signed [30:0] in2d1;  // sfix31
  reg signed [30:0] in2d2;  // sfix31
  reg signed [55:0] yreg1;  // sfix56
  reg signed [55:0] yreg2;  // sfix56

  initial begin
    in1d1 = 25'sb0000000000000000000000000;
    in1d2 = 25'sb0000000000000000000000000;
    in2d1 = 31'sb0000000000000000000000000000000;
    in2d2 = 31'sb0000000000000000000000000000000;
    out_1 = 56'sh00000000000000;
    yreg1 = 56'sh00000000000000;
    yreg2 = 56'sh00000000000000;
  end

  always @(posedge clk)
    begin : multiplier_1_process
      if (enb) begin
        in1d2 <= in1d1;
        in1d1 <= in1;
        in2d2 <= in2d1;
        in2d1 <= in2;
        out_1 <= yreg1;
        yreg1 <= yreg2;
        yreg2 <= in1d2 * in2d2;
      end
    end

  assign out = out_1;

endmodule  // multiplier

