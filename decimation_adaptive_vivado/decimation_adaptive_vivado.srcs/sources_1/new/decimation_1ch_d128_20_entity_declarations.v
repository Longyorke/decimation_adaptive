`include "conv_pkg.v"
`timescale 1 ns / 10 ps
module sysgen_reinterpret_d58924c018 (
  input [(16 - 1):0] input_port,
  output [(16 - 1):0] output_port,
  input clk,
  input ce,
  input clr);
  wire [(16 - 1):0] input_port_1_40;
  wire signed [(16 - 1):0] output_port_5_5_force;
  assign input_port_1_40 = input_port;
  assign output_port_5_5_force = input_port_1_40;
  assign output_port = output_port_5_5_force;
endmodule
`timescale 1 ns / 10 ps
module sysgen_shift_605e31444b (
  input [(32 - 1):0] ip,
  output [(32 - 1):0] op,
  input clk,
  input ce,
  input clr);
  wire signed [(32 - 1):0] ip_1_23;
  localparam signed [(32 - 1):0] const_value = 32'sb00000000000000000000000000000000;
  reg signed [(32 - 1):0] op_mem_46_20[0:(1 - 1)];
  initial
    begin
      op_mem_46_20[0] = 32'b00000000000000000000000000000000;
    end
  wire signed [(32 - 1):0] op_mem_46_20_front_din;
  wire signed [(32 - 1):0] op_mem_46_20_back;
  wire op_mem_46_20_push_front_pop_back_en;
  localparam [(1 - 1):0] const_value_x_000000 = 1'b1;
  wire signed [(32 - 1):0] cast_internal_ip_36_3_convert;
  assign ip_1_23 = ip;
  assign op_mem_46_20_back = op_mem_46_20[0];
  always @(posedge clk)
    begin:proc_op_mem_46_20
      integer i;
      if (((ce == 1'b1) && (op_mem_46_20_push_front_pop_back_en == 1'b1)))
        begin
          op_mem_46_20[0] <= op_mem_46_20_front_din;
        end
    end
  assign cast_internal_ip_36_3_convert = {{15{ip_1_23[31]}}, ip_1_23[31:15]};
  assign op_mem_46_20_push_front_pop_back_en = 1'b0;
  assign op = cast_internal_ip_36_3_convert;
endmodule
`timescale 1 ns / 10 ps
module sysgen_shift_42c486086e (
  input [(34 - 1):0] ip,
  output [(34 - 1):0] op,
  input clk,
  input ce,
  input clr);
  wire signed [(34 - 1):0] ip_1_23;
  localparam signed [(34 - 1):0] const_value = 34'sb0000000000000000000000000000000000;
  reg signed [(34 - 1):0] op_mem_46_20[0:(1 - 1)];
  initial
    begin
      op_mem_46_20[0] = 34'b0000000000000000000000000000000000;
    end
  wire signed [(34 - 1):0] op_mem_46_20_front_din;
  wire signed [(34 - 1):0] op_mem_46_20_back;
  wire op_mem_46_20_push_front_pop_back_en;
  localparam [(1 - 1):0] const_value_x_000000 = 1'b1;
  wire signed [(34 - 1):0] cast_internal_ip_36_3_convert;
  assign ip_1_23 = ip;
  assign op_mem_46_20_back = op_mem_46_20[0];
  always @(posedge clk)
    begin:proc_op_mem_46_20
      integer i;
      if (((ce == 1'b1) && (op_mem_46_20_push_front_pop_back_en == 1'b1)))
        begin
          op_mem_46_20[0] <= op_mem_46_20_front_din;
        end
    end
  assign cast_internal_ip_36_3_convert = {{17{ip_1_23[33]}}, ip_1_23[33:17]};
  assign op_mem_46_20_push_front_pop_back_en = 1'b0;
  assign op = cast_internal_ip_36_3_convert;
