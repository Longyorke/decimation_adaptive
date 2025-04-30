-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
-- Date        : Wed Apr 30 17:30:12 2025
-- Host        : DESKTOP-98774D5 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/Users/dell/Desktop/xilinx_DLP/decimation_adaptive_vivado/decimation_1ch_d128_20.gen/sources_1/ip/decimation_1ch_d128_20_fir_compiler_v7_2_i4/decimation_1ch_d128_20_fir_compiler_v7_2_i4_stub.vhdl
-- Design      : decimation_1ch_d128_20_fir_compiler_v7_2_i4
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a200tfbg484-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decimation_1ch_d128_20_fir_compiler_v7_2_i4 is
  Port ( 
    aresetn : in STD_LOGIC;
    aclk : in STD_LOGIC;
    aclken : in STD_LOGIC;
    s_axis_data_tvalid : in STD_LOGIC;
    s_axis_data_tready : out STD_LOGIC;
    s_axis_data_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_data_tvalid : out STD_LOGIC;
    m_axis_data_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );

end decimation_1ch_d128_20_fir_compiler_v7_2_i4;

architecture stub of decimation_1ch_d128_20_fir_compiler_v7_2_i4 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "aresetn,aclk,aclken,s_axis_data_tvalid,s_axis_data_tready,s_axis_data_tdata[15:0],m_axis_data_tvalid,m_axis_data_tdata[31:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "fir_compiler_v7_2_15,Vivado 2020.2";
begin
end;
