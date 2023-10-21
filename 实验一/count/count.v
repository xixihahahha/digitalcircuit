`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/10/20 23:35:18
// Design Name: 
// Module Name: count
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


module count(
    input clk,
    input key,
    input rst,
    output reg [7:0] led,
    output reg [5:0] sel
    );
    reg [12:0] t;
    reg op = 0; //时间分频
    reg [4:0] cnt = 0; //计数 
    reg [3:0] num_1, num_0;  //提取个位、十位 
    wire key_pulse; // 消抖后 
    reg [7:0] led_r [0:9];
    
    initial 
        begin
            sel = 60;
            led_r[0] = 192;
            led_r[1] = 249;
            led_r[2] = 164;
            led_r[3] = 176;
            led_r[4] = 153;
            led_r[5] = 146;
            led_r[6] = 130;
            led_r[7] = 248;
            led_r[8] = 128;
            led_r[9] = 144;
        end 
        
    debounce u1 (
        .clk(clk),
        .rst(rst),
        .key(key),
        .key_pulse(key_pulse)
        );
    
    //计数
    always @(posedge clk or negedge rst) begin
        if(!rst) begin
            cnt <= 0;
        end
        else begin
            if(key_pulse)begin
                if(cnt == 5'd19) begin
                    cnt <= 0;
                end 
                else begin 
                    cnt <= cnt + 1;
                end
            end
            else begin
                cnt <= cnt;
            end
        end
    end
    
    //显示 
    always @(posedge clk) begin
        num_1 <= cnt / 10;
        num_0 <= cnt % 10;
        t <= t + 1;
        if(t == 0) begin
            op = ~op;
        end
        if(op) begin
            led <= led_r[num_1];
            sel[1] <= 0;
            sel[0] <= 1;
        end
        else begin
            led <= led_r[num_0];
            sel[0] <= 0;
            sel[1] <= 1;
        end
    end 
    
endmodule
