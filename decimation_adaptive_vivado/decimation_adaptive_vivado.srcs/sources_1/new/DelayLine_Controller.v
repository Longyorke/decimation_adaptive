// -------------------------------------------------------------
// 
// File Name: DelayLine_Controller.v
// Edited: 2024-12-27 21:13:14
// 
// Designed by Vivado 2020.2, MATLAB R2020b, and SysGen 2020.2
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: DelayLine_Controller
//
// Version: 0.1
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module DelayLine_Controller
          (clk,
           reset,
           enb,
           enb_1,
           rst,
           adapt,
           enbRd,
           filtEnb,
           rdAdrs,
           valCoeff,
           coeffWrEnb);


  input   clk;
  input   reset;
  input   enb;
  input   enb_1;
  input   rst;
  input   adapt;
  output  enbRd;
  output  filtEnb;
  output  [4:0] rdAdrs;  // ufix5
  output  valCoeff;
  output  coeffWrEnb;




  Controller_block u_Controller (.clk(clk),
                                 .reset(reset),
                                 .enb(enb),
                                 .enb_1(enb_1),
                                 .rst(rst),
                                 .adapt(adapt),
                                 .enbRd(enbRd),
                                 .valCoeff(valCoeff),
                                 .filtEnb(filtEnb),
                                 .coeffWrEnb(coeffWrEnb),
                                 .rdAdrs(rdAdrs)  // ufix5
                                 );

endmodule  // DelayLine_Controller

