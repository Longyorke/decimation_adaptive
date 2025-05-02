// -------------------------------------------------------------
// 
// File Name: Data_Control.v
// Edited: 2024-12-27 21:13:14
// 
// Designed by Vivado 2020.2, MATLAB R2020b, and SysGen 2020.2
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: Data_Control
//
// Version: 0.1
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module Data_Control
          (clk,
           reset,
           enb,
           reset_1,
           validIn,
           adapt,
           adaptOut,
           validOut,
           readyOut);


  input   clk;
  input   reset;
  input   enb;
  input   reset_1;
  input   validIn;
  input   adapt;
  output  adaptOut;
  output  validOut;
  output  readyOut;




  Input_Control u_Input_Control (.clk(clk),
                                 .reset(reset),
                                 .enb(enb),
                                 .reset_1(reset_1),
                                 .validIn(validIn),
                                 .adapt(adapt),
                                 .adaptOut(adaptOut),
                                 .validOut(validOut),
                                 .readyOut(readyOut)
                                 );

endmodule  // Data_Control

