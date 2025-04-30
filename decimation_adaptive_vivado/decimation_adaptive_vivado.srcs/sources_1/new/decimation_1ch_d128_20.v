`ifndef xlConvPkgIncluded
`include "conv_pkg.v"
`endif

`timescale 1 ns / 10 ps
// Generated from Simulink block decimation_1ch_d128_20_struct
module decimation_1ch_d128_20_struct (
  input [1-1:0] rst_n,
  input [16-1:0] sig_in1,
  input [1-1:0] start_filtering,
  input clk_1,
  input ce_1,
  output [1-1:0] data_tvalid1,
  output [1-1:0] data_tvalid2,
  output [16-1:0] sig_out1,
  output [16-1:0] sig_out2,
  output [16-1:0] sig_out3,
  output [16-1:0] sig_out4,
  output [16-1:0] sig_out5,
  output [16-1:0] sig_out6,
  output [16-1:0] sig_out7
);
  wire [33-1:0] shift5_op_net;
  wire [32-1:0] shift6_op_net;
  wire [32-1:0] shift1_op_net;
  wire [32-1:0] shift2_op_net;
  wire [32-1:0] shift_op_net;
  wire [34-1:0] shift3_op_net;
  wire [34-1:0] shift4_op_net;
  wire src_clk_net;
  wire [1-1:0] ffir2_m_axis_data_tvalid_net;
  wire [1-1:0] fir_d20_m_axis_data_tvalid_net;
  wire [1-1:0] rst_n_net;
  wire [16-1:0] sig_in1_net;
  wire [16-1:0] reinterpret4_output_port_net;
  wire [16-1:0] reinterpret5_output_port_net;
  wire [16-1:0] reinterpret7_output_port_net;
  wire [16-1:0] reinterpret2_output_port_net;
  wire [16-1:0] reinterpret1_output_port_net;
  wire [1-1:0] start_filtering_net;
  wire [16-1:0] reinterpret6_output_port_net;
  wire [16-1:0] reinterpret3_output_port_net;
  wire ffir0_s_axis_data_tready_net;
  wire fir_d20_s_axis_data_tready_net;
  wire fir_hb2_m_axis_data_tvalid_net;
  wire fir_hb0_s_axis_data_tready_net;
  wire [34-1:0] ffir0_m_axis_data_tdata_real_net;
  wire ffir1_s_axis_data_tready_net;
  wire ffir1_m_axis_data_tvalid_net;
  wire [34-1:0] ffir1_m_axis_data_tdata_real_net;
  wire ffir0_m_axis_data_tvalid_net;
  wire [32-1:0] fir_d20_m_axis_data_tdata_real_net;
  wire [33-1:0] ffir2_m_axis_data_tdata_real_net;
  wire ffir2_s_axis_data_tready_net;
  wire src_ce_net;
  wire [16-1:0] slice4_y_net;
  wire [16-1:0] slice3_y_net;
  wire [16-1:0] slice2_y_net;
  wire [16-1:0] slice5_y_net;
  wire fir_hb1_m_axis_data_tvalid_net;
  wire [32-1:0] fir_hb2_m_axis_data_tdata_real_net;
  wire [32-1:0] fir_hb1_m_axis_data_tdata_real_net;
  wire [16-1:0] slice1_y_net;
  wire fir_hb2_s_axis_data_tready_net;
  wire [32-1:0] fir_hb0_m_axis_data_tdata_real_net;
  wire fir_hb1_s_axis_data_tready_net;
  wire fir_hb0_m_axis_data_tvalid_net;
  wire [16-1:0] slice_y_net;
  wire [16-1:0] slice6_y_net;
  assign data_tvalid1 = ffir2_m_axis_data_tvalid_net;
  assign data_tvalid2 = fir_d20_m_axis_data_tvalid_net;
  assign rst_n_net = rst_n;
  assign sig_in1_net = sig_in1;
  assign sig_out1 = reinterpret6_output_port_net;
  assign sig_out2 = reinterpret1_output_port_net;
  assign sig_out3 = reinterpret2_output_port_net;
  assign sig_out4 = reinterpret3_output_port_net;
  assign sig_out5 = reinterpret4_output_port_net;
  assign sig_out6 = reinterpret5_output_port_net;
  assign sig_out7 = reinterpret7_output_port_net;
  assign start_filtering_net = start_filtering;
  assign src_clk_net = clk_1;
  assign src_ce_net = ce_1;
  xlfir_compiler_b4ec19fb0f6cccfd0f15540dfe602fc0 ffir0 (
    .s_axis_data_tvalid(fir_hb2_m_axis_data_tvalid_net),
    .s_axis_data_tdata_real(reinterpret3_output_port_net),
    .rst(rst_n_net),
    .src_clk(src_clk_net),
    .src_ce(src_ce_net),
    .clk(src_clk_net),
    .ce(src_ce_net),
    .s_axis_data_tready(ffir0_s_axis_data_tready_net),
    .m_axis_data_tvalid(ffir0_m_axis_data_tvalid_net),
    .m_axis_data_tdata_real(ffir0_m_axis_data_tdata_real_net)
  );
  xlfir_compiler_69d52bcc90e4f66bc097f76055eb2bf1 ffir1 (
    .s_axis_data_tvalid(ffir0_m_axis_data_tvalid_net),
    .s_axis_data_tdata_real(reinterpret4_output_port_net),
    .rst(rst_n_net),
    .src_clk(src_clk_net),
    .src_ce(src_ce_net),
    .clk(src_clk_net),
    .ce(src_ce_net),
    .s_axis_data_tready(ffir1_s_axis_data_tready_net),
    .m_axis_data_tvalid(ffir1_m_axis_data_tvalid_net),
    .m_axis_data_tdata_real(ffir1_m_axis_data_tdata_real_net)
  );
  xlfir_compiler_5b787ef10d5829f6352b09bed33793e0 ffir2 (
    .s_axis_data_tvalid(ffir1_m_axis_data_tvalid_net),
    .s_axis_data_tdata_real(reinterpret5_output_port_net),
    .rst(rst_n_net),
    .src_clk(src_clk_net),
    .src_ce(src_ce_net),
    .clk(src_clk_net),
    .ce(src_ce_net),
    .s_axis_data_tready(ffir2_s_axis_data_tready_net),
    .m_axis_data_tvalid(ffir2_m_axis_data_tvalid_net),
    .m_axis_data_tdata_real(ffir2_m_axis_data_tdata_real_net)
  );
  xlfir_compiler_ef0ad349e76b1da79017eb3c96728cda fir_d20 (
    .s_axis_data_tvalid(ffir2_m_axis_data_tvalid_net),
    .s_axis_data_tdata_real(reinterpret6_output_port_net),
    .rst(rst_n_net),
    .src_clk(src_clk_net),
    .src_ce(src_ce_net),
    .clk(src_clk_net),
    .ce(src_ce_net),
    .s_axis_data_tready(fir_d20_s_axis_data_tready_net),
    .m_axis_data_tvalid(fir_d20_m_axis_data_tvalid_net),
    .m_axis_data_tdata_real(fir_d20_m_axis_data_tdata_real_net)
  );
  xlfir_compiler_f9c9efd1e25e651aa152d05dface442a fir_hb0 (
    .s_axis_data_tvalid(start_filtering_net),
    .s_axis_data_tdata_real(sig_in1_net),
    .rst(rst_n_net),
    .src_clk(src_clk_net),
    .src_ce(src_ce_net),
    .clk(src_clk_net),
    .ce(src_ce_net),
    .s_axis_data_tready(fir_hb0_s_axis_data_tready_net),
    .m_axis_data_tvalid(fir_hb0_m_axis_data_tvalid_net),
    .m_axis_data_tdata_real(fir_hb0_m_axis_data_tdata_real_net)
  );
  xlfir_compiler_9a82e5e007703c8479d42398fa56fb88 fir_hb1 (
    .s_axis_data_tvalid(fir_hb0_m_axis_data_tvalid_net),
    .s_axis_data_tdata_real(reinterpret1_output_port_net),
    .rst(rst_n_net),
    .src_clk(src_clk_net),
    .src_ce(src_ce_net),
    .clk(src_clk_net),
    .ce(src_ce_net),
    .s_axis_data_tready(fir_hb1_s_axis_data_tready_net),
    .m_axis_data_tvalid(fir_hb1_m_axis_data_tvalid_net),
    .m_axis_data_tdata_real(fir_hb1_m_axis_data_tdata_real_net)
  );
  xlfir_compiler_faf7e10399eafd1c17e9e92af92ac2a8 fir_hb2 (
    .s_axis_data_tvalid(fir_hb1_m_axis_data_tvalid_net),
    .s_axis_data_tdata_real(reinterpret2_output_port_net),
    .rst(rst_n_net),
    .src_clk(src_clk_net),
    .src_ce(src_ce_net),
    .clk(src_clk_net),
    .ce(src_ce_net),
    .s_axis_data_tready(fir_hb2_s_axis_data_tready_net),
    .m_axis_data_tvalid(fir_hb2_m_axis_data_tvalid_net),
    .m_axis_data_tdata_real(fir_hb2_m_axis_data_tdata_real_net)
  );
  sysgen_reinterpret_d58924c018 reinterpret1 (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .input_port(slice_y_net),
    .output_port(reinterpret1_output_port_net)
  );
  sysgen_reinterpret_d58924c018 reinterpret2 (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .input_port(slice1_y_net),
    .output_port(reinterpret2_output_port_net)
  );
  sysgen_reinterpret_d58924c018 reinterpret3 (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .input_port(slice2_y_net),
    .output_port(reinterpret3_output_port_net)
  );
  sysgen_reinterpret_d58924c018 reinterpret4 (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .input_port(slice3_y_net),
    .output_port(reinterpret4_output_port_net)
  );
  sysgen_reinterpret_d58924c018 reinterpret5 (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .input_port(slice4_y_net),
    .output_port(reinterpret5_output_port_net)
  );
  sysgen_reinterpret_d58924c018 reinterpret6 (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .input_port(slice5_y_net),
    .output_port(reinterpret6_output_port_net)
  );
  sysgen_reinterpret_d58924c018 reinterpret7 (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .input_port(slice6_y_net),
    .output_port(reinterpret7_output_port_net)
  );
  sysgen_shift_605e31444b shift (
    .clr(1'b0),
    .ip(fir_hb0_m_axis_data_tdata_real_net),
    .clk(src_clk_net),
    .ce(src_ce_net),
    .op(shift_op_net)
  );
  sysgen_shift_605e31444b shift1 (
    .clr(1'b0),
    .ip(fir_hb1_m_axis_data_tdata_real_net),
    .clk(src_clk_net),
    .ce(src_ce_net),
    .op(shift1_op_net)
  );
  sysgen_shift_605e31444b shift2 (
    .clr(1'b0),
    .ip(fir_hb2_m_axis_data_tdata_real_net),
    .clk(src_clk_net),
    .ce(src_ce_net),
    .op(shift2_op_net)
  );
  sysgen_shift_42c486086e shift3 (
    .clr(1'b0),
    .ip(ffir0_m_axis_data_tdata_real_net),
    .clk(src_clk_net),
    .ce(src_ce_net),
    .op(shift3_op_net)
  );
  sysgen_shift_42c486086e shift4 (
    .clr(1'b0),
    .ip(ffir1_m_axis_data_tdata_real_net),
    .clk(src_clk_net),
    .ce(src_ce_net),
    .op(shift4_op_net)
  );
  sysgen_shift_7b2dd710fc shift5 (
    .clr(1'b0),
    .ip(ffir2_m_axis_data_tdata_real_net),
    .clk(src_clk_net),
    .ce(src_ce_net),
    .op(shift5_op_net)
  );
  sysgen_shift_605e31444b shift6 (
    .clr(1'b0),
    .ip(fir_d20_m_axis_data_tdata_real_net),
    .clk(src_clk_net),
    .ce(src_ce_net),
    .op(shift6_op_net)
  );
  decimation_1ch_d128_20_xlslice #(
    .new_lsb(0),
    .new_msb(15),
    .x_width(32),
    .y_width(16)
  )
  slice (
    .x(shift_op_net),
    .y(slice_y_net)
  );
  decimation_1ch_d128_20_xlslice #(
    .new_lsb(0),
    .new_msb(15),
    .x_width(32),
    .y_width(16)
  )
  slice1 (
    .x(shift1_op_net),
    .y(slice1_y_net)
  );
  decimation_1ch_d128_20_xlslice #(
    .new_lsb(0),
    .new_msb(15),
    .x_width(32),
    .y_width(16)
  )
  slice2 (
    .x(shift2_op_net),
    .y(slice2_y_net)
  );
  decimation_1ch_d128_20_xlslice #(
    .new_lsb(0),
    .new_msb(15),
    .x_width(34),
    .y_width(16)
  )
  slice3 (
    .x(shift3_op_net),
    .y(slice3_y_net)
  );
  decimation_1ch_d128_20_xlslice #(
    .new_lsb(0),
    .new_msb(15),
    .x_width(34),
    .y_width(16)
  )
  slice4 (
    .x(shift4_op_net),
    .y(slice4_y_net)
  );
  decimation_1ch_d128_20_xlslice #(
    .new_lsb(0),
    .new_msb(15),
    .x_width(33),
    .y_width(16)
  )
  slice5 (
    .x(shift5_op_net),
    .y(slice5_y_net)
  );
  decimation_1ch_d128_20_xlslice #(
    .new_lsb(0),
    .new_msb(15),
    .x_width(32),
    .y_width(16)
  )
  slice6 (
    .x(shift6_op_net),
    .y(slice6_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block 
module decimation_1ch_d128_20_default_clock_driver (
  input decimation_1ch_d128_20_sysclk,
  input decimation_1ch_d128_20_sysce,
  input decimation_1ch_d128_20_sysclr,
  output decimation_1ch_d128_20_clk1,
  output decimation_1ch_d128_20_ce1
);
  xlclockdriver #(
    .period(1),
    .log_2_period(1)
  )
  clockdriver (
    .sysclk(decimation_1ch_d128_20_sysclk),
    .sysce(decimation_1ch_d128_20_sysce),
    .sysclr(decimation_1ch_d128_20_sysclr),
    .clk(decimation_1ch_d128_20_clk1),
    .ce(decimation_1ch_d128_20_ce1)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block 
(* core_generation_info = "decimation_1ch_d128_20,sysgen_core_2020_2,{,compilation=HDL Netlist,block_icon_display=Default,family=artix7,part=xc7a200t,speed=-2,package=fbg484,synthesis_language=verilog,hdl_library=xil_defaultlib,synthesis_strategy=Vivado Synthesis Defaults,implementation_strategy=Vivado Implementation Defaults,testbench=1,interface_doc=1,ce_clr=0,clock_period=20,system_simulink_period=7.8125e-06,waveform_viewer=0,axilite_interface=0,ip_catalog_plugin=0,hwcosim_burst_mode=0,simulation_time=10,fir_compiler_v7_2=7,reinterpret=7,shift=7,slice=7,}" *)
module decimation_1ch_d128_20 (
  input [1-1:0] rst_n,
  input [16-1:0] sig_in1,
  input [1-1:0] start_filtering,
  input clk,
  output [1-1:0] data_tvalid1,
  output [1-1:0] data_tvalid2,
  output [16-1:0] sig_out1,
  output [16-1:0] sig_out2,
  output [16-1:0] sig_out3,
  output [16-1:0] sig_out4,
  output [16-1:0] sig_out5,
  output [16-1:0] sig_out6,
  output [16-1:0] sig_out7
);
  wire clk_1_net;
  wire ce_1_net;
  decimation_1ch_d128_20_default_clock_driver decimation_1ch_d128_20_default_clock_driver (
    .decimation_1ch_d128_20_sysclk(clk),
    .decimation_1ch_d128_20_sysce(1'b1),
    .decimation_1ch_d128_20_sysclr(1'b0),
    .decimation_1ch_d128_20_clk1(clk_1_net),
    .decimation_1ch_d128_20_ce1(ce_1_net)
  );
  decimation_1ch_d128_20_struct decimation_1ch_d128_20_struct (
    .rst_n(rst_n),
    .sig_in1(sig_in1),
    .start_filtering(start_filtering),
    .clk_1(clk_1_net),
    .ce_1(ce_1_net),
    .data_tvalid1(data_tvalid1),
    .data_tvalid2(data_tvalid2),
    .sig_out1(sig_out1),
    .sig_out2(sig_out2),
    .sig_out3(sig_out3),
    .sig_out4(sig_out4),
    .sig_out5(sig_out5),
    .sig_out6(sig_out6),
    .sig_out7(sig_out7)
  );
endmodule
