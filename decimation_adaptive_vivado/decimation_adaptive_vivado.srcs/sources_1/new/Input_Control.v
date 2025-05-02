// -------------------------------------------------------------
// 
// File Name: Input_Control.v
// Edited: 2024-12-27 21:13:14
// 
// Designed by Vivado 2020.2, MATLAB R2020b, and SysGen 2020.2
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: Input_Control
//
// Version: 0.1
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module Input_Control
          (clk,
           reset,
           enb,
           reset_1,
           validIn,
           adapt,
           adaptOut,
           validOut,
           readyOut);


  input   clk;
  input   reset;
  input   enb;
  input   reset_1;
  input   validIn;
  input   adapt;
  output  adaptOut;
  output  validOut;
  output  readyOut;


  reg  adaptOut_1;
  reg  validOut_1;
  reg  readyOut_1;
  reg [2:0] state;  // ufix3
  reg  readyReg;
  reg [5:0] count;  // ufix6
  reg [2:0] state_next;  // ufix3
  reg  readyReg_next;
  reg [5:0] count_next;  // ufix6
  reg  validOut1;


  always @(posedge clk or posedge reset)
    begin : Input_Control_1_process
      if (reset == 1'b1) begin
        state <= 3'b000;
        readyReg <= 1'b1;
        count <= 6'b000000;
      end
      else begin
        if (enb) begin
          state <= state_next;
          readyReg <= readyReg_next;
          count <= count_next;
        end
      end
    end

  always @(adapt, count, readyReg, reset_1, state, validIn) begin
    state_next = state;
    readyReg_next = readyReg;
    count_next = count;
    //#Codegen
    // Ready control logic, it generates control signals which tells the user
    // and other blocks when to accept and validate the input data.
    adaptOut_1 = (adapt && readyReg) && ( ! reset_1);
    if (reset_1) begin
      validOut1 = 1'b0;
      readyReg_next = 1'b1;
      state_next = 3'b000;
    end
    else begin
      case ( state)
        3'b000 :
          begin
            // IDLE   = fi(0, 0, 3, 0);
            validOut1 = validIn;
            state_next = 3'b000;
            readyReg_next = 1'b1;
            if (validIn) begin
              state_next = 3'b001;
              readyReg_next = 1'b0;
            end
          end
        3'b001 :
          begin
            // WAIT   = fi(1, 0, 3, 0);
            if (count == 6'b100010) begin
              readyReg_next = 1'b1;
              state_next = 3'b000;
              validOut1 = 1'b0;
            end
            else begin
              validOut1 = 1'b0;
            end
          end
        default :
          begin
            validOut1 = 1'b0;
            state_next = 3'b000;
            readyReg_next = 1'b1;
          end
      endcase
    end
    // counter logic
    if (((validIn || (count > 6'b000000)) || validOut1) || reset_1) begin
      if ((count == 6'b100010) || reset_1) begin
        count_next = 6'b000000;
      end
      else begin
        count_next = count + 6'b000001;
      end
    end
    validOut_1 = validOut1;
    readyOut_1 = readyReg;
  end

  assign adaptOut = adaptOut_1;

  assign validOut = validOut_1;

  assign readyOut = readyOut_1;

endmodule  // Input_Control

