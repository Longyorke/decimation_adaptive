// -------------------------------------------------------------
// 
// File Name: Reset_Control.v
// Edited: 2024-12-27 21:13:14
// 
// Designed by Vivado 2020.2, MATLAB R2020b, and SysGen 2020.2
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: Reset_Control
//
// Version: 0.1
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module Reset_Control
          (clk,
           reset,
           enb,
           rst,
           count,
           filterEnb,
           enb_1,
           adapt,
           accRst,
           dataRst,
           coeffRst);


  input   clk;
  input   reset;
  input   enb;
  input   rst;
  input   [4:0] count;  // ufix5
  input   filterEnb;
  input   enb_1;
  input   adapt;
  output  accRst;
  output  dataRst;
  output  coeffRst;




  resetControl u_resetControl (.clk(clk),
                               .reset(reset),
                               .enb(enb),
                               .rst(rst),
                               .filtEnb(filterEnb),
                               .enb_1(enb_1),
                               .count(count),  // ufix5
                               .adaptin(adapt),
                               .accRst(accRst),
                               .dataRst(dataRst),
                               .coeffRst(coeffRst)
                               );

endmodule  // Reset_Control

