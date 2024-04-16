module smart_pill_box(
    input                   clk    ,        // 时钟信号
    input                   rst_n  ,        // 复位信号  
	input        [4:1] 		c,                  //列查询输入
	output       [4:1] 		r,                  //行扫描输出 
	output				    lcd_rs		,//命令数据选择
	output			        lcd_rw		,//读写控制信号
	output				    lcd_en		,//执行命令的使能引脚
	output		  [7:0]	    lcd_data,	 //发送的数据
	output                  beep,
	output	     [ 7:0]     row    ,        // 行选信号  7位最上行
    output   	 [ 7:0]     r_col  ,       
    output   	 [ 7:0]     g_col
    );
wire      	[4:0]       keyvalue;          //按键编码输出
wire             		keyfinish;         //按键锁存标志 	
wire        [63:0] 	    r_dis;        // 红显示缓存
wire        [63:0]      g_dis;        // 绿显示缓存
wire        [3:0]       mode_out;
wire  		[23:0]      time_din;      // 显示的时间
wire  		[27:0]      pill_box_din;   //系统药盒设置
wire	    [255:0]		dis_data    ;//显示数据低位表示
wire        [3:0]       index_out;        //指示哪一组时钟
scankeyboard_debounce scankeyboard_debounce_inst(
	.clk(clk),
	.rst_n(rst_n),
	.r(r),
	.c(c),
	.keyvalue(keyvalue),
	.keyfinish(keyfinish)
	);	
	
smart_pill_box_ctl smart_pill_box_ctl_inst(
    .clk(clk)    ,        // 时钟信号
    .rst_n(rst_n)  ,        // 复位信号  
	.keyvalue(keyvalue),       // 按键编码输出
	.keyfinish(keyfinish),      // 按键锁存标志
	.time_din(time_din),       // 显示的时间
	.pill_box_din(pill_box_din),   // 系统药盒设置
    .r_dis(r_dis)  ,        // 红显示缓存
    .g_dis(g_dis),          // 绿显示缓存 
	.beep(beep),            // 蜂鸣器
	.mode_out(mode_out),
	.index_out(index_out)
    );	
lattic lattic_inst(
    .clk(clk)    ,        // 时钟信号
    .rst_n(rst_n)  ,        // 复位信号  
    .r_dis(r_dis)  ,        // 红显示缓存
    .g_dis(g_dis)  ,        // 绿显示缓存 
    .row(row)    ,        // 行选信号  7位最上行
    .r_col(r_col)  ,       
    .g_col(g_col)
    );
lcd1602_driver lcd1602_driver_inst(
	.clk(clk)			,//时钟
	.rst_n(rst_n)		,//复位
	.dis_data(dis_data)    ,//显示数据低位表示
	.lcd_rs(lcd_rs)		,//命令数据选择
	.lcd_rw(lcd_rw)		,//读写控制信号
	.lcd_en(lcd_en)		,//执行命令的使能引脚
	.lcd_data(lcd_data)	 //发送的数据
	);
lcd1602_display lcd1602_display_inst(
	.clk(clk)			,//时钟
	.rst_n(rst_n)		,//复位
	.mode_out(mode_out)    ,//模式
	.index_out(index_out)    ,//模式
    .time_din(time_din),       // 显示的时间
	.pill_box_din(pill_box_din),   //系统药盒设置
	.dis_data(dis_data)    //显示数据低位表示
	); 
endmodule