// -------------------------------------------------------------
// 
// File Name: Reset_Data.v
// Edited: 2024-12-27 21:13:14
// 
// Designed by Vivado 2020.2, MATLAB R2020b, and SysGen 2020.2
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: Reset_Data
//
// Version: 0.1
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module Reset_Data
          (data,
           coeff,
           dataRst,
           coeffRst,
           delayLine,
           oldCoeff);


  input   signed [23:0] data;  // sfix24_En13
  input   signed [31:0] coeff;  // sfix32_En21
  input   dataRst;
  input   coeffRst;
  output  signed [23:0] delayLine;  // sfix24_En13
  output  signed [31:0] oldCoeff;  // sfix32_En21


  reg signed [23:0] delayLine_1;  // sfix24_En13
  reg signed [31:0] oldCoeff_1;  // sfix32_En21


  always @(coeff, coeffRst, data, dataRst) begin
    // Resets the input and coefficient memory.
    if (dataRst) begin
      // cast data type based on inputs
      delayLine_1 = 24'sb000000000000000000000000;
    end
    else begin
      delayLine_1 = data;
    end
    if (coeffRst) begin
      // cast data type based on inputs
      oldCoeff_1 = 32'sb00000000000000000000000000000000;
    end
    else begin
      oldCoeff_1 = coeff;
    end
  end

  assign delayLine = delayLine_1;

  assign oldCoeff = oldCoeff_1;

endmodule  // Reset_Data

