#/////////////////////////////系统时钟和复位////////////////////////////////////
set_property -dict {PACKAGE_PIN P17 IOSTANDARD LVCMOS33} [get_ports sys_clk]
set_property -dict {PACKAGE_PIN P15 IOSTANDARD LVCMOS33} [get_ports reset]

#/////////////////////////////串口/////////////////////////////////////////////
#set_property -dict {PACKAGE_PIN N5 IOSTANDARD LVCMOS33} [get_ports s_in]
set_property -dict {PACKAGE_PIN T4 IOSTANDARD LVCMOS33} [get_ports s_out]

#------------------------------数码管片选信号-------------------------------
set_property -dict {PACKAGE_PIN G2 IOSTANDARD LVCMOS33} [get_ports {an[3]}]
set_property -dict {PACKAGE_PIN C2 IOSTANDARD LVCMOS33} [get_ports {an[2]}]
set_property -dict {PACKAGE_PIN C1 IOSTANDARD LVCMOS33} [get_ports {an[1]}]
set_property -dict {PACKAGE_PIN H1 IOSTANDARD LVCMOS33} [get_ports {an[0]}]
#------------------------------数码管段选信号-------------------------------
set_property -dict {PACKAGE_PIN B4 IOSTANDARD LVCMOS33} [get_ports {sseg[6]}]
set_property -dict {PACKAGE_PIN A4 IOSTANDARD LVCMOS33} [get_ports {sseg[5]}]
set_property -dict {PACKAGE_PIN A3 IOSTANDARD LVCMOS33} [get_ports {sseg[4]}]
set_property -dict {PACKAGE_PIN B1 IOSTANDARD LVCMOS33} [get_ports {sseg[3]}]
set_property -dict {PACKAGE_PIN A1 IOSTANDARD LVCMOS33} [get_ports {sseg[2]}]
set_property -dict {PACKAGE_PIN B3 IOSTANDARD LVCMOS33} [get_ports {sseg[1]}]
set_property -dict {PACKAGE_PIN B2 IOSTANDARD LVCMOS33} [get_ports {sseg[0]}]
set_property -dict {PACKAGE_PIN D5 IOSTANDARD LVCMOS33} [get_ports {sseg[7]}]


#----------------------------PS2-----------------------------------------------
set_property -dict {PACKAGE_PIN K5 IOSTANDARD LVCMOS33} [get_ports data_clock]
set_property -dict {PACKAGE_PIN L4 IOSTANDARD LVCMOS33} [get_ports data_in]


#//----------------------LED-----------------------------------
#set_property -dict {PACKAGE_PIN K6 IOSTANDARD LVCMOS33} [get_ports {ledshowstate[3]}]
#set_property -dict {PACKAGE_PIN L1 IOSTANDARD LVCMOS33} [get_ports {ledshowstate[2]}]
#set_property -dict {PACKAGE_PIN M1 IOSTANDARD LVCMOS33} [get_ports {ledshowstate[1]}]
#set_property -dict {PACKAGE_PIN K3 IOSTANDARD LVCMOS33} [get_ports {ledshowstate[0]}]

#//-------------------------bluetooth----------
#set_property -dict {PACKAGE_PIN L3 IOSTANDARD LVCMOS33} [get_ports bluetooth_s_in]
#set_property -dict {PACKAGE_PIN N2 IOSTANDARD LVCMOS33} [get_ports bluetooth_s_out]

#//----------------------bomakaiguan-------------------
#set_property -dict {PACKAGE_PIN P5 IOSTANDARD LVCMOS33} [get_ports sw_ctrl]

set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets data_clock_IBUF]