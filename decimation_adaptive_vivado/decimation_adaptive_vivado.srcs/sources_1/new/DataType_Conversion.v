// -------------------------------------------------------------
// 
// File Name: DataType_Conversion.v
// Edited: 2024-12-27 21:13:14
// 
// Designed by Vivado 2020.2, MATLAB R2020b, and SysGen 2020.2
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: DataType_Conversion
//
// Version: 0.1
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module DataType_Conversion
          (clk,
           reset,
           enb,
           enb_1,
           u,
           u1,
           out1,
           out2);


  input   clk;
  input   reset;
  input   enb;
  input   enb_1;
  input   signed [23:0] u;  // sfix24_En13
  input   signed [34:0] u1;  // sfix35_En20
  output  signed [30:0] out1;  // sfix31_En16
  output  signed [30:0] out2;  // sfix31_En16


  reg signed [30:0] out1_1;  // sfix31_En16
  reg signed [30:0] out2_1;  // sfix31_En16
  reg signed [30:0] reg_rsvd;  // sfix31
  reg signed [30:0] reg_next;  // sfix31_En16


  always @(posedge clk or posedge reset)
    begin : DataType_Conversion_1_process
      if (reset == 1'b1) begin
        reg_rsvd <= 31'sb0000000000000000000000000000000;
      end
      else begin
        if (enb) begin
          reg_rsvd <= reg_next;
        end
      end
    end

  always @(enb_1, reg_rsvd, u, u1) begin
    reg_next = reg_rsvd;
    //#Codegen
    // The wordlength and fractional length adjusted based on simulation
    if (enb_1) begin
      reg_next = {{4{u[23]}}, {u, 3'b000}};
    end
    out1_1 = reg_rsvd;
    out2_1 = u1[34:4];
  end

  assign out1 = out1_1;

  assign out2 = out2_1;

endmodule  // DataType_Conversion

