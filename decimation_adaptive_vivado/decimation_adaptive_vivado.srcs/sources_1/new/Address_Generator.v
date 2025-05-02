// -------------------------------------------------------------
// 
// File Name: Address_Generator.v
// Edited: 2024-12-27 21:13:14
// 
// Designed by Vivado 2020.2, MATLAB R2020b, and SysGen 2020.2
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: Address_Generator
//
// Version: 0.1
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module Address_Generator
          (clk,
           reset,
           enb,
           enb_1,
           enbRd,
           wrAddrs,
           wrEnb,
           rdAddrs);


  input   clk;
  input   reset;
  input   enb;
  input   enb_1;
  input   enbRd;
  output  [4:0] wrAddrs;  // ufix5
  output  wrEnb;
  output  [4:0] rdAddrs;  // ufix5


  wire Counter_Wr_ctrl_const_out;
  reg  Counter_Wr_ctrl_delay_out;
  wire [4:0] Counter_Wr_Initial_Val_out;  // ufix5
  wire [4:0] count_step;  // ufix5
  wire [4:0] count_from;  // ufix5
  wire [4:0] Counter_Wr_out1;  // ufix5
  wire [4:0] count;  // ufix5
  wire need_to_wrap;
  wire [4:0] count_value;  // ufix5
  wire [4:0] count_1;  // ufix5
  reg [4:0] Counter_Wr_out;  // ufix5
  wire [4:0] count_step_1;  // ufix5
  wire [4:0] count_from_1;  // ufix5
  reg [4:0] Counter_Rd_out1;  // ufix5
  wire [4:0] count_2;  // ufix5
  wire need_to_wrap_1;
  wire [4:0] count_value_1;  // ufix5
  wire [4:0] count_3;  // ufix5
  wire [4:0] count_4;  // ufix5


  assign Counter_Wr_ctrl_const_out = 1'b1;

  always @(posedge clk or posedge reset)
    begin : Counter_Wr_ctrl_delay_process
      if (reset == 1'b1) begin
        Counter_Wr_ctrl_delay_out <= 1'b0;
      end
      else begin
        if (enb) begin
          Counter_Wr_ctrl_delay_out <= Counter_Wr_ctrl_const_out;
        end
      end
    end

  assign Counter_Wr_Initial_Val_out = 5'b01111;

  // Count limited, Unsigned Counter
  //  initial value   = 15
  //  step value      = -1
  //  count to value  = 0
  assign count_step = 5'b00001;

  assign count_from = 5'b01111;

  assign count = Counter_Wr_out1 - count_step;

  assign need_to_wrap = Counter_Wr_out1 == 5'b00000;

  assign count_value = (need_to_wrap == 1'b0 ? count :
              count_from);

  assign count_1 = (enb_1 == 1'b0 ? Counter_Wr_out1 :
              count_value);

  always @(posedge clk or posedge reset)
    begin : Counter_Wr_process
      if (reset == 1'b1) begin
        Counter_Wr_out <= 5'b00000;
      end
      else begin
        if (enb) begin
          Counter_Wr_out <= count_1;
        end
      end
    end

  assign Counter_Wr_out1 = (Counter_Wr_ctrl_delay_out == 1'b0 ? Counter_Wr_Initial_Val_out :
              Counter_Wr_out);

  assign wrAddrs = Counter_Wr_out1;

  assign wrEnb = enb_1;

  // Count limited, Unsigned Counter
  //  initial value   = 0
  //  step value      = 1
  //  count to value  = 15
  assign count_step_1 = 5'b00001;

  assign count_from_1 = 5'b00000;

  assign count_2 = Counter_Rd_out1 + count_step_1;

  assign need_to_wrap_1 = Counter_Rd_out1 == 5'b01111;

  assign count_value_1 = (need_to_wrap_1 == 1'b0 ? count_2 :
              count_from_1);

  assign count_3 = (enbRd == 1'b0 ? Counter_Rd_out1 :
              count_value_1);

  assign count_4 = (enb_1 == 1'b0 ? count_3 :
              Counter_Wr_out1);

  always @(posedge clk or posedge reset)
    begin : Counter_Rd_process
      if (reset == 1'b1) begin
        Counter_Rd_out1 <= 5'b00000;
      end
      else begin
        if (enb) begin
          Counter_Rd_out1 <= count_4;
        end
      end
    end

  assign rdAddrs = Counter_Rd_out1;

endmodule  // Address_Generator

