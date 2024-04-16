-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 13.1.0 Build 162 10/23/2013 SJ Full Version"

-- DATE "03/13/2023 17:16:40"

-- 
-- Device: Altera EP4CGX30CF23C6 Package FBGA484
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEIV;
LIBRARY IEEE;
USE CYCLONEIV.CYCLONEIV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	smart_pill_box_ctl IS
    PORT (
	clk : IN std_logic;
	rst_n : IN std_logic;
	keyvalue : IN std_logic_vector(4 DOWNTO 0);
	keyfinish : IN std_logic;
	r_dis : OUT std_logic_vector(63 DOWNTO 0);
	g_dis : OUT std_logic_vector(63 DOWNTO 0)
	);
END smart_pill_box_ctl;

-- Design Ports Information
-- keyfinish	=>  Location: PIN_K12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_dis[0]	=>  Location: PIN_Y10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_dis[1]	=>  Location: PIN_U20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_dis[2]	=>  Location: PIN_AA19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_dis[3]	=>  Location: PIN_T18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_dis[4]	=>  Location: PIN_C7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_dis[5]	=>  Location: PIN_D11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_dis[6]	=>  Location: PIN_R17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_dis[7]	=>  Location: PIN_K19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_dis[8]	=>  Location: PIN_M17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_dis[9]	=>  Location: PIN_R16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_dis[10]	=>  Location: PIN_T9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_dis[11]	=>  Location: PIN_AA22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_dis[12]	=>  Location: PIN_P10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_dis[13]	=>  Location: PIN_U22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_dis[14]	=>  Location: PIN_A22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_dis[15]	=>  Location: PIN_Y22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_dis[16]	=>  Location: PIN_V22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_dis[17]	=>  Location: PIN_Y5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_dis[18]	=>  Location: PIN_N15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_dis[19]	=>  Location: PIN_R21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_dis[20]	=>  Location: PIN_N20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_dis[21]	=>  Location: PIN_P15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_dis[22]	=>  Location: PIN_R20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_dis[23]	=>  Location: PIN_W17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_dis[24]	=>  Location: PIN_W21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_dis[25]	=>  Location: PIN_A11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_dis[26]	=>  Location: PIN_G21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_dis[27]	=>  Location: PIN_W20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_dis[28]	=>  Location: PIN_P14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_dis[29]	=>  Location: PIN_Y17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_dis[30]	=>  Location: PIN_D9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_dis[31]	=>  Location: PIN_G8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_dis[32]	=>  Location: PIN_D4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_dis[33]	=>  Location: PIN_C13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_dis[34]	=>  Location: PIN_M13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_dis[35]	=>  Location: PIN_M16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_dis[36]	=>  Location: PIN_V21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_dis[37]	=>  Location: PIN_M14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_dis[38]	=>  Location: PIN_B3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_dis[39]	=>  Location: PIN_V20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_dis[40]	=>  Location: PIN_AB10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_dis[41]	=>  Location: PIN_M18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_dis[42]	=>  Location: PIN_G10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_dis[43]	=>  Location: PIN_T11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_dis[44]	=>  Location: PIN_Y4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_dis[45]	=>  Location: PIN_Y15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_dis[46]	=>  Location: PIN_A19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_dis[47]	=>  Location: PIN_A5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_dis[48]	=>  Location: PIN_W7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_dis[49]	=>  Location: PIN_W11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_dis[50]	=>  Location: PIN_U14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_dis[51]	=>  Location: PIN_AB5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_dis[52]	=>  Location: PIN_F20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_dis[53]	=>  Location: PIN_D7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_dis[54]	=>  Location: PIN_Y19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_dis[55]	=>  Location: PIN_AB11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_dis[56]	=>  Location: PIN_B12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_dis[57]	=>  Location: PIN_G19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_dis[58]	=>  Location: PIN_AB9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_dis[59]	=>  Location: PIN_T7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_dis[60]	=>  Location: PIN_AA7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_dis[61]	=>  Location: PIN_F16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_dis[62]	=>  Location: PIN_D13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r_dis[63]	=>  Location: PIN_AB7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- g_dis[0]	=>  Location: PIN_U7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- g_dis[1]	=>  Location: PIN_W8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- g_dis[2]	=>  Location: PIN_W10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- g_dis[3]	=>  Location: PIN_U12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- g_dis[4]	=>  Location: PIN_V6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- g_dis[5]	=>  Location: PIN_AB18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- g_dis[6]	=>  Location: PIN_AB17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- g_dis[7]	=>  Location: PIN_P22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- g_dis[8]	=>  Location: PIN_Y9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- g_dis[9]	=>  Location: PIN_AA6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- g_dis[10]	=>  Location: PIN_T19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- g_dis[11]	=>  Location: PIN_W15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- g_dis[12]	=>  Location: PIN_AB8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- g_dis[13]	=>  Location: PIN_AA4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- g_dis[14]	=>  Location: PIN_T17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- g_dis[15]	=>  Location: PIN_AB20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- g_dis[16]	=>  Location: PIN_W4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- g_dis[17]	=>  Location: PIN_D22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- g_dis[18]	=>  Location: PIN_W6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- g_dis[19]	=>  Location: PIN_U6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- g_dis[20]	=>  Location: PIN_AA13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- g_dis[21]	=>  Location: PIN_T20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- g_dis[22]	=>  Location: PIN_C12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- g_dis[23]	=>  Location: PIN_C2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- g_dis[24]	=>  Location: PIN_B7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- g_dis[25]	=>  Location: PIN_V9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- g_dis[26]	=>  Location: PIN_E6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- g_dis[27]	=>  Location: PIN_W18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- g_dis[28]	=>  Location: PIN_D19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- g_dis[29]	=>  Location: PIN_AB19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- g_dis[30]	=>  Location: PIN_F12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- g_dis[31]	=>  Location: PIN_T15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- g_dis[32]	=>  Location: PIN_A8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- g_dis[33]	=>  Location: PIN_C6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- g_dis[34]	=>  Location: PIN_D6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- g_dis[35]	=>  Location: PIN_T13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- g_dis[36]	=>  Location: PIN_W12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- g_dis[37]	=>  Location: PIN_K17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- g_dis[38]	=>  Location: PIN_P13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- g_dis[39]	=>  Location: PIN_U15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- g_dis[40]	=>  Location: PIN_N13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- g_dis[41]	=>  Location: PIN_Y12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- g_dis[42]	=>  Location: PIN_AB16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- g_dis[43]	=>  Location: PIN_W22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- g_dis[44]	=>  Location: PIN_R11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- g_dis[45]	=>  Location: PIN_AB6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- g_dis[46]	=>  Location: PIN_AA21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- g_dis[47]	=>  Location: PIN_AB13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- g_dis[48]	=>  Location: PIN_H16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- g_dis[49]	=>  Location: PIN_AB21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- g_dis[50]	=>  Location: PIN_Y13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- g_dis[51]	=>  Location: PIN_C4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- g_dis[52]	=>  Location: PIN_Y16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- g_dis[53]	=>  Location: PIN_H9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- g_dis[54]	=>  Location: PIN_G15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- g_dis[55]	=>  Location: PIN_T8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- g_dis[56]	=>  Location: PIN_B16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- g_dis[57]	=>  Location: PIN_W9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- g_dis[58]	=>  Location: PIN_R15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- g_dis[59]	=>  Location: PIN_Y14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- g_dis[60]	=>  Location: PIN_N21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- g_dis[61]	=>  Location: PIN_AB22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- g_dis[62]	=>  Location: PIN_R14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- g_dis[63]	=>  Location: PIN_AA18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_G14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rst_n	=>  Location: PIN_A6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- keyvalue[4]	=>  Location: PIN_A7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- keyvalue[3]	=>  Location: PIN_T21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- keyvalue[2]	=>  Location: PIN_R9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- keyvalue[1]	=>  Location: PIN_R13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- keyvalue[0]	=>  Location: PIN_Y11,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF smart_pill_box_ctl IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_rst_n : std_logic;
SIGNAL ww_keyvalue : std_logic_vector(4 DOWNTO 0);
SIGNAL ww_keyfinish : std_logic;
SIGNAL ww_r_dis : std_logic_vector(63 DOWNTO 0);
SIGNAL ww_g_dis : std_logic_vector(63 DOWNTO 0);
SIGNAL \keyfinish~input_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \rst_n~input_o\ : std_logic;
SIGNAL \keyvalue[4]~input_o\ : std_logic;
SIGNAL \keyvalue[3]~input_o\ : std_logic;
SIGNAL \keyvalue[2]~input_o\ : std_logic;
SIGNAL \keyvalue[1]~input_o\ : std_logic;
SIGNAL \keyvalue[0]~input_o\ : std_logic;
SIGNAL \r_dis[0]~output_o\ : std_logic;
SIGNAL \r_dis[1]~output_o\ : std_logic;
SIGNAL \r_dis[2]~output_o\ : std_logic;
SIGNAL \r_dis[3]~output_o\ : std_logic;
SIGNAL \r_dis[4]~output_o\ : std_logic;
SIGNAL \r_dis[5]~output_o\ : std_logic;
SIGNAL \r_dis[6]~output_o\ : std_logic;
SIGNAL \r_dis[7]~output_o\ : std_logic;
SIGNAL \r_dis[8]~output_o\ : std_logic;
SIGNAL \r_dis[9]~output_o\ : std_logic;
SIGNAL \r_dis[10]~output_o\ : std_logic;
SIGNAL \r_dis[11]~output_o\ : std_logic;
SIGNAL \r_dis[12]~output_o\ : std_logic;
SIGNAL \r_dis[13]~output_o\ : std_logic;
SIGNAL \r_dis[14]~output_o\ : std_logic;
SIGNAL \r_dis[15]~output_o\ : std_logic;
SIGNAL \r_dis[16]~output_o\ : std_logic;
SIGNAL \r_dis[17]~output_o\ : std_logic;
SIGNAL \r_dis[18]~output_o\ : std_logic;
SIGNAL \r_dis[19]~output_o\ : std_logic;
SIGNAL \r_dis[20]~output_o\ : std_logic;
SIGNAL \r_dis[21]~output_o\ : std_logic;
SIGNAL \r_dis[22]~output_o\ : std_logic;
SIGNAL \r_dis[23]~output_o\ : std_logic;
SIGNAL \r_dis[24]~output_o\ : std_logic;
SIGNAL \r_dis[25]~output_o\ : std_logic;
SIGNAL \r_dis[26]~output_o\ : std_logic;
SIGNAL \r_dis[27]~output_o\ : std_logic;
SIGNAL \r_dis[28]~output_o\ : std_logic;
SIGNAL \r_dis[29]~output_o\ : std_logic;
SIGNAL \r_dis[30]~output_o\ : std_logic;
SIGNAL \r_dis[31]~output_o\ : std_logic;
SIGNAL \r_dis[32]~output_o\ : std_logic;
SIGNAL \r_dis[33]~output_o\ : std_logic;
SIGNAL \r_dis[34]~output_o\ : std_logic;
SIGNAL \r_dis[35]~output_o\ : std_logic;
SIGNAL \r_dis[36]~output_o\ : std_logic;
SIGNAL \r_dis[37]~output_o\ : std_logic;
SIGNAL \r_dis[38]~output_o\ : std_logic;
SIGNAL \r_dis[39]~output_o\ : std_logic;
SIGNAL \r_dis[40]~output_o\ : std_logic;
SIGNAL \r_dis[41]~output_o\ : std_logic;
SIGNAL \r_dis[42]~output_o\ : std_logic;
SIGNAL \r_dis[43]~output_o\ : std_logic;
SIGNAL \r_dis[44]~output_o\ : std_logic;
SIGNAL \r_dis[45]~output_o\ : std_logic;
SIGNAL \r_dis[46]~output_o\ : std_logic;
SIGNAL \r_dis[47]~output_o\ : std_logic;
SIGNAL \r_dis[48]~output_o\ : std_logic;
SIGNAL \r_dis[49]~output_o\ : std_logic;
SIGNAL \r_dis[50]~output_o\ : std_logic;
SIGNAL \r_dis[51]~output_o\ : std_logic;
SIGNAL \r_dis[52]~output_o\ : std_logic;
SIGNAL \r_dis[53]~output_o\ : std_logic;
SIGNAL \r_dis[54]~output_o\ : std_logic;
SIGNAL \r_dis[55]~output_o\ : std_logic;
SIGNAL \r_dis[56]~output_o\ : std_logic;
SIGNAL \r_dis[57]~output_o\ : std_logic;
SIGNAL \r_dis[58]~output_o\ : std_logic;
SIGNAL \r_dis[59]~output_o\ : std_logic;
SIGNAL \r_dis[60]~output_o\ : std_logic;
SIGNAL \r_dis[61]~output_o\ : std_logic;
SIGNAL \r_dis[62]~output_o\ : std_logic;
SIGNAL \r_dis[63]~output_o\ : std_logic;
SIGNAL \g_dis[0]~output_o\ : std_logic;
SIGNAL \g_dis[1]~output_o\ : std_logic;
SIGNAL \g_dis[2]~output_o\ : std_logic;
SIGNAL \g_dis[3]~output_o\ : std_logic;
SIGNAL \g_dis[4]~output_o\ : std_logic;
SIGNAL \g_dis[5]~output_o\ : std_logic;
SIGNAL \g_dis[6]~output_o\ : std_logic;
SIGNAL \g_dis[7]~output_o\ : std_logic;
SIGNAL \g_dis[8]~output_o\ : std_logic;
SIGNAL \g_dis[9]~output_o\ : std_logic;
SIGNAL \g_dis[10]~output_o\ : std_logic;
SIGNAL \g_dis[11]~output_o\ : std_logic;
SIGNAL \g_dis[12]~output_o\ : std_logic;
SIGNAL \g_dis[13]~output_o\ : std_logic;
SIGNAL \g_dis[14]~output_o\ : std_logic;
SIGNAL \g_dis[15]~output_o\ : std_logic;
SIGNAL \g_dis[16]~output_o\ : std_logic;
SIGNAL \g_dis[17]~output_o\ : std_logic;
SIGNAL \g_dis[18]~output_o\ : std_logic;
SIGNAL \g_dis[19]~output_o\ : std_logic;
SIGNAL \g_dis[20]~output_o\ : std_logic;
SIGNAL \g_dis[21]~output_o\ : std_logic;
SIGNAL \g_dis[22]~output_o\ : std_logic;
SIGNAL \g_dis[23]~output_o\ : std_logic;
SIGNAL \g_dis[24]~output_o\ : std_logic;
SIGNAL \g_dis[25]~output_o\ : std_logic;
SIGNAL \g_dis[26]~output_o\ : std_logic;
SIGNAL \g_dis[27]~output_o\ : std_logic;
SIGNAL \g_dis[28]~output_o\ : std_logic;
SIGNAL \g_dis[29]~output_o\ : std_logic;
SIGNAL \g_dis[30]~output_o\ : std_logic;
SIGNAL \g_dis[31]~output_o\ : std_logic;
SIGNAL \g_dis[32]~output_o\ : std_logic;
SIGNAL \g_dis[33]~output_o\ : std_logic;
SIGNAL \g_dis[34]~output_o\ : std_logic;
SIGNAL \g_dis[35]~output_o\ : std_logic;
SIGNAL \g_dis[36]~output_o\ : std_logic;
SIGNAL \g_dis[37]~output_o\ : std_logic;
SIGNAL \g_dis[38]~output_o\ : std_logic;
SIGNAL \g_dis[39]~output_o\ : std_logic;
SIGNAL \g_dis[40]~output_o\ : std_logic;
SIGNAL \g_dis[41]~output_o\ : std_logic;
SIGNAL \g_dis[42]~output_o\ : std_logic;
SIGNAL \g_dis[43]~output_o\ : std_logic;
SIGNAL \g_dis[44]~output_o\ : std_logic;
SIGNAL \g_dis[45]~output_o\ : std_logic;
SIGNAL \g_dis[46]~output_o\ : std_logic;
SIGNAL \g_dis[47]~output_o\ : std_logic;
SIGNAL \g_dis[48]~output_o\ : std_logic;
SIGNAL \g_dis[49]~output_o\ : std_logic;
SIGNAL \g_dis[50]~output_o\ : std_logic;
SIGNAL \g_dis[51]~output_o\ : std_logic;
SIGNAL \g_dis[52]~output_o\ : std_logic;
SIGNAL \g_dis[53]~output_o\ : std_logic;
SIGNAL \g_dis[54]~output_o\ : std_logic;
SIGNAL \g_dis[55]~output_o\ : std_logic;
SIGNAL \g_dis[56]~output_o\ : std_logic;
SIGNAL \g_dis[57]~output_o\ : std_logic;
SIGNAL \g_dis[58]~output_o\ : std_logic;
SIGNAL \g_dis[59]~output_o\ : std_logic;
SIGNAL \g_dis[60]~output_o\ : std_logic;
SIGNAL \g_dis[61]~output_o\ : std_logic;
SIGNAL \g_dis[62]~output_o\ : std_logic;
SIGNAL \g_dis[63]~output_o\ : std_logic;

