# pass in -Gquit_at_end=true to make vsim call exit at the end. Useful for running standalone.
quietly set quit_at_end 0
if {[lsearch $argv -Gquit_at_end=true] != -1} {
    quietly set quit_at_end 1
}

# set up quartus_dir variable for subsequent commands
if [info exists ::env(QUARTUS_ROOTDIR_OVERRIDE)] {
    quietly set quartus_dir $::env(QUARTUS_ROOTDIR_OVERRIDE)
} else {
    quietly set quartus_dir "D:/software/intelFPGA/18.1/quartus"
}

if {$argc > 0} {
    quietly set base_dir $1
} else {
    quietly set base_dir "F:/EM_LAB/EM_Instrument/TEMR-3S/Num01_code/Filter/altera_fir/./rtl"
    echo The current directory is: [pwd]
}
quietly set base_dir [file normalize $base_dir]
echo Creating the project under $base_dir

onerror {resume}

if { [string compare [project env] ""] != 0 } {
    quit -sim
    project close
}

if {! [file exists $base_dir/decimation_filter_FilterSystem]} {
    file delete -force $base_dir/decimation_filter_FilterSystem
}

project new $base_dir decimation_filter_FilterSystem
if {! [file exists $base_dir/work/_info]} {
    file delete -force $base_dir/work
    vlib work
}
quietly vmap work $base_dir/work


proc checkDepends {dst src} {
    if {! [file exists $dst]} { return 1 }
    if {[file mtime $dst] < [file mtime $src]} { return 1 }
    return 0
}

quietly set compile(altera_ver) 0
if {[checkDepends $base_dir/altera_ver/_info "$quartus_dir/eda/sim_lib/altera_primitives.v"]} {
    file delete -force $base_dir/altera_ver
    vlib altera_ver
    quietly set compile(altera_ver) 1
}
quietly vmap altera_ver $base_dir/altera_ver
quietly set compile(altera_mf_ver) 0
if {[checkDepends $base_dir/altera_mf_ver/_info "$quartus_dir/eda/sim_lib/altera_mf.v"]} {
    file delete -force $base_dir/altera_mf_ver
    vlib altera_mf_ver
    quietly set compile(altera_mf_ver) 1
}
quietly vmap altera_mf_ver $base_dir/altera_mf_ver
quietly set compile(lpm_ver) 0
if {[checkDepends $base_dir/lpm_ver/_info "$quartus_dir/eda/sim_lib/220model.v"]} {
    file delete -force $base_dir/lpm_ver
    vlib lpm_ver
    quietly set compile(lpm_ver) 1
}
quietly vmap lpm_ver $base_dir/lpm_ver
quietly set compile(altera_lnsim) 0
if {[checkDepends $base_dir/altera_lnsim/_info "$quartus_dir/eda/sim_lib/altera_lnsim.sv"]} {
    file delete -force $base_dir/altera_lnsim
    vlib altera_lnsim
    quietly set compile(altera_lnsim) 1
}
quietly vmap altera_lnsim $base_dir/altera_lnsim
if {[info exists quartus_dir] && [file isdirectory $quartus_dir]} {
    if {$compile(altera_ver)} {
        vlog -quiet -work $base_dir/altera_ver "$quartus_dir/eda/sim_lib/altera_primitives.v"
    }
    if {$compile(altera_mf_ver)} {
        vlog -quiet -work $base_dir/altera_mf_ver "$quartus_dir/eda/sim_lib/altera_mf.v"
    }
    if {$compile(lpm_ver)} {
        vlog -quiet -work $base_dir/lpm_ver "$quartus_dir/eda/sim_lib/220model.v"
    }
    if {$compile(altera_lnsim)} {
        vlog -sv -quiet -work $base_dir/altera_lnsim "$quartus_dir/eda/sim_lib/altera_lnsim.sv"
    }
    do "$base_dir/decimation_filter/decimation_filter_FilterSystem_fpc.do"
} else {
    echo QUARTUS not found. Not compiling libraries.
}


quietly set vcomfailed 0
onerror {
    quietly set vcomfailed 1
    resume
}

vlog +incdir+$base_dir/decimation_filter -quiet $base_dir/decimation_filter/decimation_filter_FilterSystem.sv
vlog +incdir+$base_dir/decimation_filter -quiet $base_dir/decimation_filter/decimation_filter_FilterSystem_DecimatingFIR1.sv
vlog +incdir+$base_dir/decimation_filter -quiet $base_dir/decimation_filter/decimation_filter_FilterSystem_DecimatingFIR2.sv
vlog +incdir+$base_dir/decimation_filter -quiet $base_dir/decimation_filter/decimation_filter_FilterSystem_Scale2.sv
vlog +incdir+$base_dir/decimation_filter -quiet $base_dir/decimation_filter/decimation_filter_FilterSystem_Scale3.sv
vcom -quiet -O0 $base_dir/decimation_filter/decimation_filter_FilterSystem_atb.vhd
vcom -quiet $base_dir/decimation_filter/decimation_filter_FilterSystem_stm.vhd

onerror {resume}

proc report_mismatch {signal cycle} {
    puts "Mismatch in ${signal} at system clock cycle ${cycle}"
    set modelsimvalue [examine ${signal}_dut];
    set stmvalue [examine ${signal}_stm];
    puts "\t${signal} (ModelSim):\t${modelsimvalue}"
    puts "\t${signal} (Simulink):\t${stmvalue}"
}

if {$vcomfailed == 0} {
    onbreak {
        quietly set my_tb [string trim [tb]];
        quietly set regOK [regexp {(.*) ([0-9]+) ([\[address]*) ([.]*)} $my_tb \ match atbfile linenum ignore_this];
        if {$regOK == 1} {
            quietly set simtime [expr $now - 200];
            quietly set cyclenum [expr int($simtime / 62500000.000000)];
            if { [catch {exa mismatch_q} mismatch] == 0 && $mismatch } {
                report_mismatch q $cyclenum
            }
            if { [catch {exa mismatch_qv} mismatch] == 0 && $mismatch } {
                report_mismatch qv $cyclenum
            }
            if { [catch {exa mismatch_qc} mismatch] == 0 && $mismatch } {
                report_mismatch qc $cyclenum
            }
        } else {
            puts "Signal mismatch detected at $my_tb";
        }
        if {$quit_at_end == 1} {
            quit -code 1;
        }
    }
    vsim -quiet -error 3473 -msgmode both -voptargs="+acc" -t ps decimation_filter_FilterSystem_atb  -L altera_ver -L altera_mf_ver -L lpm_ver -L altera_lnsim
    do $base_dir/decimation_filter/decimation_filter_FilterSystem_atb.wav.do
# Disable some warnings that occur at the very start of simulation
    quietly set StdArithNoWarnings 1
    run 0ns
    quietly set StdArithNoWarnings 0
    run -all
} else {
    echo At least one module failed to compile, not starting simulation
}

if {$quit_at_end == 1} {
    exit
}
