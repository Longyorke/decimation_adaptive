// -------------------------------------------------------------
// 
// File Name: MATLAB_Function1.v
// Edited: 2024-12-27 21:13:14
// 
// Designed by Vivado 2020.2, MATLAB R2020b, and SysGen 2020.2
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: MATLAB_Function1
//
// Version: 0.1
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module MATLAB_Function1
          (u_re,
           u_im,
           u1,
           y);


  input   signed [31:0] u_re;  // sfix32_En21
  input   signed [31:0] u_im;  // sfix32_En21
  input   signed [23:0] u1;  // sfix24_En13
  output  signed [31:0] y;  // sfix32_En21




  assign y = u_re;

endmodule  // MATLAB_Function1

