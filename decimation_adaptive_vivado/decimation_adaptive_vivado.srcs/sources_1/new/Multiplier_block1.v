// -------------------------------------------------------------
// 
// File Name: Multiplier_block1.v
// Edited: 2024-12-27 21:13:14
// 
// Designed by Vivado 2020.2, MATLAB R2020b, and SysGen 2020.2
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: Multiplier_block1
//
// Version: 0.1
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module Multiplier_block1
          (clk,
           enb,
           in1,
           in2,
           mulOut);


  input   clk;
  input   enb;
  input   signed [23:0] in1;  // sfix24_En13
  input   signed [31:0] in2;  // sfix32_En21
  output  signed [55:0] mulOut;  // sfix56_En34


  wire signed [55:0] out;  // sfix56_En34


  multiplier_block u_multiplier (.clk(clk),
                                 .enb(enb),
                                 .in1(in1),  // sfix24_En13
                                 .in2(in2),  // sfix32_En21
                                 .out(out)  // sfix56_En34
                                 );

  assign mulOut = out;

endmodule  // Multiplier_block1

