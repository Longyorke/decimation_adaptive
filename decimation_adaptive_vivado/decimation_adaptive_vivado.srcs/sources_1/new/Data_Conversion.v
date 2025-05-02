// -------------------------------------------------------------
// 
// File Name: Data_Conversion.v
// Edited: 2024-12-27 21:13:14
// 
// Designed by Vivado 2020.2, MATLAB R2020b, and SysGen 2020.2
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: Data_Conversion
//
// Version: 0.1
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module Data_Conversion
          (u,
           u1,
           y);


  input   signed [48:0] u;  // sfix49_En34
  input   signed [30:0] u1;  // sfix31_En16
  output  signed [30:0] y;  // sfix31_En21




  //#Codegen
  // The wordlength and fractional length adjusted based on simulation
  assign y = u[43:13];

endmodule  // Data_Conversion

