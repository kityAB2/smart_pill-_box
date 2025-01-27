module lcd1602_driver(
	input				clk			,//时钟
	input				rst_n		,//复位
	input	[255:0]		dis_data    ,//显示数据低位表示
	output	reg			lcd_rs		,//命令数据选择
	output	wire		lcd_rw		,//读写控制信号
	output	reg			lcd_en		,//执行命令的使能引脚
	output	reg	[7:0]	lcd_data	 //发送的数据
	);
parameter SET_TIME_1MS = 32'd50_000;//1ms时间	
parameter SET_TIME_5MS = 32'd250_000;//5ms时间
parameter INIT_CMD_NUM = 4'd5;//初始化指令
reg	[31:0]	cnt				;//状态跳转计数器
reg	[3:0]	state_f			;//主状态机
reg	[3:0]	state_s		    ;//附状态机
reg	[3:0]	init_cnt		;//初始化发送的指令计数
reg [7:0]   init_cmd[4:0]  	;//初始化的指令  
reg [7:0]   pos_cmd[31:0]  	;//位置
reg [255:0] dis_cache	   	;//显示缓存
//更新显示过程中使用的寄存器
reg	[4:0]	refresh_pos		;//指示位置
reg	[7:0]	refresh_date    ;//指示显示的信息
reg	[4:0]	local_pos           ;//当前显示的位置
//主状态机用的状态
localparam
INIT			= 4'd0	,//初始状态
CHECK 			= 4'd1	,//检查显示缓存是否出现问题
REFRESH		    = 4'd2	;
//副状态机用的状态
localparam
S0			= 4'd0	,//发送指令
S1 			= 4'd1	,//
S2		    = 4'd2	,
S3		    = 4'd3	,//发送数据
S4		    = 4'd4	,//发送数据
S5		    = 4'd5	;//发送数据
//副状态机发送指令构建时间
localparam
S0_TIME			    = 10	,// 数据构建时间
S1_TIME	 			= 50000	,//
S2_TIME			    = 10	,
S3_TIME			    = 10	,
S4_TIME			    = 50000	,
S5_TIME			    = 10	;
assign lcd_rw = 1'b0;//设置该模块只能写入
always @ (posedge clk)  //指令
begin
	init_cmd[0]<=8'h38;//初始化指令
	init_cmd[1]<=8'h0c;
	init_cmd[2]<=8'h06;
	init_cmd[3]<=8'h01;
	init_cmd[4]<=8'h80;
	pos_cmd[ 0]<=8'h80+8'h00;
	pos_cmd[ 1]<=8'h80+8'h01;
	pos_cmd[ 2]<=8'h80+8'h02;
	pos_cmd[ 3]<=8'h80+8'h03;
	pos_cmd[ 4]<=8'h80+8'h04;
	pos_cmd[ 5]<=8'h80+8'h05;
	pos_cmd[ 6]<=8'h80+8'h06;
	pos_cmd[ 7]<=8'h80+8'h07;
	pos_cmd[ 8]<=8'h80+8'h08;
	pos_cmd[ 9]<=8'h80+8'h09;
	pos_cmd[10]<=8'h80+8'h0A;
	pos_cmd[11]<=8'h80+8'h0B;
	pos_cmd[12]<=8'h80+8'h0C;
	pos_cmd[13]<=8'h80+8'h0D;
	pos_cmd[14]<=8'h80+8'h0E;
	pos_cmd[15]<=8'h80+8'h0F;
	pos_cmd[16]<=8'h80+8'h40+8'h00;
	pos_cmd[17]<=8'h80+8'h40+8'h01;
	pos_cmd[18]<=8'h80+8'h40+8'h02;
	pos_cmd[19]<=8'h80+8'h40+8'h03;	
	pos_cmd[20]<=8'h80+8'h40+8'h04;
	pos_cmd[21]<=8'h80+8'h40+8'h05;
	pos_cmd[22]<=8'h80+8'h40+8'h06;
	pos_cmd[23]<=8'h80+8'h40+8'h07;
	pos_cmd[24]<=8'h80+8'h40+8'h08;
	pos_cmd[25]<=8'h80+8'h40+8'h09;
	pos_cmd[26]<=8'h80+8'h40+8'h0A;
	pos_cmd[27]<=8'h80+8'h40+8'h0B;
	pos_cmd[28]<=8'h80+8'h40+8'h0C;
	pos_cmd[29]<=8'h80+8'h40+8'h0D;
	pos_cmd[30]<=8'h80+8'h40+8'h0E;
	pos_cmd[31]<=8'h80+8'h40+8'h0F;	
