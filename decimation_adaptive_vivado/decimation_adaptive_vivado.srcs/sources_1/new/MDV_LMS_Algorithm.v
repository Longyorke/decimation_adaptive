// -------------------------------------------------------------
// 
// File Name: MDV_LMS_Algorithm.v
// Edited: 2024-12-27 21:13:14
// 
// Designed by Vivado 2020.2, MATLAB R2020b, and SysGen 2020.2
// 
// 
// -- -------------------------------------------------------------
// -- Rate and Clocking Details
// -- -------------------------------------------------------------
// Model base rate: 1
// Target subsystem base rate: 1
// 
// 
// Clock Enable  Sample Time
// -- -------------------------------------------------------------
// ce_out        1
// -- -------------------------------------------------------------
// 
// 
// Output Signal                 Clock Enable  Sample Time
// -- -------------------------------------------------------------
// filterOut_out1                ce_out        1
// filterOut_signal2             ce_out        1
// filterWeights_oldCoeff        ce_out        1
// filterWeights_signal2         ce_out        1
// filterError_signal1           ce_out        1
// filterError_signal2           ce_out        1
// ready                         ce_out        1
// -- -------------------------------------------------------------
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: MDV_LMS_Algorithm
// Source Path: MDV_LMS/MDV LMS Algorithm
//
// Version: 0.1
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module MDV_LMS_Algorithm
          (clk,
           reset,
           clk_enable,
           observedSignal,
           desiredSignal,
           valid,
           stepSize,
           adapt,
           reset_1,
           ce_out,
           filterOut_out1,
           filterOut_signal2,
           filterWeights_oldCoeff,
           filterWeights_signal2,
           filterError_signal1,
           filterError_signal2,
           ready);


  input   clk;
  input   reset;
  input   clk_enable;
  input   signed [23:0] observedSignal;  // sfix24_En13
  input   signed [23:0] desiredSignal;  // sfix24_En13
  input   valid;
  input   signed [17:0] stepSize;  // sfix18_En18
  input   adapt;
  input   reset_1;
  output  ce_out;
  output  signed [34:0] filterOut_out1;  // sfix35_En20
  output  filterOut_signal2;
  output  signed [31:0] filterWeights_oldCoeff;  // sfix32_En21
  output  filterWeights_signal2;
  output  signed [30:0] filterError_signal1;  // sfix31_En16
  output  filterError_signal2;
  output  ready;


  wire adaptOut;
  wire validOut;
  wire readyOut;
  wire signed [55:0] Coefficient_Update_out1;  // sfix56_En34
  wire signed [31:0] Data_Type_Conversion_out1;  // sfix32_En21
  wire signed [23:0] Filter_out1;  // sfix24_En13
  wire signed [34:0] out1;  // sfix35_En20
  wire Filter_out3;
  wire signed [31:0] oldCoeff;  // sfix32_En21
  wire Filter_out5;
  wire signed [30:0] Coefficient_Update_out2_signal1;  // sfix31_En16
  wire Coefficient_Update_out2_signal2;
  wire signed [34:0] Coefficient_Update_out3_out1;  // sfix35_En20
  wire Coefficient_Update_out3_signal2;
  wire signed [31:0] Coefficient_Update_out4_oldCoeff;  // sfix32_En21
  wire Coefficient_Update_out4_signal2;


  Data_Control u_Data_Control (.clk(clk),
                               .reset(reset),
                               .enb(clk_enable),
                               .reset_1(reset_1),
                               .validIn(valid),
                               .adapt(adapt),
                               .adaptOut(adaptOut),
                               .validOut(validOut),
                               .readyOut(readyOut)
                               );

  Data_Type_Conversion u_Data_Type_Conversion (.u1(Coefficient_Update_out1),  // sfix56_En34
                                               .y(Data_Type_Conversion_out1)  // sfix32_En21
                                               );

  Filter u_Filter (.clk(clk),
                   .reset(reset),
                   .enb(clk_enable),
                   .newCoeff(Data_Type_Conversion_out1),  // sfix32_En21
                   .observed(observedSignal),  // sfix24_En13
                   .reset_1(reset_1),
                   .adapt(adaptOut),
                   .enb_1(validOut),
                   .delayLine(Filter_out1),  // sfix24_En13
                   .filterOut(out1),  // sfix35_En20
                   .filterEnb(Filter_out3),
                   .oldCoeff(oldCoeff),  // sfix32_En21
                   .validCoeff(Filter_out5)
                   );

  Coefficient_Update u_Coefficient_Update (.clk(clk),
                                           .reset(reset),
                                           .enb(clk_enable),
                                           .delayLine(Filter_out1),  // sfix24_En13
                                           .filterData(out1),  // sfix35_En20
                                           .filterEnb(Filter_out3),
                                           .oldCoeff(oldCoeff),  // sfix32_En21
                                           .validCoeff(Filter_out5),
                                           .inputEnb(validOut),
                                           .stepSize(stepSize),  // sfix18_En18
                                           .desired(desiredSignal),  // sfix24_En13
                                           .newCoeff(Coefficient_Update_out1),  // sfix56_En34
                                           .filterError_signal1(Coefficient_Update_out2_signal1),  // sfix31_En16
                                           .filterError_signal2(Coefficient_Update_out2_signal2),
                                           .filterOut_out1(Coefficient_Update_out3_out1),  // sfix35_En20
                                           .filterOut_signal2(Coefficient_Update_out3_signal2),
                                           .filterWeights_oldCoeff(Coefficient_Update_out4_oldCoeff),  // sfix32_En21
                                           .filterWeights_signal2(Coefficient_Update_out4_signal2)
                                           );

  assign filterOut_out1 = Coefficient_Update_out3_out1;

  assign filterOut_signal2 = Coefficient_Update_out3_signal2;

  assign filterWeights_oldCoeff = Coefficient_Update_out4_oldCoeff;

  assign filterWeights_signal2 = Coefficient_Update_out4_signal2;

  assign filterError_signal1 = Coefficient_Update_out2_signal1;

  assign filterError_signal2 = Coefficient_Update_out2_signal2;

  assign ready = readyOut;

  assign ce_out = clk_enable;
  
  //Just for the convenience of observing the final filtering result
  reg signed [30:0] filterError_signal1_buf; // sfix31_En16
  reg ready_prev;
always @(posedge clk or posedge reset) begin
    if (reset)
        ready_prev <= 0;
    else
        ready_prev <= ready;
end

always @(posedge clk or posedge reset) begin
    if (reset)
        filterError_signal1_buf <= 31'd0;
    else if (ready && !ready_prev) begin  // 在 ready 的上升沿时缓存数据
        filterError_signal1_buf <= filterError_signal1;
    end
end

endmodule  // MDV_LMS_Algorithm

