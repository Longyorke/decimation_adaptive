// -------------------------------------------------------------
// 
// File Name: Multiplier2.v
// Edited: 2024-12-27 21:13:14
// 
// Designed by Vivado 2020.2, MATLAB R2020b, and SysGen 2020.2
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: Multiplier2
//
// Version: 0.1
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module Multiplier2
          (clk,
           reset,
           enb,
           in1,
           in2,
           enb_1,
           mulout);


  input   clk;
  input   reset;
  input   enb;
  input   signed [23:0] in1;  // sfix24_En13
  input   signed [30:0] in2;  // sfix31_En21
  input   enb_1;
  output  signed [55:0] mulout;  // sfix56_En34


  wire signed [24:0] const_rsvd;  // sfix25_En13
  reg signed [24:0] Delay3_reg [0:1];  // sfix25 [2]
  wire signed [24:0] Delay3_reg_next [0:1];  // sfix25_En13 [2]
  wire signed [24:0] Delay3_out1;  // sfix25_En13
  wire signed [30:0] out;  // sfix31_En21
  wire signed [55:0] out_1;  // sfix56_En34
  reg signed [31:0] Delay3_t_0_0;  // int32
  reg signed [31:0] Delay3_t_1;  // int32


  Data_Conversion_block u_Data_Conversion (.u(in1),  // sfix24_En13
                                           .const_rsvd(const_rsvd)  // sfix25_En13
                                           );

  always @(posedge clk or posedge reset)
    begin : Delay3_process
      if (reset == 1'b1) begin
        for(Delay3_t_1 = 32'sd0; Delay3_t_1 <= 32'sd1; Delay3_t_1 = Delay3_t_1 + 32'sd1) begin
          Delay3_reg[Delay3_t_1] <= 25'sb0000000000000000000000000;
        end
      end
      else begin
        if (enb) begin
          for(Delay3_t_0_0 = 32'sd0; Delay3_t_0_0 <= 32'sd1; Delay3_t_0_0 = Delay3_t_0_0 + 32'sd1) begin
            Delay3_reg[Delay3_t_0_0] <= Delay3_reg_next[Delay3_t_0_0];
          end
        end
      end
    end

  assign Delay3_out1 = Delay3_reg[1];
  assign Delay3_reg_next[0] = const_rsvd;
  assign Delay3_reg_next[1] = Delay3_reg[0];

  Enb_Delay u_Enb_Delay (.clk(clk),
                         .reset(reset),
                         .enb(enb),
                         .u(in2),  // sfix31_En21
                         .enb_1(enb_1),
                         .out(out)  // sfix31_En21
                         );

  multiplier u_multiplier (.clk(clk),
                           .enb(enb),
                           .in1(Delay3_out1),  // sfix25_En13
                           .in2(out),  // sfix31_En21
                           .out(out_1)  // sfix56_En34
                           );

  assign mulout = out_1;

endmodule  // Multiplier2

