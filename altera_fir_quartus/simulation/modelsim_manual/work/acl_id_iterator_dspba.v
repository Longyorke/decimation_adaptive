// (C) 1992-2018 Intel Corporation.                            
// Intel, the Intel logo, Intel, MegaCore, NIOS II, Quartus and TalkBack words    
// and logos are trademarks of Intel Corporation or its subsidiaries in the U.S.  
// and/or other countries. Other marks and brands may be claimed as the property  
// of others. See Trademarks on intel.com for full list of Intel trademarks or    
// the Trademarks & Brands Names Database (if Intel) or See www.Intel.com/legal (if Altera) 
// Your use of Intel Corporation's design tools, logic functions and other        
// software and tools, and its AMPP partner logic functions, and any output       
// files any of the foregoing (including device programming or simulation         
// files), and any associated documentation or information are expressly subject  
// to the terms and conditions of the Altera Program License Subscription         
// Agreement, Intel MegaCore Function License Agreement, or other applicable      
// license agreement, including, without limitation, that your use is for the     
// sole purpose of programming logic devices manufactured by Intel and sold by    
// Intel or its authorized distributors.  Please refer to the applicable          
// agreement for further details.                                                 


// This wraps acl_id_iterator.

module acl_id_iterator_dspba
#(
  parameter WIDTH = 32,    // width of all the counters
  parameter LOCAL_WIDTH_X = 32,
  parameter LOCAL_WIDTH_Y = 32,
  parameter LOCAL_WIDTH_Z = 32,
  parameter ENABLE_TESSELLATION = 0
)

(
  input clock,
  input resetn,
  input start,
  
  // handshaking with work group dispatcher
  input valid_in,
  output stall_out,
  
  // handshaking with kernel instance
  input stall_in,
  output valid_out,
  
  // comes from group dispatcher
  input [WIDTH-1:0] group_id_in_0,
  input [WIDTH-1:0] group_id_in_1,
  input [WIDTH-1:0] group_id_in_2,
  input [WIDTH-1:0] global_id_base_in_0,
  input [WIDTH-1:0] global_id_base_in_1,
  input [WIDTH-1:0] global_id_base_in_2,
  
  // kernel parameters from the higher level
  input [WIDTH-1:0] local_size_0,
  input [WIDTH-1:0] local_size_1,
  input [WIDTH-1:0] local_size_2,
  input [WIDTH-1:0] global_size_0,
  input [WIDTH-1:0] global_size_1,
  input [WIDTH-1:0] global_size_2,
  
  // actual outputs
  output [WIDTH-1:0] local_id_0,
  output [WIDTH-1:0] local_id_1,
  output [WIDTH-1:0] local_id_2,
  output [WIDTH-1:0] global_id_0,
  output [WIDTH-1:0] global_id_1,
  output [WIDTH-1:0] global_id_2,
  output [WIDTH-1:0] group_id_0,
  output [WIDTH-1:0] group_id_1,
  output [WIDTH-1:0] group_id_2
);
  wire [WIDTH-1:0] local_id[2:0];
  wire [WIDTH-1:0] global_id[2:0];
  wire [WIDTH-1:0] group_id[2:0];

  wire [WIDTH-1:0] group_id_in[2:0];
  wire [WIDTH-1:0] global_id_base_in[2:0];
  wire [WIDTH-1:0] local_size[2:0];
  wire [WIDTH-1:0] global_size[2:0];
  
  assign group_id_in[0] = group_id_in_0;
  assign group_id_in[1] = group_id_in_1;
  assign group_id_in[2] = group_id_in_2;
  assign global_id_base_in[0] = global_id_base_in_0;
  assign global_id_base_in[1] = global_id_base_in_1;
  assign global_id_base_in[2] = global_id_base_in_2;
  assign local_size[0] = local_size_0;
  assign local_size[1] = local_size_1;
  assign local_size[2] = local_size_2;
  assign global_size[0] = global_size_0;
  assign global_size[1] = global_size_1;
  assign global_size[2] = global_size_2;
  
  acl_id_iterator iterator(
    .clock(clock),
    .resetn(resetn),
    .start(start),
  
    // handshaking with work group dispatcher
    .valid_in(valid_in),
    .stall_out(stall_out),
  
    // handshaking with kernel instance
    .stall_in(stall_in),
    .valid_out(valid_out),
  
    // comes from group dispatcher
    .group_id_in(group_id_in),
    .global_id_base_in(global_id_base_in),
  
    // kernel parameters from the higher level
    .local_size(local_size),
    .global_size(global_size),
  
    // actual outputs
    .local_id(local_id),
    .global_id(global_id),
    .group_id(group_id));
  defparam iterator.WIDTH = WIDTH;
  defparam iterator.LOCAL_WIDTH_X = LOCAL_WIDTH_X;
  defparam iterator.LOCAL_WIDTH_Y = LOCAL_WIDTH_Y;
  defparam iterator.LOCAL_WIDTH_Z = LOCAL_WIDTH_Z;
  defparam iterator.ENABLE_TESSELLATION = ENABLE_TESSELLATION;
  
  assign local_id_0 = local_id[0];
  assign local_id_1 = local_id[1];
  assign local_id_2 = local_id[2];
  assign global_id_0 = global_id[0];
  assign global_id_1 = global_id[1];
  assign global_id_2 = global_id[2];
  assign group_id_0 = group_id[0];
  assign group_id_1 = group_id[1];
  assign group_id_2 = group_id[2];
  
endmodule

// vim:set filetype=verilog:

