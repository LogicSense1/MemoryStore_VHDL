transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/xiawe/OneDrive - The University of Sydney (Students)/ELEC3608 Computer Architecture/LAB4/Part 2&3/src/common.vhd}
vcom -93 -work work {C:/Users/xiawe/OneDrive - The University of Sydney (Students)/ELEC3608 Computer Architecture/LAB4/Part 2&3/src/alu.vhd}

vcom -93 -work work {C:/Users/xiawe/Desktop/part/../../OneDrive - The University of Sydney (Students)/ELEC3608 Computer Architecture/LAB4/Part 2&3/src/store_tb.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cyclonev -L rtl_work -L work -voptargs="+acc"  tb

add wave *
view structure
view signals
run -all
