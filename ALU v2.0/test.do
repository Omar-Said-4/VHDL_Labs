

add wave -position insertpoint sim:/alu/*
force -freeze sim:/alu/SEL 0100 0
force -freeze sim:/alu/A_ALU 11110000 0
force -freeze sim:/alu/B_ALU 10110000 0
run
force -freeze sim:/alu/B_ALU 00001011 0
force -freeze sim:/alu/SEL 0101 0
run
force -freeze sim:/alu/B_ALU 10110000 0
force -freeze sim:/alu/SEL 0110 0
run
force -freeze sim:/alu/SEL 0111 0
run
force -freeze sim:/alu/SEL 1000 0
run
force -freeze sim:/alu/SEL 1001 0
run
force -freeze sim:/alu/Cin 0 0
force -freeze sim:/alu/SEL 1010 0
run
force -freeze sim:/alu/SEL 1011 0
run
force -freeze sim:/alu/SEL 1100 0
run
force -freeze sim:/alu/SEL 1101 0
run
force -freeze sim:/alu/Cin 0 0
force -freeze sim:/alu/SEL 1110 0
run
force -freeze sim:/alu/SEL 1111 0
run
force -freeze sim:/alu/SEL 1010 0
force -freeze sim:/alu/Cin 1 0
run
force -freeze sim:/alu/SEL 1110 0
run
force -freeze sim:/alu/SEL 0000 0
force -freeze sim:/alu/B_ALU 10110000 0
force -freeze sim:/alu/Cin 0 0
run
force -freeze sim:/alu/SEL 0001 0
run
force -freeze sim:/alu/SEL 0010 0
run
force -freeze sim:/alu/SEL 0011 0
run
force -freeze sim:/alu/SEL 0000 0
force -freeze sim:/alu/Cin 1 0
run
force -freeze sim:/alu/SEL 0001 0
run
force -freeze sim:/alu/SEL 0010 0
run
force -freeze sim:/alu/SEL 0011 0
run



