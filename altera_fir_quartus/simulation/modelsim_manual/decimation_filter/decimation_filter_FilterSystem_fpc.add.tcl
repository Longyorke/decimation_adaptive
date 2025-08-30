if [info exists ::env(DSPBA_HDL_DIR)] {
    set dspba_hdl_dir $::env(DSPBA_HDL_DIR)
} else {
    set dspba_hdl_dir $quartus_dir/dspba/backend/Libraries
}

set_global_assignment -name SYSTEMVERILOG_FILE "$dspba_hdl_dir/sv/base/dspba_library_ver.sv"