BEGIN

ww_clk <= clk;
ww_rst_n <= rst_n;
ww_keyvalue <= keyvalue;
ww_keyfinish <= keyfinish;
r_dis <= ww_r_dis;
g_dis <= ww_g_dis;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

-- Location: IOOBUF_X31_Y0_N16
\r_dis[0]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_dis[0]~output_o\);

-- Location: IOOBUF_X81_Y7_N9
\r_dis[1]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_dis[1]~output_o\);

-- Location: IOOBUF_X58_Y0_N2
\r_dis[2]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_dis[2]~output_o\);

-- Location: IOOBUF_X81_Y2_N16
\r_dis[3]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_dis[3]~output_o\);

-- Location: IOOBUF_X22_Y67_N2
\r_dis[4]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_dis[4]~output_o\);

-- Location: IOOBUF_X24_Y67_N9
\r_dis[5]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_dis[5]~output_o\);

-- Location: IOOBUF_X81_Y2_N9
\r_dis[6]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_dis[6]~output_o\);

-- Location: IOOBUF_X81_Y46_N2
\r_dis[7]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_dis[7]~output_o\);

-- Location: IOOBUF_X81_Y17_N2
\r_dis[8]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_dis[8]~output_o\);

-- Location: IOOBUF_X81_Y2_N2
\r_dis[9]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_dis[9]~output_o\);