endmodule
`timescale 1 ns / 10 ps
module sysgen_shift_7b2dd710fc (
  input [(33 - 1):0] ip,
  output [(33 - 1):0] op,
  input clk,
  input ce,
  input clr);
  wire signed [(33 - 1):0] ip_1_23;
  localparam signed [(33 - 1):0] const_value = 33'sb000000000000000000000000000000000;
  reg signed [(33 - 1):0] op_mem_46_20[0:(1 - 1)];
  initial
    begin
      op_mem_46_20[0] = 33'b000000000000000000000000000000000;
    end
  wire signed [(33 - 1):0] op_mem_46_20_front_din;
  wire signed [(33 - 1):0] op_mem_46_20_back;
  wire op_mem_46_20_push_front_pop_back_en;
  localparam [(1 - 1):0] const_value_x_000000 = 1'b1;
  wire signed [(33 - 1):0] cast_internal_ip_36_3_convert;
  assign ip_1_23 = ip;
  assign op_mem_46_20_back = op_mem_46_20[0];
  always @(posedge clk)
    begin:proc_op_mem_46_20
      integer i;
      if (((ce == 1'b1) && (op_mem_46_20_push_front_pop_back_en == 1'b1)))
        begin
          op_mem_46_20[0] <= op_mem_46_20_front_din;
        end
    end
  assign cast_internal_ip_36_3_convert = {{15{ip_1_23[32]}}, ip_1_23[32:15]};
  assign op_mem_46_20_push_front_pop_back_en = 1'b0;
  assign op = cast_internal_ip_36_3_convert;
endmodule
`timescale 1 ns / 10 ps

module  decimation_1ch_d128_20_xlslice  (x, y);

//Parameter Definitions
parameter new_msb= 9;
parameter new_lsb= 1;
parameter x_width= 16;
parameter y_width= 8;

//Port Declartions
input [x_width-1:0] x;
output [y_width-1:0] y;

assign y = x[new_msb:new_lsb];

endmodule

`timescale 1 ns / 10 ps
module  xlfir_compiler_b4ec19fb0f6cccfd0f15540dfe602fc0 (ce,clk,m_axis_data_tdata_real,m_axis_data_tvalid,rst,s_axis_data_tdata_real,s_axis_data_tready,s_axis_data_tvalid,src_ce,src_clk);

input ce;
input clk;
output[33:0] m_axis_data_tdata_real;
output m_axis_data_tvalid;
input rst;
input[15:0] s_axis_data_tdata_real;
output s_axis_data_tready;
input s_axis_data_tvalid;
input src_ce;
input src_clk;
wire aresetn_net;
wire[39:0] m_axis_data_tdata_net;
wire[15:0] s_axis_data_tdata_net;
  assign aresetn_net = rst | (~ ce);
  assign m_axis_data_tdata_real = m_axis_data_tdata_net[33 : 0];
  assign s_axis_data_tdata_net[15 : 0] = s_axis_data_tdata_real;
  decimation_1ch_d128_20_fir_compiler_v7_2_i0 decimation_1ch_d128_20_fir_compiler_v7_2_i0_instance(
      .aclk(clk),
      .aclken(ce),
      .aresetn(aresetn_net),
      .m_axis_data_tdata(m_axis_data_tdata_net),
      .m_axis_data_tvalid(m_axis_data_tvalid),
      .s_axis_data_tdata(s_axis_data_tdata_net),
      .s_axis_data_tready(s_axis_data_tready),
      .s_axis_data_tvalid(s_axis_data_tvalid)
    );

 endmodule



`timescale 1 ns / 10 ps
module  xlfir_compiler_69d52bcc90e4f66bc097f76055eb2bf1 (ce,clk,m_axis_data_tdata_real,m_axis_data_tvalid,rst,s_axis_data_tdata_real,s_axis_data_tready,s_axis_data_tvalid,src_ce,src_clk);

input ce;
input clk;
output[33:0] m_axis_data_tdata_real;
output m_axis_data_tvalid;
input rst;
input[15:0] s_axis_data_tdata_real;
output s_axis_data_tready;
input s_axis_data_tvalid;
input src_ce;
input src_clk;
wire aresetn_net;
wire[39:0] m_axis_data_tdata_net;
wire[15:0] s_axis_data_tdata_net;
  assign aresetn_net = rst | (~ ce);
  assign m_axis_data_tdata_real = m_axis_data_tdata_net[33 : 0];
  assign s_axis_data_tdata_net[15 : 0] = s_axis_data_tdata_real;
  decimation_1ch_d128_20_fir_compiler_v7_2_i1 decimation_1ch_d128_20_fir_compiler_v7_2_i1_instance(
      .aclk(clk),
      .aclken(ce),
      .aresetn(aresetn_net),
      .m_axis_data_tdata(m_axis_data_tdata_net),
      .m_axis_data_tvalid(m_axis_data_tvalid),
      .s_axis_data_tdata(s_axis_data_tdata_net),
      .s_axis_data_tready(s_axis_data_tready),
      .s_axis_data_tvalid(s_axis_data_tvalid)
    );

 endmodule



