// -------------------------------------------------------------
// 
// File Name: Data_Type_Conversion_Inherited.v
// Edited: 2024-12-27 21:13:14
// 
// Designed by Vivado 2020.2, MATLAB R2020b, and SysGen 2020.2
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: Data_Type_Conversion_Inherited
//
// Version: 0.1
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module Data_Type_Conversion_Inherited
          (u,
           y);


  input   signed [55:0] u;  // sfix56_En34
  output  signed [31:0] y;  // sfix32_En21


  wire signed [31:0] Conversion_out1;  // sfix32_En21


  assign Conversion_out1 = u[44:13];

  assign y = Conversion_out1;

endmodule  // Data_Type_Conversion_Inherited