-- Location: IOOBUF_X8_Y0_N2
\r_dis[10]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_dis[10]~output_o\);

-- Location: IOOBUF_X68_Y0_N2
\r_dis[11]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_dis[11]~output_o\);

-- Location: IOOBUF_X10_Y0_N9
\r_dis[12]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_dis[12]~output_o\);

-- Location: IOOBUF_X81_Y9_N9
\r_dis[13]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_dis[13]~output_o\);

-- Location: IOOBUF_X81_Y56_N2
\r_dis[14]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_dis[14]~output_o\);

-- Location: IOOBUF_X81_Y4_N23
\r_dis[15]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_dis[15]~output_o\);

-- Location: IOOBUF_X81_Y9_N2
\r_dis[16]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_dis[16]~output_o\);

-- Location: IOOBUF_X15_Y0_N23
\r_dis[17]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_dis[17]~output_o\);

-- Location: IOOBUF_X81_Y4_N16
\r_dis[18]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_dis[18]~output_o\);

-- Location: IOOBUF_X81_Y10_N16
\r_dis[19]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_dis[19]~output_o\);

-- Location: IOOBUF_X81_Y20_N2
\r_dis[20]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_dis[20]~output_o\);

-- Location: IOOBUF_X81_Y4_N9
\r_dis[21]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_dis[21]~output_o\);

