// -------------------------------------------------------------
// 
// File Name: Data_Type_Conversion.v
// Edited: 2024-12-27 21:13:14
// 
// Designed by Vivado 2020.2, MATLAB R2020b, and SysGen 2020.2
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: Data_Type_Conversion
//
// Version: 0.1
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module Data_Type_Conversion
          (u1,
           y);


  input   signed [55:0] u1;  // sfix56_En34
  output  signed [31:0] y;  // sfix32_En21


  wire signed [31:0] Data_Type_Conversion_Inherited_out1;  // sfix32_En21


  Data_Type_Conversion_Inherited u_Data_Type_Conversion_Inherited (.u(u1),  // sfix56_En34
                                                                   .y(Data_Type_Conversion_Inherited_out1)  // sfix32_En21
                                                                   );

  assign y = Data_Type_Conversion_Inherited_out1;

endmodule  // Data_Type_Conversion

