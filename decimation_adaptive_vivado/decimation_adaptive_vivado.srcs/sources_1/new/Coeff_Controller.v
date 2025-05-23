// -------------------------------------------------------------
// 
// File Name: Coeff_Controller.v
// Edited: 2024-12-27 21:13:14
// 
// Designed by Vivado 2020.2, MATLAB R2020b, and SysGen 2020.2
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: Coeff_Controller
//
// Version: 0.1
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module Coeff_Controller
          (clk,
           reset,
           enb,
           din,
           rst,
           coeffWrenb,
           dout_re,
           dout_im,
           wrAddrs,
           wrEnb);


  input   clk;
  input   reset;
  input   enb;
  input   signed [31:0] din;  // sfix32_En21
  input   rst;
  input   coeffWrenb;
  output  signed [31:0] dout_re;  // sfix32_En21
  output  signed [31:0] dout_im;  // sfix32_En21
  output  [4:0] wrAddrs;  // ufix5
  output  wrEnb;


  reg  [11:0] Delay9_reg;  // ufix1 [12]
  wire Delay9_out1;
  reg  [12:0] Delay1_reg;  // ufix1 [13]
  wire Delay1_out1;
  wire signed [31:0] out_re;  // sfix32_En21
  wire signed [31:0] out_im;  // sfix32_En21
  wire [4:0] wrAdrs;  // ufix5
  wire enbWr;
  reg [4:0] Delay16_reg [0:3];  // ufix5 [4]
  reg [4:0] Delay16_reg_next [0:3];  // ufix5 [4]
  reg [4:0] Delay16_out1;  // ufix5
  reg  [3:0] Delay17_reg;  // ufix1 [4]
  wire Delay17_out1;
  reg signed [31:0] Delay16_t_0_0;  // int32
  reg signed [31:0] Delay16_t_0_1;  // int32
  reg signed [31:0] Delay16_t_1;  // int32


  always @(posedge clk or posedge reset)
    begin : Delay9_process
      if (reset == 1'b1) begin
        Delay9_reg <= {12{1'b0}};
      end
      else begin
        if (enb) begin
          Delay9_reg[0] <= coeffWrenb;
          Delay9_reg[32'sd11:32'sd1] <= Delay9_reg[32'sd10:32'sd0];
        end
      end
    end

  assign Delay9_out1 = Delay9_reg[11];

  always @(posedge clk or posedge reset)
    begin : Delay1_process
      if (reset == 1'b1) begin
        Delay1_reg <= {13{1'b0}};
      end
      else begin
        if (enb) begin
          Delay1_reg[0] <= rst;
          Delay1_reg[32'sd12:32'sd1] <= Delay1_reg[32'sd11:32'sd0];
        end
      end
    end

  assign Delay1_out1 = Delay1_reg[12];

  Controller u_Controller (.clk(clk),
                           .reset(reset),
                           .enb(enb),
                           .in(din),  // sfix32_En21
                           .enb_1(Delay9_out1),
                           .rst(Delay1_out1),
                           .out_re(out_re),  // sfix32_En21
                           .out_im(out_im),  // sfix32_En21
                           .wrAdrs(wrAdrs),  // ufix5
                           .enbWr(enbWr)
                           );

  assign dout_re = out_re;

  assign dout_im = out_im;

  always @(posedge clk or posedge reset)
    begin : Delay16_process
      if (reset == 1'b1) begin
        for(Delay16_t_1 = 32'sd0; Delay16_t_1 <= 32'sd3; Delay16_t_1 = Delay16_t_1 + 32'sd1) begin
          Delay16_reg[Delay16_t_1] <= 5'b00000;
        end
      end
      else begin
        if (enb) begin
          for(Delay16_t_0_1 = 32'sd0; Delay16_t_0_1 <= 32'sd3; Delay16_t_0_1 = Delay16_t_0_1 + 32'sd1) begin
            Delay16_reg[Delay16_t_0_1] <= Delay16_reg_next[Delay16_t_0_1];
          end
        end
      end
    end

  always @* begin
    Delay16_out1 = Delay16_reg[3];
    Delay16_reg_next[0] = wrAdrs;

    for(Delay16_t_0_0 = 32'sd0; Delay16_t_0_0 <= 32'sd2; Delay16_t_0_0 = Delay16_t_0_0 + 32'sd1) begin
      Delay16_reg_next[Delay16_t_0_0 + 32'sd1] = Delay16_reg[Delay16_t_0_0];
    end

  end

  assign wrAddrs = Delay16_out1;

  always @(posedge clk or posedge reset)
    begin : Delay17_process
      if (reset == 1'b1) begin
        Delay17_reg <= {4{1'b0}};
      end
      else begin
        if (enb) begin
          Delay17_reg[0] <= enbWr;
          Delay17_reg[32'sd3:32'sd1] <= Delay17_reg[32'sd2:32'sd0];
        end
      end
    end

  assign Delay17_out1 = Delay17_reg[3];

  assign wrEnb = Delay17_out1;

endmodule  // Coeff_Controller

