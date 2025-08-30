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

// SystemVerilog created from decimation_filter_FilterSystem_DecimatingFIR1
// SystemVerilog created on Thu Jan 23 17:48:41 2025


(* altera_attribute = "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007; -name MESSAGE_DISABLE 10958" *)
module decimation_filter_FilterSystem_DecimatingFIR1 (
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
    output wire [36:0] xOut_0,
    input wire clk,
    input wire areset,
    input wire h_areset
    );

    wire [0:0] GND_q;
    wire [0:0] VCC_q;
    reg [16:0] d_xIn_0_13_q;
    reg [0:0] d_busIn_read_12_q;
    reg [15:0] d_busIn_writedata_11_q;
    reg [2:0] rblookup_q;
    reg [0:0] rblookup_h;
    reg [0:0] rblookup_e;
    wire [0:0] rblookup_c;
    reg [0:0] d_rblookup_h_12_q;
    reg [0:0] rblookup_valid_q;
    wire rm_reset0;
    wire [15:0] rm_ia;
    wire [2:0] rm_aa;
    wire [2:0] rm_ab;
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
    reg [0:0] d_u0_m0_wo0_compute_q_16_q;
    reg [0:0] d_u0_m0_wo0_compute_q_17_q;
    reg [2:0] u0_m0_wo0_wi0_r0_ra1_count0_lutreg_q;
    wire [2:0] u0_m0_wo0_wi0_r0_ra1_count0_q;
    (* preserve *) reg [2:0] u0_m0_wo0_wi0_r0_ra1_count0_i;
    (* preserve *) reg u0_m0_wo0_wi0_r0_ra1_count0_eq;
    reg [3:0] u0_m0_wo0_wi0_r0_ra2_count0_lutreg_q;
    wire [3:0] u0_m0_wo0_wi0_r0_ra2_count0_q;
    (* preserve *) reg [3:0] u0_m0_wo0_wi0_r0_ra2_count0_i;
    (* preserve *) reg u0_m0_wo0_wi0_r0_ra2_count0_eq;
    reg [3:0] u0_m0_wo0_wi0_r0_ra3_count0_lutreg_q;
    wire [3:0] u0_m0_wo0_wi0_r0_ra3_count0_q;
    (* preserve *) reg [3:0] u0_m0_wo0_wi0_r0_ra3_count0_i;
    (* preserve *) reg u0_m0_wo0_wi0_r0_ra3_count0_eq;
    wire [2:0] u0_m0_wo0_wi0_r0_wa0_q;
    (* preserve *) reg [2:0] u0_m0_wo0_wi0_r0_wa0_i;
    wire [2:0] u0_m0_wo0_wi0_r0_wa1_q;
    (* preserve *) reg [2:0] u0_m0_wo0_wi0_r0_wa1_i;
    wire [3:0] u0_m0_wo0_wi0_r0_wa2_q;
    (* preserve *) reg [3:0] u0_m0_wo0_wi0_r0_wa2_i;
    (* preserve *) reg u0_m0_wo0_wi0_r0_wa2_eq;
    reg [3:0] u0_m0_wo0_wi0_r0_wa3_1_q;
    wire u0_m0_wo0_wi0_r0_memr0_reset0;
    wire [16:0] u0_m0_wo0_wi0_r0_memr0_ia;
    wire [2:0] u0_m0_wo0_wi0_r0_memr0_aa;
    wire [2:0] u0_m0_wo0_wi0_r0_memr0_ab;
    wire [16:0] u0_m0_wo0_wi0_r0_memr0_iq;
    wire [16:0] u0_m0_wo0_wi0_r0_memr0_q;
    wire u0_m0_wo0_wi0_r0_memr1_reset0;
    wire [16:0] u0_m0_wo0_wi0_r0_memr1_ia;
    wire [2:0] u0_m0_wo0_wi0_r0_memr1_aa;
    wire [2:0] u0_m0_wo0_wi0_r0_memr1_ab;
    wire [16:0] u0_m0_wo0_wi0_r0_memr1_iq;
    wire [16:0] u0_m0_wo0_wi0_r0_memr1_q;
    wire u0_m0_wo0_wi0_r0_memr2_reset0;
    wire [16:0] u0_m0_wo0_wi0_r0_memr2_ia;
    wire [3:0] u0_m0_wo0_wi0_r0_memr2_aa;
    wire [3:0] u0_m0_wo0_wi0_r0_memr2_ab;
    wire [16:0] u0_m0_wo0_wi0_r0_memr2_iq;
    wire [16:0] u0_m0_wo0_wi0_r0_memr2_q;
    wire u0_m0_wo0_wi0_r0_memr3_reset0;
    wire [16:0] u0_m0_wo0_wi0_r0_memr3_ia;
    wire [3:0] u0_m0_wo0_wi0_r0_memr3_aa;
    wire [3:0] u0_m0_wo0_wi0_r0_memr3_ab;
    wire [16:0] u0_m0_wo0_wi0_r0_memr3_iq;
    wire [16:0] u0_m0_wo0_wi0_r0_memr3_q;
    wire [1:0] u0_m0_wo0_ca1_q;
    (* preserve *) reg [1:0] u0_m0_wo0_ca1_i;
    (* preserve *) reg u0_m0_wo0_ca1_eq;
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
    wire [17:0] u0_m0_wo0_sym_add0_a;
    wire [17:0] u0_m0_wo0_sym_add0_b;
    logic [17:0] u0_m0_wo0_sym_add0_o;
    wire [17:0] u0_m0_wo0_sym_add0_q;
    reg [0:0] u0_m0_wo0_symSuppress_1_seq_q;
    reg u0_m0_wo0_symSuppress_1_seq_eq;
    wire [17:0] u0_m0_wo0_sym_add1_a;
    wire [17:0] u0_m0_wo0_sym_add1_b;
    wire [17:0] u0_m0_wo0_sym_add1_i;
    logic [17:0] u0_m0_wo0_sym_add1_o;
    wire [17:0] u0_m0_wo0_sym_add1_q;
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
    reg [0:0] u0_m0_wo0_aseq_q;
    reg u0_m0_wo0_aseq_eq;
    wire [36:0] u0_m0_wo0_accum_a;
    wire [36:0] u0_m0_wo0_accum_b;
    wire [36:0] u0_m0_wo0_accum_i;
    logic [36:0] u0_m0_wo0_accum_o;
    wire [36:0] u0_m0_wo0_accum_q;
    reg [0:0] u0_m0_wo0_oseq_q;
    reg u0_m0_wo0_oseq_eq;
    reg [0:0] u0_m0_wo0_oseq_gated_reg_q;
    wire [0:0] rblookup_read_hit_q;
    wire [0:0] u0_m0_wo0_oseq_gated_q;
    reg [2:0] u0_m0_wo0_wi0_r0_ra1_count0_lut_q;
    reg [3:0] u0_m0_wo0_wi0_r0_ra2_count0_lut_q;
    reg [3:0] u0_m0_wo0_wi0_r0_ra3_count0_lut_q;
    reg [3:0] u0_m0_wo0_wi0_r0_wa3_1_lut_q;


    // d_busIn_writedata_11(DELAY,70)@10 + 1
    dspba_delay_ver #( .width(16), .depth(1), .reset_kind("ASYNC") )
    d_busIn_writedata_11 ( .xin(busIn_writedata), .xout(d_busIn_writedata_11_q), .clk(clk), .aclr(h_areset), .ena(1'b1) );

    // rblookup(LOOKUP,4)@10 + 1
    assign rblookup_c = busIn_write;
    always @ (posedge clk or posedge h_areset)
    begin
        if (h_areset)
        begin
            rblookup_q <= 3'b000;
            rblookup_h <= 1'b0;
            rblookup_e <= 1'b0;
        end
        else
        begin
            unique case (busIn_address)
                11'b00000000000 : begin
                                      rblookup_q <= 3'b000;
                                      rblookup_h <= 1'b1;
                                      rblookup_e <= rblookup_c;
                                  end
                11'b00000000001 : begin
                                      rblookup_q <= 3'b001;
                                      rblookup_h <= 1'b1;
                                      rblookup_e <= rblookup_c;
                                  end
                11'b00000000010 : begin
                                      rblookup_q <= 3'b010;
                                      rblookup_h <= 1'b1;
                                      rblookup_e <= rblookup_c;
                                  end
                11'b00000000011 : begin
                                      rblookup_q <= 3'b011;
                                      rblookup_h <= 1'b1;
                                      rblookup_e <= rblookup_c;
                                  end
                11'b00000000100 : begin
                                      rblookup_q <= 3'b100;
                                      rblookup_h <= 1'b1;
                                      rblookup_e <= rblookup_c;
                                  end
                11'b00000000101 : begin
                                      rblookup_q <= 3'b101;
                                      rblookup_h <= 1'b1;
                                      rblookup_e <= rblookup_c;
                                  end
                default : begin
                              rblookup_q <= 3'b000;
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
        .widthad_a(3),
        .numwords_a(6),
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

    // d_busIn_read_12(DELAY,71)@10 + 2
    dspba_delay_ver #( .width(1), .depth(2), .reset_kind("ASYNC") )
    d_busIn_read_12 ( .xin(busIn_read), .xout(d_busIn_read_12_q), .clk(clk), .aclr(h_areset), .ena(1'b1) );

    // d_rblookup_h_12(DELAY,72)@11 + 1
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
        reg [1:0] u0_m0_wo0_run_enable_c;
        reg [3:0] u0_m0_wo0_run_inc;
        if (areset)
        begin
            u0_m0_wo0_run_q <= 1'b0;
            u0_m0_wo0_run_enable_c = 2'd1;
            u0_m0_wo0_run_enableQ <= 1'b0;
            u0_m0_wo0_run_count <= 4'b0000;
            u0_m0_wo0_run_inc = 4'b0;
        end
        else
        begin
            if (u0_m0_wo0_run_out == 1'b1)
            begin
                if (u0_m0_wo0_run_enable_c[1] == 1'b1)
                begin
                    u0_m0_wo0_run_enable_c = $signed(u0_m0_wo0_run_enable_c) - $signed(-2'd2);
                end
                else
                begin
                    u0_m0_wo0_run_enable_c = $signed(u0_m0_wo0_run_enable_c) + $signed(-2'd1);
                end
                u0_m0_wo0_run_enableQ <= u0_m0_wo0_run_enable_c[1:1];
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

    // d_u0_m0_wo0_compute_q_13(DELAY,75)@12 + 1
    dspba_delay_ver #( .width(1), .depth(1), .reset_kind("ASYNC") )
    d_u0_m0_wo0_compute_q_13 ( .xin(u0_m0_wo0_compute_q), .xout(d_u0_m0_wo0_compute_q_13_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // d_u0_m0_wo0_compute_q_16(DELAY,76)@13 + 3
    dspba_delay_ver #( .width(1), .depth(3), .reset_kind("ASYNC") )
    d_u0_m0_wo0_compute_q_16 ( .xin(d_u0_m0_wo0_compute_q_13_q), .xout(d_u0_m0_wo0_compute_q_16_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // u0_m0_wo0_aseq(SEQUENCE,59)@16 + 1
    always @ (posedge clk or posedge areset)
    begin
        reg [3:0] u0_m0_wo0_aseq_c;
        if (areset)
        begin
            u0_m0_wo0_aseq_c = 4'b0000;
            u0_m0_wo0_aseq_q <= 1'b0;
            u0_m0_wo0_aseq_eq <= 1'b0;
        end
        else
        begin
            if (d_u0_m0_wo0_compute_q_16_q == 1'b1)
            begin
                if (u0_m0_wo0_aseq_c == 4'b0000)
                begin
                    u0_m0_wo0_aseq_eq <= 1'b1;
                end
                else
                begin
                    u0_m0_wo0_aseq_eq <= 1'b0;
                end
                if (u0_m0_wo0_aseq_eq == 1'b1)
                begin
                    u0_m0_wo0_aseq_c = $signed(u0_m0_wo0_aseq_c) + $signed(4'd2);
                end
                else
                begin
                    u0_m0_wo0_aseq_c = $signed(u0_m0_wo0_aseq_c) - $signed(4'd1);
                end
                u0_m0_wo0_aseq_q <= u0_m0_wo0_aseq_c[3:3];
            end
        end
    end

    // d_u0_m0_wo0_compute_q_17(DELAY,77)@16 + 1
    dspba_delay_ver #( .width(1), .depth(1), .reset_kind("ASYNC") )
    d_u0_m0_wo0_compute_q_17 ( .xin(d_u0_m0_wo0_compute_q_16_q), .xout(d_u0_m0_wo0_compute_q_17_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // d_u0_m0_wo0_memread_q_13(DELAY,74)@12 + 1
    dspba_delay_ver #( .width(1), .depth(1), .reset_kind("ASYNC") )
    d_u0_m0_wo0_memread_q_13 ( .xin(u0_m0_wo0_memread_q), .xout(d_u0_m0_wo0_memread_q_13_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // u0_m0_wo0_wi0_r0_ra3_count0(COUNTER,33)@13
    // low=0, high=11, step=1, init=1
    always @ (posedge clk or posedge areset)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_ra3_count0_i <= 4'd1;
            u0_m0_wo0_wi0_r0_ra3_count0_eq <= 1'b0;
        end
        else if (d_u0_m0_wo0_memread_q_13_q == 1'b1)
        begin
            if (u0_m0_wo0_wi0_r0_ra3_count0_i == 4'd10)
            begin
                u0_m0_wo0_wi0_r0_ra3_count0_eq <= 1'b1;
            end
            else
            begin
                u0_m0_wo0_wi0_r0_ra3_count0_eq <= 1'b0;
            end
            if (u0_m0_wo0_wi0_r0_ra3_count0_eq == 1'b1)
            begin
                u0_m0_wo0_wi0_r0_ra3_count0_i <= $unsigned(u0_m0_wo0_wi0_r0_ra3_count0_i) + $unsigned(4'd5);
            end
            else
            begin
                u0_m0_wo0_wi0_r0_ra3_count0_i <= $unsigned(u0_m0_wo0_wi0_r0_ra3_count0_i) + $unsigned(4'd1);
            end
        end
    end
    assign u0_m0_wo0_wi0_r0_ra3_count0_q = u0_m0_wo0_wi0_r0_ra3_count0_i[3:0];

    // u0_m0_wo0_wi0_r0_ra3_count0_lut(LOOKUP,31)@13
    always @(u0_m0_wo0_wi0_r0_ra3_count0_q)
    begin
        // Begin reserved scope level
        unique case (u0_m0_wo0_wi0_r0_ra3_count0_q)
            4'b0000 : u0_m0_wo0_wi0_r0_ra3_count0_lut_q = 4'b0011;
            4'b0001 : u0_m0_wo0_wi0_r0_ra3_count0_lut_q = 4'b0010;
            4'b0010 : u0_m0_wo0_wi0_r0_ra3_count0_lut_q = 4'b0001;
            4'b0011 : u0_m0_wo0_wi0_r0_ra3_count0_lut_q = 4'b0110;
            4'b0100 : u0_m0_wo0_wi0_r0_ra3_count0_lut_q = 4'b0101;
            4'b0101 : u0_m0_wo0_wi0_r0_ra3_count0_lut_q = 4'b0100;
            4'b0110 : u0_m0_wo0_wi0_r0_ra3_count0_lut_q = 4'b1001;
            4'b0111 : u0_m0_wo0_wi0_r0_ra3_count0_lut_q = 4'b1000;
            4'b1000 : u0_m0_wo0_wi0_r0_ra3_count0_lut_q = 4'b0111;
            4'b1001 : u0_m0_wo0_wi0_r0_ra3_count0_lut_q = 4'b0000;
            4'b1010 : u0_m0_wo0_wi0_r0_ra3_count0_lut_q = 4'b1011;
            4'b1011 : u0_m0_wo0_wi0_r0_ra3_count0_lut_q = 4'b1010;
            default : begin
                          // unreachable
                          u0_m0_wo0_wi0_r0_ra3_count0_lut_q = 4'bxxxx;
                      end
        endcase
        // End reserved scope level
    end

    // u0_m0_wo0_wi0_r0_ra3_count0_lutreg(REG,32)@13
    always @ (posedge clk or posedge areset)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_ra3_count0_lutreg_q <= 4'b0011;
        end
        else if (d_u0_m0_wo0_memread_q_13_q == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_ra3_count0_lutreg_q <= u0_m0_wo0_wi0_r0_ra3_count0_lut_q;
        end
    end

    // u0_m0_wo0_wi0_r0_wa3_1_lut(LOOKUP,37)@13
    always @(u0_m0_wo0_wi0_r0_wa3_1_q)
    begin
        // Begin reserved scope level
        unique case (u0_m0_wo0_wi0_r0_wa3_1_q)
            4'b0000 : u0_m0_wo0_wi0_r0_wa3_1_lut_q = 4'b0001;
            4'b0001 : u0_m0_wo0_wi0_r0_wa3_1_lut_q = 4'b0010;
            4'b0010 : u0_m0_wo0_wi0_r0_wa3_1_lut_q = 4'b0011;
            4'b0011 : u0_m0_wo0_wi0_r0_wa3_1_lut_q = 4'b0100;
            4'b0100 : u0_m0_wo0_wi0_r0_wa3_1_lut_q = 4'b0101;
            4'b0101 : u0_m0_wo0_wi0_r0_wa3_1_lut_q = 4'b0110;
            4'b0110 : u0_m0_wo0_wi0_r0_wa3_1_lut_q = 4'b0111;
            4'b0111 : u0_m0_wo0_wi0_r0_wa3_1_lut_q = 4'b1000;
            4'b1000 : u0_m0_wo0_wi0_r0_wa3_1_lut_q = 4'b1001;
            4'b1001 : u0_m0_wo0_wi0_r0_wa3_1_lut_q = 4'b1010;
            4'b1010 : u0_m0_wo0_wi0_r0_wa3_1_lut_q = 4'b1011;
            4'b1011 : u0_m0_wo0_wi0_r0_wa3_1_lut_q = 4'b0000;
            default : u0_m0_wo0_wi0_r0_wa3_1_lut_q = 4'b0001;
        endcase
        // End reserved scope level
    end

    // u0_m0_wo0_wi0_r0_wa3_1(REG,38)@13
    always @ (posedge clk or posedge areset)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_wa3_1_q <= 4'b0111;
        end
        else if (d_u0_m0_wo0_compute_q_13_q == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_wa3_1_q <= u0_m0_wo0_wi0_r0_wa3_1_lut_q;
        end
    end

    // u0_m0_wo0_wi0_r0_memr3(DUALMEM,42)@13
    assign u0_m0_wo0_wi0_r0_memr3_ia = u0_m0_wo0_wi0_r0_memr0_q;
    assign u0_m0_wo0_wi0_r0_memr3_aa = u0_m0_wo0_wi0_r0_wa3_1_q;
    assign u0_m0_wo0_wi0_r0_memr3_ab = u0_m0_wo0_wi0_r0_ra3_count0_lutreg_q;
    altsyncram #(
        .ram_block_type("M9K"),
        .operation_mode("DUAL_PORT"),
        .width_a(17),
        .widthad_a(4),
        .numwords_a(12),
        .width_b(17),
        .widthad_b(4),
        .numwords_b(12),
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
    ) u0_m0_wo0_wi0_r0_memr3_dmem (
        .clocken0(1'b1),
        .clock0(clk),
        .address_a(u0_m0_wo0_wi0_r0_memr3_aa),
        .data_a(u0_m0_wo0_wi0_r0_memr3_ia),
        .wren_a(d_u0_m0_wo0_compute_q_13_q[0]),
        .address_b(u0_m0_wo0_wi0_r0_memr3_ab),
        .q_b(u0_m0_wo0_wi0_r0_memr3_iq),
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
    assign u0_m0_wo0_wi0_r0_memr3_q = u0_m0_wo0_wi0_r0_memr3_iq[16:0];

    // u0_m0_wo0_wi0_r0_ra1_count0(COUNTER,27)@13
    // low=0, high=5, step=1, init=1
    always @ (posedge clk or posedge areset)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_ra1_count0_i <= 3'd1;
            u0_m0_wo0_wi0_r0_ra1_count0_eq <= 1'b0;
        end
        else if (d_u0_m0_wo0_memread_q_13_q == 1'b1)
        begin
            if (u0_m0_wo0_wi0_r0_ra1_count0_i == 3'd4)
            begin
                u0_m0_wo0_wi0_r0_ra1_count0_eq <= 1'b1;
            end
            else
            begin
                u0_m0_wo0_wi0_r0_ra1_count0_eq <= 1'b0;
            end
            if (u0_m0_wo0_wi0_r0_ra1_count0_eq == 1'b1)
            begin
                u0_m0_wo0_wi0_r0_ra1_count0_i <= $unsigned(u0_m0_wo0_wi0_r0_ra1_count0_i) + $unsigned(3'd3);
            end
            else
            begin
                u0_m0_wo0_wi0_r0_ra1_count0_i <= $unsigned(u0_m0_wo0_wi0_r0_ra1_count0_i) + $unsigned(3'd1);
            end
        end
    end
    assign u0_m0_wo0_wi0_r0_ra1_count0_q = u0_m0_wo0_wi0_r0_ra1_count0_i[2:0];

    // u0_m0_wo0_wi0_r0_ra1_count0_lut(LOOKUP,25)@13
    always @(u0_m0_wo0_wi0_r0_ra1_count0_q)
    begin
        // Begin reserved scope level
        unique case (u0_m0_wo0_wi0_r0_ra1_count0_q)
            3'b000 : u0_m0_wo0_wi0_r0_ra1_count0_lut_q = 3'b011;
            3'b001 : u0_m0_wo0_wi0_r0_ra1_count0_lut_q = 3'b100;
            3'b010 : u0_m0_wo0_wi0_r0_ra1_count0_lut_q = 3'b101;
            3'b011 : u0_m0_wo0_wi0_r0_ra1_count0_lut_q = 3'b111;
            3'b100 : u0_m0_wo0_wi0_r0_ra1_count0_lut_q = 3'b000;
            3'b101 : u0_m0_wo0_wi0_r0_ra1_count0_lut_q = 3'b001;
            default : begin
                          // unreachable
                          u0_m0_wo0_wi0_r0_ra1_count0_lut_q = 3'bxxx;
                      end
        endcase
        // End reserved scope level
    end

    // u0_m0_wo0_wi0_r0_ra1_count0_lutreg(REG,26)@13
    always @ (posedge clk or posedge areset)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_ra1_count0_lutreg_q <= 3'b011;
        end
        else if (d_u0_m0_wo0_memread_q_13_q == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_ra1_count0_lutreg_q <= u0_m0_wo0_wi0_r0_ra1_count0_lut_q;
        end
    end

    // d_xIn_0_13(DELAY,69)@10 + 3
    dspba_delay_ver #( .width(17), .depth(3), .reset_kind("ASYNC") )
    d_xIn_0_13 ( .xin(xIn_0), .xout(d_xIn_0_13_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // d_in0_m0_wi0_wo0_assign_id1_q_13(DELAY,73)@10 + 3
    dspba_delay_ver #( .width(1), .depth(3), .reset_kind("ASYNC") )
    d_in0_m0_wi0_wo0_assign_id1_q_13 ( .xin(xIn_v), .xout(d_in0_m0_wi0_wo0_assign_id1_q_13_q), .clk(clk), .aclr(areset), .ena(1'b1) );

    // u0_m0_wo0_wi0_r0_wa0(COUNTER,34)@13
    // low=0, high=7, step=1, init=5
    always @ (posedge clk or posedge areset)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_wa0_i <= 3'd5;
        end
        else if (d_in0_m0_wi0_wo0_assign_id1_q_13_q == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_wa0_i <= $unsigned(u0_m0_wo0_wi0_r0_wa0_i) + $unsigned(3'd1);
        end
    end
    assign u0_m0_wo0_wi0_r0_wa0_q = u0_m0_wo0_wi0_r0_wa0_i[2:0];

    // u0_m0_wo0_wi0_r0_memr0(DUALMEM,39)@13
    assign u0_m0_wo0_wi0_r0_memr0_ia = d_xIn_0_13_q;
    assign u0_m0_wo0_wi0_r0_memr0_aa = u0_m0_wo0_wi0_r0_wa0_q;
    assign u0_m0_wo0_wi0_r0_memr0_ab = u0_m0_wo0_wi0_r0_ra1_count0_lutreg_q;
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

    // u0_m0_wo0_sym_add0(ADD,53)@13 + 1
    assign u0_m0_wo0_sym_add0_a = {{1{u0_m0_wo0_wi0_r0_memr0_q[16]}}, u0_m0_wo0_wi0_r0_memr0_q};
    assign u0_m0_wo0_sym_add0_b = {{1{u0_m0_wo0_wi0_r0_memr3_q[16]}}, u0_m0_wo0_wi0_r0_memr3_q};
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

    // u0_m0_wo0_ca1(COUNTER,43)@12
    // low=0, high=2, step=1, init=0
    always @ (posedge clk or posedge areset)
    begin
        if (areset)
        begin
            u0_m0_wo0_ca1_i <= 2'd0;
            u0_m0_wo0_ca1_eq <= 1'b0;
        end
        else if (u0_m0_wo0_compute_q == 1'b1)
        begin
            if (u0_m0_wo0_ca1_i == 2'd1)
            begin
                u0_m0_wo0_ca1_eq <= 1'b1;
            end
            else
            begin
                u0_m0_wo0_ca1_eq <= 1'b0;
            end
            if (u0_m0_wo0_ca1_eq == 1'b1)
            begin
                u0_m0_wo0_ca1_i <= $unsigned(u0_m0_wo0_ca1_i) + $unsigned(2'd2);
            end
            else
            begin
                u0_m0_wo0_ca1_i <= $unsigned(u0_m0_wo0_ca1_i) + $unsigned(2'd1);
            end
        end
    end
    assign u0_m0_wo0_ca1_q = u0_m0_wo0_ca1_i[1:0];

    // u0_m0_wo0_dec0(LOOKUP,47)@10 + 1
    assign u0_m0_wo0_dec0_c = busIn_write;
    always @ (posedge clk or posedge h_areset)
    begin
        if (h_areset)
        begin
            u0_m0_wo0_dec0_q <= 2'b10;
            u0_m0_wo0_dec0_e <= 1'b0;
        end
        else
        begin
            unique case (busIn_address)
                11'b00000000000 : begin
                                      u0_m0_wo0_dec0_q <= 2'b10;
                                      u0_m0_wo0_dec0_e <= u0_m0_wo0_dec0_c;
                                  end
                11'b00000000001 : begin
                                      u0_m0_wo0_dec0_q <= 2'b01;
                                      u0_m0_wo0_dec0_e <= u0_m0_wo0_dec0_c;
                                  end
                11'b00000000010 : begin
                                      u0_m0_wo0_dec0_q <= 2'b00;
                                      u0_m0_wo0_dec0_e <= u0_m0_wo0_dec0_c;
                                  end
                default : begin
                              u0_m0_wo0_dec0_q <= 2'b10;
                              u0_m0_wo0_dec0_e <= 1'b0;
                          end
            endcase
        end
    end

    // u0_m0_wo0_cm0(DUALMEM,49)@12 + 2
    assign u0_m0_wo0_cm0_ia = d_busIn_writedata_11_q;
    assign u0_m0_wo0_cm0_aa = u0_m0_wo0_dec0_q;
    assign u0_m0_wo0_cm0_ab = u0_m0_wo0_ca1_q;
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

    // u0_m0_wo0_mtree_mult1_1(MULT,56)@14 + 2
    assign u0_m0_wo0_mtree_mult1_1_a0 = u0_m0_wo0_cm0_q;
    assign u0_m0_wo0_mtree_mult1_1_b0 = u0_m0_wo0_sym_add0_q;
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

    // u0_m0_wo0_symSuppress_1_seq(SEQUENCE,54)@12 + 1
    always @ (posedge clk or posedge areset)
    begin
        reg [3:0] u0_m0_wo0_symSuppress_1_seq_c;
        if (areset)
        begin
            u0_m0_wo0_symSuppress_1_seq_c = 4'b0000;
            u0_m0_wo0_symSuppress_1_seq_q <= 1'b0;
            u0_m0_wo0_symSuppress_1_seq_eq <= 1'b0;
        end
        else
        begin
            if (u0_m0_wo0_compute_q == 1'b1)
            begin
                if (u0_m0_wo0_symSuppress_1_seq_c == 4'b0000)
                begin
                    u0_m0_wo0_symSuppress_1_seq_eq <= 1'b1;
                end
                else
                begin
                    u0_m0_wo0_symSuppress_1_seq_eq <= 1'b0;
                end
                if (u0_m0_wo0_symSuppress_1_seq_eq == 1'b1)
                begin
                    u0_m0_wo0_symSuppress_1_seq_c = $signed(u0_m0_wo0_symSuppress_1_seq_c) + $signed(4'd2);
                end
                else
                begin
                    u0_m0_wo0_symSuppress_1_seq_c = $signed(u0_m0_wo0_symSuppress_1_seq_c) - $signed(4'd1);
                end
                u0_m0_wo0_symSuppress_1_seq_q <= u0_m0_wo0_symSuppress_1_seq_c[3:3];
            end
        end
    end

    // u0_m0_wo0_wi0_r0_ra2_count0(COUNTER,30)@13
    // low=0, high=8, step=1, init=1
    always @ (posedge clk or posedge areset)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_ra2_count0_i <= 4'd1;
            u0_m0_wo0_wi0_r0_ra2_count0_eq <= 1'b0;
        end
        else if (d_u0_m0_wo0_memread_q_13_q == 1'b1)
        begin
            if (u0_m0_wo0_wi0_r0_ra2_count0_i == 4'd7)
            begin
                u0_m0_wo0_wi0_r0_ra2_count0_eq <= 1'b1;
            end
            else
            begin
                u0_m0_wo0_wi0_r0_ra2_count0_eq <= 1'b0;
            end
            if (u0_m0_wo0_wi0_r0_ra2_count0_eq == 1'b1)
            begin
                u0_m0_wo0_wi0_r0_ra2_count0_i <= $unsigned(u0_m0_wo0_wi0_r0_ra2_count0_i) + $unsigned(4'd8);
            end
            else
            begin
                u0_m0_wo0_wi0_r0_ra2_count0_i <= $unsigned(u0_m0_wo0_wi0_r0_ra2_count0_i) + $unsigned(4'd1);
            end
        end
    end
    assign u0_m0_wo0_wi0_r0_ra2_count0_q = u0_m0_wo0_wi0_r0_ra2_count0_i[3:0];

    // u0_m0_wo0_wi0_r0_ra2_count0_lut(LOOKUP,28)@13
    always @(u0_m0_wo0_wi0_r0_ra2_count0_q)
    begin
        // Begin reserved scope level
        unique case (u0_m0_wo0_wi0_r0_ra2_count0_q)
            4'b0000 : u0_m0_wo0_wi0_r0_ra2_count0_lut_q = 4'b0011;
            4'b0001 : u0_m0_wo0_wi0_r0_ra2_count0_lut_q = 4'b0010;
            4'b0010 : u0_m0_wo0_wi0_r0_ra2_count0_lut_q = 4'b0001;
            4'b0011 : u0_m0_wo0_wi0_r0_ra2_count0_lut_q = 4'b0111;
            4'b0100 : u0_m0_wo0_wi0_r0_ra2_count0_lut_q = 4'b0110;
            4'b0101 : u0_m0_wo0_wi0_r0_ra2_count0_lut_q = 4'b0101;
            4'b0110 : u0_m0_wo0_wi0_r0_ra2_count0_lut_q = 4'b1011;
            4'b0111 : u0_m0_wo0_wi0_r0_ra2_count0_lut_q = 4'b1010;
            4'b1000 : u0_m0_wo0_wi0_r0_ra2_count0_lut_q = 4'b1001;
            default : begin
                          // unreachable
                          u0_m0_wo0_wi0_r0_ra2_count0_lut_q = 4'bxxxx;
                      end
        endcase
        // End reserved scope level
    end

    // u0_m0_wo0_wi0_r0_ra2_count0_lutreg(REG,29)@13
    always @ (posedge clk or posedge areset)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_ra2_count0_lutreg_q <= 4'b0011;
        end
        else if (d_u0_m0_wo0_memread_q_13_q == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_ra2_count0_lutreg_q <= u0_m0_wo0_wi0_r0_ra2_count0_lut_q;
        end
    end

    // u0_m0_wo0_wi0_r0_wa2(COUNTER,36)@13
    // low=0, high=11, step=1, init=8
    always @ (posedge clk or posedge areset)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_wa2_i <= 4'd8;
            u0_m0_wo0_wi0_r0_wa2_eq <= 1'b0;
        end
        else if (d_in0_m0_wi0_wo0_assign_id1_q_13_q == 1'b1)
        begin
            if (u0_m0_wo0_wi0_r0_wa2_i == 4'd10)
            begin
                u0_m0_wo0_wi0_r0_wa2_eq <= 1'b1;
            end
            else
            begin
                u0_m0_wo0_wi0_r0_wa2_eq <= 1'b0;
            end
            if (u0_m0_wo0_wi0_r0_wa2_eq == 1'b1)
            begin
                u0_m0_wo0_wi0_r0_wa2_i <= $unsigned(u0_m0_wo0_wi0_r0_wa2_i) + $unsigned(4'd5);
            end
            else
            begin
                u0_m0_wo0_wi0_r0_wa2_i <= $unsigned(u0_m0_wo0_wi0_r0_wa2_i) + $unsigned(4'd1);
            end
        end
    end
    assign u0_m0_wo0_wi0_r0_wa2_q = u0_m0_wo0_wi0_r0_wa2_i[3:0];

    // u0_m0_wo0_wi0_r0_memr2(DUALMEM,41)@13
    assign u0_m0_wo0_wi0_r0_memr2_ia = d_xIn_0_13_q;
    assign u0_m0_wo0_wi0_r0_memr2_aa = u0_m0_wo0_wi0_r0_wa2_q;
    assign u0_m0_wo0_wi0_r0_memr2_ab = u0_m0_wo0_wi0_r0_ra2_count0_lutreg_q;
    altsyncram #(
        .ram_block_type("M9K"),
        .operation_mode("DUAL_PORT"),
        .width_a(17),
        .widthad_a(4),
        .numwords_a(12),
        .width_b(17),
        .widthad_b(4),
        .numwords_b(12),
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
    ) u0_m0_wo0_wi0_r0_memr2_dmem (
        .clocken0(1'b1),
        .clock0(clk),
        .address_a(u0_m0_wo0_wi0_r0_memr2_aa),
        .data_a(u0_m0_wo0_wi0_r0_memr2_ia),
        .wren_a(d_in0_m0_wi0_wo0_assign_id1_q_13_q[0]),
        .address_b(u0_m0_wo0_wi0_r0_memr2_ab),
        .q_b(u0_m0_wo0_wi0_r0_memr2_iq),
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
    assign u0_m0_wo0_wi0_r0_memr2_q = u0_m0_wo0_wi0_r0_memr2_iq[16:0];

    // u0_m0_wo0_wi0_r0_wa1(COUNTER,35)@13
    // low=0, high=7, step=1, init=0
    always @ (posedge clk or posedge areset)
    begin
        if (areset)
        begin
            u0_m0_wo0_wi0_r0_wa1_i <= 3'd0;
        end
        else if (d_in0_m0_wi0_wo0_assign_id1_q_13_q == 1'b1)
        begin
            u0_m0_wo0_wi0_r0_wa1_i <= $unsigned(u0_m0_wo0_wi0_r0_wa1_i) + $unsigned(3'd1);
        end
    end
    assign u0_m0_wo0_wi0_r0_wa1_q = u0_m0_wo0_wi0_r0_wa1_i[2:0];

    // u0_m0_wo0_wi0_r0_memr1(DUALMEM,40)@13
    assign u0_m0_wo0_wi0_r0_memr1_ia = d_xIn_0_13_q;
    assign u0_m0_wo0_wi0_r0_memr1_aa = u0_m0_wo0_wi0_r0_wa1_q;
    assign u0_m0_wo0_wi0_r0_memr1_ab = u0_m0_wo0_wi0_r0_ra1_count0_lutreg_q;
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
    ) u0_m0_wo0_wi0_r0_memr1_dmem (
        .clocken0(1'b1),
        .clock0(clk),
        .address_a(u0_m0_wo0_wi0_r0_memr1_aa),
        .data_a(u0_m0_wo0_wi0_r0_memr1_ia),
        .wren_a(d_in0_m0_wi0_wo0_assign_id1_q_13_q[0]),
        .address_b(u0_m0_wo0_wi0_r0_memr1_ab),
        .q_b(u0_m0_wo0_wi0_r0_memr1_iq),
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
    assign u0_m0_wo0_wi0_r0_memr1_q = u0_m0_wo0_wi0_r0_memr1_iq[16:0];

    // u0_m0_wo0_sym_add1(ADD,55)@13 + 1
    assign u0_m0_wo0_sym_add1_a = {{1{u0_m0_wo0_wi0_r0_memr1_q[16]}}, u0_m0_wo0_wi0_r0_memr1_q};
    assign u0_m0_wo0_sym_add1_b = {{1{u0_m0_wo0_wi0_r0_memr2_q[16]}}, u0_m0_wo0_wi0_r0_memr2_q};
    assign u0_m0_wo0_sym_add1_i = u0_m0_wo0_sym_add1_a;
    always @ (posedge clk or posedge areset)
    begin
        if (areset)
        begin
            u0_m0_wo0_sym_add1_o <= 18'b0;
        end
        else
        begin
            if (u0_m0_wo0_symSuppress_1_seq_q == 1'b1)
            begin
                u0_m0_wo0_sym_add1_o <= u0_m0_wo0_sym_add1_i;
            end
            else
            begin
                u0_m0_wo0_sym_add1_o <= $signed(u0_m0_wo0_sym_add1_a) + $signed(u0_m0_wo0_sym_add1_b);
            end
        end
    end
    assign u0_m0_wo0_sym_add1_q = u0_m0_wo0_sym_add1_o[17:0];

    // u0_m0_wo0_dec1(LOOKUP,50)@10 + 1
    assign u0_m0_wo0_dec1_c = busIn_write;
    always @ (posedge clk or posedge h_areset)
    begin
        if (h_areset)
        begin
            u0_m0_wo0_dec1_q <= 2'b01;
            u0_m0_wo0_dec1_e <= 1'b0;
        end
        else
        begin
            unique case (busIn_address)
                11'b00000000100 : begin
                                      u0_m0_wo0_dec1_q <= 2'b01;
                                      u0_m0_wo0_dec1_e <= u0_m0_wo0_dec1_c;
                                  end
                11'b00000000101 : begin
                                      u0_m0_wo0_dec1_q <= 2'b00;
                                      u0_m0_wo0_dec1_e <= u0_m0_wo0_dec1_c;
                                  end
                11'b00000000011 : begin
                                      u0_m0_wo0_dec1_q <= 2'b10;
                                      u0_m0_wo0_dec1_e <= u0_m0_wo0_dec1_c;
                                  end
                default : begin
                              u0_m0_wo0_dec1_q <= 2'b01;
                              u0_m0_wo0_dec1_e <= 1'b0;
                          end
            endcase
        end
    end

    // u0_m0_wo0_cm1(DUALMEM,52)@12 + 2
    assign u0_m0_wo0_cm1_ia = d_busIn_writedata_11_q;
    assign u0_m0_wo0_cm1_aa = u0_m0_wo0_dec1_q;
    assign u0_m0_wo0_cm1_ab = u0_m0_wo0_ca1_q;
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

    // u0_m0_wo0_mtree_mult1_0(MULT,57)@14 + 2
    assign u0_m0_wo0_mtree_mult1_0_a0 = u0_m0_wo0_cm1_q;
    assign u0_m0_wo0_mtree_mult1_0_b0 = u0_m0_wo0_sym_add1_q;
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

    // u0_m0_wo0_mtree_add0_0(ADD,58)@16 + 1
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

    // u0_m0_wo0_accum(ADD,60)@17 + 1
    assign u0_m0_wo0_accum_a = {{2{u0_m0_wo0_mtree_add0_0_q[34]}}, u0_m0_wo0_mtree_add0_0_q};
    assign u0_m0_wo0_accum_b = u0_m0_wo0_accum_q;
    assign u0_m0_wo0_accum_i = u0_m0_wo0_accum_a;
    always @ (posedge clk or posedge areset)
    begin
        if (areset)
        begin
            u0_m0_wo0_accum_o <= 37'b0;
        end
        else if (d_u0_m0_wo0_compute_q_17_q == 1'b1)
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
    assign u0_m0_wo0_accum_q = u0_m0_wo0_accum_o[36:0];

    // GND(CONSTANT,0)@0
    assign GND_q = 1'b0;

    // u0_m0_wo0_oseq(SEQUENCE,61)@16 + 1
    always @ (posedge clk or posedge areset)
    begin
        reg [3:0] u0_m0_wo0_oseq_c;
        if (areset)
        begin
            u0_m0_wo0_oseq_c = 4'b0010;
            u0_m0_wo0_oseq_q <= 1'b0;
            u0_m0_wo0_oseq_eq <= 1'b0;
        end
        else
        begin
            if (d_u0_m0_wo0_compute_q_16_q == 1'b1)
            begin
                if (u0_m0_wo0_oseq_c == 4'b0000)
                begin
                    u0_m0_wo0_oseq_eq <= 1'b1;
                end
                else
                begin
                    u0_m0_wo0_oseq_eq <= 1'b0;
                end
                if (u0_m0_wo0_oseq_eq == 1'b1)
                begin
                    u0_m0_wo0_oseq_c = $signed(u0_m0_wo0_oseq_c) + $signed(4'd2);
                end
                else
                begin
                    u0_m0_wo0_oseq_c = $signed(u0_m0_wo0_oseq_c) - $signed(4'd1);
                end
                u0_m0_wo0_oseq_q <= u0_m0_wo0_oseq_c[3:3];
            end
        end
    end

    // u0_m0_wo0_oseq_gated(LOGICAL,62)@17
    assign u0_m0_wo0_oseq_gated_q = u0_m0_wo0_oseq_q & d_u0_m0_wo0_compute_q_17_q;

    // u0_m0_wo0_oseq_gated_reg(REG,63)@17 + 1
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

    // xOut(PORTOUT,68)@18 + 1
    assign xOut_v = u0_m0_wo0_oseq_gated_reg_q;
    assign xOut_c = {7'b0000000, GND_q};
    assign xOut_0 = u0_m0_wo0_accum_q;

endmodule
