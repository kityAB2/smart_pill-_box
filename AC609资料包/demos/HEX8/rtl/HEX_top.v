/***************************************************
*	Module Name		:	HEX_top		   
*	Engineer		   :	James
*	Target Device	:	EP4CE10F17C8
*	Tool versions	:	Quartus II 13.0
*	Create Date		:	2019-4-29
*	Revision		   :	v1.0
*	Description		:  8位7段数码管显示   板级测试顶层模块
**************************************************/

module HEX_top(
		Clk,
		Rst_n,
		sel,
		seg
	);
	
	input Clk;   //50M
	input Rst_n;

	
	output[7:0] sel;//数码管位选（选择当前要现实的数码管）
	output[6:0]  seg;//数码管段选（当前要显示的内容）
	
	
	wire[31:0] disp_data;
	
	hex_data hex_data(
	.probe(),
	.source(disp_data)
	);
	
	HEX8 HEX8(
		.Clk(Clk),
		.Rst_n(Rst_n),
		.En(1'b1),
		.disp_data(disp_data),
		.sel(sel),
		.seg(seg)
	);
	
endmodule