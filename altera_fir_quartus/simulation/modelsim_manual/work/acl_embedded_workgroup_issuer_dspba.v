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


module acl_embedded_workgroup_issuer_dspba (
  clock, resetn, valid_in, stall_out, valid_entry, stall_entry, valid_exit, stall_exit, workgroup_size, linear_local_id_out,
  hw_wg_id_out, done_hw_wg_id_in, 
  global_id_in_0, global_id_in_1, global_id_in_2,
  local_id_in_0, local_id_in_1, local_id_in_2,
  group_id_in_0, group_id_in_1, group_id_in_2,
  global_id_out_0, global_id_out_1, global_id_out_2,
  local_id_out_0, local_id_out_1, local_id_out_2,
  group_id_out_0, group_id_out_1, group_id_out_2);
  
 parameter MAX_SIMULTANEOUS_WORKGROUPS = 2;    // >0
 parameter MAX_WORKGROUP_SIZE = 2147483648;    // >0
 parameter WORKGROUP_EXIT_ORDER = "fifo";        // fifo|noninterleaved|unknown
 localparam WG_SIZE_BITS = $clog2({1'b0, MAX_WORKGROUP_SIZE} + 1);
 localparam LLID_BITS = (MAX_WORKGROUP_SIZE > 1 ? $clog2(MAX_WORKGROUP_SIZE) : 1);
 localparam WG_ID_BITS = (MAX_SIMULTANEOUS_WORKGROUPS > 1 ? $clog2(MAX_SIMULTANEOUS_WORKGROUPS) : 1);

 input clock;
 input resetn; 

 // Handshake for item entry into function.
 input valid_in; 
 output stall_out; 
  
 // Handshake with entry basic block
 output valid_entry; 
 input stall_entry;

 // Observe threads exiting the function .
 // This is asserted when items are ready to be retired from the workgroup.
 input valid_exit;
 // This is asserted when downstream is not ready to retire an item from
 // the workgroup.
 input stall_exit; 

 // Need workgroup_size to know when one workgroup ends
 // and another begins.
 input [31:0] workgroup_size;

 // Linearized local id. In range of [0, workgroup_size - 1].
 output [31:0] linear_local_id_out;

 // Hardware work-group id. In range of [0, MAX_SIMULTANEOUS_WORKGROUPS - 1].
 output [31:0] hw_wg_id_out;

 // The hardware work-group id of the work-group that is exiting.
 input [31:0] done_hw_wg_id_in;

 // Pass though global_id, local_id and group_id.
 input [31:0] global_id_in_0;
 input [31:0] global_id_in_1;
 input [31:0] global_id_in_2;
 input [31:0] local_id_in_0;
 input [31:0] local_id_in_1;
 input [31:0] local_id_in_2;
 input [31:0] group_id_in_0;
 input [31:0] group_id_in_1;
 input [31:0] group_id_in_2;
 output [31:0] global_id_out_0;
 output [31:0] global_id_out_1;
 output [31:0] global_id_out_2;
 output [31:0] local_id_out_0;
 output [31:0] local_id_out_1;
 output [31:0] local_id_out_2;
 output [31:0] group_id_out_0;
 output [31:0] group_id_out_1;
 output [31:0] group_id_out_2;

 logic [31:0] temp_global_id_in[2:0];
 logic [31:0] temp_local_id_in[2:0];
 logic [31:0] temp_group_id_in[2:0];
 logic [31:0] temp_global_id_out[2:0];
 logic [31:0] temp_local_id_out[2:0];
 logic [31:0] temp_group_id_out[2:0];
 logic [WG_ID_BITS - 1:0] temp_hw_wg_id_out;
 logic [WG_ID_BITS - 1:0] temp_done_hw_wg_id_in;
 logic [LLID_BITS - 1:0] temp_linear_local_id_out;
 logic [WG_SIZE_BITS - 1:0] temp_workgroup_size;


 assign temp_done_hw_wg_id_in = done_hw_wg_id_in[WG_ID_BITS - 1:0];
 assign temp_workgroup_size = workgroup_size[WG_SIZE_BITS - 1:0];
 
 assign temp_global_id_in[0] = global_id_in_0;
 assign temp_global_id_in[1] = global_id_in_1;
 assign temp_global_id_in[2] = global_id_in_2;
 assign temp_local_id_in[0] = local_id_in_0;
 assign temp_local_id_in[1] = local_id_in_1;
 assign temp_local_id_in[2] = local_id_in_2;
 assign temp_group_id_in[0] = group_id_in_0;
 assign temp_group_id_in[1] = group_id_in_1;
 assign temp_group_id_in[2] = group_id_in_2;
  
 acl_embedded_workgroup_issuer issuer_core(
   .clock(clock), 
   .resetn(resetn), 
   .valid_in(valid_in), 
   .stall_out(stall_out), 
   .valid_entry(valid_entry), 
   .stall_entry(stall_entry),
   .valid_exit(valid_exit), 
   .stall_exit(stall_exit), 
   .workgroup_size(temp_workgroup_size), 
   .linear_local_id_out(temp_linear_local_id_out),
   .hw_wg_id_out(temp_hw_wg_id_out),
   .done_hw_wg_id_in(temp_done_hw_wg_id_in),
   .global_id_in(temp_global_id_in),
   .local_id_in(temp_local_id_in),
   .group_id_in(temp_group_id_in),
   .global_id_out(temp_global_id_out),
   .local_id_out(temp_local_id_out),
   .group_id_out(temp_group_id_out));
   defparam issuer_core.MAX_SIMULTANEOUS_WORKGROUPS = MAX_SIMULTANEOUS_WORKGROUPS;
   defparam issuer_core.MAX_WORKGROUP_SIZE = MAX_WORKGROUP_SIZE;
   defparam issuer_core.WORKGROUP_EXIT_ORDER = WORKGROUP_EXIT_ORDER;
   
  assign global_id_out_0 = temp_global_id_out[0];
  assign global_id_out_1 = temp_global_id_out[1];
  assign global_id_out_2 = temp_global_id_out[2];
  assign local_id_out_0 = temp_local_id_out[0];
  assign local_id_out_1 = temp_local_id_out[1];
  assign local_id_out_2 = temp_local_id_out[2];
  assign group_id_out_0 = temp_group_id_out[0];
  assign group_id_out_1 = temp_group_id_out[1];
  assign group_id_out_2 = temp_group_id_out[2];
  
  generate
    if (WG_ID_BITS < 32)
    begin
      assign hw_wg_id_out = {{{32-WG_ID_BITS}{1'b0}}, temp_hw_wg_id_out}; 
    end
    else
    begin
      assign hw_wg_id_out = temp_hw_wg_id_out; 
    end
    if (LLID_BITS < 32)
    begin
      assign linear_local_id_out = {{{32-LLID_BITS}{1'b0}}, temp_linear_local_id_out}; 
    end
    else
    begin
      assign linear_local_id_out = temp_linear_local_id_out; 
    end    
  endgenerate

endmodule

