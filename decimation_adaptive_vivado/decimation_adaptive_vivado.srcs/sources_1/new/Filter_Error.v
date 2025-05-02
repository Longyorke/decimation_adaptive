// -------------------------------------------------------------
// 
// File Name: Filter_Error.v
// Edited: 2024-12-27 21:13:14
// 
// Designed by Vivado 2020.2, MATLAB R2020b, and SysGen 2020.2
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: Filter_Error
//
// Version: 0.1
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module Filter_Error
          (clk,
           reset,
           enb,
           enb_1,
           desired,
           filterData,
           filterError);


  input   clk;
  input   reset;
  input   enb;
  input   enb_1;
  input   signed [23:0] desired;  // sfix24_En13
  input   signed [34:0] filterData;  // sfix35_En20
  output  signed [30:0] filterError;  // sfix31_En16


  wire signed [30:0] out1;  // sfix31_En16
  wire signed [30:0] out2;  // sfix31_En16
  reg signed [30:0] Delay3_reg [0:6];  // sfix31 [7]
  reg signed [30:0] Delay3_reg_next [0:6];  // sfix31_En16 [7]
  reg signed [30:0] Delay3_out1;  // sfix31_En16
  wire signed [30:0] Add1_out1;  // sfix31_En16
  reg signed [30:0] Delay5_out1;  // sfix31_En16
  reg signed [31:0] Delay3_t_0_0;  // int32
  reg signed [31:0] Delay3_t_0_1;  // int32
  reg signed [31:0] Delay3_t_1;  // int32


  DataType_Conversion u_DataType_Conversion (.clk(clk),
                                             .reset(reset),
                                             .enb(enb),
                                             .enb_1(enb_1),
                                             .u(desired),  // sfix24_En13
                                             .u1(filterData),  // sfix35_En20
                                             .out1(out1),  // sfix31_En16
                                             .out2(out2)  // sfix31_En16
                                             );

  always @(posedge clk or posedge reset)
    begin : Delay3_process
      if (reset == 1'b1) begin
        for(Delay3_t_1 = 32'sd0; Delay3_t_1 <= 32'sd6; Delay3_t_1 = Delay3_t_1 + 32'sd1) begin
          Delay3_reg[Delay3_t_1] <= 31'sb0000000000000000000000000000000;
        end
      end
      else begin
        if (enb) begin
          for(Delay3_t_0_1 = 32'sd0; Delay3_t_0_1 <= 32'sd6; Delay3_t_0_1 = Delay3_t_0_1 + 32'sd1) begin
            Delay3_reg[Delay3_t_0_1] <= Delay3_reg_next[Delay3_t_0_1];
          end
        end
      end
    end

  always @* begin
    Delay3_out1 = Delay3_reg[6];
    Delay3_reg_next[0] = out1;

    for(Delay3_t_0_0 = 32'sd0; Delay3_t_0_0 <= 32'sd5; Delay3_t_0_0 = Delay3_t_0_0 + 32'sd1) begin
      Delay3_reg_next[Delay3_t_0_0 + 32'sd1] = Delay3_reg[Delay3_t_0_0];
    end

  end

  assign Add1_out1 = Delay3_out1 - out2;

  always @(posedge clk or posedge reset)
    begin : Delay5_process
      if (reset == 1'b1) begin
        Delay5_out1 <= 31'sb0000000000000000000000000000000;
      end
      else begin
        if (enb) begin
          Delay5_out1 <= Add1_out1;
        end
      end
    end

  assign filterError = Delay5_out1;

endmodule  // Filter_Error

