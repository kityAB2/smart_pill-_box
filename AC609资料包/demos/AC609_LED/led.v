module led(
	clk,
	rst_n,
	key,
	led
);

	input clk;
	input rst_n;
	input [1:0]key;
	output [3:0]led;
	
	reg [31:0]cnt;
	
	reg [3:0]led_r;
	
	always@(posedge clk or negedge rst_n)
	if(!rst_n)begin
		cnt <= 32'd0;
		led_r <= 4'b1111;
	end
	else if(cnt == 32'd24999999)begin
		cnt <= 32'd0;
		led_r <= led_r + 1'b1;
	end
	else begin
		cnt <= cnt + 1'b1;
		led_r <= led_r;
	end
		
	assign led[1:0] = key[1:0] & led_r[1:0];
	assign led[3:2] = led_r[3:2];
	
endmodule