end
always @ (posedge clk or negedge rst_n)  
begin
	if(!rst_n) begin	//
		state_f <= INIT;//主状态机
		state_s <= S0; 
		cnt <= 0;	
		refresh_pos<=5'd0;//指示需要刷新的显示的位置
		init_cnt <= 4'd0;//初始化过程中要发送的数据个数初始化为0
		lcd_rs <= 1'b0;
		lcd_en <= 1'b0;
		refresh_date<=" ";
		local_pos<=5'd0;//指示0
		dis_cache <= "                                ";
	end
	else begin
		if(state_f==INIT) begin
			if(init_cnt<INIT_CMD_NUM) begin
				if(state_s==S0) begin
					if(cnt==S0_TIME) begin
						cnt<=0;
						state_s<=S1;
					end
					else begin //数据构建时间
						cnt<=cnt+1;
						lcd_rs<=1'b0;
						lcd_en <= 1'b0;
						lcd_data<=init_cmd[init_cnt];
					end
					
				end
				else if(state_s==S1)begin
					if(cnt==S1_TIME) begin
						cnt<=0;
						state_s<=S2;
					end
					else begin //数据构建时间
						cnt<=cnt+1;
						lcd_en <= 1'b1;
					end
				end
				else if(state_s==S2)begin
					if(cnt==S2_TIME) begin
						cnt<=0;
						state_s<=S0;
						init_cnt<=init_cnt+4'd1;
					end
					else begin //数据构建时间
						cnt<=cnt+1;
						lcd_en <= 1'b0;
					end
				end
			end
			else begin
				state_f<=CHECK;
			end
		end
		else if(state_f==CHECK) begin
			if(dis_cache[7:0]!=dis_data[7:0]) begin//显示缓存与显示数据不一致
				refresh_pos<=5'd0;
				refresh_date<=dis_data[7:0];
				state_f <= REFRESH;//更新显示状态机
				if(local_pos==5'd0) state_s <= S3;
				else state_s <= S0; 
				dis_cache[7:0]<=dis_data[7:0];
			end
			else if(dis_cache[15:8]!=dis_data[15:8]) begin
				refresh_pos<=5'd1;
				refresh_date<=dis_data[15:8];
				state_f <= REFRESH;//更新显示状态机
				if(local_pos==5'd1) state_s <= S3;
				else state_s <= S0; 
				dis_cache[15:8]<=dis_data[15:8];
			end
			else if(dis_cache[23:16]!=dis_data[23:16]) begin
				refresh_pos<=5'd2;
				refresh_date<=dis_data[23:16];
				state_f <= REFRESH;//更新显示状态机
				if(local_pos==5'd2) state_s <= S3;
				else state_s <= S0; 
				dis_cache[23:16]<=dis_data[23:16];
			end
			else if(dis_cache[31:24]!=dis_data[31:24]) begin
				refresh_pos<=5'd3;
				refresh_date<=dis_data[31:24];
				state_f <= REFRESH;//更新显示状态机
				if(local_pos==5'd3) state_s <= S3;
				else state_s <= S0; 
				dis_cache[31:24]<=dis_data[31:24];
			end
			else if(dis_cache[39:32]!=dis_data[39:32]) begin
				refresh_pos<=5'd4;
				refresh_date<=dis_data[39:32];
				state_f <= REFRESH;//更新显示状态机
				if(local_pos==5'd4) state_s <= S3;
				else state_s <= S0; 
				dis_cache[39:32]<=dis_data[39:32];
			end
			else if(dis_cache[47:40]!=dis_data[47:40]) begin
				refresh_pos<=5'd5;
				refresh_date<=dis_data[47:40];
				state_f <= REFRESH;//更新显示状态机
				if(local_pos==5'd5) state_s <= S3;
				else state_s <= S0; 
				dis_cache[47:40]<=dis_data[47:40];
			end
			else if(dis_cache[55:48]!=dis_data[55:48]) begin
				refresh_pos<=5'd6;
				refresh_date<=dis_data[55:48];
				state_f <= REFRESH;//更新显示状态机
				if(local_pos==5'd6) state_s <= S3;
				else state_s <= S0; 
				dis_cache[55:48]<=dis_data[55:48];
			end
			else if(dis_cache[63:56]!=dis_data[63:56]) begin
				refresh_pos<=5'd7;
				refresh_date<=dis_data[63:56];
				state_f <= REFRESH;//更新显示状态机
				if(local_pos==5'd7) state_s <= S3;
				else state_s <= S0; 
				dis_cache[63:56]<=dis_data[63:56];
			end
			else if(dis_cache[71:64]!=dis_data[71:64]) begin
				refresh_pos<=5'd8;
				refresh_date<=dis_data[71:64];
				state_f <= REFRESH;//更新显示状态机
				if(local_pos==5'd8) state_s <= S3;
				else state_s <= S0; 
				dis_cache[71:64]<=dis_data[71:64];
			end
			else if(dis_cache[79:72]!=dis_data[79:72]) begin
				refresh_pos<=5'd9;
				refresh_date<=dis_data[79:72];
				state_f <= REFRESH;//更新显示状态机
				if(local_pos==5'd9) state_s <= S3;
				else state_s <= S0; 
				dis_cache[79:72]<=dis_data[79:72];
			end
			else if(dis_cache[87:80]!=dis_data[87:80]) begin
				refresh_pos<=5'd10;
				refresh_date<=dis_data[87:80];
				state_f <= REFRESH;//更新显示状态机
				if(local_pos==5'd10) state_s <= S3;
				else state_s <= S0; 
				dis_cache[87:80]<=dis_data[87:80];
			end
			else if(dis_cache[95:88]!=dis_data[95:88]) begin
				refresh_pos<=5'd11;
				refresh_date<=dis_data[95:88];
				state_f <= REFRESH;//更新显示状态机
				if(local_pos==5'd11) state_s <= S3;
				else state_s <= S0; 
				dis_cache[95:88]<=dis_data[95:88];
			end
			else if(dis_cache[103:96]!=dis_data[103:96]) begin
				refresh_pos<=5'd12;
				refresh_date<=dis_data[103:96];
				state_f <= REFRESH;//更新显示状态机
				if(local_pos==5'd12) state_s <= S3;
				else state_s <= S0; 
				dis_cache[103:96]<=dis_data[103:96];
			end
			else if(dis_cache[111:104]!=dis_data[111:104]) begin
				refresh_pos<=5'd13;
				refresh_date<=dis_data[111:104];
				state_f <= REFRESH;//更新显示状态机
				if(local_pos==5'd13) state_s <= S3;
				else state_s <= S0; 
				dis_cache[111:104]<=dis_data[111:104];
			end
			else if(dis_cache[119:112]!=dis_data[119:112]) begin
				refresh_pos<=5'd14;
				refresh_date<=dis_data[119:112];
				state_f <= REFRESH;//更新显示状态机
				if(local_pos==5'd14) state_s <= S3;
				else state_s <= S0; 
				dis_cache[119:112]<=dis_data[119:112];
			end
			else if(dis_cache[127:120]!=dis_data[127:120]) begin
				refresh_pos<=5'd15;
				refresh_date<=dis_data[127:120];
				state_f <= REFRESH;//更新显示状态机
				if(local_pos==5'd15) state_s <= S3;
				else state_s <= S0; 
				dis_cache[127:120]<=dis_data[127:120];
			end
			else if(dis_cache[135:128]!=dis_data[135:128]) begin
				refresh_pos<=5'd16;
				refresh_date<=dis_data[135:128];
				state_f <= REFRESH;//更新显示状态机
				if(local_pos==5'd16) state_s <= S3;
				else state_s <= S0; 
				dis_cache[135:128]<=dis_data[135:128];
			end
			else if(dis_cache[143:136]!=dis_data[143:136]) begin
				refresh_pos<=5'd17;
				refresh_date<=dis_data[143:136];
				state_f <= REFRESH;//更新显示状态机
				if(local_pos==5'd17) state_s <= S3;
				else state_s <= S0; 
				dis_cache[143:136]<=dis_data[143:136];
			end
			else if(dis_cache[151:144]!=dis_data[151:144]) begin
				refresh_pos<=5'd18;
				refresh_date<=dis_data[151:144];
				state_f <= REFRESH;//更新显示状态机
				if(local_pos==5'd18) state_s <= S3;
				else state_s <= S0; 
				dis_cache[151:144]<=dis_data[151:144];
			end
			else if(dis_cache[159:152]!=dis_data[159:152]) begin
				refresh_pos<=5'd19;
				refresh_date<=dis_data[159:152];
				state_f <= REFRESH;//更新显示状态机
				if(local_pos==5'd19) state_s <= S3;
				else state_s <= S0; 
				dis_cache[159:152]<=dis_data[159:152];
			end
			else if(dis_cache[167:160]!=dis_data[167:160]) begin
				refresh_pos<=5'd20;
				refresh_date<=dis_data[167:160];
				state_f <= REFRESH;//更新显示状态机
				if(local_pos==5'd20) state_s <= S3;
				else state_s <= S0; 
				dis_cache[167:160]<=dis_data[167:160];
			end
			else if(dis_cache[175:168]!=dis_data[175:168]) begin
				refresh_pos<=5'd21;
				refresh_date<=dis_data[175:168];
				state_f <= REFRESH;//更新显示状态机
				if(local_pos==5'd21) state_s <= S3;
				else state_s <= S0; 
				dis_cache[175:168]<=dis_data[175:168];
			end
			else if(dis_cache[183:176]!=dis_data[183:176]) begin
				refresh_pos<=5'd22;
				refresh_date<=dis_data[183:176];
				state_f <= REFRESH;//更新显示状态机
				if(local_pos==5'd22) state_s <= S3;
				else state_s <= S0; 
				dis_cache[183:176]<=dis_data[183:176];
			end
			else if(dis_cache[191:184]!=dis_data[191:184]) begin
				refresh_pos<=5'd23;
				refresh_date<=dis_data[191:184];
				state_f <= REFRESH;//更新显示状态机
				if(local_pos==5'd23) state_s <= S3;
				else state_s <= S0; 
				dis_cache[191:184]<=dis_data[191:184];
			end
			else if(dis_cache[199:192]!=dis_data[199:192]) begin
				refresh_pos<=5'd24;
				refresh_date<=dis_data[199:192];
				state_f <= REFRESH;//更新显示状态机
				if(local_pos==5'd24) state_s <= S3;
				else state_s <= S0; 
				dis_cache[199:192]<=dis_data[199:192];
			end
			else if(dis_cache[207:200]!=dis_data[207:200]) begin
				refresh_pos<=5'd25;
				refresh_date<=dis_data[207:200];
				state_f <= REFRESH;//更新显示状态机
				if(local_pos==5'd25) state_s <= S3;
				else state_s <= S0; 
				dis_cache[207:200]<=dis_data[207:200];
			end
			else if(dis_cache[215:208]!=dis_data[215:208]) begin
				refresh_pos<=5'd26;
				refresh_date<=dis_data[215:208];
				state_f <= REFRESH;//更新显示状态机
				if(local_pos==5'd26) state_s <= S3;
				else state_s <= S0; 
				dis_cache[215:208]<=dis_data[215:208];
			end
			else if(dis_cache[223:216]!=dis_data[223:216]) begin
				refresh_pos<=5'd27;
				refresh_date<=dis_data[223:216];
				state_f <= REFRESH;//更新显示状态机
				if(local_pos==5'd27) state_s <= S3;
				else state_s <= S0; 
				dis_cache[223:216]<=dis_data[223:216];
			end
			else if(dis_cache[231:224]!=dis_data[231:224]) begin
				refresh_pos<=5'd28;
				refresh_date<=dis_data[231:224];
				state_f <= REFRESH;//更新显示状态机
				if(local_pos==5'd28) state_s <= S3;
				else state_s <= S0; 
				dis_cache[231:224]<=dis_data[231:224];
			end
			else if(dis_cache[239:232]!=dis_data[239:232]) begin
				refresh_pos<=5'd29;
				refresh_date<=dis_data[239:232];
				state_f <= REFRESH;//更新显示状态机
				if(local_pos==5'd29) state_s <= S3;
				else state_s <= S0; 
				dis_cache[239:232]<=dis_data[239:232];
			end
			else if(dis_cache[247:240]!=dis_data[247:240]) begin
				refresh_pos<=5'd30;
				refresh_date<=dis_data[247:240];
				state_f <= REFRESH;//更新显示状态机
				if(local_pos==5'd30) state_s <= S3;
				else state_s <= S0; 
				dis_cache[247:240]<=dis_data[247:240];
			end
			else if(dis_cache[255:248]!=dis_data[255:248]) begin
				refresh_pos<=5'd31;
				refresh_date<=dis_data[255:248];
				state_f <= REFRESH;//更新显示状态机
				if(local_pos==5'd31) state_s <= S3;
				else state_s <= S0; 
				dis_cache[255:248]<=dis_data[255:248];
			end
			else begin
				state_f<=CHECK;
			end
			
		end
		else if(state_f==REFRESH) begin
			if(state_s==S0) begin
				if(cnt==S0_TIME) begin
					cnt<=0;
					state_s<=S1;
				end
				else begin //数据构建时间
					cnt<=cnt+1;
					lcd_rs<=1'b0;
					lcd_en <= 1'b0;
					lcd_data<=pos_cmd[refresh_pos];
					
				end	
			end
			else if(state_s==S1)begin
				if(cnt==S1_TIME) begin
					cnt<=0;
					state_s<=S2;
				end
				else begin //数据构建时间
					cnt<=cnt+1;
					lcd_en <= 1'b1;
				end
			end
			else if(state_s==S2)begin
				if(cnt==S2_TIME) begin
					cnt<=0;
					state_s<=S3;
				end
				else begin //数据构建时间
					cnt<=cnt+1;
					lcd_en <= 1'b0;
				end
			end
			else if(state_s==S3) begin
				if(cnt==S3_TIME) begin
					cnt<=0;
					state_s<=S4;
				end
				else begin //数据构建时间
					cnt<=cnt+1;
					lcd_rs<=1'b1;
					lcd_en <= 1'b0;
					lcd_data<=refresh_date;
				end	
			end
			else if(state_s==S4)begin
				if(cnt==S4_TIME) begin
					cnt<=0;
					state_s<=S5;
				end
				else begin //数据构建时间
					cnt<=cnt+1;
					lcd_en <= 1'b1;
				end
			end
			else if(state_s==S5)begin
				if(cnt==S5_TIME) begin
					cnt<=0;
					state_s<=S0;
					state_f<=CHECK;
					local_pos<=refresh_pos+1'b1;
				end
				else begin //数据构建时间
					cnt<=cnt+1;
					lcd_en <= 1'b0;
				end
			end
		end
	end	
end

endmodule