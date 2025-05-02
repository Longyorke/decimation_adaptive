// -------------------------------------------------------------
// 
// File Name: multiplier_block.v
// Edited: 2024-12-27 21:13:14
// 
// Designed by Vivado 2020.2, MATLAB R2020b, and SysGen 2020.2
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: multiplier_block
//
// Version: 0.1
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module multiplier_block
          (clk,
           enb,
           in1,
           in2,
           out);


  input   clk;
  input   enb;
  input   signed [23:0] in1;  // sfix24_En13
  input   signed [31:0] in2;  // sfix32_En21
  output  signed [55:0] out;  // sfix56_En34


  reg signed [55:0] out_1;  // sfix56_En34
  reg signed [23:0] in1d1;  // sfix24
  reg signed [23:0] in1d2;  // sfix24
  reg signed [31:0] in2d1;  // sfix32
  reg signed [31:0] in2d2;  // sfix32
  reg signed [55:0] yreg1;  // sfix56
  reg signed [55:0] yreg2;  // sfix56

  initial begin
    in1d1 = 24'sb000000000000000000000000;
    in1d2 = 24'sb000000000000000000000000;
    in2d1 = 32'sb00000000000000000000000000000000;
    in2d2 = 32'sb00000000000000000000000000000000;
    out_1 = 56'sh00000000000000;
    yreg1 = 56'sh00000000000000;
    yreg2 = 56'sh00000000000000;
  end

  always @(posedge clk)
    begin : multiplier_process
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

endmodule  // multiplier_block

