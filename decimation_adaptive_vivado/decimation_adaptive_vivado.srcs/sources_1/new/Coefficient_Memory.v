// -------------------------------------------------------------
// 
// File Name: Coefficient_Memory.v
// Edited: 2024-12-27 21:13:14
// 
// Designed by Vivado 2020.2, MATLAB R2020b, and SysGen 2020.2
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: Coefficient_Memory
//
// Version: 0.1
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module Coefficient_Memory
          (clk,
           reset,
           enb,
           delayLine,
           coeffWrEnb,
           rdAddrs,
           coeffIn,
           rst,
           coeffOut);


  input   clk;
  input   reset;
  input   enb;
  input   signed [23:0] delayLine;  // sfix24_En13
  input   coeffWrEnb;
  input   [4:0] rdAddrs;  // ufix5
  input   signed [31:0] coeffIn;  // sfix32_En21
  input   rst;
  output  signed [31:0] coeffOut;  // sfix32_En21


  wire signed [31:0] out_re;  // sfix32_En21
  wire signed [31:0] out_im;  // sfix32_En21
  wire [4:0] Coeff_Controller_out2;  // ufix5
  wire Coeff_Controller_out3;
  reg signed [31:0] Delay2_out1_re;  // sfix32_En21
  reg signed [31:0] Delay2_out1_im;  // sfix32_En21
  reg [4:0] Delay_out1;  // ufix5
  reg  Delay1_out1;
  wire signed [31:0] Simple_Dual_Port_RAM1_out1_re;  // sfix32_En21
  wire signed [31:0] Simple_Dual_Port_RAM1_out1_im;  // sfix32_En21
  wire signed [31:0] y;  // sfix32_En21


  Coeff_Controller u_Coeff_Controller (.clk(clk),
                                       .reset(reset),
                                       .enb(enb),
                                       .din(coeffIn),  // sfix32_En21
                                       .rst(rst),
                                       .coeffWrenb(coeffWrEnb),
                                       .dout_re(out_re),  // sfix32_En21
                                       .dout_im(out_im),  // sfix32_En21
                                       .wrAddrs(Coeff_Controller_out2),  // ufix5
                                       .wrEnb(Coeff_Controller_out3)
                                       );

  always @(posedge clk or posedge reset)
    begin : Delay2_process
      if (reset == 1'b1) begin
        Delay2_out1_re <= 32'sb00000000000000000000000000000000;
        Delay2_out1_im <= 32'sb00000000000000000000000000000000;
      end
      else begin
        if (enb) begin
          Delay2_out1_re <= out_re;
          Delay2_out1_im <= out_im;
        end
      end
    end

  always @(posedge clk or posedge reset)
    begin : Delay_process
      if (reset == 1'b1) begin
        Delay_out1 <= 5'b00000;
      end
      else begin
        if (enb) begin
          Delay_out1 <= Coeff_Controller_out2;
        end
      end
    end

  always @(posedge clk or posedge reset)
    begin : Delay1_process
      if (reset == 1'b1) begin
        Delay1_out1 <= 1'b0;
      end
      else begin
        if (enb) begin
          Delay1_out1 <= Coeff_Controller_out3;
        end
      end
    end

  SimpleDualPortRAM_generic #(.AddrWidth(5),
                              .DataWidth(32)
                              )
                            u_Simple_Dual_Port_RAM1 (.clk(clk),
                                                     .enb(enb),
                                                     .wr_din_re(Delay2_out1_re),
                                                     .wr_din_im(Delay2_out1_im),
                                                     .wr_addr(Delay_out1),
                                                     .wr_en(Delay1_out1),
                                                     .rd_addr(rdAddrs),
                                                     .dout_re(Simple_Dual_Port_RAM1_out1_re),
                                                     .dout_im(Simple_Dual_Port_RAM1_out1_im)
                                                     );

  MATLAB_Function1 u_MATLAB_Function1 (.u_re(Simple_Dual_Port_RAM1_out1_re),  // sfix32_En21
                                       .u_im(Simple_Dual_Port_RAM1_out1_im),  // sfix32_En21
                                       .u1(delayLine),  // sfix24_En13
                                       .y(y)  // sfix32_En21
                                       );

  assign coeffOut = y;

endmodule  // Coefficient_Memory

