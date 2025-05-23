// -------------------------------------------------------------
// 
// File Name: resetControl.v
// Edited: 2024-12-27 21:13:14
// 
// Designed by Vivado 2020.2, MATLAB R2020b, and SysGen 2020.2
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: resetControl
//
// Version: 0.1
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module resetControl
          (clk,
           reset,
           enb,
           rst,
           filtEnb,
           enb_1,
           count,
           adaptin,
           accRst,
           dataRst,
           coeffRst);


  input   clk;
  input   reset;
  input   enb;
  input   rst;
  input   filtEnb;
  input   enb_1;
  input   [4:0] count;  // ufix5
  input   adaptin;
  output  accRst;
  output  dataRst;
  output  coeffRst;


  reg  accRst_1;
  reg  dataRst_1;
  reg  coeffRst_1;
  reg  state1;
  reg  state2;
  reg [4:0] count1;  // ufix5
  reg  rstReg;
  reg  state3;
  reg  state1_next;
  reg  state2_next;
  reg [4:0] count1_next;  // ufix5
  reg  rstReg_next;
  reg  state3_next;
  reg  last;
  reg  state2Tmp;


  always @(posedge clk or posedge reset)
    begin : resetControl_1_process
      if (reset == 1'b1) begin
        state1 <= 1'b0;
        state2 <= 1'b0;
        state3 <= 1'b0;
        rstReg <= 1'b0;
        count1 <= 5'b00000;
      end
      else begin
        if (enb) begin
          state1 <= state1_next;
          state2 <= state2_next;
          count1 <= count1_next;
          rstReg <= rstReg_next;
          state3 <= state3_next;
        end
      end
    end

  always @(adaptin, count, count1, enb_1, filtEnb, rst, rstReg, state1, state2, state3) begin
    state1_next = state1;
    state2_next = state2;
    count1_next = count1;
    rstReg_next = rstReg;
    state3_next = state3;
    //#Codegen
    // This function provides reset control logic to reset the input and
    // coefficient memory.
    accRst_1 = state1 && filtEnb;
    coeffRst_1 = state1 && state2;
    dataRst_1 = (count > count1) && state2;
    if (rst) begin
      state1_next = 1'b1;
    end
    else if (filtEnb && state3) begin
      state1_next = 1'b0;
    end
    last = ((count1 == 5'b01111) && filtEnb) && state3;
    state2Tmp = state2 && state3;
    if (rstReg) begin
      state2_next = 1'b1;
    end
    else if (last) begin
      state2_next = 1'b0;
    end
    if (rst || last) begin
      count1_next = 5'b00000;
    end
    else if (state2Tmp && filtEnb) begin
      count1_next = count1 + 5'b00001;
    end
    if (rst) begin
      rstReg_next = 1'b1;
    end
    else if (enb_1) begin
      rstReg_next = 1'b0;
    end
    if (rst || (enb_1 && ( ! adaptin))) begin
      state3_next = 1'b0;
    end
    else if (enb_1 && adaptin) begin
      state3_next = 1'b1;
    end
  end

  assign accRst = accRst_1;

  assign dataRst = dataRst_1;

  assign coeffRst = coeffRst_1;

endmodule  // resetControl

