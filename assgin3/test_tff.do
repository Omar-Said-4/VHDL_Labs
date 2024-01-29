add wave -position insertpoint sim:/tff/*
force -freeze sim:/tff/clk 1 20, 0 {70 ps} -r 100
force -freeze sim:/tff/T 1 0
force -freeze sim:/tff/rst 1 0
force -freeze sim:/tff/preset 0 0
run
force -freeze sim:/tff/preset 1 0
run
force -freeze sim:/tff/rst 0 0
run
force -freeze sim:/tff/preset 0 0
run
run
run
run
force -freeze sim:/tff/T 0 0
run
run