-- Location: IOOBUF_X81_Y10_N9
\r_dis[22]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_dis[22]~output_o\);

-- Location: IOOBUF_X56_Y0_N16
\r_dis[23]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_dis[23]~output_o\);

-- Location: IOOBUF_X81_Y4_N2
\r_dis[24]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_dis[24]~output_o\);

-- Location: IOOBUF_X44_Y67_N23
\r_dis[25]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_dis[25]~output_o\);

-- Location: IOOBUF_X81_Y49_N16
\r_dis[26]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_dis[26]~output_o\);

-- Location: IOOBUF_X81_Y5_N2
\r_dis[27]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_dis[27]~output_o\);

-- Location: IOOBUF_X81_Y6_N16
\r_dis[28]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_dis[28]~output_o\);

-- Location: IOOBUF_X56_Y0_N9
\r_dis[29]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_dis[29]~output_o\);

-- Location: IOOBUF_X15_Y67_N16
\r_dis[30]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_dis[30]~output_o\);

-- Location: IOOBUF_X10_Y67_N23
\r_dis[31]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_dis[31]~output_o\);

-- Location: IOOBUF_X17_Y67_N9
\r_dis[32]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_dis[32]~output_o\);

-- Location: IOOBUF_X54_Y67_N23
\r_dis[33]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_dis[33]~output_o\);

