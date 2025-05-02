// -------------------------------------------------------------
// 
// File Name: Tapped_Delay.v
// Edited: 2024-12-27 21:13:14
// 
// Designed by Vivado 2020.2, MATLAB R2020b, and SysGen 2020.2
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: Tapped_Delay
//
// Version: 0.1
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module Tapped_Delay
          (clk,
           reset,
           enb,
           observed,
           enb_1,
           rst,
           adapt,
           validCoeff,
           filterEnb,
           delayLine,
           coeffWrEnb,
           rdAddrs);


  input   clk;
  input   reset;
  input   enb;
  input   signed [23:0] observed;  // sfix24_En13
  input   enb_1;
  input   rst;
  input   adapt;
  output  validCoeff;
  output  filterEnb;
  output  signed [23:0] delayLine;  // sfix24_En13
  output  coeffWrEnb;
  output  [4:0] rdAddrs;  // ufix5


  wire enbRd;
  wire filtEnb;
  wire [4:0] rdAdrs;  // ufix5
  wire valCoeff;
  wire coeffWrEnb_1;
  reg  Delay2_out1;
  wire [4:0] Address_Generator_out1;  // ufix5
  wire validOut;
  wire [4:0] Address_Generator_out3;  // ufix5
  wire signed [23:0] Simple_Dual_Port_RAM_out1;  // sfix24_En13
  reg  Delay3_out1;


  DelayLine_Controller u_DelayLine_Controller (.clk(clk),
                                               .reset(reset),
                                               .enb(enb),
                                               .enb_1(enb_1),
                                               .rst(rst),
                                               .adapt(adapt),
                                               .enbRd(enbRd),
                                               .filtEnb(filtEnb),
                                               .rdAdrs(rdAdrs),  // ufix5
                                               .valCoeff(valCoeff),
                                               .coeffWrEnb(coeffWrEnb_1)
                                               );

  always @(posedge clk or posedge reset)
    begin : Delay2_process
      if (reset == 1'b1) begin
        Delay2_out1 <= 1'b0;
      end
      else begin
        if (enb) begin
          Delay2_out1 <= valCoeff;
        end
      end
    end

  assign validCoeff = Delay2_out1;

  assign filterEnb = filtEnb;

  Address_Generator u_Address_Generator (.clk(clk),
                                         .reset(reset),
                                         .enb(enb),
                                         .enb_1(enb_1),
                                         .enbRd(enbRd),
                                         .wrAddrs(Address_Generator_out1),  // ufix5
                                         .wrEnb(validOut),
                                         .rdAddrs(Address_Generator_out3)  // ufix5
                                         );

  SimpleDualPortRAM_generic_block #(.AddrWidth(5),
                                    .DataWidth(24)
                                    )
                                  u_Simple_Dual_Port_RAM (.clk(clk),
                                                          .enb(enb),
                                                          .wr_din(observed),
                                                          .wr_addr(Address_Generator_out1),
                                                          .wr_en(validOut),
                                                          .rd_addr(Address_Generator_out3),
                                                          .dout(Simple_Dual_Port_RAM_out1)
                                                          );

  assign delayLine = Simple_Dual_Port_RAM_out1;

  always @(posedge clk or posedge reset)
    begin : Delay3_process
      if (reset == 1'b1) begin
        Delay3_out1 <= 1'b0;
      end
      else begin
        if (enb) begin
          Delay3_out1 <= coeffWrEnb_1;
        end
      end
    end

  assign coeffWrEnb = Delay3_out1;

  assign rdAddrs = rdAdrs;

endmodule  // Tapped_Delay

