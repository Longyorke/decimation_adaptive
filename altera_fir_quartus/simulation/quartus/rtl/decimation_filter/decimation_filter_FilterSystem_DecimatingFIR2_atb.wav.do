onerror {resume}

# obtain Modelsim version and extract the NN.Nc part after vsim
quietly set vsim_ver [regexp -inline {vsim (\d+\.\d+)(\w?)} [vsim -version]]
quietly set has_fixpt_radix 0
if {[lindex $vsim_ver 1] == 10.2} {
    if {[lindex $vsim_ver 2] >= "d"} {
        quietly set has_fixpt_radix 1
    }
} elseif {[lindex $vsim_ver 1] > 10.2} {
    quietly set has_fixpt_radix 1
}

proc add_fixpt_wave {name width frac_width signed} {
    global has_fixpt_radix
    if {$frac_width > 0 && $has_fixpt_radix} {
        set type "[string index $signed 0]fix${width}_En${frac_width}"
        if {[lsearch [radix names] $type] < 0} {
            if {$signed == "signed"} {
                radix define $type -fixed -signed -fraction $frac_width
            } else {
                radix define $type -fixed -fraction $frac_width
            }
        }
        add wave -noupdate -format Literal -radix $type $name
    } else {
        add wave -noupdate -format Literal -radix $signed $name
    }
}

add wave -noupdate -divider {Input Ports}
add wave -noupdate -format Logic /decimation_filter_FilterSystem_DecimatingFIR2_atb/dut/clk
add wave -noupdate -format Logic /decimation_filter_FilterSystem_DecimatingFIR2_atb/dut/areset
add wave -noupdate -format Logic /decimation_filter_FilterSystem_DecimatingFIR2_atb/dut/h_areset
add wave -noupdate -format Logical /decimation_filter_FilterSystem_DecimatingFIR2_atb/sim/xIn_v_stm
add_fixpt_wave /decimation_filter_FilterSystem_DecimatingFIR2_atb/sim/xIn_c_stm 8 0 signed
add_fixpt_wave /decimation_filter_FilterSystem_DecimatingFIR2_atb/sim/xIn_0_stm 17 0 signed
add wave -noupdate -divider {Output Ports}
add wave -noupdate -format Logical /decimation_filter_FilterSystem_DecimatingFIR2_atb/dut/xOut_v
add wave -noupdate -format Logical /decimation_filter_FilterSystem_DecimatingFIR2_atb/sim/xOut_v_stm
add_fixpt_wave /decimation_filter_FilterSystem_DecimatingFIR2_atb/dut/xOut_c 8 0 unsigned
add_fixpt_wave /decimation_filter_FilterSystem_DecimatingFIR2_atb/sim/xOut_c_stm 8 0 unsigned
add_fixpt_wave /decimation_filter_FilterSystem_DecimatingFIR2_atb/dut/xOut_0 38 0 signed
add_fixpt_wave /decimation_filter_FilterSystem_DecimatingFIR2_atb/sim/xOut_0_stm 38 0 signed
TreeUpdate [SetDefaultTree]
