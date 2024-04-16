module smart_pill_box_ctl(
    input                   clk    ,        // 时钟信号
    input                   rst_n  ,        // 复位信号  
	input        [4:0]      keyvalue,       // 按键编码输出
	input                   keyfinish,      // 按键锁存标志
	output	reg  [23:0]     time_din,       // 显示的时间
	output  reg  [27:0]     pill_box_din,   //系统药盒设置
    output	reg  [63:0] 	r_dis  ,        // 红显示缓存
    output	reg  [63:0]     g_dis,          // 绿显示缓存 
	output	wire            beep,            // 蜂鸣器
	output  wire [3:0]      mode_out,
	output  wire [3:0]      index_out        //指示哪一组时钟
    );
//矩阵键盘转独立按键
reg  [15:0] key,key_n1,key_n2;
wire [15:0] key_fin;
//1秒钟脉冲产生
reg  [31:0] time1s_cnt;
reg  clk_1hz;
//2hz脉冲产生
reg  [31:0] time500ms_cnt;
reg  clk_2hz;
//4hz脉冲产生
reg  [31:0] time250ms_cnt;
reg  clk_4hz;
//系统时间设计相关
reg [7:0] hour;//小时
reg [7:0] min;//分
reg [7:0] sec;//秒 
wire [3:0] hour_bcd0;
wire [3:0] hour_bcd1;
wire [3:0] min_bcd0;
wire [3:0] min_bcd1;
wire [3:0] sec_bcd0;
wire [3:0] sec_bcd1;
//第一个药盒时间
reg [7:0] pill_box1_hour[2:0];//小时
reg [7:0] pill_box1_min[2:0];//分
reg [7:0] pill_box1_sec[2:0];//秒 
reg pill_box1_on_flag[2:0];//开关信号
reg pill_box1_alarm_flag[2:0];//报警
wire [3:0] pill_box1_hour_bcd0[2:0];
wire [3:0] pill_box1_hour_bcd1[2:0];
wire [3:0] pill_box1_min_bcd0[2:0];
wire [3:0] pill_box1_min_bcd1[2:0];
wire [3:0] pill_box1_sec_bcd0[2:0];
wire [3:0] pill_box1_sec_bcd1[2:0];
//第二个药盒时间
reg [7:0] pill_box2_hour[2:0];//小时
reg [7:0] pill_box2_min[2:0];//分
reg [7:0] pill_box2_sec[2:0];//秒 
reg pill_box2_on_flag[2:0];//开关信号
reg pill_box2_alarm_flag[2:0];//报警
wire [3:0] pill_box2_hour_bcd0[2:0];
wire [3:0] pill_box2_hour_bcd1[2:0];
wire [3:0] pill_box2_min_bcd0[2:0];
wire [3:0] pill_box2_min_bcd1[2:0];
wire [3:0] pill_box2_sec_bcd0[2:0];
wire [3:0] pill_box2_sec_bcd1[2:0];
//第三个药盒时间
reg [7:0] pill_box3_hour[2:0];//小时
reg [7:0] pill_box3_min[2:0];//分
reg [7:0] pill_box3_sec[2:0];//秒 
reg pill_box3_on_flag[2:0];//开关信号
reg pill_box3_alarm_flag[2:0];//报警
wire [3:0] pill_box3_hour_bcd0[2:0];
wire [3:0] pill_box3_hour_bcd1[2:0];
wire [3:0] pill_box3_min_bcd0[2:0];
wire [3:0] pill_box3_min_bcd1[2:0];
wire [3:0] pill_box3_sec_bcd0[2:0];
wire [3:0] pill_box3_sec_bcd1[2:0];
//最近的时间
reg  [7:0] recent_hour;
reg  [7:0] recent_min;
reg  [7:0] recent_sec;
wire [3:0] recent_hour_bcd0;
wire [3:0] recent_hour_bcd1;
wire [3:0] recent_min_bcd0;
wire [3:0] recent_min_bcd1;
wire [3:0] recent_sec_bcd0;
wire [3:0] recent_sec_bcd1;
//定义了三个药盒
reg  [2:0] box_flag_abc;//显示abc
//状态机和修改位
reg [3:0] mode;//指示当前模式
reg [3:0] change;//指示修改位
reg [3:0] index;//表示需要的时间组
//显示相关
//reg [23:0] time_din;//系统时间显示
//reg [27:0] pill_box_din;//系统药盒设置
//蜂鸣器相关
reg beep_ctl;//主要产生时钟频率方波
reg [31:0] beep_cnt;//计时信号，主要为beep_ctl服务
wire alarm_ctl;
parameter  FRE = 32'd50_000;
parameter SET_TIME_1MS = 16'd50_000;
parameter SET_TIME_1S = 32'd50_000_000;	
parameter SET_TIME_500MS = 32'd25_000_000;		
parameter SET_TIME_250MS = 32'd12_500_000;			
parameter TIME = 4'd0;//指示该系统的状态
parameter PILL_BOX1 = 4'd1;
parameter PILL_BOX2 = 4'd2;
parameter PILL_BOX3 = 4'd3;
assign mode_out=mode;
assign index_out=index;
///////////////////////蜂鸣器报警信号产生///////////////////////
always @ (posedge clk or negedge rst_n)  
begin
	if(!rst_n) begin						
		beep_ctl<=1'b0;
		beep_cnt<=0;
	end
	else begin
		if(beep_cnt>FRE) begin
			beep_ctl<=~ beep_ctl;
			beep_cnt<=0;
		end
		else begin
			beep_cnt<=beep_cnt+1'b1;
		end
	end	
