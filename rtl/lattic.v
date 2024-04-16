//药品显示图案
//003c3c3c24183C00
//A  h0042427e42241800
//B  h1C24241C24241C00
//C  h001C220202221C00
module lattic(
    input                   clk    ,        // 时钟信号
    input                   rst_n  ,        // 复位信号  
    input        [63:0] 	r_dis  ,        // 红显示缓存
    input        [63:0]     g_dis  ,        // 绿显示缓存 
    output	reg  [ 7:0]     row    ,        // 行选信号  7位最上行
    output  reg	 [ 7:0]     r_col  ,       
    output  reg	 [ 7:0]     g_col
    );
parameter SET_TIME_1MS = 16'd50_000;	
reg			[15:0]	time_cnt;			//用来控制数码管闪烁频率的定时计数器
reg			[2:0]	cnt;			//用来控制数码管闪烁频率的定时计数器
    
//时序电路,用来给time_cnt寄存器赋值
always @ (posedge clk or negedge rst_n)  
begin
	if(!rst_n) begin						//判断复位
		time_cnt <= 16'd0;					//初始化time_cnt值
		cnt <= 3'd0;
	end
	else begin
		if(time_cnt==SET_TIME_1MS) begin
			time_cnt<=16'd0;
			if(cnt==3'd7) cnt<=3'd0;
			else cnt<=cnt+1'b1;
		end
		else time_cnt<=time_cnt+1'b1;
	end	
end
always @ (*)
begin
	case (cnt)  
		3'b000 : r_col = ~r_dis[ 7:0 ];  
		3'b001 : r_col = ~r_dis[15:8 ];  
		3'b010 : r_col = ~r_dis[23:16];  
		3'b011 : r_col = ~r_dis[31:24];  
		3'b100 : r_col = ~r_dis[39:32];  
		3'b101 : r_col = ~r_dis[47:40];  
		3'b110 : r_col = ~r_dis[55:48];  
		3'b111 : r_col = ~r_dis[63:56];  		
		default: r_col = ~r_dis[ 7:0 ]; 	
	endcase 	
end
always @ (*)
begin
	case (cnt)  
		3'b000 : g_col = ~g_dis[ 7:0 ];  
		3'b001 : g_col = ~g_dis[15:8 ];  
		3'b010 : g_col = ~g_dis[23:16];  
		3'b011 : g_col = ~g_dis[31:24];  
		3'b100 : g_col = ~g_dis[39:32];  
		3'b101 : g_col = ~g_dis[47:40];  
		3'b110 : g_col = ~g_dis[55:48];  
		3'b111 : g_col = ~g_dis[63:56];  		
		default: g_col = ~g_dis[ 7:0 ];  	
	endcase 	
end
always @ (*)
begin
	case (cnt)  
		3'b000 : row = ~8'b11111110; 
		3'b001 : row = ~8'b11111101; 
		3'b010 : row = ~8'b11111011; 
		3'b011 : row = ~8'b11110111; 
		3'b100 : row = ~8'b11101111; 
		3'b101 : row = ~8'b11011111; 
		3'b110 : row = ~8'b10111111; 
		3'b111 : row = ~8'b01111111; 		
		default: row = ~8'b11111110;   
	endcase 	       
end                    
endmodule               