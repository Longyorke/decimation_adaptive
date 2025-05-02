// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Fri May  2 19:10:19 2025
// Host        : DESKTOP-98774D5 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               f:/EM_LAB/EM_Instrument/TEMR-3S/Num01_code/Filter/decimation_adaptive/decimation_adaptive_vivado/decimation_adaptive_vivado.gen/sources_1/ip/clk_wiz_0/clk_wiz_0_stub.v
// Design      : clk_wiz_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a200tfbg484-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module clk_wiz_0(clk_out_50M, resetn, locked, clk_in_200M)
/* synthesis syn_black_box black_box_pad_pin="clk_out_50M,resetn,locked,clk_in_200M" */;
  output clk_out_50M;
  input resetn;
  output locked;
  input clk_in_200M;
endmodule
