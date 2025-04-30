onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib decimation_1ch_d128_20_fir_compiler_v7_2_i6_opt

do {wave.do}

view wave
view structure
view signals

do {decimation_1ch_d128_20_fir_compiler_v7_2_i6.udo}

run -all

quit -force
