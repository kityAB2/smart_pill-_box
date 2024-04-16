module lcd1602_display(
	input				clk			,//时钟
	input				rst_n		,//复位
	input   [3:0]       mode_out    ,//模式
	input   [3:0]       index_out    ,//模式
    input	[23:0]      time_din,       // 显示的时间
	input   [27:0]      pill_box_din,   //系统药盒设置
	output	reg [255:0]		dis_data   //显示数据低位表示
	); 
parameter TIME = 4'd0;//指示该系统的状态
parameter PILL_BOX1 = 4'd1;
parameter PILL_BOX2 = 4'd2;
parameter PILL_BOX3 = 4'd3;
always @ (posedge clk or negedge rst_n)  
begin
	if(!rst_n) begin						
		dis_data <= "                                ";					
	end
	else begin
//      dis_data <= "                                ";	
//		dis_data[ 7: 0]<=" ";
//		dis_data[15: 8]<="s";
//		dis_data[23:16]<="m";
//		dis_data[31:24]<="a";
//		dis_data[39:32]<="r";
//		dis_data[47:40]<="t";
//		dis_data[55:48]<=" ";
//		dis_data[63:56]<="p";
//		dis_data[71:64]<="i";
//		dis_data[79:72]<="l";
//		dis_data[87:80]<="l";
//		dis_data[95:88]<=" ";
//		dis_data[103:96]<="b";
//		dis_data[111:104]<="o";
//		dis_data[119:112]<="x";
//		dis_data[127:120]<=" ";
		if(mode_out==TIME) begin
			dis_data[ 7: 0]<=" ";//第一行显示
			dis_data[15: 8]<="s";
			dis_data[23:16]<="m";
			dis_data[31:24]<="a";
			dis_data[39:32]<="r";
			dis_data[47:40]<="t";
			dis_data[55:48]<=" ";
			dis_data[63:56]<="p";
			dis_data[71:64]<="i";
			dis_data[79:72]<="l";
			dis_data[87:80]<="l";
			dis_data[95:88]<=" ";
			dis_data[103:96]<="b";
			dis_data[111:104]<="o";
			dis_data[119:112]<="x";
			dis_data[127:120]<=" ";
			dis_data[135:128]<=" ";//第二行显示
			dis_data[143:136]<=" ";
			dis_data[151:144]<=" ";
			dis_data[159:152]<=" ";
			dis_data[167:160]<=to_char(time_din[23:20]);
			dis_data[175:168]<=to_char(time_din[19:16]);
			dis_data[183:176]<=":";
			dis_data[192:184]<=to_char(time_din[15:12]);
			dis_data[199:192]<=to_char(time_din[11: 8]);
			dis_data[207:200]<=":";
			dis_data[215:208]<=to_char(time_din[ 7: 4]);
			dis_data[223:216]<=to_char(time_din[ 3: 0]);	
			dis_data[231:224]<=" ";
			dis_data[239:232]<=" ";
			dis_data[247:240]<=" ";
			dis_data[255:248]<=" ";
		end
		else if(mode_out==PILL_BOX1||mode_out==PILL_BOX2||mode_out==PILL_BOX3) begin
			dis_data[ 7: 0]<=" ";//第一行显示
			dis_data[15: 8]<=" ";
			dis_data[23:16]<=" ";
			dis_data[31:24]<=" ";
			dis_data[39:32]<=" ";
			dis_data[47:40]<="b";
			dis_data[55:48]<="o";
			dis_data[63:56]<="x";
			dis_data[71:64]<=to_char(mode_out);
			dis_data[79:72]<=":";
			dis_data[87:80]<=to_char(index_out)+"1"-"0";
			dis_data[95:88]<=" ";
			dis_data[103:96]<=" ";
			dis_data[111:104]<=" ";
			dis_data[119:112]<=" ";
			dis_data[127:120]<=" ";
			dis_data[135:128]<=" ";
			dis_data[143:136]<=" ";
			dis_data[151:144]<=" ";
			dis_data[159:152]<=" ";
			dis_data[167:160]<=to_char(pill_box_din[27:24]);
			dis_data[175:168]<=to_char(pill_box_din[23:20]);
			dis_data[183:176]<=":";
			dis_data[192:184]<=to_char(pill_box_din[19:16]);
			dis_data[199:192]<=to_char(pill_box_din[15: 12]);
			dis_data[207:200]<=":";
			dis_data[215:208]<=to_char(pill_box_din[ 11: 8]);
			dis_data[223:216]<=to_char(pill_box_din[ 7: 4]);
			
			dis_data[231:224]<=" ";
			if(pill_box_din[3:0]==4'd1) begin
				dis_data[239:232]<="o";
				dis_data[247:240]<="n";
				dis_data[255:248]<=" ";
			end
			else if(pill_box_din[3:0]==4'd0) begin
				dis_data[239:232]<="o";
				dis_data[247:240]<="f";
				dis_data[255:248]<="f";
			end
			else begin
				dis_data[239:232]<=" ";
				dis_data[247:240]<=" ";
				dis_data[255:248]<=" ";
			end
		end
	end	
end	

function [7:0] to_char;//二级制转ascll码
    input [3:0] char;
		begin
			case (char)  
				4'b0000 : to_char = "0";	
				4'b0001 : to_char = "1";
				4'b0010 : to_char = "2";	
				4'b0011 : to_char = "3";	
				4'b0100 : to_char = "4";	
				4'b0101 : to_char = "5";		
				4'b0110 : to_char = "6";	
				4'b0111 : to_char = "7";	
				4'b1000 : to_char = "8";	
				4'b1001 : to_char = "9";	
			default:  to_char =" "; 
			endcase	
		end
	endfunction

endmodule