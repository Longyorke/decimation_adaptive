transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+G:/EM_LAB/EM_Instrument/TEMR-3S/Num01_code/Filter/altera_fir/rtl/decimation_filter {G:/EM_LAB/EM_Instrument/TEMR-3S/Num01_code/Filter/altera_fir/rtl/decimation_filter/decimation_filter_FilterSystem.sv}
vlog -sv -work work +incdir+G:/EM_LAB/EM_Instrument/TEMR-3S/Num01_code/Filter/altera_fir/rtl/decimation_filter {G:/EM_LAB/EM_Instrument/TEMR-3S/Num01_code/Filter/altera_fir/rtl/decimation_filter/decimation_filter_FilterSystem_DecimatingFIR1.sv}
vlog -sv -work work +incdir+G:/EM_LAB/EM_Instrument/TEMR-3S/Num01_code/Filter/altera_fir/rtl/decimation_filter {G:/EM_LAB/EM_Instrument/TEMR-3S/Num01_code/Filter/altera_fir/rtl/decimation_filter/decimation_filter_FilterSystem_DecimatingFIR2.sv}
vlog -sv -work work +incdir+G:/EM_LAB/EM_Instrument/TEMR-3S/Num01_code/Filter/altera_fir/rtl/decimation_filter {G:/EM_LAB/EM_Instrument/TEMR-3S/Num01_code/Filter/altera_fir/rtl/decimation_filter/decimation_filter_FilterSystem_Scale2.sv}
vlog -sv -work work +incdir+G:/EM_LAB/EM_Instrument/TEMR-3S/Num01_code/Filter/altera_fir/rtl/decimation_filter {G:/EM_LAB/EM_Instrument/TEMR-3S/Num01_code/Filter/altera_fir/rtl/decimation_filter/decimation_filter_FilterSystem_Scale3.sv}
vlog -sv -work work +incdir+e:/software/intelfpga/18.1/quartus/dspba/backend/Libraries/sv/base {e:/software/intelfpga/18.1/quartus/dspba/backend/Libraries/sv/base/dspba_library_ver.sv}

vcom -93 -work work {G:/EM_LAB/EM_Instrument/TEMR-3S/Num01_code/Filter/altera_fir/rtl/decimation_filter/decimation_filter_FilterSystem_atb.vhd}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L fiftyfivenm_ver -L rtl_work -L work -voptargs="+acc"  decimation_filter_FilterSystem_atb

add wave *
view structure
view signals
run -all
