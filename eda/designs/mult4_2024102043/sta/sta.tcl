# Define the path to the typical corner Liberty timing library
set lib $::env(PDK_ROOT)/sky130A/libs.ref/sky130_fd_sc_hd/lib/sky130_fd_sc_hd__tt_025C_1v80.lib

# Step 1: Read the cell timing library
read_liberty $lib

# Step 2: Read synthesized netlist and link design
read_verilog synth/mult_array_netlist.v
link_design mult_array

# Step 3: Define clock with initial period T = 10 ns
create_clock -name clk -period 10 [get_ports clk]

# Step 4 & 5: Set input and output delays (1.0 ns)
set_input_delay 1.0 -clock clk [delete_from_list [all_inputs] [get_ports clk]]
set_output_delay 1.0 -clock clk [all_outputs]

# Step 6: Print worst setup slack
report_worst_slack -max

# Step 7: Save detailed critical path report
report_checks -path_delay max -digits 3 > sta/mult_array_timing.rpt