end
assign   beep =~ (beep_ctl & alarm_ctl);
///////////////时间到报警信号产生/////////////////////控制alarm_ctl信号
always @ (posedge clk or negedge rst_n)  
begin
	if(!rst_n) begin						
		pill_box1_alarm_flag[0]<=1'b0;
		pill_box1_alarm_flag[1]<=1'b0;
		pill_box1_alarm_flag[2]<=1'b0;
		pill_box2_alarm_flag[0]<=1'b0;
		pill_box2_alarm_flag[1]<=1'b0;
		pill_box2_alarm_flag[2]<=1'b0;
		pill_box3_alarm_flag[0]<=1'b0;
		pill_box3_alarm_flag[1]<=1'b0;
		pill_box3_alarm_flag[2]<=1'b0;
	end
	else begin
		//box1[0]
		if(pill_box1_alarm_flag[0]==1'b1) begin//响了
			if(key_fin[5]) begin
				pill_box1_alarm_flag[0]<=1'b0;
			end
		end
		else begin
			if(mode==PILL_BOX1 && index==4'd0 && change!=4'd0) begin//说明在修改 修改过程中不触发
				pill_box1_alarm_flag[0]<=1'b0;
			end
			else begin//说明没有修改
				if(pill_box1_on_flag[0]) begin//说明打开了
					if(pill_box1_hour[0]==hour && pill_box1_min[0]==min && pill_box1_sec[0]==sec && time1s_cnt==0) begin
						pill_box1_alarm_flag[0]<=1'b1;
					end
					else begin
						pill_box1_alarm_flag[0]<=1'b0;
					end
				end
				else begin//说明没打开
					pill_box1_alarm_flag[0]<=1'b0;
				end
			end
		end
		//box1[1]
		if(pill_box1_alarm_flag[1]==1'b1) begin//响了
			if(key_fin[5]) begin
				pill_box1_alarm_flag[1]<=1'b0;
			end
		end
		else begin
			if(mode==PILL_BOX1 && index==4'd1 && change!=4'd0) begin//说明在修改 修改过程中不触发
				pill_box1_alarm_flag[1]<=1'b0;
			end
			else begin//说明没有修改
				if(pill_box1_on_flag[1]) begin//说明打开了
					if(pill_box1_hour[1]==hour && pill_box1_min[1]==min && pill_box1_sec[1]==sec && time1s_cnt==0) begin
						pill_box1_alarm_flag[1]<=1'b1;
					end
					else begin
						pill_box1_alarm_flag[1]<=1'b0;
					end
				end
				else begin//说明没打开
					pill_box1_alarm_flag[1]<=1'b0;
				end
			end
		end
		//box1[2]
		if(pill_box1_alarm_flag[2]==1'b1) begin//响了
			if(key_fin[5]) begin
				pill_box1_alarm_flag[2]<=1'b0;
			end
		end
		else begin
			if(mode==PILL_BOX1 && index==4'd2 && change!=4'd0) begin//说明在修改 修改过程中不触发
				pill_box1_alarm_flag[2]<=1'b0;
			end
			else begin//说明没有修改
				if(pill_box1_on_flag[2]) begin//说明打开了
					if(pill_box1_hour[2]==hour && pill_box1_min[2]==min && pill_box1_sec[2]==sec && time1s_cnt==0) begin
						pill_box1_alarm_flag[2]<=1'b1;
					end
					else begin
						pill_box1_alarm_flag[2]<=1'b0;
					end
				end
				else begin//说明没打开
					pill_box1_alarm_flag[2]<=1'b0;
				end
			end
		end
///////////////////
		//box2[0]
		if(pill_box2_alarm_flag[0]==1'b1) begin//响了
			if(key_fin[5]) begin
				pill_box2_alarm_flag[0]<=1'b0;
			end
		end
		else begin
			if(mode==PILL_BOX2 && index==4'd0 && change!=4'd0) begin//说明在修改 修改过程中不触发
				pill_box2_alarm_flag[0]<=1'b0;
			end
			else begin//说明没有修改
				if(pill_box2_on_flag[0]) begin//说明打开了
					if(pill_box2_hour[0]==hour && pill_box2_min[0]==min && pill_box2_sec[0]==sec && time1s_cnt==0) begin
						pill_box2_alarm_flag[0]<=1'b1;
					end
					else begin
						pill_box2_alarm_flag[0]<=1'b0;
					end
				end
				else begin//说明没打开
					pill_box2_alarm_flag[0]<=1'b0;
				end
			end
		end
		//box2[1]
		if(pill_box2_alarm_flag[1]==1'b1) begin//响了
			if(key_fin[5]) begin
				pill_box2_alarm_flag[1]<=1'b0;
			end
		end
		else begin
			if(mode==PILL_BOX2 && index==4'd1 && change!=4'd0) begin//说明在修改 修改过程中不触发
				pill_box2_alarm_flag[1]<=1'b0;
			end
			else begin//说明没有修改
				if(pill_box2_on_flag[1]) begin//说明打开了
					if(pill_box2_hour[1]==hour && pill_box2_min[1]==min && pill_box2_sec[1]==sec && time1s_cnt==0) begin
						pill_box2_alarm_flag[1]<=1'b1;
					end
					else begin
						pill_box2_alarm_flag[1]<=1'b0;
					end
				end
				else begin//说明没打开
					pill_box2_alarm_flag[1]<=1'b0;
				end
			end
		end
		//box2[2]
		if(pill_box2_alarm_flag[2]==1'b1) begin//响了
			if(key_fin[5]) begin
				pill_box2_alarm_flag[2]<=1'b0;
			end
		end
		else begin
			if(mode==PILL_BOX2 && index==4'd2 && change!=4'd0) begin//说明在修改 修改过程中不触发
				pill_box2_alarm_flag[2]<=1'b0;
			end
			else begin//说明没有修改
				if(pill_box2_on_flag[2]) begin//说明打开了
					if(pill_box2_hour[2]==hour && pill_box2_min[2]==min && pill_box2_sec[2]==sec && time1s_cnt==0) begin
						pill_box2_alarm_flag[2]<=1'b1;
					end
					else begin
						pill_box2_alarm_flag[2]<=1'b0;
					end
				end
				else begin//说明没打开
					pill_box2_alarm_flag[2]<=1'b0;
				end
			end
		end
////////////////////////
		//box3[0]
		if(pill_box3_alarm_flag[0]==1'b1) begin//响了
			if(key_fin[5]) begin
				pill_box3_alarm_flag[0]<=1'b0;
			end
		end
		else begin
			if(mode==PILL_BOX3 && index==4'd0 && change!=4'd0) begin//说明在修改 修改过程中不触发
				pill_box3_alarm_flag[0]<=1'b0;
			end
			else begin//说明没有修改
				if(pill_box3_on_flag[0]) begin//说明打开了
					if(pill_box3_hour[0]==hour && pill_box3_min[0]==min && pill_box3_sec[0]==sec && time1s_cnt==0) begin
						pill_box3_alarm_flag[0]<=1'b1;
					end
					else begin
						pill_box3_alarm_flag[0]<=1'b0;
					end
				end
				else begin//说明没打开
					pill_box3_alarm_flag[0]<=1'b0;
				end
			end
		end
		//box3[1]
		if(pill_box3_alarm_flag[1]==1'b1) begin//响了
			if(key_fin[5]) begin
				pill_box3_alarm_flag[1]<=1'b0;
			end
		end
		else begin
			if(mode==PILL_BOX3 && index==4'd1 && change!=4'd0) begin//说明在修改 修改过程中不触发
				pill_box3_alarm_flag[1]<=1'b0;
			end
			else begin//说明没有修改
				if(pill_box3_on_flag[1]) begin//说明打开了
					if(pill_box3_hour[1]==hour && pill_box3_min[1]==min && pill_box3_sec[1]==sec && time1s_cnt==0) begin
						pill_box3_alarm_flag[1]<=1'b1;
					end
					else begin
						pill_box3_alarm_flag[1]<=1'b0;
					end
				end
				else begin//说明没打开
					pill_box3_alarm_flag[1]<=1'b0;
				end
			end
		end
		//box3[2]
		if(pill_box3_alarm_flag[2]==1'b1) begin//响了
			if(key_fin[5]) begin
				pill_box3_alarm_flag[2]<=1'b0;
			end
		end
		else begin
			if(mode==PILL_BOX3 && index==4'd2 && change!=4'd0) begin//说明在修改 修改过程中不触发
				pill_box3_alarm_flag[2]<=1'b0;
			end
			else begin//说明没有修改
				if(pill_box3_on_flag[2]) begin//说明打开了
					if(pill_box3_hour[2]==hour && pill_box3_min[2]==min && pill_box3_sec[2]==sec && time1s_cnt==0) begin
						pill_box3_alarm_flag[2]<=1'b1;
					end
					else begin
						pill_box3_alarm_flag[2]<=1'b0;
					end
				end
				else begin//说明没打开
					pill_box3_alarm_flag[2]<=1'b0;
				end
			end
		end
	end	
end
assign alarm_ctl=pill_box1_alarm_flag[0]|pill_box1_alarm_flag[1]|pill_box1_alarm_flag[2]|
		pill_box2_alarm_flag[0]|pill_box2_alarm_flag[1]|pill_box2_alarm_flag[2]|
		pill_box3_alarm_flag[0]|pill_box3_alarm_flag[1]|pill_box3_alarm_flag[2];
//assign alarm_ctl=1'b0;
///////////////点阵设置并闪烁部分代码////////////////
//003c3c3c24183C00
//A  h0042427e42241800
//B  h1C24241C24241C00
//C  h001C220202221C00
always @ (posedge clk or negedge rst_n)  
begin
	if(!rst_n) begin						
		r_dis<=64'h00000000000000000;
		g_dis<=64'h00000000000000000;
	end
	else begin
		//优先响应盒子  再响应修改  接着响应闹钟
		if(box_flag_abc[0]==1'b1) begin
			r_dis<=64'h0042427e42241800;
		end
		else if(box_flag_abc[1]==1'b1) begin
			r_dis<=64'h1C24241C24241C00;
		end
		else if(box_flag_abc[2]==1'b1) begin
			r_dis<=64'h001C220202221C00;
		end
		else if(mode==PILL_BOX1 && change!=4'd0) begin
			g_dis<=64'h00000000000000000;//绿色保持不变
			if(clk_2hz) begin
				if(r_dis==64'h00000000000000000) begin
					r_dis<=64'h003c3c3c24183C00;
				end
				else begin
					r_dis<=64'h00000000000000000;	
				end
			end	
		end
		else if(mode==PILL_BOX2 && change!=4'd0) begin
			r_dis<=64'h00000000000000000;//绿色保持不变
			if(clk_2hz) begin
				if(g_dis==64'h00000000000000000) begin
					g_dis<=64'h003c3c3c24183C00;
				end
				else begin
					g_dis<=64'h00000000000000000;	
				end
			end	
		end
		else if(mode==PILL_BOX3 && change!=4'd0) begin
			if(clk_2hz) begin
				if(g_dis==64'h00000000000000000) begin
					g_dis<=64'h003c3c3c24183C00;
					r_dis<=64'h003c3c3c24183C00;
				end
				else begin
					g_dis<=64'h00000000000000000;	
					r_dis<=64'h00000000000000000;
				end
			end	
		end
		else if(change==4'd0) begin//判断闹钟到  4hz闪烁
			if(pill_box1_alarm_flag[0]|pill_box1_alarm_flag[1]|pill_box1_alarm_flag[2]) begin
				g_dis<=64'h00000000000000000;//绿色保持不变
				if(clk_4hz) begin
					if(r_dis==64'h00000000000000000) begin
						r_dis<=64'h003c3c3c24183C00;
					end
					else begin
						r_dis<=64'h00000000000000000;	
					end
				end
			end
			else if(pill_box2_alarm_flag[0]|pill_box2_alarm_flag[1]|pill_box2_alarm_flag[2]) begin
				r_dis<=64'h00000000000000000;//绿色保持不变
				if(clk_4hz) begin
					if(g_dis==64'h00000000000000000) begin
						g_dis<=64'h003c3c3c24183C00;
					end
					else begin
						g_dis<=64'h00000000000000000;	
					end
				end
			end
			else if(pill_box3_alarm_flag[0]|pill_box3_alarm_flag[1]|pill_box3_alarm_flag[2]) begin
				if(clk_4hz) begin
					if(g_dis==64'h00000000000000000) begin
						g_dis<=64'h003c3c3c24183C00;
						r_dis<=64'h003c3c3c24183C00;
					end
					else begin
						g_dis<=64'h00000000000000000;	
						r_dis<=64'h00000000000000000;
					end
				end
			end
			else begin
				r_dis<=64'h00000000000000000;
				g_dis<=64'h00000000000000000;
			end
		end
		else begin
			r_dis<=64'h00000000000000000;
			g_dis<=64'h00000000000000000;
		end
	end	
end
///////////////矩阵键盘转独立按键////////////////////////////////
always @ (posedge clk or negedge rst_n)  
begin
	if(!rst_n) begin						
		key <= 16'b0000000000000000;
	end
	else begin
		case(keyvalue)
			5'b00000:key=16'b0000000000000001;	 
			5'b00001:key=16'b0000000000000010;		
			5'b00010:key=16'b0000000000000100;	
			5'b00011:key=16'b0000000000001000;		
			5'b00100:key=16'b0000000000010000;	
			5'b00101:key=16'b0000000000100000;		
			5'b00110:key=16'b0000000001000000;		
			5'b00111:key=16'b0000000010000000;	
							 
			5'b01000:key=16'b0000000100000000;		
			5'b01001:key=16'b0000001000000000;		
			5'b01010:key=16'b0000010000000000;		
			5'b01011:key=16'b0000100000000000;		
			5'b01100:key=16'b0001000000000000;		
			5'b01101:key=16'b0010000000000000;		
			5'b01110:key=16'b0100000000000000;	
			5'b01111:key=16'b1000000000000000;	
			5'b10000:key=16'b0000000000000000;
			default:key=16'b0000000000000000;	 
		endcase         	 		 
	end	
end
always @ (posedge clk or negedge rst_n)  
begin
	if(!rst_n) begin						
		key_n1<=16'b0000000000000000;
		key_n2<=16'b0000000000000000;
	end
	else begin
		key_n1<=key;
		key_n2<=key_n1;
	end	
end
assign key_fin=key_n1 & (~ key_n2);  
////////////////////1hz脉冲产生///////////////////////////
always @ (posedge clk or negedge rst_n)  
begin
	if(!rst_n) begin						
		time1s_cnt<=0;
        clk_1hz<=1'b0;
	end
	else begin
		if((mode==TIME && change==4'd0) || mode==PILL_BOX1 || mode==PILL_BOX2 || mode==PILL_BOX3) begin
			if(time1s_cnt == SET_TIME_1S-1'b1) begin
				time1s_cnt<=0;
				clk_1hz<=1'b1;
			end
			else begin
				time1s_cnt<=time1s_cnt+1;
				clk_1hz<=1'b0;
			end
		end
		else begin
			time1s_cnt<=0;
			clk_1hz<=1'b0;
		end 
	end	
end
////////////////////2hz脉冲产生///////////////////////////
always @ (posedge clk or negedge rst_n)  
begin
	if(!rst_n) begin						
		time500ms_cnt<=0;
        clk_2hz<=1'b0;
	end
	else begin
		if(change!=4'd0) begin
			if(time500ms_cnt == SET_TIME_500MS-1'b1) begin
				time500ms_cnt<=0;
				clk_2hz<=1'b1;
			end
			else begin
				time500ms_cnt<=time500ms_cnt+1;
				clk_2hz<=1'b0;
			end
		end
		else begin
			time500ms_cnt<=0;
			clk_2hz<=1'b0;
		end 
	end	
end
////////////////////4hz脉冲产生///////////////////////////
always @ (posedge clk or negedge rst_n)  
begin
	if(!rst_n) begin						
		time250ms_cnt<=0;
        clk_4hz<=1'b0;
	end
	else begin
		if(mode==TIME && alarm_ctl==1'b1) begin
			if(time250ms_cnt == SET_TIME_250MS-1'b1) begin
				time250ms_cnt<=0;
				clk_4hz<=1'b1;
			end
			else begin
				time250ms_cnt<=time250ms_cnt+1;
				clk_4hz<=1'b0;
			end
		end
		else begin
			time250ms_cnt<=0;
			clk_4hz<=1'b0;
		end 
	end	
end
////////////////////时钟代码////////////////////////////// 
assign hour_bcd1 = hour/4'd10%4'd10;//系统时钟
assign hour_bcd0 = hour%4'd10;
assign min_bcd1  = min/4'd10%4'd10;
assign min_bcd0  = min%4'd10;  
assign sec_bcd1  = sec/4'd10%4'd10;
assign sec_bcd0  = sec%4'd10;   

assign pill_box1_hour_bcd1[0] = pill_box1_hour[0]/4'd10%4'd10;//第一个药盒时间1
assign pill_box1_hour_bcd0[0] = pill_box1_hour[0]%4'd10;
assign pill_box1_min_bcd1[0]  = pill_box1_min[0]/4'd10%4'd10;
assign pill_box1_min_bcd0[0]  = pill_box1_min[0]%4'd10;  
assign pill_box1_sec_bcd1[0]  = pill_box1_sec[0]/4'd10%4'd10;
assign pill_box1_sec_bcd0[0]  = pill_box1_sec[0]%4'd10;   

assign pill_box1_hour_bcd1[1] = pill_box1_hour[1]/4'd10%4'd10;//第一个药盒时间2
assign pill_box1_hour_bcd0[1] = pill_box1_hour[1]%4'd10;
assign pill_box1_min_bcd1[1]  = pill_box1_min[1]/4'd10%4'd10;
assign pill_box1_min_bcd0[1]  = pill_box1_min[1]%4'd10;  
assign pill_box1_sec_bcd1[1]  = pill_box1_sec[1]/4'd10%4'd10;
assign pill_box1_sec_bcd0[1]  = pill_box1_sec[1]%4'd10;   

assign pill_box1_hour_bcd1[2] = pill_box1_hour[2]/4'd10%4'd10;//第一个药盒时间3
assign pill_box1_hour_bcd0[2] = pill_box1_hour[2]%4'd10;
assign pill_box1_min_bcd1[2]  = pill_box1_min[2]/4'd10%4'd10;
assign pill_box1_min_bcd0[2]  = pill_box1_min[2]%4'd10;  
assign pill_box1_sec_bcd1[2]  = pill_box1_sec[2]/4'd10%4'd10;
assign pill_box1_sec_bcd0[2]  = pill_box1_sec[2]%4'd10;   

assign pill_box2_hour_bcd1[0] = pill_box2_hour[0]/4'd10%4'd10;//第二个药盒时间1
assign pill_box2_hour_bcd0[0] = pill_box2_hour[0]%4'd10;
assign pill_box2_min_bcd1[0]  = pill_box2_min[0]/4'd10%4'd10;
assign pill_box2_min_bcd0[0]  = pill_box2_min[0]%4'd10;  
assign pill_box2_sec_bcd1[0]  = pill_box2_sec[0]/4'd10%4'd10;
assign pill_box2_sec_bcd0[0]  = pill_box2_sec[0]%4'd10;   

assign pill_box2_hour_bcd1[1] = pill_box2_hour[1]/4'd10%4'd10;//第二个药盒时间2
assign pill_box2_hour_bcd0[1] = pill_box2_hour[1]%4'd10;
assign pill_box2_min_bcd1[1]  = pill_box2_min[1]/4'd10%4'd10;
assign pill_box2_min_bcd0[1]  = pill_box2_min[1]%4'd10;  
assign pill_box2_sec_bcd1[1]  = pill_box2_sec[1]/4'd10%4'd10;
assign pill_box2_sec_bcd0[1]  = pill_box2_sec[1]%4'd10;   

assign pill_box2_hour_bcd1[2] = pill_box2_hour[2]/4'd10%4'd10;//第二个药盒时间3
assign pill_box2_hour_bcd0[2] = pill_box2_hour[2]%4'd10;
assign pill_box2_min_bcd1[2]  = pill_box2_min[2]/4'd10%4'd10;
assign pill_box2_min_bcd0[2]  = pill_box2_min[2]%4'd10;  
assign pill_box2_sec_bcd1[2]  = pill_box2_sec[2]/4'd10%4'd10;
assign pill_box2_sec_bcd0[2]  = pill_box2_sec[2]%4'd10;

assign pill_box3_hour_bcd1[0] = pill_box3_hour[0]/4'd10%4'd10;//第三个药盒时间1
assign pill_box3_hour_bcd0[0] = pill_box3_hour[0]%4'd10;
assign pill_box3_min_bcd1[0]  = pill_box3_min[0]/4'd10%4'd10;
assign pill_box3_min_bcd0[0]  = pill_box3_min[0]%4'd10;  
assign pill_box3_sec_bcd1[0]  = pill_box3_sec[0]/4'd10%4'd10;
assign pill_box3_sec_bcd0[0]  = pill_box3_sec[0]%4'd10;   

assign pill_box3_hour_bcd1[1] = pill_box3_hour[1]/4'd10%4'd10;//第三个药盒时间2
assign pill_box3_hour_bcd0[1] = pill_box3_hour[1]%4'd10;
assign pill_box3_min_bcd1[1]  = pill_box3_min[1]/4'd10%4'd10;
assign pill_box3_min_bcd0[1]  = pill_box3_min[1]%4'd10;  
assign pill_box3_sec_bcd1[1]  = pill_box3_sec[1]/4'd10%4'd10;
assign pill_box3_sec_bcd0[1]  = pill_box3_sec[1]%4'd10;   

assign pill_box3_hour_bcd1[2] = pill_box3_hour[2]/4'd10%4'd10;//第三个药盒时间3
assign pill_box3_hour_bcd0[2] = pill_box3_hour[2]%4'd10;
assign pill_box3_min_bcd1[2]  = pill_box3_min[2]/4'd10%4'd10;
assign pill_box3_min_bcd0[2]  = pill_box3_min[2]%4'd10;  
assign pill_box3_sec_bcd1[2]  = pill_box3_sec[2]/4'd10%4'd10;
assign pill_box3_sec_bcd0[2]  = pill_box3_sec[2]%4'd10;

assign recent_hour_bcd1 = recent_hour/4'd10%4'd10;//最近的时间的bcd码
assign recent_hour_bcd0 = recent_hour%4'd10;
assign recent_min_bcd1  = recent_min/4'd10%4'd10;
assign recent_min_bcd0  = recent_min%4'd10;  
assign recent_sec_bcd1  = recent_sec/4'd10%4'd10;
assign recent_sec_bcd0  = recent_sec%4'd10;
always @ (posedge clk or negedge rst_n)  
begin
	if(!rst_n) begin						
		hour<=8'd0;
		min<=8'd0;
		sec<=8'd0;
		mode<=TIME;//初始化为当前时钟状态
		change<=4'd0;//指示修改的位数
		index<=4'd0;//初始化索引
		pill_box1_hour[0]<=8'd0;
		pill_box1_min[0]<=8'd0;
		pill_box1_sec[0]<=8'd0;
		pill_box1_hour[1]<=8'd0;
		pill_box1_min[1]<=8'd0;
		pill_box1_sec[1]<=8'd0;
		pill_box1_hour[2]<=8'd0;
		pill_box1_min[2]<=8'd0;
		pill_box1_sec[2]<=8'd0;
		
		pill_box2_hour[0]<=8'd0;
		pill_box2_min[0]<=8'd0;
		pill_box2_sec[0]<=8'd0;
		pill_box2_hour[1]<=8'd0;
		pill_box2_min[1]<=8'd0;
		pill_box2_sec[1]<=8'd0;
		pill_box2_hour[2]<=8'd0;
		pill_box2_min[2]<=8'd0;
		pill_box2_sec[2]<=8'd0;
		
		pill_box3_hour[0]<=8'd0;
		pill_box3_min[0]<=8'd0;
		pill_box3_sec[0]<=8'd0;
		pill_box3_hour[1]<=8'd0;
		pill_box3_min[1]<=8'd0;
		pill_box3_sec[1]<=8'd0;
		pill_box3_hour[2]<=8'd0;
		pill_box3_min[2]<=8'd0;
		pill_box3_sec[2]<=8'd0;
		pill_box2_on_flag[0]<=1'b0;
		pill_box2_on_flag[1]<=1'b0;
		pill_box2_on_flag[2]<=1'b0;
		pill_box2_on_flag[0]<=1'b0;
		pill_box2_on_flag[1]<=1'b0;
		pill_box2_on_flag[2]<=1'b0;
		pill_box2_on_flag[0]<=1'b0;
		pill_box2_on_flag[1]<=1'b0;
		pill_box2_on_flag[2]<=1'b0;
	end
	else begin
		if(mode==TIME) begin//系统时间模式
			index<=4'd0;
			if(key_fin[0]==1'b1) begin
				if(change==4'd3) begin
					change<=4'd0;
				end
				else begin
					change<=change+1'b1;
				end
			end
			else if(key_fin[1]==1'b1) begin
				if(change==4'd1) begin
					if(hour==8'd23) hour<=8'd0;
					else hour<=hour+1'd1;
				end
				else if(change==4'd2) begin
					if(min==8'd59) min<=8'd0;
					else min<=min+1'd1;
				end
				else if(change==4'd3) begin
					if(sec==8'd59) sec<=8'd0;
					else sec<=sec+1'd1;
				end
			end
			else if(key_fin[2]==1'b1) begin
				if(change==4'd1) begin
					if(hour==8'd0) hour<=8'd23;
					else hour<=hour-1'd1;
				end
				else if(change==4'd2) begin
					if(min==8'd0) min<=8'd59;
					else min<=min-1'd1;
				end
				else if(change==4'd3) begin
					if(sec==8'd0) sec<=8'd59;
					else sec<=sec-1'd1;
				end
			end
			else if(key_fin[3]==1'b1) begin
				if(change==4'd0) begin
					mode<=PILL_BOX1;
				end
			end

		end
		else if(mode==PILL_BOX1) begin
			if(key_fin[0]==1'b1) begin
				if(change==4'd4) begin
					change<=4'd0;
				end
				else begin
					change<=change+1'b1;
				end
			end
			else if(key_fin[1]==1'b1) begin
				if(change==4'd1) begin
					if(pill_box1_hour[index]==8'd23) pill_box1_hour[index]<=8'd0;
					else pill_box1_hour[index]<=pill_box1_hour[index]+1'd1;
				end
				else if(change==4'd2) begin
					if(pill_box1_min[index]==8'd59) pill_box1_min[index]<=8'd0;
					else pill_box1_min[index]<=pill_box1_min[index]+1'd1;
				end
				else if(change==4'd3) begin
					if(pill_box1_sec[index]==8'd59) pill_box1_sec[index]<=8'd0;
					else pill_box1_sec[index]<=pill_box1_sec[index]+1'd1;
				end
				else if(change==4'd4) begin
					pill_box1_on_flag[index]<=~pill_box1_on_flag[index];
				end
			end
			else if(key_fin[2]==1'b1) begin
				if(change==4'd1) begin
					if(pill_box1_hour[index]==8'd0) pill_box1_hour[index]<=8'd23;
					else pill_box1_hour[index]<=pill_box1_hour[index]-1'd1;
				end
				else if(change==4'd2) begin
					if(pill_box1_min[index]==8'd0) pill_box1_min[index]<=8'd59;
					else pill_box1_min[index]<=pill_box1_min[index]-1'd1;
				end
				else if(change==4'd3) begin
					if(pill_box1_sec[index]==8'd0) pill_box1_sec[index]<=8'd59;
					else pill_box1_sec[index]<=pill_box1_sec[index]-1'd1;
				end
				else if(change==4'd4) begin
					pill_box1_on_flag[index]<=~pill_box1_on_flag[index];
				end
			end
			else if(key_fin[3]==1'b1) begin
				if(change==4'd0) begin
					mode<=PILL_BOX2;
					index<=4'd0;
				end
			end
			else if(key_fin[4]==1'b1) begin//切换一个盒子时间
				if(change==4'd0) begin
					if(index==4'd2) begin
						index<=4'd0;
					end
					else begin
						index<=index+1'b1;
					end
				end
			end
		end
		else if(mode==PILL_BOX2) begin
			if(key_fin[0]==1'b1) begin
				if(change==4'd4) begin
					change<=4'd0;
				end
				else begin
					change<=change+1'b1;
				end
			end
			else if(key_fin[1]==1'b1) begin
				if(change==4'd1) begin
					if(pill_box2_hour[index]==8'd23) pill_box2_hour[index]<=8'd0;
					else pill_box2_hour[index]<=pill_box2_hour[index]+1'd1;
				end
				else if(change==4'd2) begin
					if(pill_box2_min[index]==8'd59) pill_box2_min[index]<=8'd0;
					else pill_box2_min[index]<=pill_box2_min[index]+1'd1;
				end
				else if(change==4'd3) begin
					if(pill_box2_sec[index]==8'd59) pill_box2_sec[index]<=8'd0;
					else pill_box2_sec[index]<=pill_box2_sec[index]+1'd1;
				end
				else if(change==4'd4) begin
					pill_box2_on_flag[index]<=~pill_box2_on_flag[index];
				end
			end
			else if(key_fin[2]==1'b1) begin
				if(change==4'd1) begin
					if(pill_box2_hour[index]==8'd0) pill_box2_hour[index]<=8'd23;
					else pill_box2_hour[index]<=pill_box2_hour[index]-1'd1;
				end
				else if(change==4'd2) begin
					if(pill_box2_min[index]==8'd0) pill_box2_min[index]<=8'd59;
					else pill_box2_min[index]<=pill_box2_min[index]-1'd1;
				end
				else if(change==4'd3) begin
					if(pill_box2_sec[index]==8'd0) pill_box2_sec[index]<=8'd59;
					else pill_box2_sec[index]<=pill_box2_sec[index]-1'd1;
				end
				else if(change==4'd4) begin
					pill_box2_on_flag[index]<=~pill_box2_on_flag[index];
				end
			end
			else if(key_fin[3]==1'b1) begin
				if(change==4'd0) begin
					mode<=PILL_BOX3;
					index<=4'd0;
				end
			end
			else if(key_fin[4]==1'b1) begin//切换一个盒子时间
				if(change==4'd0) begin
					if(index==4'd2) begin
						index<=4'd0;
					end
					else begin
						index<=index+1'b1;
					end
				end
			end
		end
		else if(mode==PILL_BOX3) begin
			if(key_fin[0]==1'b1) begin
				if(change==4'd4) begin
					change<=4'd0;
				end
				else begin
					change<=change+1'b1;
				end
			end
			else if(key_fin[1]==1'b1) begin
				if(change==4'd1) begin
					if(pill_box3_hour[index]==8'd23) pill_box3_hour[index]<=8'd0;
					else pill_box3_hour[index]<=pill_box3_hour[index]+1'd1;
				end
				else if(change==4'd2) begin
					if(pill_box3_min[index]==8'd59) pill_box3_min[index]<=8'd0;
					else pill_box3_min[index]<=pill_box3_min[index]+1'd1;
				end
				else if(change==4'd3) begin
					if(pill_box3_sec[index]==8'd59) pill_box3_sec[index]<=8'd0;
					else pill_box3_sec[index]<=pill_box3_sec[index]+1'd1;
				end
				else if(change==4'd4) begin
					pill_box3_on_flag[index]<=~pill_box3_on_flag[index];
				end
			end
			else if(key_fin[2]==1'b1) begin
				if(change==4'd1) begin
					if(pill_box3_hour[index]==8'd0) pill_box3_hour[index]<=8'd23;
					else pill_box3_hour[index]<=pill_box3_hour[index]-1'd1;
				end
				else if(change==4'd2) begin
					if(pill_box3_min[index]==8'd0) pill_box3_min[index]<=8'd59;
					else pill_box3_min[index]<=pill_box3_min[index]-1'd1;
				end
				else if(change==4'd3) begin
					if(pill_box3_sec[index]==8'd0) pill_box3_sec[index]<=8'd59;
					else pill_box3_sec[index]<=pill_box3_sec[index]-1'd1;
				end
				else if(change==4'd4) begin
					pill_box3_on_flag[index]<=~pill_box3_on_flag[index];
				end
			end
			else if(key_fin[3]==1'b1) begin
				if(change==4'd0) begin
					mode<=TIME;
					index<=4'd0;
				end
			end
			else if(key_fin[4]==1'b1) begin//切换一个盒子时间
				if(change==4'd0) begin
					if(index==4'd2) begin
						index<=4'd0;
					end
					else begin
						index<=index+1'b1;
					end
				end
			end		
		end
		if(((change==4'd0&&mode==TIME))||mode==PILL_BOX1||mode==PILL_BOX2||mode==PILL_BOX3) begin
			if(clk_1hz==1'b1) begin
				if(sec==8'd59) begin
					sec<=8'd0;
					if(min==8'd59)begin
						min<=8'd0;
						if (hour==8'd23) begin
							hour<=8'd0;
						end
						else begin
							hour<=hour+1'b1;
						end 
					end
					else begin
						min<=min+1'b1;
					end 
				end	
				else begin
					sec<=sec+1'b1;
				end
			end	
		end
	end	
end
////////////////////时钟显示////////////////////
always @ (posedge clk or negedge rst_n)  
begin
	if(!rst_n) begin						
		time_din<=24'h000000;
	end
	else begin
		if(mode==TIME) begin
			if(change==4'd0) begin
				time_din<={hour_bcd1,hour_bcd0,min_bcd1,min_bcd0,sec_bcd1,sec_bcd0};
			end
			else if(change==4'd1) begin
				time_din[7:0]<={sec_bcd1,sec_bcd0};
				time_din[15:8]<={min_bcd1,min_bcd0};
				if(clk_2hz==1'b1) begin
					if(time_din[23:16]==8'hff) begin
						time_din[23:16]<={hour_bcd1,hour_bcd0};
					end
					else begin
						time_din[23:16]<=8'hff;
					end
				end
			end
			else if(change==4'd2) begin
				time_din[7:0]<={sec_bcd1,sec_bcd0};
				//time_din[15:8]<={min_bcd1,min_bcd0};
				time_din[23:16]<={hour_bcd1,hour_bcd0};
				if(clk_2hz==1'b1) begin
					if(time_din[15:8]==8'hff) begin
						time_din[15:8]<={min_bcd1,min_bcd0};
					end
					else begin
						time_din[15:8]<=8'hff;
					end
				end
			end
			else if(change==4'd3) begin
				//time_din[7:0]<={sec_bcd1,sec_bcd0};
				time_din[15:8]<={min_bcd1,min_bcd0};
				time_din[23:16]<={hour_bcd1,hour_bcd0};
				if(clk_2hz==1'b1) begin
					if(time_din[7:0]==8'hff) begin
						time_din[7:0]<={sec_bcd1,sec_bcd0};
					end
					else begin
						time_din[7:0]<=8'hff;
					end
				end
			end
		end 
		else begin
			time_din<={hour_bcd1,hour_bcd0,min_bcd1,min_bcd0,sec_bcd1,sec_bcd0};
		end
	end	
end
//盒子显示
always @ (posedge clk or negedge rst_n)  
begin
	if(!rst_n) begin						//判断复位
		box_flag_abc<=3'b000;
	end
	else begin
		if(box_flag_abc==3'b000) begin
			if(key_fin[6]==1'b1) begin
				box_flag_abc<=3'b001;
			end
			else if(key_fin[7]==1'b1) begin
				box_flag_abc<=3'b010;
			end
			else if(key_fin[8]==1'b1) begin
				box_flag_abc<=3'b100;
			end
		end
		else if(box_flag_abc==3'b001) begin
			if(key_fin[6]==1'b1) begin
				box_flag_abc<=3'b000;
			end
			else if(key_fin[7]==1'b1) begin
				box_flag_abc<=3'b010;
			end
			else if(key_fin[8]==1'b1) begin
				box_flag_abc<=3'b100;
			end
		end
		else if(box_flag_abc==3'b010) begin
			if(key_fin[6]==1'b1) begin
				box_flag_abc<=3'b001;
			end
			else if(key_fin[7]==1'b1) begin
				box_flag_abc<=3'b000;
			end
			else if(key_fin[8]==1'b1) begin
				box_flag_abc<=3'b100;
			end
		end
		else if(box_flag_abc==3'b100) begin
			if(key_fin[6]==1'b1) begin
				box_flag_abc<=3'b001;
			end
			else if(key_fin[7]==1'b1) begin
				box_flag_abc<=3'b010;
			end
			else if(key_fin[8]==1'b1) begin
				box_flag_abc<=3'b000;
			end
		end
	end	
end
//闹钟显示
///////////////////////////////////////////////
always @ (posedge clk or negedge rst_n)  
begin
	if(!rst_n) begin						
		pill_box_din<=28'h0000000;
	end
	else begin
		if(mode==TIME) begin//显示最近的闹钟时间
			pill_box_din<=28'hFFFFFF;
		end
		else if(mode==PILL_BOX1) begin
			if(change==4'd0) begin
				pill_box_din[27:4]<={pill_box1_hour_bcd1[index],pill_box1_hour_bcd0[index],pill_box1_min_bcd1[index],pill_box1_min_bcd0[index],pill_box1_sec_bcd1[index],pill_box1_sec_bcd0[index]};
				pill_box_din[3:0]<={3'b000,pill_box1_on_flag[index]};
			end
			else if(change==4'd1) begin
				pill_box_din[19:4]<={pill_box1_min_bcd1[index],pill_box1_min_bcd0[index],pill_box1_sec_bcd1[index],pill_box1_sec_bcd0[index]};
				pill_box_din[3:0]<={3'b000,pill_box1_on_flag[index]};
				if(clk_2hz==1'b1) begin
					if(pill_box_din[27:20]==8'hff) begin
						pill_box_din[27:20]<={pill_box1_hour_bcd1[index],pill_box1_hour_bcd0[index]};
					end
					else begin
						pill_box_din[27:20]<=8'hff;
					end
				end
			end
			else if(change==4'd2) begin
				pill_box_din[27:20]<={pill_box1_hour_bcd1[index],pill_box1_hour_bcd0[index]};
				pill_box_din[11:4]<={pill_box1_sec_bcd1[index],pill_box1_sec_bcd0[index]};
				pill_box_din[3:0]<={3'b000,pill_box1_on_flag[index]};
				if(clk_2hz==1'b1) begin
					if(pill_box_din[19:12]==8'hff) begin
						pill_box_din[19:12]<={pill_box1_min_bcd1[index],pill_box1_min_bcd0[index]};
					end
					else begin
						pill_box_din[19:12]<=8'hff;
					end
				end
			end
			else if(change==4'd3) begin
				pill_box_din[27:12]<={pill_box1_hour_bcd1[index],pill_box1_hour_bcd0[index],pill_box1_min_bcd1[index],pill_box1_min_bcd0[index]};
				pill_box_din[3:0]<={3'b000,pill_box1_on_flag[index]};
				if(clk_2hz==1'b1) begin
					if(pill_box_din[11:4]==8'hff) begin
						pill_box_din[11:4]<={pill_box1_sec_bcd1[index],pill_box1_sec_bcd0[index]};
					end
					else begin
						pill_box_din[11:4]<=8'hff;
					end
				end
			end
			else if(change==4'd4) begin
				pill_box_din[27:4]<={pill_box1_hour_bcd1[index],pill_box1_hour_bcd0[index],pill_box1_min_bcd1[index],pill_box1_min_bcd0[index],pill_box1_sec_bcd1[index],pill_box1_sec_bcd0[index]};
				if(clk_2hz==1'b1) begin
					if(pill_box_din[3:0]==4'hf) begin
						pill_box_din[3:0]<={3'b000,pill_box1_on_flag[index]};
					end
					else begin
						pill_box_din[3:0]<=4'hf;
					end
				end		
			end
		end
		else if(mode==PILL_BOX2) begin
			if(change==4'd0) begin
				pill_box_din[27:4]<={pill_box2_hour_bcd1[index],pill_box2_hour_bcd0[index],pill_box2_min_bcd1[index],pill_box2_min_bcd0[index],pill_box2_sec_bcd1[index],pill_box2_sec_bcd0[index]};
				pill_box_din[3:0]<={3'b000,pill_box2_on_flag[index]};
			end
			else if(change==4'd1) begin
				pill_box_din[19:4]<={pill_box2_min_bcd1[index],pill_box2_min_bcd0[index],pill_box2_sec_bcd1[index],pill_box2_sec_bcd0[index]};
				pill_box_din[3:0]<={3'b000,pill_box2_on_flag[index]};
				if(clk_2hz==1'b1) begin
					if(pill_box_din[27:20]==8'hff) begin
						pill_box_din[27:20]<={pill_box2_hour_bcd1[index],pill_box2_hour_bcd0[index]};
					end
					else begin
						pill_box_din[27:20]<=8'hff;
					end
				end
			end
			else if(change==4'd2) begin
				pill_box_din[27:20]<={pill_box2_hour_bcd1[index],pill_box2_hour_bcd0[index]};
				pill_box_din[11:4]<={pill_box2_sec_bcd1[index],pill_box2_sec_bcd0[index]};
				pill_box_din[3:0]<={3'b000,pill_box2_on_flag[index]};
				if(clk_2hz==1'b1) begin
					if(pill_box_din[19:12]==8'hff) begin
						pill_box_din[19:12]<={pill_box2_min_bcd1[index],pill_box2_min_bcd0[index]};
					end
					else begin
						pill_box_din[19:12]<=8'hff;
					end
				end
			end
			else if(change==4'd3) begin
				pill_box_din[27:12]<={pill_box2_hour_bcd1[index],pill_box2_hour_bcd0[index],pill_box2_min_bcd1[index],pill_box2_min_bcd0[index]};
				pill_box_din[3:0]<={3'b000,pill_box2_on_flag[index]};
				if(clk_2hz==1'b1) begin
					if(pill_box_din[11:4]==8'hff) begin
						pill_box_din[11:4]<={pill_box2_sec_bcd1[index],pill_box2_sec_bcd0[index]};
					end
					else begin
						pill_box_din[11:4]<=8'hff;
					end
				end
			end
			else if(change==4'd4) begin
				pill_box_din[27:4]<={pill_box2_hour_bcd1[index],pill_box2_hour_bcd0[index],pill_box2_min_bcd1[index],pill_box2_min_bcd0[index],pill_box2_sec_bcd1[index],pill_box2_sec_bcd0[index]};
				if(clk_2hz==1'b1) begin
					if(pill_box_din[3:0]==4'hf) begin
						pill_box_din[3:0]<={3'b000,pill_box2_on_flag[index]};
					end
					else begin
						pill_box_din[3:0]<=4'hf;
					end
				end		
			end
		end
		else if(mode==PILL_BOX3) begin
			if(change==4'd0) begin
				pill_box_din[27:4]<={pill_box3_hour_bcd1[index],pill_box3_hour_bcd0[index],pill_box3_min_bcd1[index],pill_box3_min_bcd0[index],pill_box3_sec_bcd1[index],pill_box3_sec_bcd0[index]};
				pill_box_din[3:0]<={3'b000,pill_box3_on_flag[index]};
			end
			else if(change==4'd1) begin
				pill_box_din[19:4]<={pill_box3_min_bcd1[index],pill_box3_min_bcd0[index],pill_box3_sec_bcd1[index],pill_box3_sec_bcd0[index]};
				pill_box_din[3:0]<={3'b000,pill_box3_on_flag[index]};
				if(clk_2hz==1'b1) begin
					if(pill_box_din[27:20]==8'hff) begin
						pill_box_din[27:20]<={pill_box3_hour_bcd1[index],pill_box3_hour_bcd0[index]};
					end
					else begin
						pill_box_din[27:20]<=8'hff;
					end
				end
			end
			else if(change==4'd2) begin
				pill_box_din[27:20]<={pill_box3_hour_bcd1[index],pill_box3_hour_bcd0[index]};
				pill_box_din[11:4]<={pill_box3_sec_bcd1[index],pill_box3_sec_bcd0[index]};
				pill_box_din[3:0]<={3'b000,pill_box3_on_flag[index]};
				if(clk_2hz==1'b1) begin
					if(pill_box_din[19:12]==8'hff) begin
						pill_box_din[19:12]<={pill_box3_min_bcd1[index],pill_box3_min_bcd0[index]};
					end
					else begin
						pill_box_din[19:12]<=8'hff;
					end
				end
			end
			else if(change==4'd3) begin
				pill_box_din[27:12]<={pill_box3_hour_bcd1[index],pill_box3_hour_bcd0[index],pill_box3_min_bcd1[index],pill_box3_min_bcd0[index]};
				pill_box_din[3:0]<={3'b000,pill_box3_on_flag[index]};
				if(clk_2hz==1'b1) begin
					if(pill_box_din[11:4]==8'hff) begin
						pill_box_din[11:4]<={pill_box3_sec_bcd1[index],pill_box3_sec_bcd0[index]};
					end
					else begin
						pill_box_din[11:4]<=8'hff;
					end
				end
			end
			else if(change==4'd4) begin
				pill_box_din[27:4]<={pill_box3_hour_bcd1[index],pill_box3_hour_bcd0[index],pill_box3_min_bcd1[index],pill_box3_min_bcd0[index],pill_box3_sec_bcd1[index],pill_box3_sec_bcd0[index]};
				if(clk_2hz==1'b1) begin
					if(pill_box_din[3:0]==4'hf) begin
						pill_box_din[3:0]<={3'b000,pill_box3_on_flag[index]};
					end
					else begin
						pill_box_din[3:0]<=4'hf;
					end
				end		
			end
		end
	end	
end
endmodule               