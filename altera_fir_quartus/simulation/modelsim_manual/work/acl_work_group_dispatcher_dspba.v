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


// This module wraps acl_work_group_dispatcher.

module acl_work_group_dispatcher_dspba
#(
  parameter WIDTH = 32,       // width of all the counters
  parameter NUM_COPIES = 1,   // number of kernel copies to manage
  parameter RUN_FOREVER = 0   // flag for infinitely running kernel
)
(
   input clock,
   input resetn,
   input start,         // Assert to restart the iterators

   // Populated during kernel startup
   input [WIDTH-1:0] num_groups_0,
   input [WIDTH-1:0] num_groups_1,
   input [WIDTH-1:0] num_groups_2,
   input [WIDTH-1:0] local_size_0,
   input [WIDTH-1:0] local_size_1,
   input [WIDTH-1:0] local_size_2,
   
   // Handshaking with iterators for each kernel copy
   input [NUM_COPIES-1:0] stall_in,
   output [NUM_COPIES-1:0] valid_out,
   
   // Export group_id to iterators.
   output [WIDTH-1:0] group_id_out_0,
   output [WIDTH-1:0] group_id_out_1,
   output [WIDTH-1:0] group_id_out_2,
   output [WIDTH-1:0] global_id_base_out_0,
   output [WIDTH-1:0] global_id_base_out_1,
   output [WIDTH-1:0] global_id_base_out_2,
   output start_out,
   
   // High when all groups have been dispatched to id iterators
   output dispatched_all_groups
);

   wire [WIDTH-1:0] num_groups[2:0];
   wire [WIDTH-1:0] local_size[2:0];
   wire [WIDTH-1:0] group_id_out[2:0];
   wire [WIDTH-1:0] global_id_base_out[2:0];

   assign num_groups[0] = num_groups_0;
   assign num_groups[1] = num_groups_1;
   assign num_groups[2] = num_groups_2;
   assign local_size[0] = local_size_0;
   assign local_size[1] = local_size_1;
   assign local_size[2] = local_size_2;
   
   acl_work_group_dispatcher dispatch(
      .clock(clock),
      .resetn(resetn),
      .start(start),         // Assert to restart the iterators

      // Populated during kernel startup
      .num_groups(num_groups),
      .local_size(local_size),
   
      // Handshaking with iterators for each kernel copy
      .stall_in(stall_in),
      .valid_out(valid_out),
   
      // Export group_id to iterators.
      .group_id_out(group_id_out),
      .global_id_base_out(global_id_base_out),
      .start_out(start_out),
   
      // High when all groups have been dispatched to id iterators
      .dispatched_all_groups(dispatched_all_groups)
   );
   defparam dispatch.WIDTH = WIDTH;
   defparam dispatch.NUM_COPIES = NUM_COPIES;
   defparam dispatch.RUN_FOREVER = RUN_FOREVER;
 
   assign group_id_out_0 = group_id_out[0],
          group_id_out_1 = group_id_out[1],
          group_id_out_2 = group_id_out[2],
          global_id_base_out_0 = global_id_base_out[0],
          global_id_base_out_1 = global_id_base_out[1],
          global_id_base_out_2 = global_id_base_out[2];

endmodule

// vim:set filetype=verilog:
