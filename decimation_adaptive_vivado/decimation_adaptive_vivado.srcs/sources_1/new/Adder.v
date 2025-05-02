// -------------------------------------------------------------
// 
// File Name: Adder.v
// Edited: 2024-12-27 21:13:14
// 
// Designed by Vivado 2020.2, MATLAB R2020b, and SysGen 2020.2
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: Adder
// Source Path: decimation_adaptive_vivado\decimation_adaptive_vivado.srcs\Adder
//
// Version: 0.1
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module Adder
          (clk,
           reset,
           enb,
           enb_1,
           rst,
           a,
           out1);


  input   clk;
  input   reset;
  input   enb;
  input   enb_1;
  input   rst;
  input   signed [55:0] a;  // sfix56_En34
  output  signed [34:0] out1;  // sfix35_En20


  reg signed [34:0] out1_1;  // sfix35_En20
  reg signed [34:0] reg_rsvd;  // sfix35
  reg signed [34:0] breg;  // sfix35
  reg  state;
  reg signed [34:0] reg_next;  // sfix35_En20
  reg signed [34:0] breg_next;  // sfix35_En20
  reg  state_next;
  reg signed [56:0] u;  // sfix57_En34
  reg signed [56:0] add_cast;  // sfix57_En34
  reg signed [56:0] add_cast_0;  // sfix57_En34


  always @(posedge clk or posedge reset)
    begin : Adder_1_process
      if (reset == 1'b1) begin
        state <= 1'b1;
        reg_rsvd <= 35'sh000000000;
        breg <= 35'sh000000000;
      end
      else begin
        if (enb) begin
          reg_rsvd <= reg_next;
          breg <= breg_next;
          state <= state_next;
        end
      end
    end

  always @(a, breg, enb_1, reg_rsvd, rst, state) begin
    reg_next = reg_rsvd;
    state_next = state;
    // This logic fuctions as accumulator of the filter. It casts the data based
    // on the double, single or fixed-point real- or complex-valued input
    // signals.
    add_cast = {a[55], a};
    add_cast_0 = {{8{breg[34]}}, {breg, 14'b00000000000000}};
    u = add_cast + add_cast_0;
    if (rst) begin
      reg_next = 35'sh000000000;
    end
    else if (enb_1) begin
      reg_next = u[48:14];
    end
    if (rst || state) begin
      breg_next = 35'sh000000000;
    end
    else begin
      breg_next = u[48:14];
    end
    if (rst) begin
      state_next = 1'b0;
    end
    else if (enb_1) begin
      state_next = 1'b1;
    end
    out1_1 = reg_rsvd;
  end

  assign out1 = out1_1;

endmodule  // Adder

