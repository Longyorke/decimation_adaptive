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

// SystemVerilog created from decimation_filter_FilterSystem_DecimatingFIR2
// SystemVerilog created on Sun Feb 23 15:26:34 2025


(* altera_attribute = "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007; -name MESSAGE_DISABLE 10958" *)
module decimation_filter_FilterSystem_DecimatingFIR2 (
    input wire [0:0] xIn_v,
    input wire [7:0] xIn_c,
    input wire [16:0] xIn_0,
    input wire [15:0] busIn_writedata,
    input wire [10:0] busIn_address,
    input wire [0:0] busIn_write,
    input wire [0:0] busIn_read,
    output wire [0:0] busOut_readdatavalid,
    output wire [15:0] busOut_readdata,
    output wire [0:0] xOut_v,
    output wire [7:0] xOut_c,
    output wire [37:0] xOut_0,
    input wire clk,
    input wire areset,
    input wire h_areset
    );

    wire [0:0] GND_q;
    wire [0:0] VCC_q;
    reg [16:0] d_xIn_0_13_q;
    reg [0:0] d_busIn_read_12_q;
    reg [15:0] d_busIn_writedata_11_q;
    reg [3:0] rblookup_q;
    reg [0:0] rblookup_h;
    reg [0:0] rblookup_e;
    wire [0:0] rblookup_c;
    reg [0:0] d_rblookup_h_12_q;
    reg [0:0] rblookup_valid_q;
    wire rm_reset0;
    wire [15:0] rm_ia;
    wire [3:0] rm_aa;
    wire [3:0] rm_ab;
    wire [15:0] rm_iq;
    wire [15:0] rm_q;
    reg [0:0] d_in0_m0_wi0_wo0_assign_id1_q_13_q;
    reg [3:0] u0_m0_wo0_run_count;
    wire [0:0] u0_m0_wo0_run_preEnaQ;
    reg [0:0] u0_m0_wo0_run_q;
    wire [0:0] u0_m0_wo0_run_out;
    reg [0:0] u0_m0_wo0_run_enableQ;
    wire [2:0] u0_m0_wo0_run_ctrl;
    reg [0:0] u0_m0_wo0_memread_q;
    reg [0:0] d_u0_m0_wo0_memread_q_13_q;
    reg [0:0] u0_m0_wo0_compute_q;
    reg [0:0] d_u0_m0_wo0_compute_q_13_q;
    reg [0:0] d_u0_m0_wo0_compute_q_17_q;
    reg [0:0] d_u0_m0_wo0_compute_q_18_q;
    wire [2:0] u0_m0_wo0_wi0_r0_ra0_count0_q;
    (* preserve *) reg [2:0] u0_m0_wo0_wi0_r0_ra0_count0_i;
    reg [3:0] u0_m0_wo0_wi0_r0_ra4_count0_lutreg_q;
    wire [3:0] u0_m0_wo0_wi0_r0_ra4_count0_q;
    (* preserve *) reg [3:0] u0_m0_wo0_wi0_r0_ra4_count0_i;
    wire [2:0] u0_m0_wo0_wi0_r0_wa0_q;
    (* preserve *) reg [2:0] u0_m0_wo0_wi0_r0_wa0_i;
    wire [3:0] u0_m0_wo0_wi0_r0_wa4_q;
    (* preserve *) reg [3:0] u0_m0_wo0_wi0_r0_wa4_i;
    wire u0_m0_wo0_wi0_r0_memr0_reset0;
    wire [16:0] u0_m0_wo0_wi0_r0_memr0_ia;
    wire [2:0] u0_m0_wo0_wi0_r0_memr0_aa;
    wire [2:0] u0_m0_wo0_wi0_r0_memr0_ab;
    wire [16:0] u0_m0_wo0_wi0_r0_memr0_iq;
    wire [16:0] u0_m0_wo0_wi0_r0_memr0_q;
    wire u0_m0_wo0_wi0_r0_memr4_reset0;
    wire [16:0] u0_m0_wo0_wi0_r0_memr4_ia;
    wire [3:0] u0_m0_wo0_wi0_r0_memr4_aa;
    wire [3:0] u0_m0_wo0_wi0_r0_memr4_ab;
    wire [16:0] u0_m0_wo0_wi0_r0_memr4_iq;
    wire [16:0] u0_m0_wo0_wi0_r0_memr4_q;
    reg [16:0] u0_m0_wo0_wi0_r0_delayr1_q;
    reg [16:0] u0_m0_wo0_wi0_r0_delayr2_q;
    reg [16:0] u0_m0_wo0_wi0_r0_delayr3_q;
    reg [16:0] u0_m0_wo0_wi0_r0_delayr5_q;
    reg [16:0] u0_m0_wo0_wi0_r0_delayr6_q;
    reg [16:0] u0_m0_wo0_wi0_r0_delayr7_q;
    wire [1:0] u0_m0_wo0_ca3_q;
    (* preserve *) reg [1:0] u0_m0_wo0_ca3_i;
    reg [1:0] u0_m0_wo0_dec0_q;
    reg [0:0] u0_m0_wo0_dec0_e;
    wire [0:0] u0_m0_wo0_dec0_c;
    wire u0_m0_wo0_cm0_reset0;
    wire [15:0] u0_m0_wo0_cm0_ia;
    wire [1:0] u0_m0_wo0_cm0_aa;
    wire [1:0] u0_m0_wo0_cm0_ab;
    wire [15:0] u0_m0_wo0_cm0_iq;
    wire [15:0] u0_m0_wo0_cm0_q;
    reg [1:0] u0_m0_wo0_dec1_q;
    reg [0:0] u0_m0_wo0_dec1_e;
    wire [0:0] u0_m0_wo0_dec1_c;
    wire u0_m0_wo0_cm1_reset0;
    wire [15:0] u0_m0_wo0_cm1_ia;
    wire [1:0] u0_m0_wo0_cm1_aa;
    wire [1:0] u0_m0_wo0_cm1_ab;
    wire [15:0] u0_m0_wo0_cm1_iq;
    wire [15:0] u0_m0_wo0_cm1_q;
    reg [1:0] u0_m0_wo0_dec2_q;
    reg [0:0] u0_m0_wo0_dec2_e;
    wire [0:0] u0_m0_wo0_dec2_c;
    wire u0_m0_wo0_cm2_reset0;
    wire [15:0] u0_m0_wo0_cm2_ia;
    wire [1:0] u0_m0_wo0_cm2_aa;
    wire [1:0] u0_m0_wo0_cm2_ab;
    wire [15:0] u0_m0_wo0_cm2_iq;
    wire [15:0] u0_m0_wo0_cm2_q;
    reg [1:0] u0_m0_wo0_dec3_q;
    reg [0:0] u0_m0_wo0_dec3_e;
    wire [0:0] u0_m0_wo0_dec3_c;
    wire u0_m0_wo0_cm3_reset0;
    wire [15:0] u0_m0_wo0_cm3_ia;
    wire [1:0] u0_m0_wo0_cm3_aa;
    wire [1:0] u0_m0_wo0_cm3_ab;
    wire [15:0] u0_m0_wo0_cm3_iq;
    wire [15:0] u0_m0_wo0_cm3_q;
    wire [17:0] u0_m0_wo0_sym_add0_a;
    wire [17:0] u0_m0_wo0_sym_add0_b;
    logic [17:0] u0_m0_wo0_sym_add0_o;
    wire [17:0] u0_m0_wo0_sym_add0_q;
    wire [17:0] u0_m0_wo0_sym_add1_a;
    wire [17:0] u0_m0_wo0_sym_add1_b;
    logic [17:0] u0_m0_wo0_sym_add1_o;
    wire [17:0] u0_m0_wo0_sym_add1_q;
    wire [17:0] u0_m0_wo0_sym_add2_a;
    wire [17:0] u0_m0_wo0_sym_add2_b;
    logic [17:0] u0_m0_wo0_sym_add2_o;
    wire [17:0] u0_m0_wo0_sym_add2_q;
    reg [0:0] u0_m0_wo0_symSuppress_3_seq_q;
    reg u0_m0_wo0_symSuppress_3_seq_eq;
    wire [17:0] u0_m0_wo0_sym_add3_a;
    wire [17:0] u0_m0_wo0_sym_add3_b;
    wire [17:0] u0_m0_wo0_sym_add3_i;
    logic [17:0] u0_m0_wo0_sym_add3_o;
    wire [17:0] u0_m0_wo0_sym_add3_q;
    wire [15:0] u0_m0_wo0_mtree_mult1_3_a0;
    wire [17:0] u0_m0_wo0_mtree_mult1_3_b0;
    wire [33:0] u0_m0_wo0_mtree_mult1_3_s1;
    wire u0_m0_wo0_mtree_mult1_3_reset;
    reg [33:0] u0_m0_wo0_mtree_mult1_3_q;
    wire [15:0] u0_m0_wo0_mtree_mult1_2_a0;
    wire [17:0] u0_m0_wo0_mtree_mult1_2_b0;
    wire [33:0] u0_m0_wo0_mtree_mult1_2_s1;
    wire u0_m0_wo0_mtree_mult1_2_reset;
    reg [33:0] u0_m0_wo0_mtree_mult1_2_q;
    wire [15:0] u0_m0_wo0_mtree_mult1_1_a0;
    wire [17:0] u0_m0_wo0_mtree_mult1_1_b0;
    wire [33:0] u0_m0_wo0_mtree_mult1_1_s1;
    wire u0_m0_wo0_mtree_mult1_1_reset;
    reg [33:0] u0_m0_wo0_mtree_mult1_1_q;
    wire [15:0] u0_m0_wo0_mtree_mult1_0_a0;
    wire [17:0] u0_m0_wo0_mtree_mult1_0_b0;
    wire [33:0] u0_m0_wo0_mtree_mult1_0_s1;
    wire u0_m0_wo0_mtree_mult1_0_reset;
    reg [33:0] u0_m0_wo0_mtree_mult1_0_q;
    wire [34:0] u0_m0_wo0_mtree_add0_0_a;
    wire [34:0] u0_m0_wo0_mtree_add0_0_b;
    logic [34:0] u0_m0_wo0_mtree_add0_0_o;
    wire [34:0] u0_m0_wo0_mtree_add0_0_q;
    wire [34:0] u0_m0_wo0_mtree_add0_1_a;
    wire [34:0] u0_m0_wo0_mtree_add0_1_b;
    logic [34:0] u0_m0_wo0_mtree_add0_1_o;
    wire [34:0] u0_m0_wo0_mtree_add0_1_q;
    wire [35:0] u0_m0_wo0_mtree_add1_0_a;
    wire [35:0] u0_m0_wo0_mtree_add1_0_b;
    logic [35:0] u0_m0_wo0_mtree_add1_0_o;
    wire [35:0] u0_m0_wo0_mtree_add1_0_q;
    reg [0:0] u0_m0_wo0_aseq_q;
    reg u0_m0_wo0_aseq_eq;
    wire [37:0] u0_m0_wo0_accum_a;
    wire [37:0] u0_m0_wo0_accum_b;
    wire [37:0] u0_m0_wo0_accum_i;
    logic [37:0] u0_m0_wo0_accum_o;
    wire [37:0] u0_m0_wo0_accum_q;
    reg [0:0] u0_m0_wo0_oseq_q;
    reg u0_m0_wo0_oseq_eq;
    reg [0:0] u0_m0_wo0_oseq_gated_reg_q;
    wire [0:0] rblookup_read_hit_q;
    wire [0:0] u0_m0_wo0_oseq_gated_q;
    reg [3:0] u0_m0_wo0_wi0_r0_ra4_count0_lut_q;


    // d_busIn_writedata_11(DELAY,78)@10 + 1
    dspba_delay_ver #( .width(16), .depth(1), .reset_kind("ASYNC") )
    d_busIn_writedata_11 ( .xin(busIn_writedata), .xout(d_busIn_writedata_11_q), .clk(clk), .aclr(h_areset), .ena(1'b1) );

    // rblookup(LOOKUP,4)@10 + 1
    assign rblookup_c = busIn_write;
    always @ (posedge clk or posedge h_areset)
    begin
        if (h_areset)
        begin
            rblookup_q <= 4'b0000;
            rblookup_h <= 1'b0;
            rblookup_e <= 1'b0;
        end
        else
        begin
            unique case (busIn_address)
                11'b00000000110 : begin
                                      rblookup_q <= 4'b0000;
                                      rblookup_h <= 1'b1;
                                      rblookup_e <= rblookup_c;
                                  end
                11'b00000000111 : begin
                                      rblookup_q <= 4'b0001;
                                      rblookup_h <= 1'b1;
                                      rblookup_e <= rblookup_c;
                                  end
                11'b00000001000 : begin
                                      rblookup_q <= 4'b0010;
                                      rblookup_h <= 1'b1;
                                      rblookup_e <= rblookup_c;
                                  end
                11'b00000001001 : begin
                                      rblookup_q <= 4'b0011;
                                      rblookup_h <= 1'b1;
                                      rblookup_e <= rblookup_c;
                                  end
                11'b00000001010 : begin
                                      rblookup_q <= 4'b0100;
                                      rblookup_h <= 1'b1;
                                      rblookup_e <= rblookup_c;
                                  end
                11'b00000001011 : begin
                                      rblookup_q <= 4'b0101;
                                      rblookup_h <= 1'b1;
                                      rblookup_e <= rblookup_c;
                                  end
                11'b00000001100 : begin
                                      rblookup_q <= 4'b0110;
                                      rblookup_h <= 1'b1;
                                      rblookup_e <= rblookup_c;
                                  end
                11'b00000001101 : begin
                                      rblookup_q <= 4'b0111;
                                      rblookup_h <= 1'b1;
                                      rblookup_e <= rblookup_c;
                                  end
                11'b00000001110 : begin
                                      rblookup_q <= 4'b1000;
                                      rblookup_h <= 1'b1;
                                      rblookup_e <= rblookup_c;
                                  end
                11'b00000001111 : begin
                                      rblookup_q <= 4'b1001;
                                      rblookup_h <= 1'b1;
                                      rblookup_e <= rblookup_c;
                                  end
                11'b00000010000 : begin
                                      rblookup_q <= 4'b1010;
                                      rblookup_h <= 1'b1;
                                      rblookup_e <= rblookup_c;
                                  end
                11'b00000010001 : begin
                                      rblookup_q <= 4'b1011;
                                      rblookup_h <= 1'b1;
                                      rblookup_e <= rblookup_c;
                                  end
                11'b00000010010 : begin
                                      rblookup_q <= 4'b1100;
                                      rblookup_h <= 1'b1;
                                      rblookup_e <= rblookup_c;
                                  end
                11'b00000010011 : begin
                                      rblookup_q <= 4'b1101;
                                      rblookup_h <= 1'b1;
                                      rblookup_e <= rblookup_c;
                                  end
                default : begin
                              rblookup_q <= 4'b0000;
                              rblookup_h <= 1'b0;
                              rblookup_e <= 1'b0;
                          end
            endcase
        end
    end

    // rm(DUALMEM,7)@11 + 2
    assign rm_ia = d_busIn_writedata_11_q;
    assign rm_aa = rblookup_q;
    altsyncram #(
        .ram_block_type("M9K"),
        .operation_mode("SINGLE_PORT"),
        .width_a(16),
        .widthad_a(4),
        .numwords_a(14),
        .lpm_type("altsyncram"),
        .width_byteena_a(1),
        .outdata_reg_a("CLOCK0"),
        .outdata_aclr_a("NONE"),
        .clock_enable_input_a("NORMAL"),
        .read_during_write_mode_port_a("NEW_DATA_NO_NBE_READ"),
        .power_up_uninitialized("TRUE"),
        .intended_device_family("MAX 10")
    ) rm_dmem (
        .clocken0(1'b1),
        .clock0(clk),
        .address_a(rm_aa),
        .data_a(rm_ia),
        .wren_a(rblookup_e[0]),
        .q_a(rm_iq),
        .wren_b(),
        .rden_a(),
        .rden_b(),
        .data_b(),
        .address_b(),
        .clock1(),
        .clocken1(),
        .clocken2(),
        .clocken3(),
        .aclr0(),
        .aclr1(),
        .byteena_a(),
        .byteena_b(),
        .addressstall_a(),
        .addressstall_b(),
        .q_b(),
        .eccstatus()
    );
    assign rm_q = rm_iq[15:0];

    // VCC(CONSTANT,1)@0
    assign VCC_q = 1'b1;

    // d_busIn_read_12(DELAY,79)@10 + 2
    dspba_delay_ver #( .width(1), .depth(2), .reset_kind("ASYNC") )
    d_busIn_read_12 ( .xin(busIn_read), .xout(d_busIn_read_12_q), .clk(clk), .aclr(h_areset), .ena(1'b1) );

    // d_rblookup_h_12(DELAY,80)@11 + 1
    dspba_delay_ver #( .width(1), .depth(1), .reset_kind("ASYNC") )
    d_rblookup_h_12 ( .xin(rblookup_h), .xout(d_rblookup_h_12_q), .clk(clk), .aclr(h_areset), .ena(1'b1) );

    // rblookup_read_hit(LOGICAL,5)@12
    assign rblookup_read_hit_q = d_rblookup_h_12_q & d_busIn_read_12_q;

    // rblookup_valid(REG,6)@12 + 1
    always @ (posedge clk or posedge h_areset)
    begin
        if (h_areset)
        begin
            rblookup_valid_q <= 1'b0;
        end
        else
        begin
            rblookup_valid_q <= rblookup_read_hit_q;
        end
    end

    // busOut(BUSOUT,8)@13
    assign busOut_readdatavalid = rblookup_valid_q;
    assign busOut_readdata = rm_q;

    // u0_m0_wo0_run(ENABLEGENERATOR,19)@10 + 2
    assign u0_m0_wo0_run_ctrl = { u0_m0_wo0_run_out, xIn_v, u0_m0_wo0_run_enableQ };
    always @ (posedge clk or posedge areset)
    begin
        reg [2:0] u0_m0_wo0_run_enable_c;
        reg [3:0] u0_m0_wo0_run_inc;
        if (areset)
        begin
            u0_m0_wo0_run_q <= 1'b0;
            u0_m0_wo0_run_enable_c = 3'd2;
            u0_m0_wo0_run_enableQ <= 1'b0;
            u0_m0_wo0_run_count <= 4'b0000;
            u0_m0_wo0_run_inc = 4'b0;
        end
        else
        begin
            if (u0_m0_wo0_run_out == 1'b1)
            begin
                if (u0_m0_wo0_run_enable_c[2] == 1'b1)
                begin
                    u0_m0_wo0_run_enable_c = $signed(u0_m0_wo0_run_enable_c) - $signed(-3'd3);
                end
                else
                begin
                    u0_m0_wo0_run_enable_c = $signed(u0_m0_wo0_run_enable_c) + $signed(-3'd1);
                end
                u0_m0_wo0_run_enableQ <= u0_m0_wo0_run_enable_c[2:2];
            end
            else
            begin
                u0_m0_wo0_run_enableQ <= 1'b0;
            end
            unique case (u0_m0_wo0_run_ctrl)
                3'b000, 3'b001 : u0_m0_wo0_run_inc = 4'b0000;
                3'b010, 3'b011 : u0_m0_wo0_run_inc = 4'b1111;
                3'b100 : u0_m0_wo0_run_inc = 4'b0000;
                3'b101 : u0_m0_wo0_run_inc = 4'b0100;
                3'b110 : u0_m0_wo0_run_inc = 4'b1111;
                3'b111 : u0_m0_wo0_run_inc = 4'b0011;
                default : ;
            endcase
            u0_m0_wo0_run_count <= $signed(u0_m0_wo0_run_count) + $signed(u0_m0_wo0_run_inc);
            u0_m0_wo0_run_q <= u0_m0_wo0_run_out;
        end
    end
    assign u0_m0_wo0_run_preEnaQ = u0_m0_wo0_run_count[3:3];
    assign u0_m0_wo0_run_out = u0_m0_wo0_run_preEnaQ & VCC_q;

    // u0_m0_wo0_memread(DELAY,20)@12
    dspba_delay_ver #( .width(1), .depth(1), .reset_kind("ASYNC") )
    u0_m0_wo0_memread ( .xin(u0_m0_wo0_run_q), .xout(u0_m0_wo0_memread_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // u0_m0_wo0_compute(DELAY,22)@12
    dspba_delay_ver #( .width(1), .depth(2), .reset_kind("ASYNC") )
    u0_m0_wo0_compute ( .xin(u0_m0_wo0_memread_q), .xout(u0_m0_wo0_compute_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // d_u0_m0_wo0_compute_q_13(DELAY,83)@12 + 1
    dspba_delay_ver #( .width(1), .depth(1), .reset_kind("ASYNC") )
    d_u0_m0_wo0_compute_q_13 ( .xin(u0_m0_wo0_compute_q), .xout(d_u0_m0_wo0_compute_q_13_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // d_u0_m0_wo0_compute_q_17(DELAY,84)@13 + 4
    dspba_delay_ver #( .width(1), .depth(4), .reset_kind("ASYNC") )
    d_u0_m0_wo0_compute_q_17 ( .xin(d_u0_m0_wo0_compute_q_13_q), .xout(d_u0_m0_wo0_compute_q_17_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // u0_m0_wo0_aseq(SEQUENCE,67)@17 + 1
    always @ (posedge clk or posedge areset)
    begin
        reg [4:0] u0_m0_wo0_aseq_c;
        if (areset)
        begin
            u0_m0_wo0_aseq_c = 5'b00000;
            u0_m0_wo0_aseq_q <= 1'b0;
            u0_m0_wo0_aseq_eq <= 1'b0;
        end
        else
        begin
            if (d_u0_m0_wo0_compute_q_17_q == 1'b1)
            begin
                if (u0_m0_wo0_aseq_c == 5'b00000)
                begin
                    u0_m0_wo0_aseq_eq <= 1'b1;
                end
                else
                begin
                    u0_m0_wo0_aseq_eq <= 1'b0;
                end
                if (u0_m0_wo0_aseq_eq == 1'b1)
                begin
                    u0_m0_wo0_aseq_c = $signed(u0_m0_wo0_aseq_c) + $signed(5'd3);
                end
                else
                begin
                    u0_m0_wo0_aseq_c = $signed(u0_m0_wo0_aseq_c) - $signed(5'd1);
                end
                u0_m0_wo0_aseq_q <= u0_m0_wo0_aseq_c[4:4];
            end
        end
    end

    // d_u0_m0_wo0_compute_q_18(DELAY,85)@17 + 1
    dspba_delay_ver #( .width(1), .depth(1), .reset_kind("ASYNC") )
    d_u0_m0_wo0_compute_q_18 ( .xin(d_u0_m0_wo0_compute_q_17_q), .xout(d_u0_m0_wo0_compute_q_18_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // d_u0_m0_wo0_memread_q_13(DELAY,82)@12 + 1
    dspba_delay_ver #( .width(1), .depth(1), .reset_kind("ASYNC") )
    d_u0_m0_wo0_memread_q_13 ( .xin(u0_m0_wo0_memread_q), .xout(d_u0_m0_wo0_memread_q_13_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // u0_m0_wo0_wi0_r0_ra4_count0(COUNTER,28)@13
    // low=0, high=15, step=1, init=1
    always @ (posedge clk or posedge areset)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_ra4_count0_i <= 4'd1;
        end
        else if (d_u0_m0_wo0_memread_q_13_q == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_ra4_count0_i <= $unsigned(u0_m0_wo0_wi0_r0_ra4_count0_i) + $unsigned(4'd1);
        end
    end
    assign u0_m0_wo0_wi0_r0_ra4_count0_q = u0_m0_wo0_wi0_r0_ra4_count0_i[3:0];

    // u0_m0_wo0_wi0_r0_ra4_count0_lut(LOOKUP,26)@13
    always @(u0_m0_wo0_wi0_r0_ra4_count0_q)
    begin
        // Begin reserved scope level
        unique case (u0_m0_wo0_wi0_r0_ra4_count0_q)
            4'b0000 : u0_m0_wo0_wi0_r0_ra4_count0_lut_q = 4'b0101;
            4'b0001 : u0_m0_wo0_wi0_r0_ra4_count0_lut_q = 4'b0100;
            4'b0010 : u0_m0_wo0_wi0_r0_ra4_count0_lut_q = 4'b0011;
            4'b0011 : u0_m0_wo0_wi0_r0_ra4_count0_lut_q = 4'b0010;
            4'b0100 : u0_m0_wo0_wi0_r0_ra4_count0_lut_q = 4'b1001;
            4'b0101 : u0_m0_wo0_wi0_r0_ra4_count0_lut_q = 4'b1000;
            4'b0110 : u0_m0_wo0_wi0_r0_ra4_count0_lut_q = 4'b0111;
            4'b0111 : u0_m0_wo0_wi0_r0_ra4_count0_lut_q = 4'b0110;
            4'b1000 : u0_m0_wo0_wi0_r0_ra4_count0_lut_q = 4'b1101;
            4'b1001 : u0_m0_wo0_wi0_r0_ra4_count0_lut_q = 4'b1100;
            4'b1010 : u0_m0_wo0_wi0_r0_ra4_count0_lut_q = 4'b1011;
            4'b1011 : u0_m0_wo0_wi0_r0_ra4_count0_lut_q = 4'b1010;
            4'b1100 : u0_m0_wo0_wi0_r0_ra4_count0_lut_q = 4'b0001;
            4'b1101 : u0_m0_wo0_wi0_r0_ra4_count0_lut_q = 4'b0000;
            4'b1110 : u0_m0_wo0_wi0_r0_ra4_count0_lut_q = 4'b1111;
            4'b1111 : u0_m0_wo0_wi0_r0_ra4_count0_lut_q = 4'b1110;
            default : begin
                          // unreachable
                          u0_m0_wo0_wi0_r0_ra4_count0_lut_q = 4'bxxxx;
                      end
        endcase
        // End reserved scope level
    end

    // u0_m0_wo0_wi0_r0_ra4_count0_lutreg(REG,27)@13
    always @ (posedge clk or posedge areset)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_ra4_count0_lutreg_q <= 4'b0101;
        end
        else if (d_u0_m0_wo0_memread_q_13_q == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_ra4_count0_lutreg_q <= u0_m0_wo0_wi0_r0_ra4_count0_lut_q;
        end
    end

    // u0_m0_wo0_wi0_r0_delayr1(DELAY,33)@13
    dspba_delay_ver #( .width(17), .depth(4), .reset_kind("ASYNC") )
    u0_m0_wo0_wi0_r0_delayr1 ( .xin(u0_m0_wo0_wi0_r0_memr0_q), .xout(u0_m0_wo0_wi0_r0_delayr1_q), .ena(d_u0_m0_wo0_compute_q_13_q[0]), .clk(clk), .aclr(areset) );

    // u0_m0_wo0_wi0_r0_wa4(COUNTER,30)@13
    // low=0, high=15, step=1, init=9
    always @ (posedge clk or posedge areset)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_wa4_i <= 4'd9;
        end
        else if (d_u0_m0_wo0_compute_q_13_q == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_wa4_i <= $unsigned(u0_m0_wo0_wi0_r0_wa4_i) + $unsigned(4'd1);
        end
    end
    assign u0_m0_wo0_wi0_r0_wa4_q = u0_m0_wo0_wi0_r0_wa4_i[3:0];

    // u0_m0_wo0_wi0_r0_memr4(DUALMEM,32)@13
    assign u0_m0_wo0_wi0_r0_memr4_ia = u0_m0_wo0_wi0_r0_delayr1_q;
    assign u0_m0_wo0_wi0_r0_memr4_aa = u0_m0_wo0_wi0_r0_wa4_q;
    assign u0_m0_wo0_wi0_r0_memr4_ab = u0_m0_wo0_wi0_r0_ra4_count0_lutreg_q;
    altsyncram #(
        .ram_block_type("M9K"),
        .operation_mode("DUAL_PORT"),
        .width_a(17),
        .widthad_a(4),
        .numwords_a(16),
        .width_b(17),
        .widthad_b(4),
        .numwords_b(16),
        .lpm_type("altsyncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK0"),
        .indata_reg_b("CLOCK0"),
        .wrcontrol_wraddress_reg_b("CLOCK0"),
        .rdcontrol_reg_b("CLOCK0"),
        .byteena_reg_b("CLOCK0"),
        .outdata_reg_b("CLOCK0"),
        .outdata_aclr_b("NONE"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file("UNUSED"),
        .intended_device_family("MAX 10")
    ) u0_m0_wo0_wi0_r0_memr4_dmem (
        .clocken0(1'b1),
        .clock0(clk),
        .address_a(u0_m0_wo0_wi0_r0_memr4_aa),
        .data_a(u0_m0_wo0_wi0_r0_memr4_ia),
        .wren_a(d_u0_m0_wo0_compute_q_13_q[0]),
        .address_b(u0_m0_wo0_wi0_r0_memr4_ab),
        .q_b(u0_m0_wo0_wi0_r0_memr4_iq),
        .wren_b(),
        .rden_a(),
        .rden_b(),
        .data_b(),
        .clock1(),
        .clocken1(),
        .clocken2(),
        .clocken3(),
        .aclr0(),
        .aclr1(),
        .byteena_a(),
        .byteena_b(),
        .addressstall_a(),
        .addressstall_b(),
        .q_a(),
        .eccstatus()
    );
    assign u0_m0_wo0_wi0_r0_memr4_q = u0_m0_wo0_wi0_r0_memr4_iq[16:0];

    // u0_m0_wo0_wi0_r0_delayr5(DELAY,36)@13
    dspba_delay_ver #( .width(17), .depth(4), .reset_kind("ASYNC") )
    u0_m0_wo0_wi0_r0_delayr5 ( .xin(u0_m0_wo0_wi0_r0_memr4_q), .xout(u0_m0_wo0_wi0_r0_delayr5_q), .ena(d_u0_m0_wo0_compute_q_13_q[0]), .clk(clk), .aclr(areset) );

    // u0_m0_wo0_wi0_r0_delayr6(DELAY,37)@13
    dspba_delay_ver #( .width(17), .depth(4), .reset_kind("ASYNC") )
    u0_m0_wo0_wi0_r0_delayr6 ( .xin(u0_m0_wo0_wi0_r0_delayr5_q), .xout(u0_m0_wo0_wi0_r0_delayr6_q), .ena(d_u0_m0_wo0_compute_q_13_q[0]), .clk(clk), .aclr(areset) );

    // u0_m0_wo0_wi0_r0_delayr7(DELAY,38)@13
    dspba_delay_ver #( .width(17), .depth(4), .reset_kind("ASYNC") )
    u0_m0_wo0_wi0_r0_delayr7 ( .xin(u0_m0_wo0_wi0_r0_delayr6_q), .xout(u0_m0_wo0_wi0_r0_delayr7_q), .ena(d_u0_m0_wo0_compute_q_13_q[0]), .clk(clk), .aclr(areset) );

    // u0_m0_wo0_wi0_r0_ra0_count0(COUNTER,25)@13
    // low=0, high=7, step=1, init=1
    always @ (posedge clk or posedge areset)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_ra0_count0_i <= 3'd1;
        end
        else if (d_u0_m0_wo0_memread_q_13_q == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_ra0_count0_i <= $unsigned(u0_m0_wo0_wi0_r0_ra0_count0_i) + $unsigned(3'd1);
        end
    end
    assign u0_m0_wo0_wi0_r0_ra0_count0_q = u0_m0_wo0_wi0_r0_ra0_count0_i[2:0];

    // d_xIn_0_13(DELAY,77)@10 + 3
    dspba_delay_ver #( .width(17), .depth(3), .reset_kind("ASYNC") )
    d_xIn_0_13 ( .xin(xIn_0), .xout(d_xIn_0_13_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // d_in0_m0_wi0_wo0_assign_id1_q_13(DELAY,81)@10 + 3
    dspba_delay_ver #( .width(1), .depth(3), .reset_kind("ASYNC") )
    d_in0_m0_wi0_wo0_assign_id1_q_13 ( .xin(xIn_v), .xout(d_in0_m0_wi0_wo0_assign_id1_q_13_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // u0_m0_wo0_wi0_r0_wa0(COUNTER,29)@13
    // low=0, high=7, step=1, init=4
    always @ (posedge clk or posedge areset)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_wa0_i <= 3'd4;
        end
        else if (d_in0_m0_wi0_wo0_assign_id1_q_13_q == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_wa0_i <= $unsigned(u0_m0_wo0_wi0_r0_wa0_i) + $unsigned(3'd1);
        end
    end
    assign u0_m0_wo0_wi0_r0_wa0_q = u0_m0_wo0_wi0_r0_wa0_i[2:0];

    // u0_m0_wo0_wi0_r0_memr0(DUALMEM,31)@13
    assign u0_m0_wo0_wi0_r0_memr0_ia = d_xIn_0_13_q;
    assign u0_m0_wo0_wi0_r0_memr0_aa = u0_m0_wo0_wi0_r0_wa0_q;
    assign u0_m0_wo0_wi0_r0_memr0_ab = u0_m0_wo0_wi0_r0_ra0_count0_q;
    altsyncram #(
        .ram_block_type("M9K"),
        .operation_mode("DUAL_PORT"),
        .width_a(17),
        .widthad_a(3),
        .numwords_a(8),
        .width_b(17),
        .widthad_b(3),
        .numwords_b(8),
        .lpm_type("altsyncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK0"),
        .indata_reg_b("CLOCK0"),
        .wrcontrol_wraddress_reg_b("CLOCK0"),
        .rdcontrol_reg_b("CLOCK0"),
        .byteena_reg_b("CLOCK0"),
        .outdata_reg_b("CLOCK0"),
        .outdata_aclr_b("NONE"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("FALSE"),
        .init_file("UNUSED"),
        .intended_device_family("MAX 10")
    ) u0_m0_wo0_wi0_r0_memr0_dmem (
        .clocken0(1'b1),
        .clock0(clk),
        .address_a(u0_m0_wo0_wi0_r0_memr0_aa),
        .data_a(u0_m0_wo0_wi0_r0_memr0_ia),
        .wren_a(d_in0_m0_wi0_wo0_assign_id1_q_13_q[0]),
        .address_b(u0_m0_wo0_wi0_r0_memr0_ab),
        .q_b(u0_m0_wo0_wi0_r0_memr0_iq),
        .wren_b(),
        .rden_a(),
        .rden_b(),
        .data_b(),
        .clock1(),
        .clocken1(),
        .clocken2(),
        .clocken3(),
        .aclr0(),
        .aclr1(),
        .byteena_a(),
        .byteena_b(),
        .addressstall_a(),
        .addressstall_b(),
        .q_a(),
        .eccstatus()
    );
    assign u0_m0_wo0_wi0_r0_memr0_q = u0_m0_wo0_wi0_r0_memr0_iq[16:0];

    // u0_m0_wo0_sym_add0(ADD,55)@13 + 1
    assign u0_m0_wo0_sym_add0_a = {{1{u0_m0_wo0_wi0_r0_memr0_q[16]}}, u0_m0_wo0_wi0_r0_memr0_q};
    assign u0_m0_wo0_sym_add0_b = {{1{u0_m0_wo0_wi0_r0_delayr7_q[16]}}, u0_m0_wo0_wi0_r0_delayr7_q};
    always @ (posedge clk or posedge areset)
    begin
        if (areset)
        begin
            u0_m0_wo0_sym_add0_o <= 18'b0;
        end
        else
        begin
            u0_m0_wo0_sym_add0_o <= $signed(u0_m0_wo0_sym_add0_a) + $signed(u0_m0_wo0_sym_add0_b);
        end
    end
    assign u0_m0_wo0_sym_add0_q = u0_m0_wo0_sym_add0_o[17:0];

    // u0_m0_wo0_ca3(COUNTER,39)@12
    // low=0, high=3, step=1, init=0
    always @ (posedge clk or posedge areset)
    begin
        if (areset)
        begin
            u0_m0_wo0_ca3_i <= 2'd0;
        end
        else if (u0_m0_wo0_compute_q == 1'b1)
        begin
            u0_m0_wo0_ca3_i <= $unsigned(u0_m0_wo0_ca3_i) + $unsigned(2'd1);
        end
    end
    assign u0_m0_wo0_ca3_q = u0_m0_wo0_ca3_i[1:0];

    // u0_m0_wo0_dec0(LOOKUP,43)@10 + 1
    assign u0_m0_wo0_dec0_c = busIn_write;
    always @ (posedge clk or posedge h_areset)
    begin
        if (h_areset)
        begin
            u0_m0_wo0_dec0_q <= 2'b11;
            u0_m0_wo0_dec0_e <= 1'b0;
        end
        else
        begin
            unique case (busIn_address)
                11'b00000000110 : begin
                                      u0_m0_wo0_dec0_q <= 2'b11;
                                      u0_m0_wo0_dec0_e <= u0_m0_wo0_dec0_c;
                                  end
                11'b00000000111 : begin
                                      u0_m0_wo0_dec0_q <= 2'b10;
                                      u0_m0_wo0_dec0_e <= u0_m0_wo0_dec0_c;
                                  end
                11'b00000001000 : begin
                                      u0_m0_wo0_dec0_q <= 2'b01;
                                      u0_m0_wo0_dec0_e <= u0_m0_wo0_dec0_c;
                                  end
                11'b00000001001 : begin
                                      u0_m0_wo0_dec0_q <= 2'b00;
                                      u0_m0_wo0_dec0_e <= u0_m0_wo0_dec0_c;
                                  end
                default : begin
                              u0_m0_wo0_dec0_q <= 2'b11;
                              u0_m0_wo0_dec0_e <= 1'b0;
                          end
            endcase
        end
    end

    // u0_m0_wo0_cm0(DUALMEM,45)@12 + 2
    assign u0_m0_wo0_cm0_ia = d_busIn_writedata_11_q;
    assign u0_m0_wo0_cm0_aa = u0_m0_wo0_dec0_q;
    assign u0_m0_wo0_cm0_ab = u0_m0_wo0_ca3_q;
    altsyncram #(
        .ram_block_type("M9K"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(2),
        .numwords_a(4),
        .width_b(16),
        .widthad_b(2),
        .numwords_b(4),
        .lpm_type("altsyncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK0"),
        .indata_reg_b("CLOCK0"),
        .wrcontrol_wraddress_reg_b("CLOCK0"),
        .rdcontrol_reg_b("CLOCK0"),
        .byteena_reg_b("CLOCK0"),
        .outdata_reg_b("CLOCK0"),
        .outdata_aclr_b("NONE"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("TRUE"),
        .intended_device_family("MAX 10")
    ) u0_m0_wo0_cm0_dmem (
        .clocken0(1'b1),
        .clock0(clk),
        .address_a(u0_m0_wo0_cm0_aa),
        .data_a(u0_m0_wo0_cm0_ia),
        .wren_a(u0_m0_wo0_dec0_e[0]),
        .address_b(u0_m0_wo0_cm0_ab),
        .q_b(u0_m0_wo0_cm0_iq),
        .wren_b(),
        .rden_a(),
        .rden_b(),
        .data_b(),
        .clock1(),
        .clocken1(),
        .clocken2(),
        .clocken3(),
        .aclr0(),
        .aclr1(),
        .byteena_a(),
        .byteena_b(),
        .addressstall_a(),
        .addressstall_b(),
        .q_a(),
        .eccstatus()
    );
    assign u0_m0_wo0_cm0_q = u0_m0_wo0_cm0_iq[15:0];

    // u0_m0_wo0_mtree_mult1_3(MULT,60)@14 + 2
    assign u0_m0_wo0_mtree_mult1_3_a0 = u0_m0_wo0_cm0_q;
    assign u0_m0_wo0_mtree_mult1_3_b0 = u0_m0_wo0_sym_add0_q;
    assign u0_m0_wo0_mtree_mult1_3_reset = areset;
    lpm_mult #(
        .lpm_widtha(16),
        .lpm_widthb(18),
        .lpm_widthp(34),
        .lpm_widths(1),
        .lpm_type("LPM_MULT"),
        .lpm_representation("SIGNED"),
        .lpm_hint("DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5"),
        .lpm_pipeline(2)
    ) u0_m0_wo0_mtree_mult1_3_component (
        .dataa(u0_m0_wo0_mtree_mult1_3_a0),
        .datab(u0_m0_wo0_mtree_mult1_3_b0),
        .clken(VCC_q[0]),
        .aclr(u0_m0_wo0_mtree_mult1_3_reset),
        .clock(clk),
        .result(u0_m0_wo0_mtree_mult1_3_s1),
        .sum()
    );
    assign u0_m0_wo0_mtree_mult1_3_q = u0_m0_wo0_mtree_mult1_3_s1;

    // u0_m0_wo0_sym_add1(ADD,56)@13 + 1
    assign u0_m0_wo0_sym_add1_a = {{1{u0_m0_wo0_wi0_r0_delayr1_q[16]}}, u0_m0_wo0_wi0_r0_delayr1_q};
    assign u0_m0_wo0_sym_add1_b = {{1{u0_m0_wo0_wi0_r0_delayr6_q[16]}}, u0_m0_wo0_wi0_r0_delayr6_q};
    always @ (posedge clk or posedge areset)
    begin
        if (areset)
        begin
            u0_m0_wo0_sym_add1_o <= 18'b0;
        end
        else
        begin
            u0_m0_wo0_sym_add1_o <= $signed(u0_m0_wo0_sym_add1_a) + $signed(u0_m0_wo0_sym_add1_b);
        end
    end
    assign u0_m0_wo0_sym_add1_q = u0_m0_wo0_sym_add1_o[17:0];

    // u0_m0_wo0_dec1(LOOKUP,46)@10 + 1
    assign u0_m0_wo0_dec1_c = busIn_write;
    always @ (posedge clk or posedge h_areset)
    begin
        if (h_areset)
        begin
            u0_m0_wo0_dec1_q <= 2'b11;
            u0_m0_wo0_dec1_e <= 1'b0;
        end
        else
        begin
            unique case (busIn_address)
                11'b00000001010 : begin
                                      u0_m0_wo0_dec1_q <= 2'b11;
                                      u0_m0_wo0_dec1_e <= u0_m0_wo0_dec1_c;
                                  end
                11'b00000001011 : begin
                                      u0_m0_wo0_dec1_q <= 2'b10;
                                      u0_m0_wo0_dec1_e <= u0_m0_wo0_dec1_c;
                                  end
                11'b00000001100 : begin
                                      u0_m0_wo0_dec1_q <= 2'b01;
                                      u0_m0_wo0_dec1_e <= u0_m0_wo0_dec1_c;
                                  end
                11'b00000001101 : begin
                                      u0_m0_wo0_dec1_q <= 2'b00;
                                      u0_m0_wo0_dec1_e <= u0_m0_wo0_dec1_c;
                                  end
                default : begin
                              u0_m0_wo0_dec1_q <= 2'b11;
                              u0_m0_wo0_dec1_e <= 1'b0;
                          end
            endcase
        end
    end

    // u0_m0_wo0_cm1(DUALMEM,48)@12 + 2
    assign u0_m0_wo0_cm1_ia = d_busIn_writedata_11_q;
    assign u0_m0_wo0_cm1_aa = u0_m0_wo0_dec1_q;
    assign u0_m0_wo0_cm1_ab = u0_m0_wo0_ca3_q;
    altsyncram #(
        .ram_block_type("M9K"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(2),
        .numwords_a(4),
        .width_b(16),
        .widthad_b(2),
        .numwords_b(4),
        .lpm_type("altsyncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK0"),
        .indata_reg_b("CLOCK0"),
        .wrcontrol_wraddress_reg_b("CLOCK0"),
        .rdcontrol_reg_b("CLOCK0"),
        .byteena_reg_b("CLOCK0"),
        .outdata_reg_b("CLOCK0"),
        .outdata_aclr_b("NONE"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("TRUE"),
        .intended_device_family("MAX 10")
    ) u0_m0_wo0_cm1_dmem (
        .clocken0(1'b1),
        .clock0(clk),
        .address_a(u0_m0_wo0_cm1_aa),
        .data_a(u0_m0_wo0_cm1_ia),
        .wren_a(u0_m0_wo0_dec1_e[0]),
        .address_b(u0_m0_wo0_cm1_ab),
        .q_b(u0_m0_wo0_cm1_iq),
        .wren_b(),
        .rden_a(),
        .rden_b(),
        .data_b(),
        .clock1(),
        .clocken1(),
        .clocken2(),
        .clocken3(),
        .aclr0(),
        .aclr1(),
        .byteena_a(),
        .byteena_b(),
        .addressstall_a(),
        .addressstall_b(),
        .q_a(),
        .eccstatus()
    );
    assign u0_m0_wo0_cm1_q = u0_m0_wo0_cm1_iq[15:0];

    // u0_m0_wo0_mtree_mult1_2(MULT,61)@14 + 2
    assign u0_m0_wo0_mtree_mult1_2_a0 = u0_m0_wo0_cm1_q;
    assign u0_m0_wo0_mtree_mult1_2_b0 = u0_m0_wo0_sym_add1_q;
    assign u0_m0_wo0_mtree_mult1_2_reset = areset;
    lpm_mult #(
        .lpm_widtha(16),
        .lpm_widthb(18),
        .lpm_widthp(34),
        .lpm_widths(1),
        .lpm_type("LPM_MULT"),
        .lpm_representation("SIGNED"),
        .lpm_hint("DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5"),
        .lpm_pipeline(2)
    ) u0_m0_wo0_mtree_mult1_2_component (
        .dataa(u0_m0_wo0_mtree_mult1_2_a0),
        .datab(u0_m0_wo0_mtree_mult1_2_b0),
        .clken(VCC_q[0]),
        .aclr(u0_m0_wo0_mtree_mult1_2_reset),
        .clock(clk),
        .result(u0_m0_wo0_mtree_mult1_2_s1),
        .sum()
    );
    assign u0_m0_wo0_mtree_mult1_2_q = u0_m0_wo0_mtree_mult1_2_s1;

    // u0_m0_wo0_mtree_add0_1(ADD,65)@16 + 1
    assign u0_m0_wo0_mtree_add0_1_a = {{1{u0_m0_wo0_mtree_mult1_2_q[33]}}, u0_m0_wo0_mtree_mult1_2_q};
    assign u0_m0_wo0_mtree_add0_1_b = {{1{u0_m0_wo0_mtree_mult1_3_q[33]}}, u0_m0_wo0_mtree_mult1_3_q};
    always @ (posedge clk or posedge areset)
    begin
        if (areset)
        begin
            u0_m0_wo0_mtree_add0_1_o <= 35'b0;
        end
        else
        begin
            u0_m0_wo0_mtree_add0_1_o <= $signed(u0_m0_wo0_mtree_add0_1_a) + $signed(u0_m0_wo0_mtree_add0_1_b);
        end
    end
    assign u0_m0_wo0_mtree_add0_1_q = u0_m0_wo0_mtree_add0_1_o[34:0];

    // u0_m0_wo0_wi0_r0_delayr2(DELAY,34)@13
    dspba_delay_ver #( .width(17), .depth(4), .reset_kind("ASYNC") )
    u0_m0_wo0_wi0_r0_delayr2 ( .xin(u0_m0_wo0_wi0_r0_delayr1_q), .xout(u0_m0_wo0_wi0_r0_delayr2_q), .ena(d_u0_m0_wo0_compute_q_13_q[0]), .clk(clk), .aclr(areset) );

    // u0_m0_wo0_sym_add2(ADD,57)@13 + 1
    assign u0_m0_wo0_sym_add2_a = {{1{u0_m0_wo0_wi0_r0_delayr2_q[16]}}, u0_m0_wo0_wi0_r0_delayr2_q};
    assign u0_m0_wo0_sym_add2_b = {{1{u0_m0_wo0_wi0_r0_delayr5_q[16]}}, u0_m0_wo0_wi0_r0_delayr5_q};
    always @ (posedge clk or posedge areset)
    begin
        if (areset)
        begin
            u0_m0_wo0_sym_add2_o <= 18'b0;
        end
        else
        begin
            u0_m0_wo0_sym_add2_o <= $signed(u0_m0_wo0_sym_add2_a) + $signed(u0_m0_wo0_sym_add2_b);
        end
    end
    assign u0_m0_wo0_sym_add2_q = u0_m0_wo0_sym_add2_o[17:0];

    // u0_m0_wo0_dec2(LOOKUP,49)@10 + 1
    assign u0_m0_wo0_dec2_c = busIn_write;
    always @ (posedge clk or posedge h_areset)
    begin
        if (h_areset)
        begin
            u0_m0_wo0_dec2_q <= 2'b10;
            u0_m0_wo0_dec2_e <= 1'b0;
        end
        else
        begin
            unique case (busIn_address)
                11'b00000001111 : begin
                                      u0_m0_wo0_dec2_q <= 2'b10;
                                      u0_m0_wo0_dec2_e <= u0_m0_wo0_dec2_c;
                                  end
                11'b00000010000 : begin
                                      u0_m0_wo0_dec2_q <= 2'b01;
                                      u0_m0_wo0_dec2_e <= u0_m0_wo0_dec2_c;
                                  end
                11'b00000010001 : begin
                                      u0_m0_wo0_dec2_q <= 2'b00;
                                      u0_m0_wo0_dec2_e <= u0_m0_wo0_dec2_c;
                                  end
                11'b00000001110 : begin
                                      u0_m0_wo0_dec2_q <= 2'b11;
                                      u0_m0_wo0_dec2_e <= u0_m0_wo0_dec2_c;
                                  end
                default : begin
                              u0_m0_wo0_dec2_q <= 2'b10;
                              u0_m0_wo0_dec2_e <= 1'b0;
                          end
            endcase
        end
    end

    // u0_m0_wo0_cm2(DUALMEM,51)@12 + 2
    assign u0_m0_wo0_cm2_ia = d_busIn_writedata_11_q;
    assign u0_m0_wo0_cm2_aa = u0_m0_wo0_dec2_q;
    assign u0_m0_wo0_cm2_ab = u0_m0_wo0_ca3_q;
    altsyncram #(
        .ram_block_type("M9K"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(2),
        .numwords_a(4),
        .width_b(16),
        .widthad_b(2),
        .numwords_b(4),
        .lpm_type("altsyncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK0"),
        .indata_reg_b("CLOCK0"),
        .wrcontrol_wraddress_reg_b("CLOCK0"),
        .rdcontrol_reg_b("CLOCK0"),
        .byteena_reg_b("CLOCK0"),
        .outdata_reg_b("CLOCK0"),
        .outdata_aclr_b("NONE"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("TRUE"),
        .intended_device_family("MAX 10")
    ) u0_m0_wo0_cm2_dmem (
        .clocken0(1'b1),
        .clock0(clk),
        .address_a(u0_m0_wo0_cm2_aa),
        .data_a(u0_m0_wo0_cm2_ia),
        .wren_a(u0_m0_wo0_dec2_e[0]),
        .address_b(u0_m0_wo0_cm2_ab),
        .q_b(u0_m0_wo0_cm2_iq),
        .wren_b(),
        .rden_a(),
        .rden_b(),
        .data_b(),
        .clock1(),
        .clocken1(),
        .clocken2(),
        .clocken3(),
        .aclr0(),
        .aclr1(),
        .byteena_a(),
        .byteena_b(),
        .addressstall_a(),
        .addressstall_b(),
        .q_a(),
        .eccstatus()
    );
    assign u0_m0_wo0_cm2_q = u0_m0_wo0_cm2_iq[15:0];

    // u0_m0_wo0_mtree_mult1_1(MULT,62)@14 + 2
    assign u0_m0_wo0_mtree_mult1_1_a0 = u0_m0_wo0_cm2_q;
    assign u0_m0_wo0_mtree_mult1_1_b0 = u0_m0_wo0_sym_add2_q;
    assign u0_m0_wo0_mtree_mult1_1_reset = areset;
    lpm_mult #(
        .lpm_widtha(16),
        .lpm_widthb(18),
        .lpm_widthp(34),
        .lpm_widths(1),
        .lpm_type("LPM_MULT"),
        .lpm_representation("SIGNED"),
        .lpm_hint("DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5"),
        .lpm_pipeline(2)
    ) u0_m0_wo0_mtree_mult1_1_component (
        .dataa(u0_m0_wo0_mtree_mult1_1_a0),
        .datab(u0_m0_wo0_mtree_mult1_1_b0),
        .clken(VCC_q[0]),
        .aclr(u0_m0_wo0_mtree_mult1_1_reset),
        .clock(clk),
        .result(u0_m0_wo0_mtree_mult1_1_s1),
        .sum()
    );
    assign u0_m0_wo0_mtree_mult1_1_q = u0_m0_wo0_mtree_mult1_1_s1;

    // u0_m0_wo0_symSuppress_3_seq(SEQUENCE,58)@12 + 1
    always @ (posedge clk or posedge areset)
    begin
        reg [4:0] u0_m0_wo0_symSuppress_3_seq_c;
        if (areset)
        begin
            u0_m0_wo0_symSuppress_3_seq_c = 5'b00010;
            u0_m0_wo0_symSuppress_3_seq_q <= 1'b0;
            u0_m0_wo0_symSuppress_3_seq_eq <= 1'b0;
        end
        else
        begin
            if (u0_m0_wo0_compute_q == 1'b1)
            begin
                if (u0_m0_wo0_symSuppress_3_seq_c == 5'b00000)
                begin
                    u0_m0_wo0_symSuppress_3_seq_eq <= 1'b1;
                end
                else
                begin
                    u0_m0_wo0_symSuppress_3_seq_eq <= 1'b0;
                end
                if (u0_m0_wo0_symSuppress_3_seq_eq == 1'b1)
                begin
                    u0_m0_wo0_symSuppress_3_seq_c = $signed(u0_m0_wo0_symSuppress_3_seq_c) + $signed(5'd3);
                end
                else
                begin
                    u0_m0_wo0_symSuppress_3_seq_c = $signed(u0_m0_wo0_symSuppress_3_seq_c) - $signed(5'd1);
                end
                u0_m0_wo0_symSuppress_3_seq_q <= u0_m0_wo0_symSuppress_3_seq_c[4:4];
            end
        end
    end

    // u0_m0_wo0_wi0_r0_delayr3(DELAY,35)@13
    dspba_delay_ver #( .width(17), .depth(4), .reset_kind("ASYNC") )
    u0_m0_wo0_wi0_r0_delayr3 ( .xin(u0_m0_wo0_wi0_r0_delayr2_q), .xout(u0_m0_wo0_wi0_r0_delayr3_q), .ena(d_u0_m0_wo0_compute_q_13_q[0]), .clk(clk), .aclr(areset) );

    // u0_m0_wo0_sym_add3(ADD,59)@13 + 1
    assign u0_m0_wo0_sym_add3_a = {{1{u0_m0_wo0_wi0_r0_delayr3_q[16]}}, u0_m0_wo0_wi0_r0_delayr3_q};
    assign u0_m0_wo0_sym_add3_b = {{1{u0_m0_wo0_wi0_r0_memr4_q[16]}}, u0_m0_wo0_wi0_r0_memr4_q};
    assign u0_m0_wo0_sym_add3_i = u0_m0_wo0_sym_add3_a;
    always @ (posedge clk or posedge areset)
    begin
        if (areset)
        begin
            u0_m0_wo0_sym_add3_o <= 18'b0;
        end
        else
        begin
            if (u0_m0_wo0_symSuppress_3_seq_q == 1'b1)
            begin
                u0_m0_wo0_sym_add3_o <= u0_m0_wo0_sym_add3_i;
            end
            else
            begin
                u0_m0_wo0_sym_add3_o <= $signed(u0_m0_wo0_sym_add3_a) + $signed(u0_m0_wo0_sym_add3_b);
            end
        end
    end
    assign u0_m0_wo0_sym_add3_q = u0_m0_wo0_sym_add3_o[17:0];

    // u0_m0_wo0_dec3(LOOKUP,52)@10 + 1
    assign u0_m0_wo0_dec3_c = busIn_write;
    always @ (posedge clk or posedge h_areset)
    begin
        if (h_areset)
        begin
            u0_m0_wo0_dec3_q <= 2'b11;
            u0_m0_wo0_dec3_e <= 1'b0;
        end
        else
        begin
            unique case (busIn_address)
                11'b00000010010 : begin
                                      u0_m0_wo0_dec3_q <= 2'b11;
                                      u0_m0_wo0_dec3_e <= u0_m0_wo0_dec3_c;
                                  end
                11'b00000010011 : begin
                                      u0_m0_wo0_dec3_q <= 2'b10;
                                      u0_m0_wo0_dec3_e <= u0_m0_wo0_dec3_c;
                                  end
                default : begin
                              u0_m0_wo0_dec3_q <= 2'b11;
                              u0_m0_wo0_dec3_e <= 1'b0;
                          end
            endcase
        end
    end

    // u0_m0_wo0_cm3(DUALMEM,54)@12 + 2
    assign u0_m0_wo0_cm3_ia = d_busIn_writedata_11_q;
    assign u0_m0_wo0_cm3_aa = u0_m0_wo0_dec3_q;
    assign u0_m0_wo0_cm3_ab = u0_m0_wo0_ca3_q;
    altsyncram #(
        .ram_block_type("M9K"),
        .operation_mode("DUAL_PORT"),
        .width_a(16),
        .widthad_a(2),
        .numwords_a(4),
        .width_b(16),
        .widthad_b(2),
        .numwords_b(4),
        .lpm_type("altsyncram"),
        .width_byteena_a(1),
        .address_reg_b("CLOCK0"),
        .indata_reg_b("CLOCK0"),
        .wrcontrol_wraddress_reg_b("CLOCK0"),
        .rdcontrol_reg_b("CLOCK0"),
        .byteena_reg_b("CLOCK0"),
        .outdata_reg_b("CLOCK0"),
        .outdata_aclr_b("NONE"),
        .clock_enable_input_a("NORMAL"),
        .clock_enable_input_b("NORMAL"),
        .clock_enable_output_b("NORMAL"),
        .read_during_write_mode_mixed_ports("DONT_CARE"),
        .power_up_uninitialized("TRUE"),
        .intended_device_family("MAX 10")
    ) u0_m0_wo0_cm3_dmem (
        .clocken0(1'b1),
        .clock0(clk),
        .address_a(u0_m0_wo0_cm3_aa),
        .data_a(u0_m0_wo0_cm3_ia),
        .wren_a(u0_m0_wo0_dec3_e[0]),
        .address_b(u0_m0_wo0_cm3_ab),
        .q_b(u0_m0_wo0_cm3_iq),
        .wren_b(),
        .rden_a(),
        .rden_b(),
        .data_b(),
        .clock1(),
        .clocken1(),
        .clocken2(),
        .clocken3(),
        .aclr0(),
        .aclr1(),
        .byteena_a(),
        .byteena_b(),
        .addressstall_a(),
        .addressstall_b(),
        .q_a(),
        .eccstatus()
    );
    assign u0_m0_wo0_cm3_q = u0_m0_wo0_cm3_iq[15:0];

    // u0_m0_wo0_mtree_mult1_0(MULT,63)@14 + 2
    assign u0_m0_wo0_mtree_mult1_0_a0 = u0_m0_wo0_cm3_q;
    assign u0_m0_wo0_mtree_mult1_0_b0 = u0_m0_wo0_sym_add3_q;
    assign u0_m0_wo0_mtree_mult1_0_reset = areset;
    lpm_mult #(
        .lpm_widtha(16),
        .lpm_widthb(18),
        .lpm_widthp(34),
        .lpm_widths(1),
        .lpm_type("LPM_MULT"),
        .lpm_representation("SIGNED"),
        .lpm_hint("DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5"),
        .lpm_pipeline(2)
    ) u0_m0_wo0_mtree_mult1_0_component (
        .dataa(u0_m0_wo0_mtree_mult1_0_a0),
        .datab(u0_m0_wo0_mtree_mult1_0_b0),
        .clken(VCC_q[0]),
        .aclr(u0_m0_wo0_mtree_mult1_0_reset),
        .clock(clk),
        .result(u0_m0_wo0_mtree_mult1_0_s1),
        .sum()
    );
    assign u0_m0_wo0_mtree_mult1_0_q = u0_m0_wo0_mtree_mult1_0_s1;

    // u0_m0_wo0_mtree_add0_0(ADD,64)@16 + 1
    assign u0_m0_wo0_mtree_add0_0_a = {{1{u0_m0_wo0_mtree_mult1_0_q[33]}}, u0_m0_wo0_mtree_mult1_0_q};
    assign u0_m0_wo0_mtree_add0_0_b = {{1{u0_m0_wo0_mtree_mult1_1_q[33]}}, u0_m0_wo0_mtree_mult1_1_q};
    always @ (posedge clk or posedge areset)
    begin
        if (areset)
        begin
            u0_m0_wo0_mtree_add0_0_o <= 35'b0;
        end
        else
        begin
            u0_m0_wo0_mtree_add0_0_o <= $signed(u0_m0_wo0_mtree_add0_0_a) + $signed(u0_m0_wo0_mtree_add0_0_b);
        end
    end
    assign u0_m0_wo0_mtree_add0_0_q = u0_m0_wo0_mtree_add0_0_o[34:0];

    // u0_m0_wo0_mtree_add1_0(ADD,66)@17 + 1
    assign u0_m0_wo0_mtree_add1_0_a = {{1{u0_m0_wo0_mtree_add0_0_q[34]}}, u0_m0_wo0_mtree_add0_0_q};
    assign u0_m0_wo0_mtree_add1_0_b = {{1{u0_m0_wo0_mtree_add0_1_q[34]}}, u0_m0_wo0_mtree_add0_1_q};
    always @ (posedge clk or posedge areset)
    begin
        if (areset)
        begin
            u0_m0_wo0_mtree_add1_0_o <= 36'b0;
        end
        else
        begin
            u0_m0_wo0_mtree_add1_0_o <= $signed(u0_m0_wo0_mtree_add1_0_a) + $signed(u0_m0_wo0_mtree_add1_0_b);
        end
    end
    assign u0_m0_wo0_mtree_add1_0_q = u0_m0_wo0_mtree_add1_0_o[35:0];

    // u0_m0_wo0_accum(ADD,68)@18 + 1
    assign u0_m0_wo0_accum_a = {{2{u0_m0_wo0_mtree_add1_0_q[35]}}, u0_m0_wo0_mtree_add1_0_q};
    assign u0_m0_wo0_accum_b = u0_m0_wo0_accum_q;
    assign u0_m0_wo0_accum_i = u0_m0_wo0_accum_a;
    always @ (posedge clk or posedge areset)
    begin
        if (areset)
        begin
            u0_m0_wo0_accum_o <= 38'b0;
        end
        else if (d_u0_m0_wo0_compute_q_18_q == 1'b1)
        begin
            if (u0_m0_wo0_aseq_q == 1'b1)
            begin
                u0_m0_wo0_accum_o <= u0_m0_wo0_accum_i;
            end
            else
            begin
                u0_m0_wo0_accum_o <= $signed(u0_m0_wo0_accum_a) + $signed(u0_m0_wo0_accum_b);
            end
        end
    end
    assign u0_m0_wo0_accum_q = u0_m0_wo0_accum_o[37:0];

    // GND(CONSTANT,0)@0
    assign GND_q = 1'b0;

    // u0_m0_wo0_oseq(SEQUENCE,69)@17 + 1
    always @ (posedge clk or posedge areset)
    begin
        reg [4:0] u0_m0_wo0_oseq_c;
        if (areset)
        begin
            u0_m0_wo0_oseq_c = 5'b00011;
            u0_m0_wo0_oseq_q <= 1'b0;
            u0_m0_wo0_oseq_eq <= 1'b0;
        end
        else
        begin
            if (d_u0_m0_wo0_compute_q_17_q == 1'b1)
            begin
                if (u0_m0_wo0_oseq_c == 5'b00000)
                begin
                    u0_m0_wo0_oseq_eq <= 1'b1;
                end
                else
                begin
                    u0_m0_wo0_oseq_eq <= 1'b0;
                end
                if (u0_m0_wo0_oseq_eq == 1'b1)
                begin
                    u0_m0_wo0_oseq_c = $signed(u0_m0_wo0_oseq_c) + $signed(5'd3);
                end
                else
                begin
                    u0_m0_wo0_oseq_c = $signed(u0_m0_wo0_oseq_c) - $signed(5'd1);
                end
                u0_m0_wo0_oseq_q <= u0_m0_wo0_oseq_c[4:4];
            end
        end
    end

    // u0_m0_wo0_oseq_gated(LOGICAL,70)@18
    assign u0_m0_wo0_oseq_gated_q = u0_m0_wo0_oseq_q & d_u0_m0_wo0_compute_q_18_q;

    // u0_m0_wo0_oseq_gated_reg(REG,71)@18 + 1
    always @ (posedge clk or posedge areset)
    begin
        if (areset)
        begin
            u0_m0_wo0_oseq_gated_reg_q <= 1'b0;
        end
        else
        begin
            u0_m0_wo0_oseq_gated_reg_q <= u0_m0_wo0_oseq_gated_q;
        end
    end

    // xOut(PORTOUT,76)@19 + 1
    assign xOut_v = u0_m0_wo0_oseq_gated_reg_q;
    assign xOut_c = {7'b0000000, GND_q};
    assign xOut_0 = u0_m0_wo0_accum_q;

endmodule
