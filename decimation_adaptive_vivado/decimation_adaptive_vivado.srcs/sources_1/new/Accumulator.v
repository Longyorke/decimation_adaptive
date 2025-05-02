// -------------------------------------------------------------
// 
// File Name: Accumulator.v
// Edited: 2024-12-27 21:13:14
// 
// Designed by Vivado 2020.2, MATLAB R2020b, and SysGen 2020.2
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: Accumulator
//
// Version: 0.1
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module Accumulator
          (clk,
           reset,
           enb,
           reset_1,
           enb_1,
           mulOut,
           filterValid,
           filterOut);


  input   clk;
  input   reset;
  input   enb;
  input   reset_1;
  input   enb_1;
  input   signed [55:0] mulOut;  // sfix56_En34
  output  filterValid;
  output  signed [34:0] filterOut;  // sfix35_En20


  reg  Delay1_out1;
  reg  Delay5_out1;
  reg  Delay2_out1;
  reg signed [55:0] Delay3_out1;  // sfix56_En34
  wire signed [34:0] out1;  // sfix35_En20


  always @(posedge clk or posedge reset)
    begin : Delay1_process
      if (reset == 1'b1) begin
        Delay1_out1 <= 1'b0;
      end
      else begin
        if (enb) begin
          Delay1_out1 <= enb_1;
        end
      end
    end

  always @(posedge clk or posedge reset)
    begin : Delay5_process
      if (reset == 1'b1) begin
        Delay5_out1 <= 1'b0;
      end
      else begin
        if (enb) begin
          Delay5_out1 <= Delay1_out1;
        end
      end
    end

  assign filterValid = Delay5_out1;

  always @(posedge clk or posedge reset)
    begin : Delay2_process
      if (reset == 1'b1) begin
        Delay2_out1 <= 1'b0;
      end
      else begin
        if (enb) begin
          Delay2_out1 <= reset_1;
        end
      end
    end

  always @(posedge clk or posedge reset)
    begin : Delay3_process
      if (reset == 1'b1) begin
        Delay3_out1 <= 56'sh00000000000000;
      end
      else begin
        if (enb) begin
          Delay3_out1 <= mulOut;
        end
      end
    end

  Adder u_Adder (.clk(clk),
                 .reset(reset),
                 .enb(enb),
                 .enb_1(Delay1_out1),
                 .rst(Delay2_out1),
                 .a(Delay3_out1),  // sfix56_En34
                 .out1(out1)  // sfix35_En20
                 );

  assign filterOut = out1;

endmodule  // Accumulator

