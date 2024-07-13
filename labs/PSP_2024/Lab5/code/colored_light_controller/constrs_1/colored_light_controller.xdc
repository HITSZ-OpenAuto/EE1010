set_property PACKAGE_PIN P17 [get_ports clk];

# 按键 引脚： S0 R11; S1 R17; S2 R15
set_property PACKAGE_PIN R17 [get_ports cin];
set_property PACKAGE_PIN R11 [get_ports rst];
set_property PACKAGE_PIN K2 [get_ports dout[0]]; # LD2_0
set_property PACKAGE_PIN J2 [get_ports dout[1]]; # LD2_1
set_property PACKAGE_PIN J3 [get_ports dout[2]];
set_property PACKAGE_PIN H4 [get_ports dout[3]];
set_property PACKAGE_PIN J4 [get_ports dout[4]];
set_property PACKAGE_PIN G3 [get_ports dout[5]];
set_property PACKAGE_PIN G4 [get_ports dout[6]];
set_property PACKAGE_PIN F6 [get_ports dout[7]];
set_property IOSTANDARD LVCMOS33 [get_ports clk];
set_property IOSTANDARD LVCMOS33 [get_ports cin];
set_property IOSTANDARD LVCMOS33 [get_ports rst];
set_property IOSTANDARD LVCMOS33 [get_ports dout[0]];
set_property IOSTANDARD LVCMOS33 [get_ports dout[1]];
set_property IOSTANDARD LVCMOS33 [get_ports dout[2]];
set_property IOSTANDARD LVCMOS33 [get_ports dout[3]];
set_property IOSTANDARD LVCMOS33 [get_ports dout[4]];
set_property IOSTANDARD LVCMOS33 [get_ports dout[5]];
set_property IOSTANDARD LVCMOS33 [get_ports dout[6]];
set_property IOSTANDARD LVCMOS33 [get_ports dout[7]];
set_property BITSTREAM.CONFIG.UNUSEDPIN PULLNONE [current_design];