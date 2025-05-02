// -------------------------------------------------------------
// 
// File Name: Enb_Delay.v
// Edited: 2024-12-27 21:13:14
// 
// Designed by Vivado 2020.2, MATLAB R2020b, and SysGen 2020.2
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: Enb_Delay
//
// Version: 0.1
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module Enb_Delay
          (clk,
           reset,
           enb,
           u,
           enb_1,
           out);


  input   clk;
  input   reset;
  input   enb;
  input   signed [30:0] u;  // sfix31_En21
  input   enb_1;
  output  signed [30:0] out;  // sfix31_En21


  reg signed [30:0] out_1;  // sfix31_En21
  reg signed [30:0] reg_rsvd;  // sfix31
  reg signed [30:0] reg_next;  // sfix31_En21


  always @(posedge clk or posedge reset)
    begin : Enb_Delay_1_process
      if (reset == 1'b1) begin
        reg_rsvd <= 31'sb0000000000000000000000000000000;
      end
      else begin
        if (enb) begin
          reg_rsvd <= reg_next;
        end
      end
    end

  always @(enb_1, reg_rsvd, u) begin
    reg_next = reg_rsvd;
    //#Codegen
    // The wordlength and fractional length adjusted based on simulation
    if (enb_1) begin
      reg_next = u;
    end
    out_1 = reg_rsvd;
  end

  assign out = out_1;

endmodule  // Enb_Delay