-- Location: IOOBUF_X81_Y20_N9
\r_dis[34]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_dis[34]~output_o\);

-- Location: IOOBUF_X81_Y25_N2
\r_dis[35]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_dis[35]~output_o\);

-- Location: IOOBUF_X81_Y6_N2
\r_dis[36]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_dis[36]~output_o\);

-- Location: IOOBUF_X81_Y14_N16
\r_dis[37]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_dis[37]~output_o\);

-- Location: IOOBUF_X29_Y67_N9
\r_dis[38]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_dis[38]~output_o\);

-- Location: IOOBUF_X81_Y7_N16
\r_dis[39]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_dis[39]~output_o\);

-- Location: IOOBUF_X33_Y0_N9
\r_dis[40]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_dis[40]~output_o\);

-- Location: IOOBUF_X81_Y26_N2
\r_dis[41]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_dis[41]~output_o\);

-- Location: IOOBUF_X8_Y67_N9
\r_dis[42]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_dis[42]~output_o\);

-- Location: IOOBUF_X15_Y0_N2
\r_dis[43]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_dis[43]~output_o\);

-- Location: IOOBUF_X8_Y0_N16
\r_dis[44]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_dis[44]~output_o\);

-- Location: IOOBUF_X49_Y0_N9
\r_dis[45]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_dis[45]~output_o\);

-- Location: IOOBUF_X65_Y67_N9
\r_dis[46]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_dis[46]~output_o\);

-- Location: IOOBUF_X31_Y67_N9
\r_dis[47]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_dis[47]~output_o\);

-- Location: IOOBUF_X17_Y0_N9
\r_dis[48]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_dis[48]~output_o\);

-- Location: IOOBUF_X29_Y0_N2
\r_dis[49]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_dis[49]~output_o\);

-- Location: IOOBUF_X49_Y0_N2
\r_dis[50]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_dis[50]~output_o\);

-- Location: IOOBUF_X19_Y0_N16
\r_dis[51]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_dis[51]~output_o\);

-- Location: IOOBUF_X81_Y50_N9
\r_dis[52]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_dis[52]~output_o\);

-- Location: IOOBUF_X22_Y67_N9
\r_dis[53]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_dis[53]~output_o\);

-- Location: IOOBUF_X68_Y0_N9
\r_dis[54]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_dis[54]~output_o\);

-- Location: IOOBUF_X33_Y0_N2
\r_dis[55]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_dis[55]~output_o\);

-- Location: IOOBUF_X52_Y67_N2
\r_dis[56]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_dis[56]~output_o\);

-- Location: IOOBUF_X81_Y65_N9
\r_dis[57]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_dis[57]~output_o\);

-- Location: IOOBUF_X29_Y0_N9
\r_dis[58]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_dis[58]~output_o\);

-- Location: IOOBUF_X3_Y0_N16
\r_dis[59]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_dis[59]~output_o\);

-- Location: IOOBUF_X22_Y0_N16
\r_dis[60]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_dis[60]~output_o\);

-- Location: IOOBUF_X70_Y67_N2
\r_dis[61]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_dis[61]~output_o\);

-- Location: IOOBUF_X54_Y67_N9
\r_dis[62]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_dis[62]~output_o\);

-- Location: IOOBUF_X22_Y0_N9
\r_dis[63]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \r_dis[63]~output_o\);

-- Location: IOOBUF_X6_Y0_N16
\g_dis[0]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \g_dis[0]~output_o\);

-- Location: IOOBUF_X6_Y0_N2
\g_dis[1]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \g_dis[1]~output_o\);

-- Location: IOOBUF_X22_Y0_N2
\g_dis[2]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \g_dis[2]~output_o\);

-- Location: IOOBUF_X31_Y0_N2
\g_dis[3]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \g_dis[3]~output_o\);

-- Location: IOOBUF_X6_Y0_N23
\g_dis[4]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \g_dis[4]~output_o\);

-- Location: IOOBUF_X56_Y0_N23
\g_dis[5]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \g_dis[5]~output_o\);

-- Location: IOOBUF_X54_Y0_N2
\g_dis[6]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \g_dis[6]~output_o\);

-- Location: IOOBUF_X81_Y16_N2
\g_dis[7]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \g_dis[7]~output_o\);

-- Location: IOOBUF_X26_Y0_N9
\g_dis[8]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \g_dis[8]~output_o\);

-- Location: IOOBUF_X19_Y0_N9
\g_dis[9]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \g_dis[9]~output_o\);

-- Location: IOOBUF_X81_Y7_N2
\g_dis[10]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \g_dis[10]~output_o\);

-- Location: IOOBUF_X49_Y0_N16
\g_dis[11]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \g_dis[11]~output_o\);

