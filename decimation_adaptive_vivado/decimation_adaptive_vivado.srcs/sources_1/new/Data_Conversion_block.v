// -------------------------------------------------------------
// 
// File Name: Data_Conversion_block.v
// Edited: 2024-12-27 21:13:14
// 
// Designed by Vivado 2020.2, MATLAB R2020b, and SysGen 2020.2
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: Data_Conversion_block
//
// Version: 0.1
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module Data_Conversion_block
          (u,
           const_rsvd);


  input   signed [23:0] u;  // sfix24_En13
  output  signed [24:0] const_rsvd;  // sfix25_En13




  //#Codegen
  // The wordlength and fractional length adjusted based on simulation
  assign const_rsvd = {u[23], u};

endmodule  // Data_Conversion_block

