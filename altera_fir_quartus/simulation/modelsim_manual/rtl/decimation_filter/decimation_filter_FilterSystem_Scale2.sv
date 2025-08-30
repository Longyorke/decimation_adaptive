// ------------------------------------------------------------------------- 
// High Level Design Compiler for Intel(R) FPGAs Version 18.1 (Release Build #625)
// Quartus Prime development tool and MATLAB/Simulink Interface
// 
// Legal Notice: Copyright 2018 Intel Corporation.  All rights reserved.
// Your use of  Intel Corporation's design tools,  logic functions and other
// software and  tools, and its AMPP partner logic functions, and any output
// files any  of the foregoing (including  device programming  or simulation
// files), and  any associated  documentation  or information  are expressly
// subject  to the terms and  conditions of the  Intel FPGA Software License
// Agreement, Intel MegaCore Function License Agreement, or other applicable
// license agreement,  including,  without limitation,  that your use is for
// the  sole  purpose of  programming  logic devices  manufactured by  Intel
// and  sold by Intel  or its authorized  distributors. Please refer  to the
// applicable agreement for further details.
// ---------------------------------------------------------------------------

// SystemVerilog created from decimation_filter_FilterSystem_Scale2
// SystemVerilog created on Thu Jan 23 17:48:41 2025


