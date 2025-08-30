# This is the Run ModelSim file list for 'decimation_filter_FilterSystem'

vlog -sv -quiet $base_dir/decimation_filter/decimation_filter_FilterSystem.sv
vlog -sv -quiet $base_dir/decimation_filter/decimation_filter_FilterSystem.sv
vlog -sv -quiet $base_dir/decimation_filter/decimation_filter_FilterSystem.sv
vlog -sv -quiet $base_dir/decimation_filter/decimation_filter_FilterSystem.sv
source $base_dir/decimation_filter/decimation_filter_FilterSystem_DecimatingFIR1.dspb.do
source $base_dir/decimation_filter/decimation_filter_FilterSystem_DecimatingFIR2.dspb.do
source $base_dir/decimation_filter/decimation_filter_FilterSystem_Scale2.dspb.do
source $base_dir/decimation_filter/decimation_filter_FilterSystem_Scale3.dspb.do
