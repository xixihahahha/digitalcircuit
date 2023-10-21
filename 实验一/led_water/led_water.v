`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/10/20 00:53:43
// Design Name: 
// Module Name: led_water
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////





module led_water(
    input wire clk,//时钟信号，50MHz
    input wire rst_n,//复位信号，下降沿有效
    output wire  [3:0] led_on
);

parameter MAXS = 26'd50_000_000;
reg [25:0] cnt1s = 0;//计数寄存器器0.5s
reg [3:0]   led_r = 4'b1110;//led信号寄存器

always @(posedge clk or negedge rst_n) begin
    if (!rst_n ) begin//复位，重新计数
       cnt1s<=26'd0;
    end
    else if (cnt1s == MAXS)begin//记到最大数,重新计数
       cnt1s<=26'd0;
    end
    else begin//其他情况+1
      cnt1s <= cnt1s + 1'd1;
    end

   
end

always @(posedge clk or negedge rst_n) begin
    if (!rst_n ) begin//复位
        led_r = 4'b1110;
    end
    else if (cnt1s == MAXS)begin//记到最大数,翻转
        led_r = {led_r[2:0],led_r[3]};
    end
    else begin
        led_r = led_r;
    end
    
end

assign led_on = led_r;

endmodule
