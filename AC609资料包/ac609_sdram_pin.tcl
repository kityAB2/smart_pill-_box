# Copyright (C) 1991-2013 Altera Corporation
# Your use of Altera Corporation's design tools, logic functions 
# and other software and tools, and its AMPP partner logic 
# functions, and any output files from any of the foregoing 
# (including device programming or simulation files), and any 
# associated documentation or information are expressly subject 
# to the terms and conditions of the Altera Program License 
# Subscription Agreement, Altera MegaCore Function License 
# Agreement, or other applicable license agreement, including, 
# without limitation, that your use is for the sole purpose of 
# programming logic devices manufactured by Altera and sold by 
# Altera or its authorized distributors.  Please refer to the 
# applicable agreement for further details.

# Quartus II 64-Bit Version 13.0.0 Build 156 04/24/2013 SJ Full Version
# File: D:\fpga\ACM_Boards\ACM7180\Demos\ac601\ADV7180_SDRAM_VGA\output_files\AC601_ADV7180_SDRAM_VGA_Pin_assignments.tcl
# Generated on: Thu Mar 15 22:03:07 2018

package require ::quartus::project

set_location_assignment PIN_F9 -to sdram_addr[0]
set_location_assignment PIN_D12 -to sdram_addr[1]
set_location_assignment PIN_C14 -to sdram_addr[2]
set_location_assignment PIN_E11 -to sdram_addr[3]
set_location_assignment PIN_A13 -to sdram_addr[4]
set_location_assignment PIN_B12 -to sdram_addr[5]
set_location_assignment PIN_A12 -to sdram_addr[6]
set_location_assignment PIN_A11 -to sdram_addr[7]
set_location_assignment PIN_B10 -to sdram_addr[8]
set_location_assignment PIN_A10 -to sdram_addr[9]
set_location_assignment PIN_D11 -to sdram_addr[10]
set_location_assignment PIN_B9 -to sdram_addr[11]
set_location_assignment PIN_E10 -to sdram_ba[0]
set_location_assignment PIN_C11 -to sdram_ba[1]
set_location_assignment PIN_E9 -to sdram_cas_n
set_location_assignment PIN_E8 -to sdram_cke
set_location_assignment PIN_A8 -to sdram_clk
set_location_assignment PIN_D9 -to sdram_cs_n
set_location_assignment PIN_F8 -to sdram_dqm[0]
set_location_assignment PIN_B8 -to sdram_dqm[1]
set_location_assignment PIN_F6 -to sdram_dq[0]
set_location_assignment PIN_D5 -to sdram_dq[1]
set_location_assignment PIN_D6 -to sdram_dq[2]
set_location_assignment PIN_C6 -to sdram_dq[3]
set_location_assignment PIN_E6 -to sdram_dq[4]
set_location_assignment PIN_D8 -to sdram_dq[5]
set_location_assignment PIN_C8 -to sdram_dq[6]
set_location_assignment PIN_E7 -to sdram_dq[7]
set_location_assignment PIN_A7 -to sdram_dq[8]
set_location_assignment PIN_B7 -to sdram_dq[9]
set_location_assignment PIN_A6 -to sdram_dq[10]
set_location_assignment PIN_B6 -to sdram_dq[11]
set_location_assignment PIN_A5 -to sdram_dq[12]
set_location_assignment PIN_B5 -to sdram_dq[13]
set_location_assignment PIN_A4 -to sdram_dq[14]
set_location_assignment PIN_B4 -to sdram_dq[15]
set_location_assignment PIN_C9 -to sdram_ras_n
set_location_assignment PIN_F7 -to sdram_we_n
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to sdram_addr[12]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to sdram_addr[11]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to sdram_addr[10]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to sdram_addr[9]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to sdram_addr[8]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to sdram_addr[7]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to sdram_addr[6]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to sdram_addr[5]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to sdram_addr[4]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to sdram_addr[3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to sdram_addr[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to sdram_addr[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to sdram_addr[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to sdram_ba[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to sdram_ba[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to sdram_cas_n
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to sdram_cke
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to sdram_clk
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to sdram_cs_n
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to sdram_dq[15]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to sdram_dq[14]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to sdram_dq[13]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to sdram_dq[12]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to sdram_dq[11]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to sdram_dq[10]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to sdram_dq[9]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to sdram_dq[8]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to sdram_dq[7]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to sdram_dq[6]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to sdram_dq[5]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to sdram_dq[4]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to sdram_dq[3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to sdram_dq[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to sdram_dq[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to sdram_dq[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to sdram_dqm[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to sdram_dqm[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to sdram_ras_n
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to sdram_we_n
set_location_assignment PIN_A9 -to sdram_addr[12]
