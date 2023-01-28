SetActiveLib -work
comp -include "$dsn\src\Big_thing.vhd" 
comp -include "$dsn\src\TestBench\big_thing_TB.vhd" 
asim +access +r TESTBENCH_FOR_big_thing 
wave 
wave -noreg data
wave -noreg keyboard_clk
wave -noreg fpga_clk
wave -noreg cathode
wave -noreg anode
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\big_thing_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_big_thing 