-- Location: IOOBUF_X29_Y0_N16
\g_dis[12]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \g_dis[12]~output_o\);

-- Location: IOOBUF_X10_Y0_N23
\g_dis[13]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \g_dis[13]~output_o\);

-- Location: IOOBUF_X81_Y2_N23
\g_dis[14]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \g_dis[14]~output_o\);

-- Location: IOOBUF_X65_Y0_N16
\g_dis[15]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \g_dis[15]~output_o\);

-- Location: IOOBUF_X8_Y0_N23
\g_dis[16]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \g_dis[16]~output_o\);

-- Location: IOOBUF_X81_Y53_N9
\g_dis[17]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \g_dis[17]~output_o\);

-- Location: IOOBUF_X17_Y0_N23
\g_dis[18]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \g_dis[18]~output_o\);

-- Location: IOOBUF_X3_Y0_N2
\g_dis[19]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \g_dis[19]~output_o\);

-- Location: IOOBUF_X42_Y0_N9
\g_dis[20]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \g_dis[20]~output_o\);

-- Location: IOOBUF_X81_Y8_N9
\g_dis[21]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \g_dis[21]~output_o\);

-- Location: IOOBUF_X54_Y67_N16
\g_dis[22]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \g_dis[22]~output_o\);

-- Location: IOOBUF_X24_Y67_N23
\g_dis[23]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \g_dis[23]~output_o\);

-- Location: IOOBUF_X33_Y67_N9
\g_dis[24]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \g_dis[24]~output_o\);

-- Location: IOOBUF_X15_Y0_N16
\g_dis[25]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \g_dis[25]~output_o\);

-- Location: IOOBUF_X13_Y67_N2
\g_dis[26]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \g_dis[26]~output_o\);

-- Location: IOOBUF_X68_Y0_N16
\g_dis[27]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \g_dis[27]~output_o\);

-- Location: IOOBUF_X81_Y59_N16
\g_dis[28]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \g_dis[28]~output_o\);

-- Location: IOOBUF_X61_Y0_N2
\g_dis[29]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \g_dis[29]~output_o\);

-- Location: IOOBUF_X44_Y67_N2
\g_dis[30]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \g_dis[30]~output_o\);

-- Location: IOOBUF_X58_Y0_N9
\g_dis[31]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \g_dis[31]~output_o\);

-- Location: IOOBUF_X33_Y67_N2
\g_dis[32]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \g_dis[32]~output_o\);

-- Location: IOOBUF_X26_Y67_N2
\g_dis[33]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \g_dis[33]~output_o\);

-- Location: IOOBUF_X15_Y67_N23
\g_dis[34]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \g_dis[34]~output_o\);

-- Location: IOOBUF_X40_Y0_N9
\g_dis[35]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \g_dis[35]~output_o\);

-- Location: IOOBUF_X33_Y0_N23
\g_dis[36]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \g_dis[36]~output_o\);

-- Location: IOOBUF_X81_Y62_N9
\g_dis[37]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \g_dis[37]~output_o\);

-- Location: IOOBUF_X81_Y6_N9
\g_dis[38]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \g_dis[38]~output_o\);

-- Location: IOOBUF_X52_Y0_N16
\g_dis[39]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \g_dis[39]~output_o\);

-- Location: IOOBUF_X81_Y14_N9
\g_dis[40]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \g_dis[40]~output_o\);

-- Location: IOOBUF_X33_Y0_N16
\g_dis[41]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \g_dis[41]~output_o\);

-- Location: IOOBUF_X54_Y0_N23
\g_dis[42]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \g_dis[42]~output_o\);

-- Location: IOOBUF_X81_Y3_N2
\g_dis[43]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \g_dis[43]~output_o\);

-- Location: IOOBUF_X15_Y0_N9
\g_dis[44]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \g_dis[44]~output_o\);

-- Location: IOOBUF_X19_Y0_N2
\g_dis[45]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \g_dis[45]~output_o\);

-- Location: IOOBUF_X65_Y0_N9
\g_dis[46]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \g_dis[46]~output_o\);

-- Location: IOOBUF_X42_Y0_N2
\g_dis[47]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \g_dis[47]~output_o\);

-- Location: IOOBUF_X81_Y64_N9
\g_dis[48]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \g_dis[48]~output_o\);

-- Location: IOOBUF_X65_Y0_N2
\g_dis[49]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \g_dis[49]~output_o\);

-- Location: IOOBUF_X42_Y0_N16
\g_dis[50]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \g_dis[50]~output_o\);

-- Location: IOOBUF_X19_Y67_N9
\g_dis[51]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \g_dis[51]~output_o\);

-- Location: IOOBUF_X54_Y0_N16
\g_dis[52]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \g_dis[52]~output_o\);

-- Location: IOOBUF_X8_Y67_N16
\g_dis[53]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \g_dis[53]~output_o\);

-- Location: IOOBUF_X52_Y67_N23
\g_dis[54]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \g_dis[54]~output_o\);

-- Location: IOOBUF_X3_Y0_N9
\g_dis[55]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \g_dis[55]~output_o\);

-- Location: IOOBUF_X63_Y67_N16
\g_dis[56]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \g_dis[56]~output_o\);

-- Location: IOOBUF_X24_Y0_N2
\g_dis[57]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \g_dis[57]~output_o\);

