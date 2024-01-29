add wave -position insertpoint sim:/sync_count/*
force -freeze sim:/sync_count/clk 1 20, 0 {70 ps} -r 100
force -freeze sim:/sync_count/rst 0 0
force -freeze sim:/sync_count/en 1 0
force -freeze sim:/sync_count/load 1 0
force -freeze sim:/sync_count/mode 1 0
force -freeze sim:/sync_count/Data 11110000 0
run
force -freeze sim:/sync_count/rst 1 0
force -freeze sim:/sync_count/load 0 0
run
force -freeze sim:/sync_count/en 0 0
run
force -freeze sim:/sync_count/mode 0 0
run
force -freeze sim:/sync_count/load 1 0
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
force -freeze sim:/sync_count/mode 1 0
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
force -freeze sim:/sync_count/rst 0 0
run
force -freeze sim:/sync_count/rst 1 0
run
run
