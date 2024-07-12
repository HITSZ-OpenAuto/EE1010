set_property PACKAGE_PIN P2  [get_ports sw4];
set_property PACKAGE_PIN P3  [get_ports sw5];
set_property PACKAGE_PIN P4  [get_ports sw6];
set_property PACKAGE_PIN P5  [get_ports sw7];
set_property PACKAGE_PIN R11 [get_ports update];
set_property PACKAGE_PIN P17  [get_ports clk];
set_property PACKAGE_PIN C2  [get_ports select_1];
set_property PACKAGE_PIN G2  [get_ports select_2];

set_property PACKAGE_PIN B4  [get_ports dk[6]];
set_property PACKAGE_PIN A4  [get_ports dk[5]];
set_property PACKAGE_PIN A3  [get_ports dk[4]];
set_property PACKAGE_PIN B1  [get_ports dk[3]];
set_property PACKAGE_PIN A1  [get_ports dk[2]];
set_property PACKAGE_PIN B3  [get_ports dk[1]];
set_property PACKAGE_PIN B2  [get_ports dk[0]];

set_property IOSTANDARD LVCMOS33 [get_ports sw4];
set_property IOSTANDARD LVCMOS33 [get_ports sw5];
set_property IOSTANDARD LVCMOS33 [get_ports sw6];
set_property IOSTANDARD LVCMOS33 [get_ports sw7];
set_property IOSTANDARD LVCMOS33 [get_ports clk];
set_property IOSTANDARD LVCMOS33 [get_ports update];
set_property IOSTANDARD LVCMOS33 [get_ports select_1];
set_property IOSTANDARD LVCMOS33 [get_ports select_2];
set_property IOSTANDARD LVCMOS33 [get_ports dk];

# 配置未使用管脚为非上拉非下拉状态的命令
set_property BITSTREAM.CONFIG.UNUSEDPIN PULLNONE [current_design];