(* altera_attribute = "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007; -name MESSAGE_DISABLE 10958" *)
module decimation_filter_FilterSystem_Scale2 (
    input wire [0:0] xIn_v,
    input wire [7:0] xIn_c,
    input wire [36:0] xIn_0,
    input wire [0:0] gain_i,
    output wire [0:0] qOut_v,
    output wire [7:0] qOut_c,
    output wire [16:0] qOut_0,
    output wire [0:0] eOut_0,
    input wire clk,
    input wire areset
    );

    wire [0:0] GND_q;
    wire [0:0] VCC_q;
    wire [16:0] u0_lowconst_q;
    wire [16:0] u0_highconst_q;
    reg [16:0] u0_mux_q;
    reg [0:0] u0_mux_v;
    wire [14:0] u0_rnd_replace_constant_q;
    reg [0:0] redist0_xIn_v_1_q;
    reg [7:0] redist1_xIn_c_1_q;
    wire [36:0] u0_shiftsel_q;
    wire [36:0] u0_shiftsel_qint;
    wire [14:0] u0_rnd_replace_round_select_in;
    wire [14:0] u0_rnd_replace_round_select_b;
    wire [21:0] u0_rnd_replace_keep_select_b;
    wire [15:0] u0_rnd_replace_hi_select_in;
    wire [0:0] u0_rnd_replace_hi_select_b;
    wire [14:0] u0_rnd_replace_lo_select_in;
    wire [0:0] u0_rnd_replace_lo_select_b;
    wire [0:0] u0_rnd_replace_comp_q;
    wire [0:0] u0_rnd_replace_mux_s;
    reg [0:0] u0_rnd_replace_mux_q;
    wire [23:0] u0_rnd_replace_add_a;
    wire [23:0] u0_rnd_replace_add_b;
    logic [23:0] u0_rnd_replace_add_o;
    wire [22:0] u0_rnd_replace_add_q;
    wire [24:0] u0_low_a;
    wire [24:0] u0_low_b;
    logic [24:0] u0_low_o;
    wire [0:0] u0_low_c;
    wire [24:0] u0_high_a;
    wire [24:0] u0_high_b;
    logic [24:0] u0_high_o;
    wire [0:0] u0_high_c;


    // u0_shiftsel(BITSHIFT,4)@0
    assign u0_shiftsel_qint = xIn_0;
    assign u0_shiftsel_q = u0_shiftsel_qint[36:0];

    // u0_rnd_replace_hi_select(BITSELECT,16)@0
    assign u0_rnd_replace_hi_select_in = u0_shiftsel_q[15:0];
    assign u0_rnd_replace_hi_select_b = u0_rnd_replace_hi_select_in[15:15];

    // u0_rnd_replace_lo_select(BITSELECT,17)@0
    assign u0_rnd_replace_lo_select_in = u0_shiftsel_q[14:0];
    assign u0_rnd_replace_lo_select_b = u0_rnd_replace_lo_select_in[14:14];

    // u0_rnd_replace_constant(CONSTANT,12)
    assign u0_rnd_replace_constant_q = 15'b100000000000000;

    // u0_rnd_replace_round_select(BITSELECT,13)@0
    assign u0_rnd_replace_round_select_in = u0_shiftsel_q[14:0];
    assign u0_rnd_replace_round_select_b = u0_rnd_replace_round_select_in[14:0];

    // u0_rnd_replace_comp(LOGICAL,15)@0
    assign u0_rnd_replace_comp_q = u0_rnd_replace_round_select_b == u0_rnd_replace_constant_q ? 1'b1 : 1'b0;

    // u0_rnd_replace_mux(MUX,18)@0
    assign u0_rnd_replace_mux_s = u0_rnd_replace_comp_q;
    always @(u0_rnd_replace_mux_s or u0_rnd_replace_lo_select_b or u0_rnd_replace_hi_select_b)
    begin
        unique case (u0_rnd_replace_mux_s)
            1'b0 : u0_rnd_replace_mux_q = u0_rnd_replace_lo_select_b;
            1'b1 : u0_rnd_replace_mux_q = u0_rnd_replace_hi_select_b;
            default : u0_rnd_replace_mux_q = 1'b0;
        endcase
    end

    // u0_rnd_replace_keep_select(BITSELECT,14)@0
    assign u0_rnd_replace_keep_select_b = u0_shiftsel_q[36:15];

    // u0_rnd_replace_add(ADD,19)@0
    assign u0_rnd_replace_add_a = {{2{u0_rnd_replace_keep_select_b[21]}}, u0_rnd_replace_keep_select_b};
    assign u0_rnd_replace_add_b = {23'b00000000000000000000000, u0_rnd_replace_mux_q};
    assign u0_rnd_replace_add_o = $signed(u0_rnd_replace_add_a) + $signed(u0_rnd_replace_add_b);
    assign u0_rnd_replace_add_q = u0_rnd_replace_add_o[22:0];

    // u0_highconst(CONSTANT,7)
    assign u0_highconst_q = 17'b01111111111111111;

    // GND(CONSTANT,0)
    assign GND_q = 1'b0;

    // u0_high(COMPARE,9)@0
    assign u0_high_a = {{8{u0_highconst_q[16]}}, u0_highconst_q};
    assign u0_high_b = {{2{u0_rnd_replace_add_q[22]}}, u0_rnd_replace_add_q};
    assign u0_high_o = $signed(u0_high_a) - $signed(u0_high_b);
    assign u0_high_c[0] = u0_high_o[24];

    // u0_lowconst(CONSTANT,6)
    assign u0_lowconst_q = 17'b10000000000000001;

    // u0_low(COMPARE,8)@0
    assign u0_low_a = {{2{u0_rnd_replace_add_q[22]}}, u0_rnd_replace_add_q};
    assign u0_low_b = {{8{u0_lowconst_q[16]}}, u0_lowconst_q};
    assign u0_low_o = $signed(u0_low_a) - $signed(u0_low_b);
    assign u0_low_c[0] = u0_low_o[24];

    // VCC(CONSTANT,1)
    assign VCC_q = 1'b1;

    // u0_mux(SELECTOR,10)@0 + 1
    always @ (posedge clk or posedge areset)
    begin
        if (areset)
        begin
            u0_mux_q <= 17'b0;
            u0_mux_v <= 1'b0;
        end
        else
        begin
            u0_mux_q <= u0_rnd_replace_add_q[16:0];
            u0_mux_v <= 1'b0;
            if (u0_high_c == 1'b1)
            begin
                u0_mux_q <= u0_highconst_q;
                u0_mux_v <= 1'b1;
            end
            if (u0_low_c == 1'b1)
            begin
                u0_mux_q <= u0_lowconst_q;
                u0_mux_v <= 1'b1;
            end
        end
    end

    // redist1_xIn_c_1(DELAY,21)
    dspba_delay_ver #( .width(8), .depth(1), .reset_kind("ASYNC") )
    redist1_xIn_c_1 ( .xin(xIn_c), .xout(redist1_xIn_c_1_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // redist0_xIn_v_1(DELAY,20)
    dspba_delay_ver #( .width(1), .depth(1), .reset_kind("ASYNC") )
    redist0_xIn_v_1 ( .xin(xIn_v), .xout(redist0_xIn_v_1_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // qOut(PORTOUT,11)@1 + 1
    assign qOut_v = redist0_xIn_v_1_q;
    assign qOut_c = redist1_xIn_c_1_q;
    assign qOut_0 = u0_mux_q;
    assign eOut_0 = u0_mux_v;

endmodule
