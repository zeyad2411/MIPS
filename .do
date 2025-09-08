vlib work
vlog ALU.v alu_tb.v
vsim -voptargs=+acc work.alu_tb
add wave *
run -all
#quit -sim