# Set Liberty library path
set lib $::env(PDK_ROOT)/sky130A/libs.ref/sky130_fd_sc_hd/lib/sky130_fd_sc_hd__tt_025C_1v80.lib

# Read timing library and netlist
read_liberty $lib
read_verilog synth/mult_array_netlist.v
link_design mult_array

# Clock and delay constraints
create_clock -name clk -period 10 [get_ports clk]
set_input_delay 1.0 -clock clk [delete_from_list [all_inputs] [get_ports clk]]
set_output_delay 1.0 -clock clk [all_outputs]

# Reports
report_worst_slack -max
report_checks -path_delay max -digits 3 > sta/mult_array_timing.rpt
exit