-- Location: IOOBUF_X58_Y0_N16
\g_dis[58]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \g_dis[58]~output_o\);

-- Location: IOOBUF_X47_Y0_N9
\g_dis[59]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \g_dis[59]~output_o\);

-- Location: IOOBUF_X81_Y23_N9
\g_dis[60]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \g_dis[60]~output_o\);

-- Location: IOOBUF_X70_Y0_N16
\g_dis[61]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \g_dis[61]~output_o\);

-- Location: IOOBUF_X47_Y0_N2
\g_dis[62]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \g_dis[62]~output_o\);

-- Location: IOOBUF_X58_Y0_N23
\g_dis[63]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \g_dis[63]~output_o\);

-- Location: IOIBUF_X49_Y67_N22
\keyfinish~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_keyfinish,
	o => \keyfinish~input_o\);

-- Location: IOIBUF_X52_Y67_N15
\clk~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

-- Location: IOIBUF_X33_Y67_N15
\rst_n~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rst_n,
	o => \rst_n~input_o\);

-- Location: IOIBUF_X33_Y67_N22
\keyvalue[4]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_keyvalue(4),
	o => \keyvalue[4]~input_o\);

-- Location: IOIBUF_X81_Y11_N22
\keyvalue[3]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_keyvalue(3),
	o => \keyvalue[3]~input_o\);

-- Location: IOIBUF_X8_Y0_N8
\keyvalue[2]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_keyvalue(2),
	o => \keyvalue[2]~input_o\);

-- Location: IOIBUF_X40_Y0_N15
\keyvalue[1]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_keyvalue(1),
	o => \keyvalue[1]~input_o\);

-- Location: IOIBUF_X31_Y0_N22
\keyvalue[0]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_keyvalue(0),
	o => \keyvalue[0]~input_o\);

ww_r_dis(0) <= \r_dis[0]~output_o\;

ww_r_dis(1) <= \r_dis[1]~output_o\;

ww_r_dis(2) <= \r_dis[2]~output_o\;

ww_r_dis(3) <= \r_dis[3]~output_o\;

ww_r_dis(4) <= \r_dis[4]~output_o\;

ww_r_dis(5) <= \r_dis[5]~output_o\;

ww_r_dis(6) <= \r_dis[6]~output_o\;

ww_r_dis(7) <= \r_dis[7]~output_o\;

ww_r_dis(8) <= \r_dis[8]~output_o\;

ww_r_dis(9) <= \r_dis[9]~output_o\;

ww_r_dis(10) <= \r_dis[10]~output_o\;

ww_r_dis(11) <= \r_dis[11]~output_o\;

ww_r_dis(12) <= \r_dis[12]~output_o\;

ww_r_dis(13) <= \r_dis[13]~output_o\;

ww_r_dis(14) <= \r_dis[14]~output_o\;

ww_r_dis(15) <= \r_dis[15]~output_o\;

ww_r_dis(16) <= \r_dis[16]~output_o\;

ww_r_dis(17) <= \r_dis[17]~output_o\;

ww_r_dis(18) <= \r_dis[18]~output_o\;

ww_r_dis(19) <= \r_dis[19]~output_o\;

ww_r_dis(20) <= \r_dis[20]~output_o\;

ww_r_dis(21) <= \r_dis[21]~output_o\;

ww_r_dis(22) <= \r_dis[22]~output_o\;

ww_r_dis(23) <= \r_dis[23]~output_o\;

ww_r_dis(24) <= \r_dis[24]~output_o\;

ww_r_dis(25) <= \r_dis[25]~output_o\;

ww_r_dis(26) <= \r_dis[26]~output_o\;

ww_r_dis(27) <= \r_dis[27]~output_o\;

ww_r_dis(28) <= \r_dis[28]~output_o\;

ww_r_dis(29) <= \r_dis[29]~output_o\;

ww_r_dis(30) <= \r_dis[30]~output_o\;

ww_r_dis(31) <= \r_dis[31]~output_o\;

ww_r_dis(32) <= \r_dis[32]~output_o\;

ww_r_dis(33) <= \r_dis[33]~output_o\;

ww_r_dis(34) <= \r_dis[34]~output_o\;

ww_r_dis(35) <= \r_dis[35]~output_o\;

ww_r_dis(36) <= \r_dis[36]~output_o\;

ww_r_dis(37) <= \r_dis[37]~output_o\;

ww_r_dis(38) <= \r_dis[38]~output_o\;

ww_r_dis(39) <= \r_dis[39]~output_o\;

ww_r_dis(40) <= \r_dis[40]~output_o\;

ww_r_dis(41) <= \r_dis[41]~output_o\;

ww_r_dis(42) <= \r_dis[42]~output_o\;

ww_r_dis(43) <= \r_dis[43]~output_o\;

ww_r_dis(44) <= \r_dis[44]~output_o\;

ww_r_dis(45) <= \r_dis[45]~output_o\;

ww_r_dis(46) <= \r_dis[46]~output_o\;

ww_r_dis(47) <= \r_dis[47]~output_o\;

ww_r_dis(48) <= \r_dis[48]~output_o\;

ww_r_dis(49) <= \r_dis[49]~output_o\;

ww_r_dis(50) <= \r_dis[50]~output_o\;

