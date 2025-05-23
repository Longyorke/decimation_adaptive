
//------------------------------------------------------------------------------
// (c) Copyright 2014 Xilinx, Inc. All rights reserved.
//
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
//
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
//
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
//
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
//------------------------------------------------------------------------------ 
//
// C Model configuration for the "decimation_1ch_d128_20_fir_compiler_v7_2_i3" instance.
//
//------------------------------------------------------------------------------
//
// coefficients: 0.00588483999598724,0,-0.0489043875602826,0,0.293019547665653,0.5,0.293019547665653,0,-0.0489043875602826,0,0.00588483999598724
// chanpats: 173
// name: decimation_1ch_d128_20_fir_compiler_v7_2_i3
// filter_type: 2
// rate_change: 0
// interp_rate: 1
// decim_rate: 20
// zero_pack_factor: 1
// coeff_padding: 14
// num_coeffs: 11
// coeff_sets: 1
// reloadable: 0
// is_halfband: 0
// quantization: 1
// coeff_width: 16
// coeff_fract_width: 15
// chan_seq: 0
// num_channels: 1
// num_paths: 1
// data_width: 16
// data_fract_width: 0
// output_rounding_mode: 0
// output_width: 32
// output_fract_width: 15
// config_method: 0

const double decimation_1ch_d128_20_fir_compiler_v7_2_i3_coefficients[11] = {0.00588483999598724,0,-0.0489043875602826,0,0.293019547665653,0.5,0.293019547665653,0,-0.0489043875602826,0,0.00588483999598724};

const xip_fir_v7_2_pattern decimation_1ch_d128_20_fir_compiler_v7_2_i3_chanpats[1] = {P_BASIC};

static xip_fir_v7_2_config gen_decimation_1ch_d128_20_fir_compiler_v7_2_i3_config() {
  xip_fir_v7_2_config config;
  config.name                = "decimation_1ch_d128_20_fir_compiler_v7_2_i3";
  config.filter_type         = 2;
  config.rate_change         = XIP_FIR_INTEGER_RATE;
  config.interp_rate         = 1;
  config.decim_rate          = 20;
  config.zero_pack_factor    = 1;
  config.coeff               = &decimation_1ch_d128_20_fir_compiler_v7_2_i3_coefficients[0];
  config.coeff_padding       = 14;
  config.num_coeffs          = 11;
  config.coeff_sets          = 1;
  config.reloadable          = 0;
  config.is_halfband         = 0;
  config.quantization        = XIP_FIR_QUANTIZED_ONLY;
  config.coeff_width         = 16;
  config.coeff_fract_width   = 15;
  config.chan_seq            = XIP_FIR_BASIC_CHAN_SEQ;
  config.num_channels        = 1;
  config.init_pattern        = decimation_1ch_d128_20_fir_compiler_v7_2_i3_chanpats[0];
  config.num_paths           = 1;
  config.data_width          = 16;
  config.data_fract_width    = 0;
  config.output_rounding_mode= XIP_FIR_FULL_PRECISION;
  config.output_width        = 32;
  config.output_fract_width  = 15,
  config.config_method       = XIP_FIR_CONFIG_SINGLE;
  return config;
}

const xip_fir_v7_2_config decimation_1ch_d128_20_fir_compiler_v7_2_i3_config = gen_decimation_1ch_d128_20_fir_compiler_v7_2_i3_config();

