set_property SRC_FILE_INFO {cfile:g:/EM_LAB/EM_Instrument/TomoTEMR/Num01_code/Filter/decimation_adaptive/decimation_adaptive_vivado/decimation_adaptive_vivado.gen/sources_1/ip/clk_wiz_0/clk_wiz_0.xdc rfile:../decimation_adaptive_vivado.gen/sources_1/ip/clk_wiz_0/clk_wiz_0.xdc id:1 order:EARLY scoped_inst:clk_200M_to_50M_and_100M/inst} [current_design]
current_instance clk_200M_to_50M_and_100M/inst
set_property src_info {type:SCOPED_XDC file:1 line:57 export:INPUT save:INPUT read:READ} [current_design]
set_input_jitter [get_clocks -of_objects [get_ports clk_in_200M]] 0.05