ww_r_dis(51) <= \r_dis[51]~output_o\;

ww_r_dis(52) <= \r_dis[52]~output_o\;

ww_r_dis(53) <= \r_dis[53]~output_o\;

ww_r_dis(54) <= \r_dis[54]~output_o\;

ww_r_dis(55) <= \r_dis[55]~output_o\;

ww_r_dis(56) <= \r_dis[56]~output_o\;

ww_r_dis(57) <= \r_dis[57]~output_o\;

ww_r_dis(58) <= \r_dis[58]~output_o\;

ww_r_dis(59) <= \r_dis[59]~output_o\;

ww_r_dis(60) <= \r_dis[60]~output_o\;

ww_r_dis(61) <= \r_dis[61]~output_o\;

ww_r_dis(62) <= \r_dis[62]~output_o\;

ww_r_dis(63) <= \r_dis[63]~output_o\;

ww_g_dis(0) <= \g_dis[0]~output_o\;

ww_g_dis(1) <= \g_dis[1]~output_o\;

ww_g_dis(2) <= \g_dis[2]~output_o\;

ww_g_dis(3) <= \g_dis[3]~output_o\;

ww_g_dis(4) <= \g_dis[4]~output_o\;

ww_g_dis(5) <= \g_dis[5]~output_o\;

ww_g_dis(6) <= \g_dis[6]~output_o\;

ww_g_dis(7) <= \g_dis[7]~output_o\;

ww_g_dis(8) <= \g_dis[8]~output_o\;

ww_g_dis(9) <= \g_dis[9]~output_o\;

ww_g_dis(10) <= \g_dis[10]~output_o\;

ww_g_dis(11) <= \g_dis[11]~output_o\;

ww_g_dis(12) <= \g_dis[12]~output_o\;

ww_g_dis(13) <= \g_dis[13]~output_o\;

ww_g_dis(14) <= \g_dis[14]~output_o\;

ww_g_dis(15) <= \g_dis[15]~output_o\;

ww_g_dis(16) <= \g_dis[16]~output_o\;

ww_g_dis(17) <= \g_dis[17]~output_o\;

ww_g_dis(18) <= \g_dis[18]~output_o\;

ww_g_dis(19) <= \g_dis[19]~output_o\;

ww_g_dis(20) <= \g_dis[20]~output_o\;

ww_g_dis(21) <= \g_dis[21]~output_o\;

ww_g_dis(22) <= \g_dis[22]~output_o\;

ww_g_dis(23) <= \g_dis[23]~output_o\;

ww_g_dis(24) <= \g_dis[24]~output_o\;

ww_g_dis(25) <= \g_dis[25]~output_o\;

ww_g_dis(26) <= \g_dis[26]~output_o\;

ww_g_dis(27) <= \g_dis[27]~output_o\;

ww_g_dis(28) <= \g_dis[28]~output_o\;

ww_g_dis(29) <= \g_dis[29]~output_o\;

ww_g_dis(30) <= \g_dis[30]~output_o\;

ww_g_dis(31) <= \g_dis[31]~output_o\;

ww_g_dis(32) <= \g_dis[32]~output_o\;

ww_g_dis(33) <= \g_dis[33]~output_o\;

ww_g_dis(34) <= \g_dis[34]~output_o\;

ww_g_dis(35) <= \g_dis[35]~output_o\;

ww_g_dis(36) <= \g_dis[36]~output_o\;

ww_g_dis(37) <= \g_dis[37]~output_o\;

ww_g_dis(38) <= \g_dis[38]~output_o\;

ww_g_dis(39) <= \g_dis[39]~output_o\;

ww_g_dis(40) <= \g_dis[40]~output_o\;

ww_g_dis(41) <= \g_dis[41]~output_o\;

ww_g_dis(42) <= \g_dis[42]~output_o\;

ww_g_dis(43) <= \g_dis[43]~output_o\;

ww_g_dis(44) <= \g_dis[44]~output_o\;

ww_g_dis(45) <= \g_dis[45]~output_o\;

ww_g_dis(46) <= \g_dis[46]~output_o\;

ww_g_dis(47) <= \g_dis[47]~output_o\;

ww_g_dis(48) <= \g_dis[48]~output_o\;

ww_g_dis(49) <= \g_dis[49]~output_o\;

ww_g_dis(50) <= \g_dis[50]~output_o\;

ww_g_dis(51) <= \g_dis[51]~output_o\;

ww_g_dis(52) <= \g_dis[52]~output_o\;

ww_g_dis(53) <= \g_dis[53]~output_o\;

ww_g_dis(54) <= \g_dis[54]~output_o\;

ww_g_dis(55) <= \g_dis[55]~output_o\;

ww_g_dis(56) <= \g_dis[56]~output_o\;

ww_g_dis(57) <= \g_dis[57]~output_o\;

ww_g_dis(58) <= \g_dis[58]~output_o\;

ww_g_dis(59) <= \g_dis[59]~output_o\;

ww_g_dis(60) <= \g_dis[60]~output_o\;

ww_g_dis(61) <= \g_dis[61]~output_o\;

ww_g_dis(62) <= \g_dis[62]~output_o\;

ww_g_dis(63) <= \g_dis[63]~output_o\;
END structure;


