// -------------------------------------------------------------
// 
// File Name: Multiplier1.v
// Edited: 2024-12-27 21:13:14
// 
// Designed by Vivado 2020.2, MATLAB R2020b, and SysGen 2020.2
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: Multiplier1
//
// Version: 0.1
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module Multiplier1
          (clk,
           enb,
           stepSize,
           filterError,
           mulout);


  input   clk;
  input   enb;
  input   [17:0] stepSize;  // ufix18_En18
  input   signed [30:0] filterError;  // sfix31_En16
  output  signed [30:0] mulout;  // sfix31_En21


  reg [17:0] Delay1_reg [0:1];  // ufix18 [2]
  wire [17:0] Delay1_reg_next [0:1];  // ufix18_En18 [2]
  wire [17:0] Delay1_out1;  // ufix18_En18
  reg signed [30:0] Delay2_reg [0:1];  // sfix31 [2]
  wire signed [30:0] Delay2_reg_next [0:1];  // sfix31_En16 [2]
  wire signed [30:0] Delay2_out1;  // sfix31_En16
  wire signed [18:0] Product_cast;  // sfix19_En18
  wire signed [49:0] Product_mul_temp;  // sfix50_En34
  wire signed [48:0] Product_out1;  // sfix49_En34
  reg signed [48:0] Delay_out1;  // sfix49_En34
  wire signed [30:0] y;  // sfix31_En21
  reg signed [31:0] Delay1_t_0_0;  // int32
  reg signed [31:0] Delay1_t_1;  // int32
  reg signed [31:0] Delay2_t_0_0;  // int32
  reg signed [31:0] Delay2_t_1;  // int32

  initial begin

    for(Delay1_t_1 = 32'sd0; Delay1_t_1 <= 32'sd1; Delay1_t_1 = Delay1_t_1 + 32'sd1) begin
      Delay1_reg[Delay1_t_1] = 18'b000000000000000000;
    end


    for(Delay2_t_1 = 32'sd0; Delay2_t_1 <= 32'sd1; Delay2_t_1 = Delay2_t_1 + 32'sd1) begin
      Delay2_reg[Delay2_t_1] = 31'sb0000000000000000000000000000000;
    end

    Delay_out1 = 49'sh0000000000000;
  end

  always @(posedge clk)
    begin : Delay1_process
      if (enb) begin
        for(Delay1_t_0_0 = 32'sd0; Delay1_t_0_0 <= 32'sd1; Delay1_t_0_0 = Delay1_t_0_0 + 32'sd1) begin
          Delay1_reg[Delay1_t_0_0] <= Delay1_reg_next[Delay1_t_0_0];
        end
      end
    end

  assign Delay1_out1 = Delay1_reg[1];
  assign Delay1_reg_next[0] = stepSize;
  assign Delay1_reg_next[1] = Delay1_reg[0];

  always @(posedge clk)
    begin : Delay2_process
      if (enb) begin
        for(Delay2_t_0_0 = 32'sd0; Delay2_t_0_0 <= 32'sd1; Delay2_t_0_0 = Delay2_t_0_0 + 32'sd1) begin
          Delay2_reg[Delay2_t_0_0] <= Delay2_reg_next[Delay2_t_0_0];
        end
      end
    end

  assign Delay2_out1 = Delay2_reg[1];
  assign Delay2_reg_next[0] = filterError;
  assign Delay2_reg_next[1] = Delay2_reg[0];

  assign Product_cast = {1'b0, Delay1_out1};
  assign Product_mul_temp = Product_cast * Delay2_out1;
  assign Product_out1 = Product_mul_temp[48:0];

  always @(posedge clk)
    begin : Delay_process
      if (enb) begin
        Delay_out1 <= Product_out1;
      end
    end

  Data_Conversion u_Data_Conversion (.u(Delay_out1),  // sfix49_En34
                                     .u1(Delay2_out1),  // sfix31_En16
                                     .y(y)  // sfix31_En21
                                     );

  assign mulout = y;

endmodule  // Multiplier1

