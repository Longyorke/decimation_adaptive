// -------------------------------------------------------------
// 
// File Name: Controller.v
// Edited: 2024-12-27 21:13:14
// 
// Designed by Vivado 2020.2, MATLAB R2020b, and SysGen 2020.2
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: Controller

// Version: 0.1
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module Controller
          (clk,
           reset,
           enb,
           in,
           enb_1,
           rst,
           out_re,
           out_im,
           wrAdrs,
           enbWr);


  input   clk;
  input   reset;
  input   enb;
  input   signed [31:0] in;  // sfix32_En21
  input   enb_1;
  input   rst;
  output  signed [31:0] out_re;  // sfix32_En21
  output  signed [31:0] out_im;  // sfix32_En21
  output  [4:0] wrAdrs;  // ufix5
  output  enbWr;


  reg signed [31:0] out_re_1;  // sfix32_En21
  reg signed [31:0] out_im_1;  // sfix32_En21
  reg [4:0] wrAdrs_1;  // ufix5
  reg  enbWr_1;
  reg  state;
  reg [4:0] count;  // ufix5
  reg  state_next;
  reg [4:0] count_next;  // ufix5
  reg  cntHigh;


  always @(posedge clk or posedge reset)
    begin : Controller_1_process
      if (reset == 1'b1) begin
        state <= 1'b0;
        count <= 5'b00000;
      end
      else begin
        if (enb) begin
          state <= state_next;
          count <= count_next;
        end
      end
    end

  always @(count, enb_1, in, rst, state) begin
    state_next = state;
    count_next = count;
    // It provides input control signals to write updated filter coefficients to
    // the RAM.
    enbWr_1 = state && ( ! rst);
    cntHigh = (count == 5'b01111) && state;
    if (rst) begin
      state_next = 1'b0;
    end
    else if (enb_1) begin
      state_next = 1'b1;
    end
    else if (cntHigh) begin
      state_next = 1'b0;
    end
    // counter logic
    if ((cntHigh || enb_1) || rst) begin
      count_next = 5'b00000;
    end
    else if (state) begin
      count_next = count + 5'b00001;
    end
    out_re_1 = in;
    out_im_1 = 32'sb00000000000000000000000000000000;
    wrAdrs_1 = count;
  end

  assign out_re = out_re_1;

  assign out_im = out_im_1;

  assign wrAdrs = wrAdrs_1;

  assign enbWr = enbWr_1;

endmodule  // Controller