`timescale 1 ns / 10 ps
module  xlfir_compiler_5b787ef10d5829f6352b09bed33793e0 (ce,clk,m_axis_data_tdata_real,m_axis_data_tvalid,rst,s_axis_data_tdata_real,s_axis_data_tready,s_axis_data_tvalid,src_ce,src_clk);

input ce;
input clk;
output[32:0] m_axis_data_tdata_real;
output m_axis_data_tvalid;
input rst;
input[15:0] s_axis_data_tdata_real;
output s_axis_data_tready;
input s_axis_data_tvalid;
input src_ce;
input src_clk;
wire aresetn_net;
wire[39:0] m_axis_data_tdata_net;
wire[15:0] s_axis_data_tdata_net;
  assign aresetn_net = rst | (~ ce);
  assign m_axis_data_tdata_real = m_axis_data_tdata_net[32 : 0];
  assign s_axis_data_tdata_net[15 : 0] = s_axis_data_tdata_real;
  decimation_1ch_d128_20_fir_compiler_v7_2_i2 decimation_1ch_d128_20_fir_compiler_v7_2_i2_instance(
      .aclk(clk),
      .aclken(ce),
      .aresetn(aresetn_net),
      .m_axis_data_tdata(m_axis_data_tdata_net),
      .m_axis_data_tvalid(m_axis_data_tvalid),
      .s_axis_data_tdata(s_axis_data_tdata_net),
      .s_axis_data_tready(s_axis_data_tready),
      .s_axis_data_tvalid(s_axis_data_tvalid)
    );

 endmodule



`timescale 1 ns / 10 ps
module  xlfir_compiler_ef0ad349e76b1da79017eb3c96728cda (ce,clk,m_axis_data_tdata_real,m_axis_data_tvalid,rst,s_axis_data_tdata_real,s_axis_data_tready,s_axis_data_tvalid,src_ce,src_clk);

input ce;
input clk;
output[31:0] m_axis_data_tdata_real;
output m_axis_data_tvalid;
input rst;
input[15:0] s_axis_data_tdata_real;
output s_axis_data_tready;
input s_axis_data_tvalid;
input src_ce;
input src_clk;
wire aresetn_net;
wire[31:0] m_axis_data_tdata_net;
wire[15:0] s_axis_data_tdata_net;
  assign aresetn_net = rst | (~ ce);
  assign m_axis_data_tdata_real = m_axis_data_tdata_net[31 : 0];
  assign s_axis_data_tdata_net[15 : 0] = s_axis_data_tdata_real;
  decimation_1ch_d128_20_fir_compiler_v7_2_i3 decimation_1ch_d128_20_fir_compiler_v7_2_i3_instance(
      .aclk(clk),
      .aclken(ce),
      .aresetn(aresetn_net),
      .m_axis_data_tdata(m_axis_data_tdata_net),
      .m_axis_data_tvalid(m_axis_data_tvalid),
      .s_axis_data_tdata(s_axis_data_tdata_net),
      .s_axis_data_tready(s_axis_data_tready),
      .s_axis_data_tvalid(s_axis_data_tvalid)
    );

 endmodule



