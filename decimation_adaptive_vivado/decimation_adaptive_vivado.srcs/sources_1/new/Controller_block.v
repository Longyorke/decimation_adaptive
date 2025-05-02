// -------------------------------------------------------------
// 
// File Name: Controller_block.v
// Edited: 2024-12-27 21:13:14
// 
// Designed by Vivado 2020.2, MATLAB R2020b, and SysGen 2020.2
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: Controller_block
//
// Version: 0.1
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module Controller_block
          (clk,
           reset,
           enb,
           enb_1,
           rst,
           adapt,
           enbRd,
           valCoeff,
           filtEnb,
           coeffWrEnb,
           rdAdrs);


  input   clk;
  input   reset;
  input   enb;
  input   enb_1;
  input   rst;
  input   adapt;
  output  enbRd;
  output  valCoeff;
  output  filtEnb;
  output  coeffWrEnb;
  output  [4:0] rdAdrs;  // ufix5


  reg  enbRd_1;
  reg  valCoeff_1;
  reg  filtEnb_1;
  reg  coeffWrEnb_1;
  reg [4:0] rdAdrs_1;  // ufix5
  reg  state1;
  reg  state2;
  reg [4:0] count;  // ufix5
  reg  state1_next;
  reg  state2_next;
  reg [4:0] count_next;  // ufix5
  reg  cntHigh;
  reg  filtEnb1;


  always @(posedge clk or posedge reset)
    begin : Controller_process
      if (reset == 1'b1) begin
        state1 <= 1'b0;
        state2 <= 1'b0;
        count <= 5'b00000;
      end
      else begin
        if (enb) begin
          state1 <= state1_next;
          state2 <= state2_next;
          count <= count_next;
        end
      end
    end

  always @(adapt, count, enb_1, rst, state1, state2) begin
    state1_next = state1;
    state2_next = state2;
    count_next = count;
    //#Codegen
    // It provides input control signals for read and write operation of the
    // filter.
    if (state1 && ( ! rst)) begin
      enbRd_1 = 1'b1;
      valCoeff_1 = 1'b1;
    end
    else begin
      enbRd_1 = 1'b0;
      valCoeff_1 = 1'b0;
    end
    cntHigh = (count == 5'b01111) && state1;
    filtEnb1 = cntHigh && ( ! rst);
    coeffWrEnb_1 = filtEnb1 && ( ! state2);
    if (rst) begin
      state1_next = 1'b0;
      state2_next = 1'b0;
    end
    else begin
      if (enb_1) begin
        state1_next = 1'b1;
      end
      else if (cntHigh) begin
        state1_next = 1'b0;
      end
      if (( ! adapt) && enb_1) begin
        state2_next = 1'b1;
      end
      else if (cntHigh) begin
        state2_next = 1'b0;
      end
    end
    if ((cntHigh || enb_1) || rst) begin
      count_next = 5'b00000;
    end
    else if (state1) begin
      count_next = count + 5'b00001;
    end
    filtEnb_1 = filtEnb1;
    rdAdrs_1 = count;
  end

  assign enbRd = enbRd_1;

  assign valCoeff = valCoeff_1;

  assign filtEnb = filtEnb_1;

  assign coeffWrEnb = coeffWrEnb_1;

  assign rdAdrs = rdAdrs_1;

endmodule  // Controller_block

