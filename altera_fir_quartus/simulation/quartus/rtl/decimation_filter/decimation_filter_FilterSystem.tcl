# This is the top level tcl file for 'decimation_filter_FilterSystem'

package require ::quartus::project

set overwrite_opt 0
set compile_opt 1

foreach arg $argv {
    switch $arg {
        overwrite { set overwrite_opt 1 }
        no_compile { set compile_opt 0 }
        default { puts "got unknown command: $arg" }
    }
}

if {!$overwrite_opt && [project_exists decimation_filter_FilterSystem]} {
    puts "The decimation_filter_FilterSystem quartus project already exists."
    puts "Use 'overwrite option' to force project to be over-written/"
} elseif {![file exists "G:/EM_LAB/EM_Instrument/TEMR-3S/Num01_code/Filter/altera_fir/./rtl/decimation_filter/decimation_filter_FilterSystem.tcl"]}    {
    puts "You must run decimation_filter_FilterSystem.tcl "
    puts "from the ../quartus directory or else "
    puts "some of the dependant scripts won't be found."
    puts "The current directory is:" 
    puts [pwd]
    error "Exiting..."
} 

set quartus_dir $::env(QUARTUS_ROOTDIR)
puts "Creating decimation_filter_FilterSystem Quartus project..."

if $overwrite_opt {
    project_new -overwrite decimation_filter_FilterSystem
} else {
    project_new decimation_filter_FilterSystem
}

set_global_assignment -name FAMILY "MAX 10"
set_global_assignment -name TOP_LEVEL_ENTITY decimation_filter_FilterSystem
set_global_assignment -name DEVICE 10M40DCF256A7G
set_global_assignment -name USE_TIMEQUEST_TIMING_ANALYZER ON
set_global_assignment -name SDC_FILE G:/EM_LAB/EM_Instrument/TEMR-3S/Num01_code/Filter/altera_fir/./rtl/decimation_filter/decimation_filter_FilterSystem.sdc
set_global_assignment -name SEARCH_PATH G:/EM_LAB/EM_Instrument/TEMR-3S/Num01_code/Filter/altera_fir/./rtl/decimation_filter
source G:/EM_LAB/EM_Instrument/TEMR-3S/Num01_code/Filter/altera_fir/./rtl/decimation_filter/decimation_filter_FilterSystem.add.tcl

set_instance_assignment -name VIRTUAL_PIN ON -to a
set_instance_assignment -name VIRTUAL_PIN ON -to av
set_instance_assignment -name VIRTUAL_PIN ON -to ac
set_instance_assignment -name VIRTUAL_PIN ON -to q
set_instance_assignment -name VIRTUAL_PIN ON -to qv
set_instance_assignment -name VIRTUAL_PIN ON -to qc
set_instance_assignment -name VIRTUAL_PIN ON -to busIn_writedata
set_instance_assignment -name VIRTUAL_PIN ON -to busIn_address
set_instance_assignment -name VIRTUAL_PIN ON -to busIn_write
set_instance_assignment -name VIRTUAL_PIN ON -to busIn_read
set_instance_assignment -name VIRTUAL_PIN ON -to busOut_readdatavalid
set_instance_assignment -name VIRTUAL_PIN ON -to busOut_readdata
set_instance_assignment -name VIRTUAL_PIN ON -to busOut_waitrequest

source "G:/EM_LAB/EM_Instrument/TEMR-3S/Num01_code/Filter/altera_fir/./rtl/decimation_filter/decimation_filter_FilterSystem_fpc.add.tcl"


if $compile_opt {
    package require ::quartus::flow
    puts "Running Compile flow..."
    execute_flow -compile

    package require ::quartus::report 

    # The output you get out of this script
    # is two lines of CSV formatted data (header line 1, real data line 2)
    # followed by the critical path

    load_report

    proc print_csv {expr} {
        regsub -all , $expr {} out
        regsub -all { .*} $out {} final
        if [string match $final ""] {
            # If quartus failed to find any value here, report -1
            set final -1
        }
        puts -nonewline $final
        puts -nonewline ","
    }

    create_timing_netlist -model slow
    read_sdc
    update_timing_netlist
    set clk_fmaxinfo [get_clock_fmax_info]

    puts "Extracting key data from report..."
    puts "LE,Regs,DSP_9bit,Mem_Bits,M9K,IO,FMax,Slack,Required"
    print_csv [get_fitter_resource_usage -used -le]
    print_csv [get_fitter_resource_usage -resource "*Total registers*"]
    print_csv [get_fitter_resource_usage -resource "Embedded Multiplier 9-bit*"]
    print_csv [get_fitter_resource_usage -used -mem_bit]
    print_csv [get_fitter_resource_usage -resource "*M9K*"]
    print_csv [get_fitter_resource_usage -used -io_pin]

    set family [get_report_panel_data -name {Flow Summary} -col 1 -row_name Family]
    set device Unknown
    set fmax -1
    set restricted_fmax -1
    set clk {clk}

    foreach clkinfo $clk_fmaxinfo {
        if ([string equal $clk [lindex $clkinfo 0] ]) {
            set fmax [lindex $clkinfo 1]
            set restricted_fmax [lindex $clkinfo 2]
        }
    }

    set slack None
    set required_fmax Unavailable
    if {[string is double $restricted_fmax] && [expr {$restricted_fmax >= 0.0}]} {
        set required_period [get_clock_info -period $clk]
        set slack [expr {$required_period - 1000.0 / $fmax}]
        set required_fmax [expr {1000.0 / $required_period}]
    } else {
        set required_period Unavailable
    }

    print_csv $restricted_fmax
    print_csv $slack
    print_csv $required_fmax
    print_csv $fmax

    puts ""

    puts "FAMILY $family"
    puts "DEVICE $device"
    puts "TIMING PATH"
    set cpi 0
    foreach_in_collection path [get_timing_paths -npaths 1 -setup -pairs_only] {
        set from [get_node_info -name [get_path_info $path -from]]
        set to [get_node_info -name [get_path_info $path -to]]
        file delete cpath$cpi.fit
        report_timing -from_clock $clk -to_clock $clk -from $from -to $to -setup -npaths 1 -show_routing -detail full_path -file cpath$cpi.fit
        set ignore [catch {
          set f [open cpath$cpi.fit]
          puts [read $f]}]
        incr cpi
    }
}

project_close

