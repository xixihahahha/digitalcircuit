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
    input wire clk,//ʱ���źţ�50MHz
    input wire rst_n,//��λ�źţ��½�����Ч
    output wire  [3:0] led_on
);

parameter MAXS = 26'd50_000_000;
reg [25:0] cnt1s = 0;//�����Ĵ�����0.5s
reg [3:0]   led_r = 4'b1110;//led�źżĴ���

always @(posedge clk or negedge rst_n) begin
    if (!rst_n ) begin//��λ�����¼���
       cnt1s<=26'd0;
    end
    else if (cnt1s == MAXS)begin//�ǵ������,���¼���
       cnt1s<=26'd0;
    end
    else begin//�������+1
      cnt1s <= cnt1s + 1'd1;
    end

   
end

always @(posedge clk or negedge rst_n) begin
    if (!rst_n ) begin//��λ
        led_r = 4'b1110;
    end
    else if (cnt1s == MAXS)begin//�ǵ������,��ת
        led_r = {led_r[2:0],led_r[3]};
    end
    else begin
        led_r = led_r;
    end
    
end

assign led_on = led_r;

endmodule
