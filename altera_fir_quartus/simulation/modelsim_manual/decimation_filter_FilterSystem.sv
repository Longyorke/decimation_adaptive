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

// SystemVerilog created from decimation_filter_FilterSystem
// SystemVerilog created on Thu Jan 23 17:48:41 2025


(* altera_attribute = "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007; -name MESSAGE_DISABLE 10958" *)
module decimation_filter_FilterSystem (
    input wire [15:0] busIn_writedata,
    input wire [10:0] busIn_address,
    input wire [0:0] busIn_write,
    input wire [0:0] busIn_read,
    output wire [0:0] busOut_readdatavalid,
    output wire [15:0] busOut_readdata,
    output wire [0:0] busOut_waitrequest,
    input wire [16:0] a,
    input wire [0:0] av,
    input wire [7:0] ac,
    output wire [16:0] q,
    output wire [0:0] qv,
    output wire [7:0] qc,
    input wire clk,
    input wire areset,
    input wire h_areset
    );

    wire [0:0] GND_q;
    wire [0:0] VCC_q;
    wire [15:0] DecimatingFIR1_busOut_readdata;
    wire [0:0] DecimatingFIR1_busOut_readdatavalid;
    wire [36:0] DecimatingFIR1_xOut_0;
    wire [0:0] DecimatingFIR1_xOut_v;
    wire [7:0] DecimatingFIR1_xOut_c;
    wire [15:0] DecimatingFIR2_busOut_readdata;
    wire [0:0] DecimatingFIR2_busOut_readdatavalid;
    wire [37:0] DecimatingFIR2_xOut_0;
    wire [0:0] DecimatingFIR2_xOut_v;
    wire [7:0] DecimatingFIR2_xOut_c;
    wire [16:0] Scale2_qOut_0;
    wire [0:0] Scale2_qOut_v;
    wire [7:0] Scale2_qOut_c;
    wire [16:0] Scale3_qOut_0;
    wire [0:0] Scale3_qOut_v;
    wire [7:0] Scale3_qOut_c;
    reg [15:0] bus_selector_q;
    reg [0:0] bus_selector_v;
    reg [0:0] decimation_filter_FilterSystem_readDelayed_q;
    wire [0:0] decimation_filter_FilterSystem_readDataValid_q;


    // GND(CONSTANT,0)
    assign GND_q = 1'b0;

    // Scale2(BLACKBOX,10)
    decimation_filter_FilterSystem_Scale2 theScale2 (
        .xIn_0(DecimatingFIR1_xOut_0),
        .xIn_v(DecimatingFIR1_xOut_v),
        .xIn_c(DecimatingFIR1_xOut_c),
        .gain_i(GND_q),
        .qOut_0(Scale2_qOut_0),
        .qOut_v(Scale2_qOut_v),
        .qOut_c(Scale2_qOut_c),
        .eOut_0(),
        .clk(clk),
        .areset(areset)
    );

    // DecimatingFIR2(BLACKBOX,9)
    decimation_filter_FilterSystem_DecimatingFIR2 theDecimatingFIR2 (
        .busIn_writedata(busIn_writedata),
        .busIn_address(busIn_address),
        .busIn_write(busIn_write),
        .busIn_read(busIn_read),
        .xIn_0(Scale2_qOut_0),
        .xIn_v(Scale2_qOut_v),
        .xIn_c(Scale2_qOut_c),
        .busOut_readdata(DecimatingFIR2_busOut_readdata),
        .busOut_readdatavalid(DecimatingFIR2_busOut_readdatavalid),
        .xOut_0(DecimatingFIR2_xOut_0),
        .xOut_v(DecimatingFIR2_xOut_v),
        .xOut_c(DecimatingFIR2_xOut_c),
        .clk(clk),
        .areset(areset),
        .h_areset(h_areset)
    );

    // DecimatingFIR1(BLACKBOX,8)
    decimation_filter_FilterSystem_DecimatingFIR1 theDecimatingFIR1 (
        .busIn_writedata(busIn_writedata),
        .busIn_address(busIn_address),
        .busIn_write(busIn_write),
        .busIn_read(busIn_read),
        .xIn_0(a),
        .xIn_v(av),
        .xIn_c(ac),
        .busOut_readdata(DecimatingFIR1_busOut_readdata),
        .busOut_readdatavalid(DecimatingFIR1_busOut_readdatavalid),
        .xOut_0(DecimatingFIR1_xOut_0),
        .xOut_v(DecimatingFIR1_xOut_v),
        .xOut_c(DecimatingFIR1_xOut_c),
        .clk(clk),
        .areset(areset),
        .h_areset(h_areset)
    );

    // bus_selector(SELECTOR,14)
    always @ (posedge clk or posedge h_areset)
    begin
        if (h_areset)
        begin
            bus_selector_q <= 16'b0;
            bus_selector_v <= 1'b0;
        end
        else
        begin
            bus_selector_q <= {15'b000000000000000, GND_q};
            bus_selector_v <= 1'b0;
            if (DecimatingFIR2_busOut_readdatavalid == 1'b1)
            begin
                bus_selector_q <= DecimatingFIR2_busOut_readdata;
                bus_selector_v <= 1'b1;
            end
            if (DecimatingFIR1_busOut_readdatavalid == 1'b1)
            begin
                bus_selector_q <= DecimatingFIR1_busOut_readdata;
                bus_selector_v <= 1'b1;
            end
        end
    end

    // decimation_filter_FilterSystem_readDelayed(DELAY,31)
    dspba_delay_ver #( .width(1), .depth(4), .reset_kind("ASYNC") )
    decimation_filter_FilterSystem_readDelayed ( .xin(busIn_read), .xout(decimation_filter_FilterSystem_readDelayed_q), .clk(clk), .aclr(h_areset), .ena(1'b1) );

    // VCC(CONSTANT,1)
    assign VCC_q = 1'b1;

    // decimation_filter_FilterSystem_readDataValid(LOGICAL,32)
    assign decimation_filter_FilterSystem_readDataValid_q = bus_selector_v | decimation_filter_FilterSystem_readDelayed_q;

    // busOut(BUSOUT,13)
    assign busOut_readdatavalid = decimation_filter_FilterSystem_readDataValid_q;
    assign busOut_readdata = bus_selector_q;
    assign busOut_waitrequest = GND_q;

    // Scale3(BLACKBOX,11)
    decimation_filter_FilterSystem_Scale3 theScale3 (
        .xIn_0(DecimatingFIR2_xOut_0),
        .xIn_v(DecimatingFIR2_xOut_v),
        .xIn_c(DecimatingFIR2_xOut_c),
        .gain_i(GND_q),
        .qOut_0(Scale3_qOut_0),
        .qOut_v(Scale3_qOut_v),
        .qOut_c(Scale3_qOut_c),
        .eOut_0(),
        .clk(clk),
        .areset(areset)
    );

    // q(GPOUT,19)
    assign q = Scale3_qOut_0;

    // qv(GPOUT,20)
    assign qv = Scale3_qOut_v;

    // qc(GPOUT,21)
    assign qc = Scale3_qOut_c;

endmodule