`timescale 1 ns / 10 ps
module  xlfir_compiler_f9c9efd1e25e651aa152d05dface442a (ce,clk,m_axis_data_tdata_real,m_axis_data_tvalid,rst,s_axis_data_tdata_real,s_axis_data_tready,s_axis_data_tvalid,src_ce,src_clk);

input ce;
input clk;
output[31:0] m_axis_data_tdata_real;
output m_axis_data_tvalid;
input rst;
input[15:0] s_axis_data_tdata_real;
output s_axis_data_tready;
input s_axis_data_tvalid;
input src_ce;
input src_clk;
wire aresetn_net;
wire[31:0] m_axis_data_tdata_net;
wire[15:0] s_axis_data_tdata_net;
  assign aresetn_net = rst | (~ ce);
  assign m_axis_data_tdata_real = m_axis_data_tdata_net[31 : 0];
  assign s_axis_data_tdata_net[15 : 0] = s_axis_data_tdata_real;
  decimation_1ch_d128_20_fir_compiler_v7_2_i4 decimation_1ch_d128_20_fir_compiler_v7_2_i4_instance(
      .aclk(clk),
      .aclken(ce),
      .aresetn(aresetn_net),
      .m_axis_data_tdata(m_axis_data_tdata_net),
      .m_axis_data_tvalid(m_axis_data_tvalid),
      .s_axis_data_tdata(s_axis_data_tdata_net),
      .s_axis_data_tready(s_axis_data_tready),
      .s_axis_data_tvalid(s_axis_data_tvalid)
    );

 endmodule



`timescale 1 ns / 10 ps
module  xlfir_compiler_9a82e5e007703c8479d42398fa56fb88 (ce,clk,m_axis_data_tdata_real,m_axis_data_tvalid,rst,s_axis_data_tdata_real,s_axis_data_tready,s_axis_data_tvalid,src_ce,src_clk);

input ce;
input clk;
output[31:0] m_axis_data_tdata_real;
output m_axis_data_tvalid;
input rst;
input[15:0] s_axis_data_tdata_real;
output s_axis_data_tready;
input s_axis_data_tvalid;
input src_ce;
input src_clk;
wire aresetn_net;
wire[31:0] m_axis_data_tdata_net;
wire[15:0] s_axis_data_tdata_net;
  assign aresetn_net = rst | (~ ce);
  assign m_axis_data_tdata_real = m_axis_data_tdata_net[31 : 0];
  assign s_axis_data_tdata_net[15 : 0] = s_axis_data_tdata_real;
  decimation_1ch_d128_20_fir_compiler_v7_2_i5 decimation_1ch_d128_20_fir_compiler_v7_2_i5_instance(
      .aclk(clk),
      .aclken(ce),
      .aresetn(aresetn_net),
      .m_axis_data_tdata(m_axis_data_tdata_net),
      .m_axis_data_tvalid(m_axis_data_tvalid),
      .s_axis_data_tdata(s_axis_data_tdata_net),
      .s_axis_data_tready(s_axis_data_tready),
      .s_axis_data_tvalid(s_axis_data_tvalid)
    );

 endmodule



`timescale 1 ns / 10 ps
module  xlfir_compiler_faf7e10399eafd1c17e9e92af92ac2a8 (ce,clk,m_axis_data_tdata_real,m_axis_data_tvalid,rst,s_axis_data_tdata_real,s_axis_data_tready,s_axis_data_tvalid,src_ce,src_clk);

input ce;
input clk;
output[31:0] m_axis_data_tdata_real;
output m_axis_data_tvalid;
input rst;
input[15:0] s_axis_data_tdata_real;
output s_axis_data_tready;
input s_axis_data_tvalid;
input src_ce;
input src_clk;
wire aresetn_net;
wire[31:0] m_axis_data_tdata_net;
wire[15:0] s_axis_data_tdata_net;
  assign aresetn_net = rst | (~ ce);
  assign m_axis_data_tdata_real = m_axis_data_tdata_net[31 : 0];
  assign s_axis_data_tdata_net[15 : 0] = s_axis_data_tdata_real;
  decimation_1ch_d128_20_fir_compiler_v7_2_i6 decimation_1ch_d128_20_fir_compiler_v7_2_i6_instance(
      .aclk(clk),
      .aclken(ce),
      .aresetn(aresetn_net),
      .m_axis_data_tdata(m_axis_data_tdata_net),
      .m_axis_data_tvalid(m_axis_data_tvalid),
      .s_axis_data_tdata(s_axis_data_tdata_net),
      .s_axis_data_tready(s_axis_data_tready),
      .s_axis_data_tvalid(s_axis_data_tvalid)
    );

 endmodule



